<?php 
namespace App\Repository;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use App\Models\Notification;
use Illuminate\SuTeamspport\Facades\Storage;
use App\Helpers\CommonHelper;

class NotificationRepository {

    public function __construct(Notification $notification){
        $this->notification = $notification;
    }
    /**
     * Function: getNotificationList
     * Desc : get notificationList all data
     */
    public function getNotificationList($request){
        return $this->notification
                    ->where('user_id',$request['user']['id'])
                    ->where('role','!=','admin')
                    ->orderBy('id','desc')->paginate(10);
    }
    /**
     * Function : getAdminNotifications
     * Desc : get admin notifications
     */
    public function getAdminNotifications(){
        return $this->notification->where('role','admin')->orderBy('id','desc')->get();
    }

    /**
     * Function : delete
     * Desc : delete notification
     * @param $id
     */
    public function delete($id) {
       return $this->notification->where('id',$id)->delete();
    }
    /**
     * Function : deleteAllNotification
     * Desc : delete all notifications
     * @param @userID
     */
    public function deleteAllNotification($request){
        return $this->notification->where('user_id',$request['user']['id'])->delete();
    }
    
}