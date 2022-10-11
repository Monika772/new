<?php 
namespace App\Repository;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use App\Models\User;
use App\Models\GigsLoginLogout;
use Illuminate\SuTeamspport\Facades\Storage;
use App\Helpers\CommonHelper;

class EmployerRepository {

    public function __construct(User $user,GigsLoginLogout $gigsLoginLogout){
        $this->user = $user;
        $this->gigsLoginLogout = $gigsLoginLogout;
    }
    public function getEmployersList(){
        return $this->user->where('status','!=','deleted')->where('role_id','3')->orderBy('id','desc')->get();
    }
         
    public function delete($id) {
       return $this->user->where('id',$id)->update(['status'=>'deleted']);
    }
    public function updateStatus($id,$status) {
        return $this->user->where('id',$id)->update(['status'=>$status]);
     }
     public function getEmployerDetails($id){
        return $this->user->with('employersBusiness')->with('BusinessImages')
                     ->with(['gigs'=>function($query){
                        $query->whereIn('status',['pending','accepted','inprocess','completed']);
                    }])
                    ->with('gigs.gigrrTypes')
                    ->where('id',$id)
                    ->NotDeleted()->Employer()
                    ->select('id','role_id','first_name','last_name','email','country_code','mobile','profile_image','gender','address','latitude','status','longitude','dob','created_at')
                    ->first();
    }
    /**
     * Function : loginLogoutTime
     * Desc :  login logout datetime
     */
    public function loginLogoutTime($request){
        $user_id = $request['user']['id'];
        $gigsRequest = $this->gigsRequest->where('status','start')
                        ->where('employe_id',$user_id)->where('gigs_id',$request['gigs_id'])->first();
        if(empty($gigsRequest)){
            return response()->json(['success'=>false,'message' => __('messages.api.error.invalid_candidate_id'),
                    'data'=>$gigsRequest], 200);
        }
        $status = $request['status'];
        $currentTime = date("Y-m-d H:i:s");
        if($status=='login'){
           $this->gigsLoginLogout
                        ->create(['gigs_id'=>$request['gigs_id'],'candidate_id'=>$user_id,'login'=>$currentTime]);
            return response()->json(['success'=>true,'message' => __('messages.api.success.login_time_added'),'data'=>[]], 200);
        }else if($status=='logout'){
            $logoutTime = $this->gigsLoginLogout
                                    ->where('gigs_id',$request['gigs_id'])
                                    ->where('candidate_id',$user_id)
                                    ->whereNotNull('login')
                                    ->orderBy('id','desc')->first();
            if(!empty($logoutTime)){
                $secondsDifference  = strtotime($currentTime)-strtotime($logoutTime->login);
                $minutes            = intval($secondsDifference/60);
                $logoutTime->logout = $currentTime;
                $logoutTime->minutes = $minutes;
                $logoutTime->save();
                return response()->json(['success'=>true,'message' => __('messages.api.success.logout_time_added'),'data'=>[]], 200);
            }
            $this->gigsLoginLogout
                ->create(['gigs_id'=>$request['gigs_id'],'candidate_id'=>$user_id,'login'=>$currentTime,'logout'=>$currentTime,'minutes'=>0]);
            return response()->json(['success'=>true,'message' => __('messages.api.success.logout_time_added'),'data'=>[]], 200);
         } 
    }
     
}