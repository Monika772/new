<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use App\Http\Requests\Api\GigsRequest;
use App\Http\Requests\Api\GigsCandidatePaymentRequest;
use App\Http\Requests\Api\CandidateAddRoster;
use App\Repository\GigsRepository;
use Carbon\Carbon;
use Validator;

class GigsController extends Controller
{
    public function __construct(GigsRepository $gigsRepository){
        $this->gigsRepository  = $gigsRepository;
    }

   public function gigsBooking(Request $request){
        try {
            return $this->gigsRepository->gigsBooking($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
   }
   public function myGigs(Request $request){
        try {
            return $this->gigsRepository->getAllGigs($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
   }

   public function gigsAcceptedCandidates(Request $request){
        try {
            return $this->gigsRepository->gigsAcceptedCandidates($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
   }
    public function gigsCandidateSentOffer(Request $request){
        try {
            return $this->gigsRepository->gigsCandidateSentOffer($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
    }

    public function gigsCandidateAddRoster(CandidateAddRoster $request){
        try {
            return $this->gigsRepository->gigsCandidateAddRoster($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
    } 
    /**
    * Function : myRosterGigs
    * Desc : get roster gigs list with candidates data
    */
    public function myRosterGigs(Request $request){
        try {
            return $this->gigsRepository->myRosterGigs($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
   }
   /**
    * Function : getSentOfferGigs
    * Desc : get sent offer gigs list with candidates data
    */
   public function getSentOfferGigs(Request $request){
    try {
        return $this->gigsRepository->getSentOfferGigs($request);
    } catch (\Exception $e) {
        return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
    }
   }
   /**
    * Function : getMyRosterViaGigs
    * Desc : gits my roster via gigs
    */
   public function getMyRosterViaGigs(Request $request){
        try {
            return $this->gigsRepository->getMyRosterViaGigs($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
   }
   /**
    * Function :gigsCandidatePayment
    * Desc : gigs candidate payment
    */
   public function gigsCandidatePayment(GigsCandidatePaymentRequest $request){
        try {
            return $this->gigsRepository->gigsCandidatePayment($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
   }
   /**
    * Function : gigsPaymentHistory
    * Desc : gigs payment history
    */
   public function gigsPaymentHistory(Request $request){
        try {
            return $this->gigsRepository->gigsPaymentHistory($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
   }
   /**
    * Function : findGigrr
    * Desc : find gigrr
    */
   public function findGigrr(Request $request){
        try {
            return $this->gigsRepository->findGigrr($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
   }
   public function sendGigRequestToCandidate(Request $request){
        try {
            return $this->gigsRepository->sendGigRequestToCandidate($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
   }
   public function searchCandidateViaGigWise(Request $request){
        try {
            return $this->gigsRepository->searchCandidateViaGigWise($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
   }
   /**
    * Function : gigsCalenderWise
    * Desc : gigs calender wise
    */
   public function gigsCalenderWise(Request $request){
        try {
            return $this->gigsRepository->gigsCalenderWise($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
   }
   

}