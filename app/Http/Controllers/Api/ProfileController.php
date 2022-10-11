<?php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Hash;
use App\Http\Requests\Api\SignupRequest;
use App\Http\Requests\Api\UpdateProfileRequest;
use App\Http\Requests\Api\CandidateKycRequest;
use App\Models\User;
use App\Models\User_address;
use App\Models\Notification;
use App\Repository\UserRepository;
use App\Helpers\CommonHelper;
use Carbon\Carbon;
use Validator;
use DB; 

use App\Mail\Forgetpassword;
use Illuminate\Support\Facades\Mail;

class ProfileController extends Controller
{
    
    public function __construct(UserRepository $userRepository){
        $this->userRepository = $userRepository;
    }
    /**
     * Function : getProfile
     * Desc : get profile data
     */
    public function getProfile(Request $request){
        try {
            return $this->userRepository->getProfile($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 403);
        }
    }
    /**
     * Function : register
     * Desc : get profile data
     */
    public function register(SignupRequest $request){
        try {
            return $this->userRepository->register($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 403);
        }
    }

     /**
     * Function : register
     * Desc : get profile data
     */
    public function resendOtp(Request $request){
        try {
            return $this->userRepository->resendOtp($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 403);
        }
    }
  
   
   /**
    * Function : updateProfile
    * Desc : update profile
    */
    public function updateProfile(UpdateProfileRequest $request){  
            $user_id = $request['user']['id'];
            $data['name']       = $request->name;
            $data['email']      = $request->email;
            if(isset($request->shop_name) && $request->shop_name){
                $data['shop_name']  = $request->shop_name;
            }
            if(isset($request->gst_number) && $request->gst_number){
                $data['gst_number'] = $request->gst_number;
            }
            
           $check = user::where('id',$user_id)->update($data);
            if($check){
                if(!empty($request->profile_image)){
                    $pro_image = user::select('profile_image')->where('id',$user_id)->first();
                    if(!empty($pro_image->profile_image  && $pro_image->profile_image != "pro_image/default.jpg")){
                        Storage::delete('pro_image', $pro_image->profile_image);
                    }
                    $profile_image=  CommonHelper::getImageName($request['profile_image']);
                    CommonHelper::moveImageFile($profile_image,'pro_image');
                    $profile_image='pro_image/'.$profile_image;
                    user::where('id', $user_id)->update(['profile_image' => $profile_image]);
                }
                /* Document image upload close */

                $user_record = user::where('id',$user_id)->select('id','role','name','email','mobile','status','shop_name','gst_number')->first();
                return response()->json(['success'=>true,'message' => 'Profile Update Successfully','data'=> $user_record], 200);

            }else{
                return response()->json(['status' => false,'message' => 'Something went wrong! Please Try Again','results' => null], 200); 
            }
        }
        
        public function notificationSwitch(Request $request){
            try {
                return $this->userRepository->notificationSwitch($request);
            } catch (\Exception $e) {
                return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 403);
            }
        }

        public function categories(Request $request){
            try {
                return $this->userRepository->catgories($request);
            } catch (\Exception $e) {
                return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 403);
            }
        }
        public function address(Request $request){
            try {
                return $this->userRepository->addressdata($request);
            } catch (\Exception $e) {
                return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 403);
            }
        }

}