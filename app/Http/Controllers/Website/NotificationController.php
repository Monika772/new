<?php

namespace App\Http\Controllers\Website;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Repository\NotificationRepository;
use App\Http\Requests\AddNotificationRequest;

use App\Models\User;
use App\Models\Notification;
use App\Models\Roles;
use Carbon\Carbon;
use Redirect;
use Session;
use DataTables;


class NotificationController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */

    public function __construct(NotificationRepository $notification,User $user )
    {   
        $this->notification = $notification;
        $this->user = $user;
    }

    public function index(Request $request){
        return view('Admin.notification.index');
        
    }
    public function getData(Request $request){
        try {
            $notification = $this->notification->getAdminNotifications($request);
            return datatables()->of($notification)->toJson();
        } catch (\Exception $e) {
            return redirect('notification')->with('error',$e->getMessage());
        }
    }
    
}
