<?php 
namespace App\Repository;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use App\Models\Payment;
use Illuminate\SuTeamspport\Facades\Storage;
use App\Helpers\CommonHelper;

class PaymentRepository {

    public function __construct(Payment $payment){
        $this->payment = $payment;
    }
    /**
     * Function: getData
     * Desc : get faq all data
     */
    public function getPaymentData($request){
        return $this->payment->where('status','!=','deleted')
                 ->with('gigs')
                 ->with('candidate:id,first_name')
                 ->with('employer:id,first_name')
                ->orderBy('id','desc')
                ->get();
    }
    
}