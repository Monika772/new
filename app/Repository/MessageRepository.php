<?php 
namespace App\Repository;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use App\Models\User;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use App\Helpers\CommonHelper;
use App\Models\Notification;
class MessageRepository   {

    
    public function sendMessage($request){
        $msg = $request['message'];
        if($request['type']=='message'){
           
            $mobile_no = User::where('role_id',2)->where('mobile_verify_status',1)->where('status','active')->pluck('mobile');
            if(!empty($mobile_no)){
                $mobile_message = !empty($msg)?$msg:$request['title'];
                send_sms($mobile_no,$mobile_message);
            }
           
        }else{
            if(!empty($request->image)){
                $img = CommonHelper::imageCompressUploads($request,'notification');
                $notificationData['img']  = url('storage/app')."/".$img;
            }else{
                $adminDetails = CommonHelper::getAdminDetails();
                $notificationData['img']  =   url('storage/app')."/".$adminDetails['profile_image'];
            }
            $notificationData['user_type']  = 'admin';
            $notificationData['title']      =   $request['title'];
            $notificationData['type']       =   'ADMIN_PUSH_NOTIFICATION';
            $notificationData['msg']        =   !empty($msg)?$msg:$request['title'];
            $notificationData['date']       = date("jS F Y G:i A");
            $result = Notification::create($notificationData);
            $userDeviceTokens = User::where('role_id',2)->where('mobile_verify_status',1)->whereNotNull('device_token')->where('device_token','!=','deviceToken')->select('id','device_token')->get();
            if(!empty($userDeviceTokens)){
                foreach($userDeviceTokens as $token){
                    CommonHelper::sendToAllNotification($token->device_token,$notificationData);
                }
            }
            
        }
      return array('status'=>200);
    }
  

}