<?php 
namespace App\Repository;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;
use App\Models\TaxCategory;
use App\Models\SubCategory;
use App\Models\Category;
use App\Models\Products;
use App\Models\Banners;
use App\Models\EmployersBusiness;
use App\Models\Notification;
use App\Models\UserAddress;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use App\Helpers\CommonHelper;
use File;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Log;

class UserRepository   {

    private $user,$notification;
    public function __construct(User $user,Notification $notification,EmployersBusiness $employersBusiness)
    {
        
        $this->user                 = $user;
        $this->apiToken             = uniqid(base64_encode(Str::random(200)));
        $this->notification         = $notification;
        $this->employersBusiness    = $employersBusiness;
        $this->userAddress          = new UserAddress;
        $this->taxtcat         = new TaxCategory();
        $this->subcat         = new SubCategory();
        $this->cat         = new Category();
        $this->product = new Products();
        $this->banners = new Banners();
        
    }


    public function register1($request){
        $users=User::where('email',$request['email'])->first();
        if(empty($users)){

            $request['access_token']   =  $this->apiToken;
            $result = $this->user->create($request);

            return response()->json([
                'success'=>true,
                'message' => 'singup sucessfullly',
                'data'=>$result                
            ], 200);

        }else{
            return response()->json([
                'success'=>false,
                'message' => 'email already exist !',
                'data'=>[]                
            ], 402);
        }
    } 
    /**
     * Function : login
     * Desc : login
     */
    public function login($request){
        $result = $this->user
                        ->where('social_id',$request['social_id'])
                        ->where('role_id',$request['role'])
                        ->where('social_type',$request['social_type'])
                        ->NotDeleted()
                        ->first();
                if(!empty($result)){
                   
                    if($result->status=='incompleted'){
                       $result->access_token=$this->apiToken;
                        $result->save();
                        return response()->json([
                            'success'=>true,
                            'message' =>__('messages.api.error.incomplete_profile'),
                            'data'=>$result
                        ], 200);
                    }
                    if($result->status=='inactive'){
                        return response()->json([
                            'success'=>false,
                            'message' => __('messages.api.error.account_inactive'),
                            'data'=>''
                        ], 200);
                    }
                    $result->first_name = ($request->full_name)?$request->full_name:$result->first_name;
                    $result->device_token = $request->device_token;
                    $result->device_type = $request->device_type;
                    $result->save();
                   if($result->mobile_verify_status != 1){
                        $user = user::where('id',$result->id)->where('role_id',$request['role'])->first();
                        $user->otp = CommonHelper::genrateOTPCode();
                        $user->access_token=$this->apiToken;
                        $user->save();
                        unset($user->otp);
                        return response()->json([
                            'success'=>true,
                            'message' => __('messages.api.error.verify_mobile_number'),
                            'data'=>$user                
                        ], 200);
                    }else{
                        $user = user::where('id',$result->id)->where('role_id',$request['role'])->first();
                        if($user->role_id=='4' && empty($user->rajorpay_customer_id)){
                            $customerId     = CommonHelper::createCustomerOnRajorPay($user);
                            $user->rajorpay_customer_id = $customerId;
                        }
                        $user->access_token = $this->apiToken;
                        $user->save();
                        return response()->json([
                            'success'=>true,
                            'message' =>  __('messages.api.success.login_success'),
                            'data'=>$user                    
                        ], 200);
                    }
                }else{
                    if(!empty($request['country_code'])){
                        $userData['country_code']   = $request['country_code'];
                    }
                    if(isset($request['mobile_no']) && !empty($request['mobile_no'])){
                        if(strlen($request['mobile_no'])<10 || strlen($request['mobile_no'])>10){
                            return response()->json([
                                'success'=>false,
                                'message' =>  'Please enter 10 digit valid mobile number',
                                'data'=>[]                    
                            ], 200);
                        }
                        $userData = user::where('mobile',$request['mobile_no'])->where('mobile_verify_status','1')->first();
                        if(!empty($userData)){
                            return response()->json([
                                'success'=>false,
                                'message' =>  __('messages.api.error.phone_already_exist'),
                                'data'=>[]                    
                            ], 200);
                        }
                        $userData['mobile']         = $request['mobile_no'];
                    }
                    
                    $userData['social_id']      = $request['social_id'];
                    $userData['social_type']    = $request['social_type'];
                    $userData['device_token']   = $request['device_token'];
                    $userData['device_type']    = $request['device_type'];
                    $userData['role_id']        = $request['role'];
                    if(!empty($request['full_name'])){
                        $userData['first_name']          = $request['full_name'];
                    }
                   if(!empty($request['email'])){
                        $userData['email']          = $request['email'];
                    }
                    
                   
                    $userData['profile_status'] =  'login';
                    $userData['status']         =  'incompleted';
                    $userData['access_token']   =  $this->apiToken;
                    $result = $this->user->create($userData);
                    $userData  = $this->user->where('id',$result['id'])->first();
                    if(!empty($result)){
                        return response()->json([
                            'success'=>true,
                            'message' => __('messages.api.success.profile_incomplete'),
                            'data'=>$userData                    
                        ], 200);
                    }else{
                        return response()->json([
                            'success'=>false,
                            'message' => __('messages.api.success.something_went_wrong'),
                            'data'=>''                
                        ],402);
                    }
                   
                }
        }
    /**
     * Function : uploadBusinessImages
     * Desc : upload business images
     */
    public function uploadBusinessImages($images,$user_id,$business_id){
        $all_images  = explode(",",$images);
        if(!empty($all_images)){
            foreach($all_images as $image){
                $file_name = CommonHelper::getImageName($image);
                if(file_exists(Storage::path(('temp')."/".$file_name))){
                    $bus_image['user_id']       = $user_id;
                    $bus_image['business_id']   = $business_id;
                    $bus_image['image']         = $file_name;
                    $addImage = $this->businessImages->create($bus_image);
                       if(!empty($addImage)){
                           CommonHelper::moveImageFile($file_name,'business_profile');
                       }
                }
                
            }
        }
        
    }
    /**
     * Function : completeProfile
     * Desc : employer complete profile
     */
    public function completeProfile($request){
        $userDetails            =  $request['user'];
        $usrReq['first_name']   =  $request['full_name'];
        $usrReq['country_code'] =  $request['country_code'];
        $usrReq['mobile']       =  $request['mobile_no'];
        $usrReq['address']      =  $request['address'];
        $usrReq['latitude']     =  $request['latitude'];
        $usrReq['longitude']    =  $request['longitude'];
        $usrReq['status']       =  'incompleted';
        $usrReq['profile_status'] =  'profile-completed';
        if(isset($request['mobile_no']) && !empty($request['mobile_no'])){
            $userData = user::where('mobile',$request['mobile_no'])->where('mobile_verify_status','1')->first();
            if(!empty($userData)){
                return response()->json([
                    'success'=>false,
                    'message' =>  __('messages.api.error.phone_already_exist'),
                    'data'=>[]                    
                ], 200);
            }
        }
        $usrReq['otp']          =  CommonHelper::genrateOTPCode();
        $update=$this->user->where('id',$userDetails['id'])->update($usrReq);
        if(!empty($update)){
            $userData  = $this->user->where('id',$userDetails['id'])->first();
            return response()->json([
                'success'=>true,
                'message' => __('messages.api.error.verify_mobile_number'),
                'data'=>$userData                
            ], 200);
        }else{
            return response()->json([
                'success'=>false,
                'message' => __('messages.api.error.something_went_wrong'),
                'data'=>''               
            ],402);
        }
       
    }
    /**
     * Function : businessProfile
     * Desc: business profile store
     */
    public function businessProfile($request){
        $user_id                                = $request['user']['id'];
        $userData   = $this->user->where('id',$user_id)->select('id','mobile_verify_status','status')->first();
        if(!empty($userData)){
            $business_profile['user_id']            = $user_id;
            $business_profile['category_id']        = $request['business_type'];
            $business_profile['business_name']      = $request['business_name'];
            $business_profile['business_address']   = $request['business_address'];
            $business_profile['latitude']           = $request['business_latitude'];
            $business_profile['longitude']          = $request['business_longitude'];
            $businessProfile  = $this->employersBusiness->create($business_profile);
            if(!empty($businessProfile)){
                if($request['images']){
                    $this->uploadBusinessImages($request['images'],$user_id,$businessProfile->id);
                }
            }
            $businessData = $this->employersBusiness->where('id',$businessProfile->id)
                                ->with('businessImages')->with('category:id,name')
                                ->where('user_id',$request['user']['id'])->first();
            return response()->json(['success'=>true,'message' => __('messages.api.success.business_profile_updated'),'data'=>$businessData],200);
        }else{
            return response()->json(['success'=>false,'message' => __('messages.api.error.no_record_found'),'data'=>''],200);
        }
       
    }

    /**
     * Function : verifyOTP
     * Desc : verify otp
     * @param : country_code
     * @param : mobile
     * @param : otp
     */
    public function verifyOTP($request){
        $users = $this->user->where('id',$request['user']['id'])
                    ->where('mobile',$request['mobile_no'])->first();
        if(!empty($users)){
            if($request['otp'] == $users->otp){
                if($users->profile_status!='completed'){
                    $users->profile_status  = 'otp-verified';
                    $users->mobile_verify_status = '1';
                }
                
                $users->device_type     = $request['device_type'];
                $users->device_token    = $request['device_token'];
                $users->status          = 'active';
               
                $users->otp             = null;
                $users->access_token    = $this->apiToken;
                $users->save();
                $usersData = $this->user->where('id',$request['user']['id'])->first();
                return response()->json(['success'=>true,'message' => __('messages.api.success.otp_verified'),'data'=>$usersData], 200); 
            }
            return response()->json(['success'=>false,'message' => __('messages.api.error.invalid_otp'),'data'=>[]], 200); 
        }
        return response()->json(['success'=>false,'message' => __('messages.api.error.no_record_found'),'data'=>[]], 200); 
    }
   
    
    public function register($request){
        $users = $this->user->where('id',$request['user']['id'])->where('role','user')->where('status','active')->first();
        if(!empty($users)){
            $users->name            = $request['name'];
            $users->email           = $request['email'];
            $users->gst_number      = $request['gst_number'];
            $users->shop_name       = $request['shop_name'];
            $users->profile_status  = 'completed';
            if($users->save()){
                $this->userAddress->create(['user_id'=>$users->id,'address'=>$request['address'],'pincode'=>$request['pincode'],'is_primary'=>1,'latitude'=>$request['latitude'],'longitude'=>$request['longitude']]);
                $usersData = $this->user->where('id',$request['user']['id'])->first();
                 return response()->json(['success'=>true,'message' => __('messages.api.success.register_successfully'),'data'=>$usersData], 200); 
            }else{
                return response()->json(['success'=>false,'message' => __('messages.admin.error.something_went_wrong'),'data'=>[]], 200);
            }
           
        }
        return response()->json(['success'=>false,'message' => __('messages.api.error.no_record_found'),'data'=>[]], 200); 
    }
    /**
     * Function : verifyOTPV1
     * Desc : verify otp using firebase
     */
    public function verifyOTPV1($request){
        $users = $this->user->where('id',$request['user']['id'])
                    ->where('country_code',$request['country_code'])
                    ->where('mobile',$request['mobile_no'])->first();
        if(!empty($users)){
                $users->mobile_verify_status    = '1';
                $users->device_type             = $request['device_type'];
                $users->device_token            = $request['device_token'];
                $users->profile_status          = 'otp-verified';
                $users->status                  =  'active';
                $notificationData['title'] = 'New User Registered';
                $notificationData['message'] = $users->full_name. " Registered As Customer Role";
                $notificationData['user_id'] = $users->id;
                saveAdminNotification($notificationData);
                $users->save();
                $usersData      = $this->user->where('id',$request['user']['id'])->first();
                // if($users->role_id=='4' && empty($usersData->rajorpay_customer_id)){
                //     $customerId     = CommonHelper::createCustomerOnRajorPay($usersData);
                //     $usersData->rajorpay_customer_id = $customerId;
                //     $usersData->save();
                // }
                
                
                return response()->json(['success'=>true,'message' => __('messages.api.success.otp_verified'),'data'=>$usersData], 200); 
        }
        return response()->json(['success'=>false,'message' => __('messages.api.error.no_record_found'),'data'=>[]], 200); 
    }

    
    /**
     * Function : sendOTP
     * Desc : send otp
     */
    public function sendOTP($request){
        $users = $this->user->select('id','name','email','mobile','role','status','access_token','profile_status')->where('mobile',$request['mobile_no'])->where('role','user')->first();
        if(empty($users)){
            $userData['mobile'] = $request['mobile_no'];
            $userData['otp'] = CommonHelper::genrateOTPCode();
            $userData['access_token']=$this->apiToken;
            
            $user = $this->user->create($userData);
            // unset($user->otp);
            return response()->json(['success'=>true,'message' =>  __('messages.api.success.otp_send'),'data'=>$user], 200); 
        }else{
            $users->otp = CommonHelper::genrateOTPCode();
            $users->access_token=$this->apiToken;
            $users->save();
            unset($users->otp);
            return response()->json([
                'success'=>true,
                'message' => __('messages.api.error.verify_mobile_number'),
                'data'=>$users                
            ], 200);
        }
       
    }

    public function resendOtp($request){
        $users = $this->user->select('id','name','email','mobile','role','status','access_token','profile_status')
                        ->where('id',$request['user']['id'])->where('role','user')->first();
        if(!empty($users)){
            $users->otp = CommonHelper::genrateOTPCode();
            $users->save();
            unset($users->otp);
            return response()->json(['success'=>true,'message' =>  __('messages.api.success.otp_send'),'data'=>$users], 200); 
        }
        return response()->json(['success'=>true,'message' => _('messages.api.error.no_record_found'),'data'=>''], 200);
    }
    
    /**
     * Function : logout
     * Desc : logout user
     */
    public function logout($request){
        $user_record   =  $request['user'];    
        $id            =  $user_record->id;
        $logout        =  $this->user->where('id',$id)->update(['access_token'=> null,'device_token'=>null]);
        if($logout){
            return response()->json(['success'=>true,'message' => __('messages.api.success.logout_success'),'data'=>'' ], 200);   
        }else{
            return response()->json(['success'=>false,'message' => 'Please login.','data'=>'' ], 200);  
        }      
    }

    /**
     * Function : getProfile
     * Desc : get profile
     */
    public function getProfile($request){
        $userDetails =  $this->user->where('id',$request['user']['id'])
                            ->select('id','name','email','role','mobile','profile_image','status','mobile_verify_status','gst_number','shop_name')
                            ->where('mobile_verify_status','1')->first();
        if(!empty($userDetails)){
            return response()->json(['success'=>true,'message' => '','data'=>$userDetails], 200);
        }
        return response()->json(['success'=>true,'message' => _('messages.api.error.no_record_found'),'data'=>''], 200);
    }

    public function getUserList($request){
        return $this->user->with('useraddress')->where('role','!=','admin')->where('status','!=','deleted')->where('mobile_verify_status','1')->orderBy('id','desc')->get();
    }
     /*
     @Method  : get user details
     @request : $id
     **/
    public function getUsersDetails($id){
        return $this->user->where('id',$id)->first();
    }

   

    public function notificationSwitch($request){
        $this->user->where('id',$request['user']['id'])->update(['is_notification'=>$request['status']]);
        $message = ($request['status']=='on')?__('messages.api.success.notification_status_on'):__('messages.api.success.notification_status_off');
        return response()->json(['success'=>true,'message' => $message,'data'=>[]], 200);

    }
    public function updateStatus($id,$status) {
        return $this->user->where('id',$id)->update(['status'=>$status]);
    }
    public function delete($id) {
        return $this->user->where('id',$id)->update(['status'=>'deleted']);
     }                  
}   
