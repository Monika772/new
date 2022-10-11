<?php

namespace App\Http\Controllers\Website;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

use App\Helpers\CommonHelper;
use App\Repository\DashboardRepository;

use DB;


use App\Models\User;

use Carbon\Carbon;
use Redirect;
use Session;

class HomeController extends Controller
{

    public function __construct(User $user,DashboardRepository $dashboardRepository){
        $this->user     = $user;
       $this->dashboardRepository=$dashboardRepository;

    }
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */

    public function index()
    {
        $counts = $this->dashboardRepository->getDashboradcount();
        $users_custom =$this->dashboardRepository->getData();
        $orders = $this->dashboardRepository->getRecentOrderData();
        // $gigs = $this->dashboardRepository->getGigsData();

        // $todayAmount = $this->dashboardRepository->getAmountData('today');

        // $earning = $this->dashboardRepository->getEarningsData('today');

        return view('Website.dashboard.Admindashboard',compact('counts','users_custom','orders'));
    }

    public function getAmountData($type){
        return $this->dashboardRepository->getAmountData($type);
    }

    public function getEarningsData($type){
        $earning = $this->dashboardRepository->getEarningsData($type);
        return view('Website.dashboard.earning',compact('earning'));
    }

    public function dashbord_data(){
        return  $this->dashboardRepository->getData();
    }

    public function logout(){
        Session::flush(); //clears out all the exisiting sessions
        Auth::logout();
        return Redirect::route('login');
    }


    public function show_verify(){
        return view('Website.otp_verify');
    }

        /** 

     * Write code on Method

     *

     * @return response()

     */

    public function saveToken(Request $request){
        $admin = CommonHelper::getAdminDetails();
        $admin->device_token = $request->token;
        $admin->save();
        return response()->json(['token saved successfully.']);
    }

  

    /**

     * Write code on Method

     *

     * @return response()

     */

    public function sendNotification(Request $request){
        $firebaseToken = User::whereNotNull('device_token')->pluck('device_token')->all();
        $SERVER_API_KEY = env('SERVER_KEY');
        $data = [
            "registration_ids" => $firebaseToken,
            "notification" => [
                "title" => $request->title,
                "body" => $request->body,  
            ]
        ];

        $dataString = json_encode($data);
        $headers = [
            'Authorization: key=' . $SERVER_API_KEY,

            'Content-Type: application/json',

        ];

    

        $ch = curl_init();

      

        curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');

        curl_setopt($ch, CURLOPT_POST, true);

        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        curl_setopt($ch, CURLOPT_POSTFIELDS, $dataString);

               

        $response = curl_exec($ch);

  

        dd($response);

    }

 
}
