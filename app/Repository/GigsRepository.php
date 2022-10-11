<?php 
namespace App\Repository;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use App\Models\Gigs;
use App\Models\EmployersBusiness;
use App\Models\GigsRequest;
use App\Models\Payment;
use App\Models\GigsLoginLogout;
use App\Models\User;
use Illuminate\Support\Facades\Storage;
use App\Helpers\CommonHelper;
use App\Repository\EmployeeRepository;
class GigsRepository   {

    public function __construct(Gigs $gigs,User $user,GigsRequest $gigsRequest,EmployersBusiness $employersBusiness,Payment $payment,GigsLoginLogout $gigsLoginLogout){
        $this->gigs = $gigs;
        $this->user = $user;
        $this->payment = $payment;
        $this->gigsRequest = $gigsRequest;
        $this->gigsLoginLogout = $gigsLoginLogout;
        $this->employersBusiness = $employersBusiness;
        $this->employeeRepository = new EmployeeRepository();
    }
    /**
     * Function : getGigsList
     * Desc : get gigs list show in admin
     */
    public function getGigsList($request){
        $gigs = $this->gigs->with('employer:id,first_name,last_name')
                    ->with('category:id,name')
                    ->select('id','gigs_id','employer_id','business_id','gig_address','gigrr_type','gig_name','gigs_start_date','gigs_end_date','gigs_starttime','gigs_endtime','status')
                    ->where('status','!=','deleted')
                    ->orderBy('id','desc')->get();
        if(!empty($gigs)){
            foreach($gigs as $gig){
                $gig->employer_name = isset($gig->employer->full_name)?$gig->employer->full_name:'N/A';
                $gig->category_name = isset($gig->category->name)?$gig->category->name:'N/A';
                $gig->job_starttime = date("H:i A",strtotime($gig->gigs_starttime));
                $gig->job_endtime = date("H:i A",strtotime($gig->gigs_endtime));
             }
        }
        return $gigs;
    }
    /**
     * Function : delete
     * Desc : delete gigs from admin
     */
    public function delete($id) {
        return $this->gigs->where('id',$id)->update(array('status'=>'deleted'));
    }
    /**
     * Function : updateStatus
     * Desc : updateg gig status from admin
     */
    public function updateStatus($id,$status) {
        return $this->gigs->where('id',$id)->update(['status'=>$status]);
     } 

     public function getGigDetails($id){
        $this->gigs->where('gigs_end_date','<',date("Y-m-d"))->update(['status'=>'completed']);
        return $this->gigs->with('gigrrTypes:id,name')
                    ->with(['gigsRequest'=>function($query){
                        $query->whereIn('status',['accpeted','favorite','roster','sent-offer','received-offer','cancel']);
                        $query->orderBy('gender','asc');
                    }])
                    ->with('gigsRequest.candidate:id,first_name,last_name,email,country_code,mobile,profile_image,gender,address,latitude,longitude,dob')
                    ->with('employer:id,first_name,last_name,email,country_code,mobile,profile_image,gender,address,latitude,longitude,dob')
                    ->with('gigrrBusiness.category')
                    ->with('gigrrBusiness.businessImages')
                    ->where('id',$id)
                    ->first();
     }
     
     /**
      * Function : create_job_id
      * Desc : create unique gig job ID
      */
     function create_job_id(){
        $oldorder = $this->gigs->whereRaw('id = (select max(id) from gigs)')->first();
        if ($oldorder) {
            $exp = explode('C', $oldorder->gigs_id);
            if ($exp[0] == date('y') . date('m')) {
                $no = $exp[1] + '1';
                $gigs_id = date('y') . date('m') . 'C' . $no;
            } else {
                $gigs_id = date('y') . date('m') . 'C1';
            }
        } else {
            $gigs_id = date('y') . date('m') . 'C1';
        }
        return $gigs_id;
    }
    /**
     * Function : getBusinessDetails
     * Desc : get business details
     */
    public function getBusinessDetails($businessId){
        return $this->employersBusiness->where('id',$businessId)->first();
    }
    /**
     * Function : gigsBooking
     * Desc : create new gigs booking
     */
     public function gigsBooking($request){
        $user_id                   = $request['user']['id'];
        $req['gigs_id']            = $this->create_job_id();
        $req['employer_id']        = $user_id;
        if(isset($request['business_id']) && !empty($request['business_id'])){
            $businessDetails = $this->getBusinessDetails($request['business_id']);
            if(empty($businessDetails)){
                return response()->json(['success'=>false,'message' => __('messages.api.error.invalid_business_id'),'data'=> []], 200);
            }
            $req['business_id']        = $businessDetails['id'];
            $req['gigs_latitude']      = $businessDetails['latitude'];
            $req['gigs_longitude']     = $businessDetails['longitude'];
            $req['gig_address']        = $businessDetails['business_address'];
        }else{
            $req['gigs_latitude']      = $request['user']['latitude'];
            $req['gigs_longitude']     = $request['user']['longitude'];
            $req['gig_address']        = $request['user']['address'];
        }
        
        $req['gigrr_type']         = $request['gigrr_type'];
        $req['gig_name']           = $request['gig_name'];
      
        $req['from_amount']        = $request['from_amount'];
        $req['to_amount']          = $request['to_amount'];
        $req['gigs_start_date']    = date("Y-m-d",strtotime($request['start_date']));
        $req['gigs_end_date']      = date("Y-m-d",strtotime($request['end_date']));
        $req['gigs_starttime']     = date("H:i:s",strtotime($request['start_time']));
        $req['gigs_endtime']       = date("H:i:s",strtotime($request['end_time']));
        $req['price_criteria']     = $request['price_criteria'];
       
        $gigs = $this->gigs->create($req);
        if(!empty($gigs)){
            $candidates = $this->searchCandidateAndAssignJobs($gigs,$request);
            $gigs['candidates'] = $candidates;
            return response()->json(['success'=>true,'message' => __('messages.api.success.gigs_created_success'),'data'=>$gigs], 200);
        }else{
            return response()->json(['success'=>false,'message' => __('messages.api.error.something_went_wrong'),'data'=> []], 200);
        }
     }

     /**
      * Function : searchCandidtaes
      * Desc : search candidates
      */
     public function searchCandidateAndAssignJobs($gigs,$request){
        $isSearch='No';
        $candidateIds =[];
        $SEARCH_RADIUS_IN_KM  = CommonHelper::getAdminSettings('SEARCH_RADIUS_IN_KM');
        $latitude  = $gigs['gigs_latitude'];
        $longitude = $gigs['gigs_longitude'];
        $haversine = "(6371 * acos(cos(radians($latitude)) 
                     * cos(radians(latitude)) 
                     * cos(radians(longitude) 
                     - radians($longitude)) 
                     + sin(radians($latitude)) 
                     * sin(radians(latitude))))";
        $employees = $this->user->where('status','active')
                        ->where('id','!=',$request['user']['id'])
                        ->Candidate()
                        ->where(function($query) use($request){
                            if(isset($request['skills']) && !empty($request['skills'])){
                                $query->whereHas('employeeSkills',function($query1) use($request){
                                    $query1->whereIn('skill_id',explode(",",$request['skills']));
                                });
                            }
                            if(isset($request['shift']) && !empty($request['shift'])){
                                $query->whereHas('employeeProfile',function($query1) use($request){
                                    $query1->where('shift',$request['shift']);
                                });
                            }
                        })
                        
                        ->select('id','first_name','last_name')
                        ->selectRaw("{$haversine} AS distance")
                        ->whereRaw("{$haversine} < ?", [$SEARCH_RADIUS_IN_KM])
                        ->get();
        if(!empty($employees)){
            $isSearch ='Yes';
            foreach($employees as $employee){
                $candidateIds[] = $employee->id;
                $reqUser['gigs_id']  = $gigs->id;
                $reqUser['employe_id'] = $employee->id;
                $reqUser['status'] = 'request';
                $this->gigsRequest->create($reqUser);
                $notificationData['type']   = 'RECEIVED_NEW_GIG_REQUEST';
                $notificationData['title']   = 'Recieved a new gig request';
                $notificationData['message'] = 'You have recieved a new gigs - #'.$gigs['gigs_id']." request.";
                $notificationData['user_id'] = $employee->id;
                $notificationData['gigs_id'] = $gigs->id;
                sendNotification($notificationData);
            }
        }
        return ['search'=>$isSearch,'candidateIds'=>$candidateIds];
     
     }
     /**
      * Function : getAllGigs
      * Desc  : get all gigs
      * Role : Employer Side
      */
     public function getAllGigs($request){
        $user_id = $request['user']['id'];
        $gigs    = $this->gigs->where('employer_id',$user_id)
                        ->with('gigrrBusiness.category')
                        ->with('gigrrTypes')
                        ->with('gigsRequest.candidate:id,role_id,first_name,last_name,email,country_code,mobile,profile_image,gender,address,latitude,longitude,dob')
                        ->with('gigsRequest.candidateImages')
                        ->with(['gigsRequest'=>function($query){
                             $query->whereIn('status',['accepted','favorite','roster','sent-offer','received-offer','start','complete']);
                        }])
                        ->withCount(['gigsRequest'=>function($query){
                             $query->whereIn('status',['accepted','favorite','roster','sent-offer','received-offer','start','complete']);
                        }])
                      
                        ->whereNotIn('status',['cancelled','deleted'])
                       // ->whereDate('gigs_end_date','>',date("Y-m-d"))
                        ->orderBy('id','desc')->paginate(10);
        return response()->json(['success'=>true,'message' => '','data'=>$gigs], 200);
     }
    /**
      * Function : myRosterGigs
      * Desc  : get all gigs roster candidates
      * Role : Employer Side
      */
     public function myRosterGigs($request){
        $user_id = $request['user']['id'];
        $gigs    = $this->gigs->where('employer_id',$user_id)
                        ->with('gigrrBusiness.category')
                        ->with('gigrrTypes')
                        ->with('gigsRequest.candidate:id,role_id,first_name,last_name,email,country_code,mobile,profile_image,gender,address,latitude,longitude,dob')
                        ->with('gigsRequest.candidateImages')
                        ->whereHas('gigsRequest',function($query){
                            $query->whereIn('status',['roster','start','complete']);
                        })
                        ->with(['gigsRequest'=>function($query){
                           $query->whereIn('status',['roster','start','complete']);
                        }])
                        ->withCount(['gigsRequest'=>function($query){
                           $query->whereIn('status',['roster','start','complete']);
                        }])
                       
                        ->whereNotIn('status',['cancelled','deleted'])
                       // ->whereDate('gigs_end_date','>',date("Y-m-d"))
                        ->orderBy('id','desc')->paginate(10);
        return response()->json(['success'=>true,'message' => '','data'=>$gigs], 200);
     }
    
     /**
      * Function : getSentOfferGigs
      * Desc  : get sent offer via gigs wise
      * Role : Employer Side
      */
     public function getSentOfferGigs($request){
        $user_id = $request['user']['id'];
        $gigs    = $this->gigs->where('employer_id',$user_id)->where('id',$request['gigs_id'])
                        ->with('gigrrBusiness.category')
                        ->with('gigrrTypes')
                        ->with('gigsRequest.candidate:id,role_id,first_name,last_name,email,country_code,mobile,profile_image,gender,address,latitude,longitude,dob')
                        ->with('gigsRequest.candidateImages')
                        // ->whereHas('gigsRequest',function($query){
                        //     $query->whereIn('status',['sent-offer','received-offer']);
                        // })
                        ->with(['gigsRequest'=>function($query){
                             $query->whereIn('status',['sent-offer','received-offer']);
                        }])
                        ->withCount(['gigsRequest'=>function($query){
                             $query->whereIn('status',['sent-offer','received-offer']);
                        }])
                       
                        ->whereNotIn('status',['cancelled','deleted'])
                       // ->whereDate('gigs_end_date','>',date("Y-m-d"))
                        ->first();
        return response()->json(['success'=>true,'message' => '','data'=>$gigs], 200);
     }
     
     /**
      * Function : getMyRosterViaGigs
      * Desc  : get my roster via gigs wise
      * Role : Employer Side
      */
     public function getMyRosterViaGigs($request){
        $user_id = $request['user']['id'];
        $gigs    = $this->gigs->where('employer_id',$user_id)
                        ->where('id',$request['gigs_id'])
                        ->with('gigrrBusiness.category')
                        ->with('gigrrTypes')
                        ->with('gigsRequest.candidate:id,role_id,first_name,last_name,email,country_code,mobile,profile_image,gender,address,latitude,longitude,dob')
                        ->with('gigsRequest.candidateImages')
                        ->whereHas('gigsRequest',function($query) use($request){
                            if(isset($request['candidate_id']) && !empty($request['candidate_id'])){
                                $query->where('employe_id',$request['candidate_id']);
                            }
                            $query->whereIn('status',['roster','start','complete']);
                        })
                        ->with(['gigsRequest'=>function($query) use($request){
                            if(isset($request['candidate_id']) && !empty($request['candidate_id'])){
                                $query->where('employe_id',$request['candidate_id']);
                            }
                             $query->whereIn('status',['roster','start','complete']);
                        }])
                        ->withCount(['gigsRequest'=>function($query) use($request){
                            if(isset($request['candidate_id']) && !empty($request['candidate_id'])){
                                $query->where('employe_id',$request['candidate_id']);
                            }
                             $query->whereIn('status',['roster','start','complete']);
                        }])
                       
                        ->whereNotIn('status',['cancelled','deleted'])
                       // ->whereDate('gigs_end_date','>',date("Y-m-d"))
                       ->first();
        return response()->json(['success'=>true,'message' => '','data'=>$gigs], 200);
     }

     /**
      * Function : getCandidatesGigsRequest
      * Desc : get candidates gigs request
      * Role : Candidates
      */
     public function getCandidatesGigsRequest($request){
        $gigs = $this->gigs
                        ->whereHas('gigsRequest',function($query) use($request){
                            $query->where('employe_id', $request['user']['id'])
                            ->whereIn('status',['request']);
                        })
                        ->with(['gigsRequest'=>function($query) use($request){
                            $query->where('employe_id', $request['user']['id'])
                            ->whereIn('status',['request']);
                        }])
                        ->with('gigrrBusiness.category')
                        ->with('gigrrTypes')
                        ->where(function($query) use ($request){
                            if(isset($request['latitude']) && !empty($request['latitude']) 
                               && isset($request['longitude']) && !empty($request['longitude'])){
                                $SEARCH_RADIUS_IN_KM  = CommonHelper::getAdminSettings('SEARCH_RADIUS_IN_KM');
                                if(isset($request['distance']) && !empty($request['distance'])){
                                    $SEARCH_RADIUS_IN_KM = $request['distance'];
                                }
                                $latitude  = $request['latitude'];
                                $longitude = $request['longitude'];
                                $haversine = "(6371 * acos(cos(radians($latitude)) 
                                                * cos(radians(gigs_latitude)) 
                                                * cos(radians( gigs_longitude) 
                                                - radians($longitude)) 
                                                + sin(radians($latitude)) 
                                                * sin(radians(gigs_latitude))))";
                                $query->selectRaw("{$haversine} AS distance")->whereRaw("{$haversine} < ?", [$SEARCH_RADIUS_IN_KM]);
                            }
                            // if(isset($request['pay-range-from']) && !empty($request['pay-range-from']) && isset($request['pay-range-to']) && !empty($request['pay-range-to'])){
                            //     $query->where(function($qu) use($request){
                            //         $qu->whereBetween('from_amount',[$request['pay-range-from'],$request['pay-range-to']]);
                            //         $qu->whereBetween('to_amount',[$request['pay-range-from'],$request['pay-range-to']]);
                            //     });
                            // }
                            //  if(isset($request['avaliable-from']) && !empty($request['avaliable-from']) && isset($request['avaliable-to']) && !empty($request['avaliable-to'])){
                            //      $query->whereDate('gigs_start_date','>=',$request['avaliable-from'])
                            //            ->whereDate('gigs_end_date','<=',$request['avaliable-to']);
                            //  }
                            if(isset($request['skills']) && !empty($request['skills'])){
                                $query->whereRaw("FIND_IN_SET(gigrr_type,'".$request['skills']."')");
                            }
                        })
                        ->whereDate('gigs_end_date','>=',date("Y-m-d"))
                        ->with('gigrrBusiness.businessImages')
                        ->orderBy('id','desc')->paginate(10);
     
        return response()->json(['success'=>true,'message' => '','data'=>$gigs], 200);
     }
     public function getCandidatesGigsRequestV1($request){
        $gigs = $this->gigs
                        // ->whereHas('gigsRequest',function($query) use($request){
                        //     $query->where('employe_id', $request['user']['id'])
                        //     ->whereIn('status',['request']);
                        // })
                        ->with(['gigsRequest'=>function($query) use($request){
                            $query->where('employe_id', $request['user']['id'])
                            ->whereIn('status',['request']);
                        }])
                        ->where(function($query) use($request){
                            $gigsIDs = $this->getGigsSentRequestEmployee($request['user']['id']);
                            if(!empty($gigsIDs)){
                                $query->whereNotIn('id',$gigsIDs);
                            }
                        })
                        ->where(function($query) use($request){
                            if(!empty($request['gigs_id'])){
                                $query->where('id',$request['gigs_id']);
                            }
                            
                        })
                        ->with('gigrrBusiness.category')
                        ->with('gigrrTypes')
                        ->where(function($query) use ($request){
                            if(isset($request['latitude']) && !empty($request['latitude']) 
                               && isset($request['longitude']) && !empty($request['longitude'])){
                                $SEARCH_RADIUS_IN_KM  = CommonHelper::getAdminSettings('SEARCH_RADIUS_IN_KM');
                                if(isset($request['distance']) && !empty($request['distance'])){
                                    $SEARCH_RADIUS_IN_KM = $request['distance'];
                                }
                                $latitude  = $request['latitude'];
                                $longitude = $request['longitude'];
                                $haversine = "(6371 * acos(cos(radians($latitude)) 
                                                * cos(radians(gigs_latitude)) 
                                                * cos(radians( gigs_longitude) 
                                                - radians($longitude)) 
                                                + sin(radians($latitude)) 
                                                * sin(radians(gigs_latitude))))";
                                $query->selectRaw("{$haversine} AS distance")->whereRaw("{$haversine} < ?", [$SEARCH_RADIUS_IN_KM]);
                            }
                            // if(isset($request['pay-range-from']) && !empty($request['pay-range-from']) && isset($request['pay-range-to']) && !empty($request['pay-range-to'])){
                            //     $query->where(function($qu) use($request){
                            //         $qu->whereBetween('from_amount',[$request['pay-range-from'],$request['pay-range-to']]);
                            //         $qu->whereBetween('to_amount',[$request['pay-range-from'],$request['pay-range-to']]);
                            //     });
                            // }
                            //  if(isset($request['avaliable-from']) && !empty($request['avaliable-from']) && isset($request['avaliable-to']) && !empty($request['avaliable-to'])){
                            //      $query->whereDate('gigs_start_date','>=',$request['avaliable-from'])
                            //            ->whereDate('gigs_end_date','<=',$request['avaliable-to']);
                            //  }
                            if(isset($request['skills']) && !empty($request['skills'])){
                              //  $query->whereRaw("FIND_IN_SET(gigrr_type,'".$request['skills']."')");
                            }
                        })
                        ->whereDate('gigs_end_date','>=',date("Y-m-d"))
                        ->with('gigrrBusiness.businessImages')
                        ->orderBy('id','desc')->paginate(10);
     
        return response()->json(['success'=>true,'message' => '','data'=>$gigs], 200);
     }
     /**
      * Function : getGigsSentRequestEmployee
      * Desc :get gigs sent request employee
      */
     public function getGigsSentRequestEmployee($candidateId){
        return $this->gigsRequest->where('employe_id',$candidateId)->where('status','!=','request')->pluck('gigs_id');
     }
       /**
      * Function : getCandidatesGigsAccepted
      * Desc : get candidates gigs applied
      * Role : Candidates
      */
      public function getCandidatesGigsAccepted($request){
        $gigs = $this->gigs
                        ->whereHas('gigsRequest',function($query) use($request){
                            $query->where('employe_id', $request['user']['id'])
                           ->whereIn('status',['accepted','favorite','roster','sent-offer','received-offer','start','complete']);
                        })
                        ->with(['gigsRequest'=>function($query) use($request){
                            $query->where('employe_id', $request['user']['id'])
                           ->whereIn('status',['accepted','favorite','roster','sent-offer','received-offer','start','complete']);
                        }])
                        ->with('gigrrBusiness.businessImages')
                        ->orderBy('id','desc')->paginate(10);
     
        return response()->json(['success'=>true,'message' => '','data'=>$gigs], 200);
     }
     
     /**
      * Function : gigsAcceptedCandidates
      * Desc : gigs accepted candidates list
      * Roles : Employer
      */
     public function gigsAcceptedCandidates($request){
            $gigs = $this->gigs->where('id',$request['gigs_id'])->where('employer_id',$request['user']['id'])->first();
            if(empty($gigs)){
                return response()->json(['success'=>false,'message' => 'Invalid Gigs ID','error'=>array('message'=>'Invalid Gigs ID'),'data'=>[]], 200);
            }
            $acceptedUsers  = $this->gigs->where('employer_id',$request['user']['id'])->where('id',$request['gigs_id'])
                                ->with('gigsRequest.candidate.employeeProfile.skills')
                                ->with('gigsRequest.candidateImages')
                                ->whereHas('gigsRequest',function($query) use($request){
                                    $query->where('gigs_id', $request['gigs_id'])
                                    ->whereIn('status',['accepted']);
                                })
                                ->with(['gigsRequest'=>function($query) use($request){
                                    $query->where('gigs_id', $request['gigs_id'])
                                    ->whereIn('status',['accepted']);
                                }])
                               
                                ->first();
            
            return response()->json(['success'=>true,'message' => '','data'=>$acceptedUsers], 200);
     }

     /**
      * Function : acceptGigsRequest
      * Desc : accept candidate gigs request
      * Role : Candidates
      */
     public function acceptGigsRequest($request){
        $gigs = $this->gigs->where('id',$request['gigs_id'])
                    // ->whereHas('gigsRequest',function($query) use($request){
                    //     $query->where('employe_id', $request['user']['id'])
                    //     ->where('status','request');
                    // })
                    ->first();
        if(empty($gigs)){

            return response()->json(['success'=>false,'message' => __('messages.api.error.invalid_gig_id'),'error'=>array('message'=>__('messages.api.error.invalid_gig_id')),'data'=>[]], 200);
        }
        $this->gigsRequest->updateOrCreate(
            ['employe_id' => $request['user']['id'],'gigs_id'=>$request['gigs_id']],
            ['employe_id' => $request['user']['id'],'gigs_id'=>$request['gigs_id'],'status'=>'accepted']);
       // $this->gigsRequest->where('employe_id',$request['user']['id'])->where('gigs_id',$request['gigs_id'])->update(['status'=>'accepted']);
        $notificationData['title']   = 'Accept Gigs Request';
        $notificationData['message'] = $request['user']['full_name']." accept your gigs request of - #".$gigs['gigs_id'];
        $notificationData['user_id'] = $gigs['employer_id'];
        $notificationData['gigs_id'] = $gigs['id'];
        $notificationData['type']   = 'CANDIDATE_ACCEPT_GIGS_REQUEST';
        sendNotification($notificationData);
        
        return response()->json(['success'=>true,'message' => __('messages.api.success.gig_request_accepted'),'data'=>$gigs], 200);
     }
     /**
      * Functon : getCandidatesAllGigs
      * Desc : get candidates all gigs
      * Role : Candidates
      */
     public function getCandidatesAllGigs($request){
        $gigs = $this->gigs
                ->whereHas('gigsRequest',function($query) use($request){
                        $query->where('employe_id', $request['user']['id']);
                })
                ->with(['gigsRequest'=>function($query) use($request){
                        $query->where('employe_id', $request['user']['id']);
                 }])
                ->with('gigrrBusiness.businessImages')
                ->orderBy('id','desc')->paginate(10);

        return response()->json(['success'=>true,'message' => '','data'=>$gigs], 200);
     }

     /**
      * Function : gigsCandidateSentOffer
      * Des : gigs candidates sent offer
      * Role : Employer
      */
     public function gigsCandidateSentOffer($request){
        $gigs = $this->gigs->where('id',$request['gigs_id'])->select('id','gigs_id')->first();
        if(empty($gigs)){
            return response()->json(['success'=>true,'message' => 'invalid gigs id','data'=>$gigs], 200);
        }
        $gigsRequest = $this->gigsRequest->where('employe_id',$request['candidate_id'])
                        ->where('gigs_id',$request['gigs_id'])->first();
        if(empty($gigsRequest)){
            return response()->json(['success'=>true,'message' => __('messages.api.error.invalid_candidate_id'),'data'=>$gigsRequest], 200);
        }
        $gigsRequest->status= 'sent-offer';
        $gigsRequest->offer_amount= $request['offer_amount'];
        $gigsRequest->save();
        $notificationData['user_id'] = $request['candidate_id'];
        $notificationData['gigs_id'] = $request['gigs_id'];
        $notificationData['title']   =  __('messages.api.notification.GIGS_SENT_OFFER');
        $notificationData['type']   = 'EMPLOYER_SENT_GIGS_OFFER';
        $notificationData['message'] = 'You have recieved offer request for gigs - #'.$gigs['gigs_id'];
        sendNotification($notificationData);
        return response()->json(['success'=>true,'message' => __('messages.api.success.gigs_sent_offer_candidate'),'data'=>[]], 200);
     }
     /**
      * Function : gigsCandidateAddRoster
      * Desc : gigs candidate add to roster
      * Role : Employers
      */
     public function gigsCandidateAddRoster($request){
        $gigs = $this->gigs->where('id',$request['gigs_id'])->select('id','gigs_id')->first();
        if(empty($gigs)){
            return response()->json(['success'=>true,'message' => 'invalid gigs id','data'=>$gigs], 200);
        }
        $gigsRequest = $this->gigsRequest->where('employe_id',$request['candidate_id'])
                        ->where('gigs_id',$request['gigs_id'])->first();
        if(empty($gigsRequest)){
            return response()->json(['success'=>true,'message' => __('messages.api.error.invalid_candidate_id'),'data'=>$gigsRequest], 200);
        }
        $message='';
        if($request['status']=='roster'){
           $gigsRequest->status= 'roster';
           $gigsRequest->save();
           $message                     = 'Successfully added candidate to as a Roster';
           $notificationData['type']    = 'EMPLOYER_ADD_ROSTER_TO_CANDIDATE';
           $notificationData['title']   = 'Add To Roster';
           $notificationData['message'] = 'You added as a roster for gigs - #'.$gigs['gigs_id'];
           $notificationData['user_id'] = $request['candidate_id'];
           $notificationData['gigs_id'] = $request['gigs_id'];
           sendNotification($notificationData);
        }else{
            $gigsRequest->status= 'cancel';
            $gigsRequest->save();
            $message = 'Candidate profile cancelled successfully';
         }
      
        return response()->json(['success'=>true,'message' => $message,'data'=>[]], 200);
    }

    public function getMyGigsRosterList($request){
        $acceptedUsers  = $this->gigs->with('gigrrBusiness.businessImages')
                                ->whereHas('gigsRequest',function($query) use($request){
                                    $query->where('employe_id', $request['user']['id'])
                                    ->whereIn('status',['roster','start','complete']);
                                })
                                ->with(['gigsRequest'=>function($query) use($request){
                                    $query->where('employe_id', $request['user']['id'])
                                    ->whereIn('status',['roster','start','complete']);
                                }])
                            ->orderBy('id','desc')->paginate(10);
        
        return response()->json(['success'=>true,'message' => '','data'=>$acceptedUsers], 200);
    }
    /**
     * Function : updateJobStatus
     * Desc : update job status
     */
    public function updateJobStatus($request){
            $user_id = $request['user']['id'];
            $gigs = $this->gigs->where('id',$request['gigs_id'])->select('id','gigs_id','employer_id')->first();
            if(empty($gigs)){
                return response()->json(['success'=>true,'message' => 'invalid gigs id','data'=>$gigs], 200);
            }
            
            if($request['status']=='start'){
                // $isServe = $request['user']['serve_job'];
                // if($isServe=='1'){
                //     return response()->json(['success'=>true,'message' => 'Already serving job. Please complete already serving job.','data'=>$gigs], 200);
                // }
                $gigsRequest = $this->gigsRequest->where('status','roster')->where('employe_id',$user_id)
                            ->where('gigs_id',$request['gigs_id'])->first();
                if(empty($gigsRequest)){
                    return response()->json(['success'=>false,'message' => __('messages.api.error.invalid_candidate_id'),'data'=>$gigsRequest], 200);
                }
                $gigsRequest->start_otp = CommonHelper::genrateOTPCode();
                $gigsRequest->save();
                $message = 'Please verify OTP with employer to start the job';
                $notificationData['type']    = 'JOB_START_OTP_CODE';
                $notificationData['title']   = 'Job start otp code';
                $notificationData['message'] = 'You got a otp code '.$gigsRequest->start_otp.' to start gigs - #'.$gigs['gigs_id']." with employee of ".$request['first_name'];
                $notificationData['user_id'] = $gigs['employer_id'];
                $notificationData['gigs_id'] = $request['gigs_id'];
                sendNotification($notificationData);
                return response()->json(['success'=>true,'message' => $message,'data'=>[]], 200);
            }else  if($request['status']=='complete'){
                $gigsRequest = $this->gigsRequest->where('status','start')->where('employe_id',$user_id)
                            ->where('gigs_id',$request['gigs_id'])->first();
                if(empty($gigsRequest)){
                    return response()->json(['success'=>false,'message' => 'Please start job first','data'=>$gigsRequest], 200);
                }
                $gigsRequest->end_otp = CommonHelper::genrateOTPCode();
                $gigsRequest->save();
                $message = 'Please verify OTP with employer to complete the job';
                $notificationData['type']    = 'JOB_COMPLETE_OTP_CODE';
                $notificationData['title']   = 'Job complete otp code';
                $notificationData['message'] = 'You got a otp code '.$gigsRequest->start_otp.' to complete gigs - #'.$gigs['gigs_id']." with employee of ".$request['first_name'];
                $notificationData['user_id'] = $gigs['employer_id'];
                $notificationData['gigs_id'] = $request['gigs_id'];
                sendNotification($notificationData);

                $logoutTime = $this->gigsLoginLogout
                                    ->where('gigs_id',$request['gigs_id'])
                                    ->where('candidate_id',$user_id)
                                    ->whereNotNull('login')
                                    ->orderBy('id','desc')->first();
                if(!empty($logoutTime)){
                    $currentTime        = date("Y-m-d H:i:s");
                    $secondsDifference  = strtotime($currentTime)-strtotime($logoutTime->login);
                    $minutes            = intval($secondsDifference/60);
                    $logoutTime->logout = $currentTime;
                    $logoutTime->minutes = $minutes;
                    $logoutTime->save();
                }
                return response()->json(['success'=>true,'message' => $message,'data'=>[]], 200);
            }

           return response()->json(['success'=>false,'message' => 'Invalid status','data'=>[]], 200);
    }

    public function gigsVerifyOtp($request){
        $user_id =$request['user']['id'];
        $gigs = $this->gigs->where('id',$request['gigs_id'])->select('id','gigs_id','employer_id')->first();
        if(empty($gigs)){
            return response()->json(['success'=>true,'message' => 'invalid gigs id','data'=>$gigs], 200);
        }
        if($request['status']=='start'){
            $gigsRequest = $this->gigsRequest->where('status','roster')->where('employe_id',$user_id)
                        ->where('gigs_id',$request['gigs_id'])->first();
            if(empty($gigsRequest)){
                return response()->json(['success'=>false,'message' => __('messages.api.error.invalid_candidate_id'),'data'=>$gigsRequest], 200);
            }
            if($gigsRequest->start_otp!=$request['otp']){
                return response()->json(['success'=>false,'message' => 'Invalid OTP code or otp code expired','data'=>$gigsRequest], 200);
            }
            $gigsRequest->status         = 'start';
            $gigsRequest->save();
            $message                     = 'Your gigs start otp verified successfullly.';
            $notificationData['type']    = 'JOB_START_OTP_VERIFIED';
            $notificationData['title']   = 'Job start otp code';
            $notificationData['message'] = 'Candidate '.$request['user']['first_name'].' verified otp successfuly to start gigs - #'.$gigs['gigs_id'];
            $notificationData['user_id'] = $gigs['employer_id'];
            $notificationData['gigs_id'] = $request['gigs_id'];
            sendNotification($notificationData);
            return response()->json(['success'=>true,'message' => $message,'data'=>[]], 200);
        }else  if($request['status']=='complete'){
            $gigsRequest = $this->gigsRequest->where('status','start')->where('employe_id',$user_id)
                        ->where('gigs_id',$request['gigs_id'])->first();
            if(empty($gigsRequest)){
                return response()->json(['success'=>false,'message' => 'Please start job first','data'=>$gigsRequest], 200);
            }
            if($gigsRequest->end_otp!=$request['otp']){
                return response()->json(['success'=>false,'message' => 'Invalid OTP code or otp code expired','data'=>$gigsRequest], 200);
            }
            $gigsRequest->status = 'complete';
            $gigsRequest->save();
            $message = 'Your gigs end job otp verified successfullly.';
            $notificationData['type']    = 'JOB_COMPLETE_OTP_VERIFIED';
            $notificationData['title']   = 'Job complete otp code';
            $notificationData['message'] = 'Candidate '.$request['user']['first_name'].' verified otp successfuly to complete gigs - #'.$gigs['gigs_id'];
            $notificationData['user_id'] = $gigs['employer_id'];
            $notificationData['gigs_id'] = $request['gigs_id'];
            sendNotification($notificationData);
            return response()->json(['success'=>true,'message' => $message,'data'=>[]], 200);
        }

       return response()->json(['success'=>false,'message' => 'Invalid status','data'=>[]], 200);
    }

    public function gigsCandidatePayment($request){
        $user_id =$request['user']['id'];
        $gigs_id = $request['gigs_id'];
        $gigs = $this->gigs->where('id',$request['gigs_id'])->select('id','gigs_id','employer_id')->first();
        if(empty($gigs)){
            return response()->json(['success'=>true,'message' => 'invalid gigs id','data'=>$gigs], 200);
        }
        $gigsRequest = $this->gigsRequest->where('status','complete')->with('candidate')
                            ->where('employe_id',$request['candidate_id'])
                            ->where('gigs_id',$request['gigs_id'])
                            ->first();
        if(empty($gigsRequest)){
            return response()->json(['success'=>false,'message' => 'Please wait for complete gigs','data'=>$gigsRequest], 200);
        }
        $checkPayment = $this->payment
                            ->where('gigs_id',$request['gigs_id'])
                            ->where('employer_id',$user_id)
                            ->where('status','completed')
                            ->where('candidate_id',$request['candidate_id'])
                            ->first();
        if(!empty($checkPayment)){
            return response()->json(['success'=>false,'message' => 'Payment already completed','data'=>$checkPayment], 200);
        }
        $payment['payment_mode']                = isset($request['payment_mode'])?$request['payment_mode']:'cash';
        if($payment['payment_mode']=='online'){
            $transactionId = isset($request['transaction_id'])?$request['transaction_id']:'';
            if($transactionId){
               $paymentResponse = CommonHelper::verifyEmployerPaymentOrder($transactionId);
               if($paymentResponse && $paymentResponse['id']){
                    $status = $paymentResponse['status'];
                    if(!in_array($status,['created','authorized','captured'])){
                        return response()->json(['success'=>false,'message' => 'Your Payment is not processed. Please wait for a while or contact to admin','data'=>$paymentResponse], 200);
                    }
                    $request['transaction_response'] = json_encode($paymentResponse);
                   // $request['amount'] = round($paymentResponse['amount'] / 100,2);
               }
            }
        }
        $payment['employer_id']                 = $user_id;
        $payment['candidate_id']                = $request['candidate_id'];
        $payment['gigs_id']                     = $request['gigs_id'];
        $payment['discount']                    = '0.00';
        $payment['amount']                      = $request['amount'];
        $payment['admin_commission']            = CommonHelper::getAdminSettings('ADMIN_COMMISSION_IN_PERCENTAGE');
        $payment['admin_income']                = CommonHelper::adminIncome($request['amount']);
        $payment['candidate_income']            = CommonHelper::candidateIncome($request['amount']);
        $payment['transaction_id']              = isset($request['transaction_id'])?$request['transaction_id']:CommonHelper::getTransactionId();
        $payment['payment_response']            = isset($request['transaction_response']) && $request['transaction_response']?json_encode($request['transaction_response']):CommonHelper::getTransactionId();
        $payment['status']                      = 'completed';
     
        $payment['candidate_transfer_amount']   = ($payment['payment_mode']=='cash')?1:0;
        $paymentData = $this->payment->create($payment);
        if(!empty($paymentData)){
            if($payment['payment_mode']=='online'){
                Log::debug('gigsCandidatePayment check', ['user_id' => $request['candidate_id'],'gigs_id'=>$gigs_id,'candidate_income'=>$payment['candidate_income'],'payment_id'=>$paymentData->id]);
                CommonHelper::candidatePayoutsViaBankAccount($request['candidate_id'],$gigs_id,$payment['candidate_income'],$paymentData->id);
            }
            
            $notificationData['type']    = 'PAYMENT_RECIEVED_CANDIDATE';
            $notificationData['title']   = 'Gigs Payment Recieved';
            $notificationData['message'] = 'Employer '.$request['user']['first_name'].' transferred payment to complete gigs - #'.$gigs['gigs_id'];
            $notificationData['user_id'] = $request['candidate_id'];
            $notificationData['gigs_id'] = $request['gigs_id'];
            sendNotification($notificationData);

            $notificationData['type']    = 'PAYMENT_TRANSFERRED_CANDIDATE';
            $notificationData['title']   = 'Gigs Payment Transferred';
            $notificationData['message'] = 'Your transferred payment is successfully done to complete gigs - #'.$gigs['gigs_id']." of candidate - ".$gigsRequest['candidate']['first_name'];
            $notificationData['user_id'] = $gigs['employer_id'];
            $notificationData['gigs_id'] = $request['gigs_id'];
            sendNotification($notificationData);

            return response()->json(['success'=>true,'message' => 'Payment successfully transferred in candidate account','data'=>$paymentData], 200);
        }else{
            return response()->json(['success'=>false,'message' => 'Paymeent transferred process is failed. Please try again','data'=>[]], 200);
        }

    }


    /**
     * Function : gigsPaymentHistory
     * Desc :gigs payment history
     * Role : Employer
     */
    public function gigsPaymentHistory($request){
        $payment = $this->payment->where('employer_id',$request['user']['id'])
                    ->where(function($query) use($request){
                        if(isset($request['candidate_id']) && !empty($request['candidate_id'])){
                            $query->where('candidate_id',$request['candidate_id']);
                        }
                        if((isset($request['start_date']) && isset($request['end_date'])) 
                                && (!empty($request['start_date']) && !empty($request['end_date'])) )
                            {
                                    $query->whereDate('created_at','>=',$request['start_date'])
                                    ->whereDate('created_at','<=',$request['end_date']);
                            }
                            
                        })
                    ->with('gigs')->with('candidate')
                    ->paginate(10);
        return response()->json(['success'=>true,'message' => '','data'=>$payment], 200);
    }
    /**
     * Function : candidatePaymentHistory
     * Desc : candidate paymenthistory
     */
    public function candidatePaymentHistory($request){
        $payment = $this->payment->where('candidate_id',$request['user']['id'])
                    ->where(function($query) use($request){
                    if((isset($request['start_date']) && isset($request['end_date'])) 
                                && (!empty($request['start_date']) && !empty($request['end_date'])) )
                            {
                                    $query->whereDate('created_at','>=',$request['start_date'])
                                    ->whereDate('created_at','<=',$request['end_date']);
                            }
                            
                        })
                    ->with('gigs.gigrrBusiness')->with('employer')
                    ->paginate(10);
        return response()->json(['success'=>true,'message' => '','data'=>$payment], 200);
    }
    /**
     * Function : findGigrr
     * Desc : find gigrr
     * Role : Employerr
     */
    public function findGigrr($request){
        $user_id = $request['user']['id'];
        $req['gigs_id']            = $this->create_job_id();
        $req['employer_id']        = $user_id;
        if(!empty($request['business_id'])){
            $businessDetails = $this->getBusinessDetails($request['business_id']);
            if(empty($businessDetails)){
                return response()->json(['success'=>false,'message' => __('messages.api.error.invalid_business_id'),'data'=> []], 200);
            }
            $req['business_id']        = $businessDetails['id'];
            $req['gigs_latitude']      = $businessDetails['latitude'];
            $req['gigs_longitude']     = $businessDetails['longitude'];
            $req['gig_address']        = $businessDetails['business_address'];
        }else{
            $req['gigs_latitude']      = $request['latitude'];
            $req['gigs_longitude']     = $request['longitude'];
            $req['gig_address']        = $request['address'];
        }
        if(isset($request['skills']) && !empty($request['skills'])){
            $req['gigrr_type']         = $request['skills'];
        }
        $req['gender']             = isset($request['gender'])?$request['gender']:'all';
        $req['gig_name']           = isset($request['gig_name'])?$request['gig_name']:'';
        $req['gigs_start_date']    = date("Y-m-d",strtotime($request['start_date']));
        $req['gigs_end_date']      = date("Y-m-d",strtotime($request['end_date']));
       
        $gigs = $this->gigs->create($req);
        if(!empty($gigs)){
           return response()->json(['success'=>true,'message' => __('messages.api.success.gigrr_searched_request_sent'),'data'=>$gigs], 200);
        }else{
            return response()->json(['success'=>false,'message' => __('messages.api.error.something_went_wrong'),'data'=> []], 200);
        }
    }

    /**
     * Function : sendGigRequestToCandidate
     * Desc :send gig request to candidate
     * Role : Employerr
     */
    public function sendGigRequestToCandidate($request){
        $user_id =$request['user']['id'];
    
        $gigs = $this->gigs->where('id',$request['gigs_id'])
                    ->where('employer_id',$user_id)
                    ->select('id','gigs_id','employer_id')
                    ->first();
        if(empty($gigs)){
            return response()->json(['success'=>false,'message' => 'invalid gigs id','data'=>$gigs], 200);
        }
        $gigsRequest = $this->gigsRequest
                            ->where('employe_id',$request['candidate_id'])
                            ->where('gigs_id',$request['gigs_id'])
                            ->where('status','sent-offer')
                            ->first();
        if(!empty($gigsRequest)){
            return response()->json(['success'=>false,'message' => 'Already sent gigs offer','data'=>$gigsRequest], 200);
        }
        $candidateData = $this->user->where('id',$request['candidate_id'])->Active()->Candidate()->select('id','role_id')->first();
        if(empty($candidateData)){
            return response()->json(['success'=>false,'message' => 'Candidate details does not exist','data'=>[]], 200); 
        }
        $gig_request = $this->gigsRequest
                        ->create(['gigs_id'=>$request['gigs_id'],'employe_id'=>$request['candidate_id'],'status'=>'sent-offer','offer_amount'=>$request['offer_amount']]);
        if(!empty($gig_request)){
            $notificationData['title']   =  __('messages.api.notification.GIGS_SENT_OFFER');
            $notificationData['type']    = 'EMPLOYER_SENT_GIGS_OFFER';
            $notificationData['message'] = 'You have recieved offer request for gigs - #'.$gigs['gigs_id'];
            $notificationData['user_id'] = $request['candidate_id'];
            $notificationData['gigs_id'] = $request['gigs_id'];
            sendNotification($notificationData);
            return response()->json(['success'=>true,'message' => 'Gig offer sent to candidate successfully','data'=>$gig_request], 200);
        }
    }
    /**
     * Function : searchCandidateViaGigWise
     * Desc : search candidate using gigs
     * Role : Employerr
     */
    public function searchCandidateViaGigWise($request){
        $gigs_id = $request['gigs_id'];
        $radius  = isset($request['radius'])?$request['radius']:'';
        $user_id =  $request['user']['id'];
        $gigs = $this->gigs->where('id',$gigs_id)->where('employer_id',$user_id)->first();
        if(!empty($gigs)){
            $gender = $gigs['gender'];
            $gigrrType = explode(",",$gigs['gigrr_type']);
            $SEARCH_RADIUS_IN_KM =$radius;
            if(empty($SEARCH_RADIUS_IN_KM)){
                $SEARCH_RADIUS_IN_KM  = CommonHelper::getAdminSettings('SEARCH_RADIUS_IN_KM');
            }
            
            $latitude  = $gigs['gigs_latitude'];
            $longitude = $gigs['gigs_longitude'];
            $haversine = "(6371 * acos(cos(radians($latitude)) 
                         * cos(radians(latitude)) 
                         * cos(radians(longitude) 
                         - radians($longitude)) 
                         + sin(radians($latitude)) 
                         * sin(radians(latitude))))";
            $employees = $this->user->Active()->Candidate()
                            ->with('employeeImages')->with('employeeProfile')
                            ->where(function($query) use($gigrrType){
                                if(isset($gigrrType) && !empty($gigrrType)){
                                    $query->whereHas('employeeSkills',function($query1) use($gigrrType){
                                        $query1->whereIn('skill_id',$gigrrType);
                                    });
                                }
                            })
                            ->where(function($query) use($gender){
                                if($gender!='all'){
                                    $query->where('gender',$gender);
                                }
                            })
                            ->where(function($query) use($gigs_id){
                                $notUserID = $this->getcandidatesGigsRequestAlreadySent($gigs_id);
                                if(!empty($notUserID)){
                                    $query->whereNotIn('id',$notUserID);
                                }
                            })
                            ->with('employeeSkills.types')
                            ->select('id','role_id','first_name','last_name','email','country_code','mobile','profile_image','gender','address','latitude','longitude','dob')
                            ->selectRaw("{$haversine} AS distance")
                            ->whereRaw("{$haversine} < ?", [$SEARCH_RADIUS_IN_KM])
                            ->get();
            return response()->json(['success'=>true,'message' => '','data'=>$employees], 200);
        }else{
            return response()->json(['success'=>false,'message' => 'Invalid gigs id','data'=>[]], 200);
        }
    }
    /**
     * Function : getcandidatesGigsRequestAlreadySent
     * Desc : get candidategigs request already sent
     */
    public function getcandidatesGigsRequestAlreadySent($gigs_id){
        return $this->gigsRequest->where('gigs_id',$gigs_id)->pluck('employe_id');
    }

    /**
     * Function : gigsCalenderWise
     * Desc : gigs calender wise
     */
    public function gigsCalenderWise($request){
        $currentDate = date("Y-m-d");
        $maxDateRecords =  $this->gigs
                        ->where('employer_id',$request['user']['id'])
                        ->select('gigs_end_date')
                        ->orderBy('gigs_end_date','desc')
                        ->first();
        $maxDate = date("Y-m-d");
        if(!empty($maxDateRecords)){
            $maxDate = $maxDateRecords['gigs_end_date'];
        }
      
        $gigs = $this->gigs->where('employer_id',$request['user']['id'])
                        ->whereHas('gigsRequest',function($query){
                            $query->whereIn('status',['roster','start','complete']);
                        })
                        ->whereDate('gigs_start_date','<=',$currentDate)
                        ->whereDate('gigs_end_date','>=',$currentDate)
                        ->orderBy('gigs_start_date','asc')
                        ->select('gigs_start_date','gigs_end_date')
                        ->get();
        if(!empty($gigs)){
            if(!empty($gigs)){
                $allDates = $this->getDatesArrayBetweenTwoDates($currentDate,$maxDate);
                if(!empty($allDates)){
                    $finalArray=[];
                    foreach($allDates as $date){
                        $gigsFind = $this->gigs->whereDate('gigs_start_date','<=',$date)
                                    ->whereDate('gigs_end_date','>=',$date)
                                     ->where('employer_id',$request['user']['id'])
                                    ->whereHas('gigsRequest',function($query){
                                        $query->whereIn('status',['roster','start','complete']);
                                    })
                                    ->with(['gigsRequestDetails'=>function($query){
                                        $query->whereIn('status',['roster','start','complete']);
                                    }])
                                    ->select('id','gigs_id','employer_id','gig_name','gig_address','gigs_start_date','gigs_end_date','gigs_starttime','gigs_endtime')
                                    ->get();
                        if(!empty($gigsFind)  && count($gigsFind)>0){
                           $finalArray[$date] = $gigsFind;
                        }
                    }
                    return response()->json(['success'=>true,'message' => '','data'=>$finalArray,'dates'=>$allDates], 200);
                }
            }
            return response()->json(['success'=>true,'message' => '','data'=>[],'dates'=>$maxDate], 200);
        }
        return response()->json(['success'=>true,'message' => '','data'=>[],'dates'=>$maxDate], 200);
    }

    public function getDatesArrayBetweenTwoDates($startDate,$endDate){
        $dates = array();
        $startDate = strtotime($startDate);
        $endDate = strtotime($endDate);
        for ($currentDate = $startDate; $currentDate <= $endDate; $currentDate += (86400)) {
                $Store = date('Y-m-d', $currentDate);
                $dates[] = $Store;
        }
        return $dates;
    }

}