<?php 
namespace App\Repository;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use App\Models\Rating;
use App\Models\Gigs;
use App\Models\Chat;
use App\Models\GigsRequest;
use App\Models\ContactSubjects;
use App\Models\AppContactUs;
use Illuminate\Support\Facades\Auth;
use Illuminate\SuTeamspport\Facades\Storage;
use App\Helpers\CommonHelper;
use App\Models\User;
class CommonRepository {

    public function __construct(Rating $rating,GigsRequest $gigsRequest,Gigs $gigs,ContactSubjects $contactSubjects,AppContactUs $appContactUs,Chat $chat,User $user){
        $this->rating           = $rating;
        $this->chat             = $chat;  
        $this->gigs             = $gigs;    
        $this->gigsRequest      = $gigsRequest;
        $this->appContactUs     = $appContactUs;
        $this->contactSubjects  = $contactSubjects;
        $this->user  = $user;
    }

    public function userRatingReview($request){
        $userId= $request['user']['id'];
        $role = $request['user']['role_id'];
        $gigs = $this->gigs->where('id',$request['gigs_id'])->select('id','gigs_id','employer_id')->first();
        if(empty($gigs)){
            return response()->json(['success'=>true,'message' => 'invalid gigs id','data'=>$gigs], 200);
        }
        if($role==3){
            $candidate_id = $request['candidate_id'];
            $gigsRequest  = $this->gigsRequest->where('status','complete')->where('employe_id',$candidate_id)
                                ->where('gigs_id',$request['gigs_id'])->first();
            if(empty($gigsRequest)){
                return response()->json(['success'=>false,'message' => 'invalid candidate id or gig not completed','data'=>[]], 200);
            }
            $ratingData['user_id']      =  $userId;
            $ratingData['user_type']    =  'employer';
            $ratingData['to_user_id']   =  $candidate_id;
            $ratingData['gigs_id']      =  $request['gigs_id'];
            $ratingData['rating']       =  $request['rating'];
            $ratingData['comments']     =  $request['comments'];
            $rating = $this->rating->create($ratingData);
            if(!empty($rating)){
                $message                     = 'Rating sent successfully';
                $notificationData['type']    = 'YOU_GOT_RATING';
                $notificationData['title']   = 'You got rating on gigs #'.$gigs['gigs_id'];
                $notificationData['message'] = 'Employer '.$request['user']['first_name'].' give rating on your gigs - #'.$gigs['gigs_id'];
                $notificationData['user_id'] = $candidate_id;
                $notificationData['gigs_id'] = $request['gigs_id'];
                sendNotification($notificationData);
                return response()->json(['success'=>true,'message' => $message,'data'=>[]], 200);
            }
        }else if($role==4){
            $gigsRequest = $this->gigsRequest->where('status','complete')->where('employe_id',$userId)
                            ->where('gigs_id',$request['gigs_id'])->first();
            if(empty($gigsRequest)){
                return response()->json(['success'=>false,'message' => 'invalid gigs id or gig not completed','data'=>[]], 200);
            }
            $ratingData['user_id']      =  $userId;
            $ratingData['to_user_id']   =  $gigs['employer_id'];
            $ratingData['user_type']    =  'candidate';
            $ratingData['gigs_id']      =  $request['gigs_id'];
            $ratingData['rating']       =  $request['rating'];
            $ratingData['comments']     =  $request['comments'];
            $rating = $this->rating->create($ratingData);
            if(!empty($rating)){
                $message                     = 'Rating sent successfully';
                $notificationData['type']    = 'YOU_GOT_RATING';
                $notificationData['title']   = 'You got rating on gigs #'.$gigs['gigs_id'];
                $notificationData['message'] = 'Candidate '.$request['user']['first_name'].' give rating on your gigs - #'.$gigs['gigs_id'];
                $notificationData['user_id'] = $gigs['employer_id'];
                $notificationData['gigs_id'] = $request['gigs_id'];
                sendNotification($notificationData);
                return response()->json(['success'=>true,'message' => $message,'data'=>[]], 200);
            }
        }
       
    }  
    /**
     * Function : contactSubjects
     * Desc : get contact subject
     */
    public function contactSubjects($request){
       $role = ($request['user']['role_id']==3)?"employer":"candidate";
        $subjects = $this->contactSubjects->where('role',$role)->where('status','active')->get();
        return response()->json(['success'=>true,'message' => '','data'=>$subjects], 200);
    } 

    public function sendContactUsAdmin($request){
        $userId = $request['user']['id'];
        $contactUs = $this->appContactUs->create(['user_id'=>$userId,'subject_id'=>$request['subject_id'],'message'=>$request['message']]);
        if(!empty($contactUs)){
            return response()->json(['success'=>true,'message' =>'Your request sent to admin successfully','data'=>$contactUs], 200);
        }else{
            return response()->json(['success'=>false,'message' => __('messages.api.error.something_went_wrong'),'data'=> []], 200);
        }
    }
    public function saveChat($request){
        $userId                         = $request['user']['id'];
        $admin                          = CommonHelper::getAdminDetails();
        $chatRequest['from_user_id']    = $userId;
        $chatRequest['to_user_id']      = $admin->id;
        $chatRequest['message']         = $request['message'];
        $chat = $this->chat->create($chatRequest);
        if(!empty($chat)){
            return response()->json(['success'=>true,'message' =>'Message sent','data'=>$chat], 200);
        }else{
            return response()->json(['success'=>false,'message' => __('messages.api.error.something_went_wrong'),'data'=> []], 200);
        }
    }

    public function getChat($request){
        $chats = $this->chat->where(function($query) use($request){
                                $query->where('from_user_id',$request['user']['id']);
                            })
                            ->orWhere(function($query) use($request){
                                $query->where('to_user_id',$request['user']['id']);
                            })
                            ->orderBy('id','desc')
                            ->paginate(10);
       return response()->json(['success'=>true,'message' =>'Message sent','data'=>$chats], 200);
    }

    public function getChatDetails($userId){
        return $this->chat->where(function($query) use($userId){
                    $query->where('from_user_id',$userId);
                })
                ->orWhere(function($query) use($userId){
                    $query->where('to_user_id',$userId);
                })
                ->orderBy('id','asc')
                ->get();
    }
    public function saveChatAdmin($request){
       $chat =  $this->chat
                    ->create(['from_user_id'=>Auth::user()->id,'to_user_id'=>$request['cust_id'],'message'=>$request['message']]);
        $notificationData['title']   =  'You have a new message';
        $notificationData['type']    = 'NEW_CHAT_MESSAGE';
        $notificationData['message'] = $request['message'];
        $notificationData['user_id'] = $request['cust_id'];
        $notificationData['gigs_id'] = 0;
        sendNotification($notificationData);
        return $chat;
    }

    public function loadChatUsers(){
       return $this->chat->with('chatUser:id,social_type,first_name,last_name,email,profile_image,gender,address')
                ->select('id','from_user_id','to_user_id')
                ->groupBy('from_user_id')
                ->orderBy('id','desc')->get();
      
    }
}