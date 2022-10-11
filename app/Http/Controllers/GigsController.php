<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Repository\GigsRepository;
use Carbon\Carbon;
use Redirect;
use Session;
use DataTables;

class GigsController extends Controller
{
    /**
     * Show the application team.
     * @return \Illuminate\Contracts\Support\Renderable
     */

    public function __construct(GigsRepository $gigsRepository){   
        $this->gigsRepository = $gigsRepository;
    }

    public function index(Request $request){
        
         return view('Admin.gigs.index');
    }

    public function showDetails($id){
        $gigs = $this->gigsRepository->getGigDetails($id);
        return view('Admin.gigs.view-details',compact('gigs'));
    }
    public function getData(Request $request){
        try {
            $gigs = $this->gigsRepository->getGigsList($request);
            return datatables()->of($gigs)->toJson();
        } catch (\Exception $e) {
            return redirect('gigs')->with('error',$e->getMessage());
        }
    }
   
    public function deleted($id){ 
        try {
            $delete = $this->gigsRepository->delete($id);
            if($delete){   
                return ['success'=>true,'message'=>'Gigs deleted successfully'];
            }else{
               return ['success'=>false,'message'=>'Something went wrong !!'];
           }
       } catch (\Exception $e) {
           return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
       }
    }

    public function status($id,$status){ 
        try {
            $status = $this->gigsRepository->updateStatus($id,$status);
            if($status){   
                return ['success'=>true,'message'=>($status=='active')?'Gigs Actived Successfully':'Gigs Inactive Successfully'];
            }else{
               return ['success'=>false,'message'=>'Something went wrong !!'];
           }
       } catch (\Exception $e) {
           return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
       }
    }
  
}