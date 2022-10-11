<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use App\Http\Requests\LoginRequest;
use App\Models\User;
use Session;
use Redirect;
use DB;
use App\Models\CMS;
use App\Mail\Forgetpassword;
use Illuminate\Support\Facades\Mail;

class Home_controller extends Controller
{

    public function Home(){
        return Redirect('dashbord_data')->with('success','Admin Login su');
    }
    public function index()
    {       
        return view('auth.login');
    }

    public function termsConditions()
    {          
        $terms = CMS::where('slug','terms-conditions')->first();      
        return view('Website.terms-conditions',compact('terms'));
    }

    public function privacyPolicy()
    {    
        $privacyPolicy = CMS::where('slug','privacy-policy')->first();      
        return view('Website.privacy-policy',compact('privacyPolicy'));
    }

   	public function login(LoginRequest $request)
    {
        try {
            $credentials = array();
            if(is_numeric($request->get('username')))
            {
            	$credentials = [
            					
            		'mobile' => $request->username, 
            		'password' => $request->password
            	];
            }
            else{
            	$credentials = [
            		'email' => $request->username, 
            		'password' => $request->password
            	];
            }
            
            if(!empty($credentials)){
            	if(Auth::attempt($credentials)){
                    $user = Auth::User();
                    $user_record = User::select('role','profile_image','status')->where('id', $user->id)->first();
                    if(($user_record->role != 'admin') && ($user_record->role_id != 'subadmin')){
                        Session::flush(); //clears out all the exisiting sessions
                        Auth::logout();
                    }
                    if($user_record->status == 'inactive'){
                        Session::flush(); //clears out all the exisiting sessions
                        Auth::logout();
                        return Redirect::route('login')->with('error','Your account are Inactive');
                    }

                    /* code if user not admin or shopkeeper - Close */
    	           	Session::put('name', $user->name);
            		//Session::put('last_name', $user->last_name);
            		Session::put('email', $user->email);
            		//Session::put('mobile', $user->mobile);
                    Session::put('role_id', $user->role_id);
                    Session::put('profile_image', $user->profile_image);
           			Session::put('id', $user->id);
    	           	return redirect('home');
               }else{
                   return Redirect::route('login')->with('error','Wrong Login Details');  
               }
            }
        }catch (\Exception $e) { 
            return Redirect::route('login')->with('error',$e->getMessage());   
        }
    }

    public function get_credentials()
    {          
        return view('auth.get_credentials');
    }


    public function reset_link(Request $request)
    {           
        try { 
            $validator = Validator::make($request->all(), [
                'username' => 'required'
            ]);

            if ($validator->fails()) {
                return redirect()->route('forgotPassword')->withErrors($validator);
            }

            $user_res = User::where('status', 'active')->where('email', $request->username)->first();
            if(!empty($user_res)){
                
                /*send mail*/
                $user_id = ($user_res->id);
                $remember_token = md5(otp_genrater(9));
                user::where('id',$user_id)->update(['remember_token' => $remember_token]);
                $data['link'] = url('/reset_password').'?code='.$remember_token;
                $request->email = $user_res->email;
                $request->subject = "Forget Password";               
                $result = Mail::send('emails.forget_password',$data, function($message) use ($request) {
                        $message->from('monika01sanawad@gmail.com','Tournamnet');
                        $message->to($request->email);
                        $message->subject($request->subject);
                        $message->replyTo($request->email);
                    }
                );
               
                if(count(Mail::failures()) <1){
                    return Redirect::route('login')->with('success','Please check your mail account for activation link');
                }else{
                    return Redirect::route('forgotPassword')->with('error','Something went Wrong');
                }
            }else{
                return Redirect::route('forgotPassword')->with('error','invalid Email-id');
            }
        }catch (\Exception $e) { 
            return Redirect::route('forgotPassword')->with('error',$e->getMessage());   
        }
       
    }

    public function reset_password()
    {
        return view('auth.reset_password');
    }

    public function ForgetSuccess()
    { 
        return view('auth.ForgetSuccess');

    }


    public function update_password(Request $request)
    {           
        try {

            $validator = Validator::make($request->all(), [
                'code' => 'required',
                'new_password' => 'required',
                'conform_password' => 'required'
            ]);

            if ($validator->fails()) {
                return redirect()->route('login')->withErrors($validator);
            }

            $user_res = User::where('remember_token', $request->code)->first();
            if(!empty($user_res)){
                
                /*send mail*/
                $user_id = ($user_res->id);
                $role_id = $user_res->role_id;

                $remember_token = md5(otp_genrater(9));
                $check = user::where('id',$user_id)->update(['remember_token' => $remember_token, 'password' => Hash::make($request->conform_password)]);
                if($check){
                    
                    if( $role_id == 3){
                        return Redirect::route('ForgetSuccess')->with('success','password reset successfully. Please login to customer app.');
                    }else{
                       return Redirect::route('login')->with('success','your Password Reset successfully.');
                    }
                    

                }else{

                    return back()->with('error','Something went Wrong. Please Try after sometime');
                }
            }else{
                 
                return back()->with('error','Your link has expired');
            }
        }catch (\Exception $e) { 
            return back()->with('error',$e->getMessage());   
        }
       
    }
    
   // forgot password
    
   public function forgotPassword(){
    return view('auth.passwords.email');
   }


}