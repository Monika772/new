<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use App\Repository\GigsRepository;
use App\Repository\EmployeeRepository;
use App\Http\Requests\Api\CandidateProfile;
use App\Http\Requests\Api\CandidateKycRequest;
use App\Http\Requests\Api\GigsStatusUpdateRequest;
use App\Http\Requests\Api\GigsOtpVerifyRequest;
use App\Http\Requests\Api\GigsAcceptAndRejectOffer;
use Carbon\Carbon;
use Validator;
use Illuminate\Support\Facades\Log;
class EmployeeController extends Controller
{
    public function __construct(GigsRepository $gigsRepository,EmployeeRepository $employeeRepository){
        $this->gigsRepository  = $gigsRepository;
        $this->employeeRepository  = $employeeRepository;
    }
    /**
     * Function : getCandidatesGigsRequest
     * Desc : get candidates gigs request
     */
    public function getCandidatesGigsRequest(Request $request){
        try {
            return $this->gigsRepository->getCandidatesGigsRequest($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
   }
   public function getCandidatesGigsRequestV1(Request $request){
    try {
        return $this->gigsRepository->getCandidatesGigsRequestV1($request);
    } catch (\Exception $e) {
        return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
    }
}
   /**
    * Function : getCandidatesGigsAccepted
    * Desc : get candidate accepted gigs list
    */
   public function getCandidatesGigsAccepted(Request $request){
    try {
        return $this->gigsRepository->getCandidatesGigsAccepted($request);
    } catch (\Exception $e) {
        return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
    }
   }
   /**
    * Function : acceptGigsRequest
    * Desc : accept gigs request
    */
    public function acceptGigsRequest(Request $request){
        try {
            return $this->gigsRepository->acceptGigsRequest($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
    }
    /**
     * Function : myGigs
     * Desc :my gigs
     */
    public function myGigs(Request $request){
        try {
            return $this->gigsRepository->getCandidatesAllGigs($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
    }
    /**
     * Function : profile
     * Desc : get candidates profile
     */
    public function profile(Request $request){
        try {
            return $this->employeeRepository->profile($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
    }

    public function updateProfile(CandidateProfile $request){
        try {
            return $this->employeeRepository->updateProfile($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
    }
    public function updateKycDetails(CandidateKycRequest $request){
        try {
            return $this->employeeRepository->saveCandidateKycDetails($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
    }

    public function gigsAcceptAndRejectOffer(GigsAcceptAndRejectOffer $request){
        try {
            return $this->employeeRepository->gigsAcceptAndRejectOffer($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
   }
   public function getMyGigsRosterList(Request $request){
        try {
            return $this->gigsRepository->getMyGigsRosterList($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
   }
   /**
    * Function : updateJobStatus (To Start/End Job)
    * Desc : update job status (start/complete)
    */
   public function updateJobStatus(GigsStatusUpdateRequest $request){
        try {
            return $this->gigsRepository->updateJobStatus($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
   }
   public function gigsVerifyOtp(GigsOtpVerifyRequest $request){
        try {
            return $this->gigsRepository->gigsVerifyOtp($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
   }
   /**
    * Function : paymentHistory
    * Desc : payment history
    */
   public function paymentHistory(Request $request){
        try {
            return $this->gigsRepository->candidatePaymentHistory($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
   }
   /**
    * Function : loginLogoutTime
    * Desc : login logout time
    */
   public function loginLogoutTime(Request $request){
    try {
        return $this->employeeRepository->loginLogoutTime($request);
    } catch (\Exception $e) {
        return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
    }
   }
   public function getBankInfo(Request $request){
    try {
        return $this->employeeRepository->getBankInfo($request);
    } catch (\Exception $e) {
        return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
    }
}
   public function saveBankAccountInfo(Request $request){
        try {
            return $this->employeeRepository->saveBankAccountInfo($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
   }
   public function transferAmountToCandidate(Request $request){
        try {
            return $this->employeeRepository->transferAmountToCandidate($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
    }
    public function payoutWebhook(Request $request){
        try {
          
            $bodyContent        = $request->getContent();
            $rajorPayResponse   =  json_decode($bodyContent, true);
            Log::debug('paymentCallBackResponse check', ['callback_response' => $rajorPayResponse]);
            if($rajorPayResponse['event']=='transaction.created'){
               
                $response = $rajorPayResponse['payload']['transaction']['entity'];
                Log::debug('Payload Response transaction.created', ['payload' => $response]);
                $this->employeeRepository->payoutWebhook($response);
                
            }
            if($rajorPayResponse['event']=='payout.processed'){
                $response = $rajorPayResponse['payload']['payout']['entity'];
                Log::debug('Payload Response payout.created', ['payload' => $response]);
                $this->employeeRepository->payoutWebhook($response);
                
            }
           return response()->json(['success'=>true,'message' => '','data'=>[]], 200);
           
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
    }
   
}