<?php 
namespace App\Repository;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;
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

class AddressRepository   {

    private $user,$notification;
    public function __construct(User $user,Notification $notification)
    {
        
        $this->user                 = $user;
        $this->apiToken             = uniqid(base64_encode(Str::random(200)));
        $this->notification         = $notification;
       
        $this->userAddress          = new UserAddress;
    }
    public function addressdata($request){
       $usersData=$this->userAddress->where('user_id',$request['user']['id'])->get();
       return response()->json(['success'=>true,'message' => __('user address list'),'data'=>$usersData], 200); 
    }
    public function updateAddress($request){
        $address        =  $this->userAddress->where('id',$request->id)->update(['address'=> $request->address,'pincode'=>$request->pincode,"latitude"=>$request->latitude,"longitude"=>$request->longitude]);
        if($address){
            return response()->json(['success'=>true,'message' => __('address updated sucessfully'),'data'=>'' ], 200);   
        }else{
            return response()->json(['success'=>false,'message' => 'Please login.','data'=>'' ], 200);  
        } 
    }
}   
