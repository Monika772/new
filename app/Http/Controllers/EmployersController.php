<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Repository\EmployerRepository;
use App\Models\User;
use Carbon\Carbon;
use Redirect;
use Session;
use DataTables;

class EmployersController extends Controller
{
    /**
     * Show the application player.
     * @return \Illuminate\Contracts\Support\Renderable
     */

    public function __construct(EmployerRepository $employers){   
        $this->employers = $employers;
    }

    public function index(Request $request){
        return view('Admin.employers.index') ;
    }

    public function getData(Request $request){
        try {
            $employers = $this->employers->getEmployersList($request);
            return datatables()->of($employers)->toJson();
        } catch (\Exception $e) {
            return redirect('employers')->with('error',$e->getMessage());
        }
    }
    public function showDetails($id){
        $employers = $this->employers->getEmployerDetails($id);
        return view('Admin.employers.view-details',compact('employers'));
    }

    public function deleted($id){ 
      try {
            $delete = $this->employers->delete($id);
            if($delete){   
                return ['success'=>true,'message'=>'Employer deleted successfully'];
            }else{
               return ['success'=>false,'message'=>'Something went wrong !!'];
           }
       } catch (\Exception $e) {
           return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
       }
    }

    public function status($id,$status){ 
        try {
            $result = $this->employers->updateStatus($id,$status);
            if($result){   
                return ['success'=>true,'message'=>($status=='active')?'Employer Actived Successfully':'Employer Inactive Successfully'];
            }else{
               return ['success'=>false,'message'=>'Something went wrong !!'];
           }
       } catch (\Exception $e) {
           return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
       }
    }

}