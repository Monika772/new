<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Repository\PaymentRepository;
use Carbon\Carbon;
use Redirect;
use Session;
use DataTables;

class PaymentController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function __construct(PaymentRepository $paymentRepository){
        $this->paymentRepository   = $paymentRepository;
     }
    public function index(){
        return view('Admin.payment.index');
    }
    public function getData(Request $request){
        try {
            $payment = $this->paymentRepository->getPaymentData($request);
            return datatables()->of($payment)->toJson();
        } catch (\Exception $e) {
            return redirect('payment')->with('error',$e->getMessage());
        }
    }   
}