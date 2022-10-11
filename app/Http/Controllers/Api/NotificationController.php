<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use App\Repository\NotificationRepository;
use Carbon\Carbon;
use Validator;

class NotificationController extends Controller
{
    public function __construct(NotificationRepository $notification){
        $this->notification  = $notification;
    }

    /**
     * Function : category
     * Desc: get categpry listing
     */
   public function getNotifications(Request $request){
        try {
            $notification = $this->notification->getNotificationList($request);
            return response()->json(['success'=>true,'message' => '','data'=> $notification], 200);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
   }
   /**
    * Function : delete
    * Desc : delete all notification of user
    */
   public function delete(Request $request){
    try {
        $notification = $this->notification->deleteAllNotification($request);
        return response()->json(['success'=>true,'message' => '','data'=> $notification], 200);
    } catch (\Exception $e) {
        return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
    }
   }
   
   
}