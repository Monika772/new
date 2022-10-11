<?php

namespace App\Http\Controllers\Website\Profile;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Hash;
use App\Http\Requests\ProfileRequest;
use App\Http\Requests\ChangePasswordRequest;
use App\Models\User;

use App\Models\States;
use App\Models\User_address;

use Carbon\Carbon;
use Session;
use DataTables;

class ProfileController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $user_id = Auth::user()->id;
        $user_record = user::select('name','profile_image','email','mobile')->where('id',$user_id)->first();
        return view('Website.profile.profile',compact('user_record'));
    }
     public function update(ProfileRequest $request){ 
        try {
            $user_id            =  Auth::user()->id;           
            $user               =  User::find($user_id);
            $user->name   =  $request->get('first_name');
            //$user->last_name    =  $request->get('last_name');
            $user->email        =  $request->get('email');
            $user->mobile       =  $request->get('mobile');
            $user->save();


            /* Document image upload start */
            if(!empty($request->profile_image))
            {

                $pro_image = user::select('profile_image')->where('id',$user_id)->first();
                if(!empty($pro_image->profile_image && $pro_image->profile_image != "pro_image/default.jpg")){
                    Storage::delete('pro_image', $pro_image->profile_image);
                }
                $pro_img_name = Storage::put('pro_image', $request->profile_image);
                if($pro_img_name){
                    user::where('id', $user_id)->update(['profile_image' => $pro_img_name]);
                    session::put('profile_image', $pro_img_name);
                }
            }
            /* Document image upload close */

            return redirect()->route('website.profile')->with('success','Profile Update successfully');
        }catch (\Exception $e) { 
            return redirect()->route('website.profile')->with('error',$e->getMessage());   
        }
    }



    public function reset_password(ChangePasswordRequest $request){ 
        try {
            $user_id = Auth::user()->id;
            $user = user::where('id',$user_id)->first();
            $check = Hash::check($request->old_password, $user->password);
            if($check){
                $check2 = user::where('id', $user_id)->update(['password'=> Hash::make($request->new_password)]);
                if($check2)
                {
                    return redirect()->route('website.profile')->with('success','Password Update Successfully');
                }else{

                    return redirect()->route('website.profile')->with('error','Something went wrong! Please Try Again');
                }   
            }else{

                return redirect()->route('website.profile')->with('error','Old password Does not match');
            }
        }catch (\Exception $e) { 
            return redirect()->route('website.profile')->with('error',$e->getMessage());   
        }
    }


    public function remove_address($id)
    {
        try {
            User_address::where('id',$id)->delete();
            return redirect()->back()->with('success','Record Delete successfully');
        }catch (\Exception $e) { 
            return redirect()->back()->with('error',$e->getMessage());   
        }
    }

}
