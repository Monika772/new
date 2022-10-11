<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use App\Repository\UserRepository;
use Carbon\Carbon;
use Validator;
use Illuminate\Support\Facades\Hash;
use App\Http\Requests\Api\SocialSignupRequest;
use App\Http\Requests\Api\VerifyOTPRequest;
use App\Http\Requests\Api\SendOTPRequest;
use App\Http\Requests\Api\LoginRequest;
use App\Helpers\CommonHelper;
class AuthController extends Controller
{
    public function __construct(UserRepository $userRepository){
        $this->userRepository  = $userRepository;
    }

   public function socialSignup(SocialSignupRequest $request){
        try {
            return $this->userRepository->register($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 403);
        }
   }
   public function singup(Request $request){

        $data=[];
        $data['name'] = $request->name;
        $data['email'] = $request->email;
        $data['password'] = Hash::make($request->password);
        $data['role_id'] = 3;
        $data['device_type'] = $request->device_type;
        $data['zipcode'] = $request->zipcode;
        $data['latitude'] = $request->latitude;
        $data['longitude'] = $request->longitude;
        $data['mobile'] = $request->mobile;
        $data['profile_image'] = $request->profile_image;
        $data['status'] = 'active';
        $data['role']='user';
        try {
            return $this->userRepository->register1($data);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 403);
        }
   }
   public function verifyOTP(VerifyOTPRequest $request){
        try {
            return $this->userRepository->verifyOTP($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 403);
        }
   }
   
   public function sendOTP(SendOTPRequest $request){
        try {
            return $this->userRepository->sendOTP($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 403);
        }
   }

    /**
     * Login via social account
     *
     * @param  [string] username
     * @param  [string] password
     */
    public function login(LoginRequest $request){
        try {
            return $this->userRepository->login($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 403);
        }
     }
    /**
     * Logout user (Revoke the token)
     *  @return [string] message
     */
    public function logout(Request $request){  
        try {
            return $this->userRepository->logout($request);
        }catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 403);
       }
   }
}