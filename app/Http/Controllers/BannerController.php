<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Repository\BannerRepository;
use App\Http\Requests\BannerRequest;
use Carbon\Carbon;
use Redirect;
use Session;
use DataTables;

class BannerController extends Controller
{
    /**
     * Show the application tournament.
     * @return \Illuminate\Contracts\Support\Renderable
     */

    public function __construct(BannerRepository $BannerRepository){   
        $this->BannerRepository = $BannerRepository;
    }
    /**
     * Function : index
     * Desc : Banner view load
     */
    public function index(Request $request){
        return view('Admin.banner.index');
    }
    /**
     * Function : getData
     * Desc : get Banner data
     */
    public function getData(Request $request){ 
        try {
            $banners = $this->BannerRepository->getBannerList($request);
            return datatables()->of($banners)->toJson();
        } catch (\Exception $e) {
            return redirect('banner')->with('error',$e->getMessage());
        }
    }
    /**
     * Function : create
     * Desc : Banner create view
     */
    public function create(){
        return view('Admin.banner.load-add-banner');
    }
    /**
     * Function : store
     * Desc : save Banner data
     */
    public function store(BannerRequest $request){
        try {
             $insert= $this->BannerRepository->store($request);
             if($insert){   
                 return ['success'=>true,'message'=>'New Banner added successfully'];
                
            }else{
                return ['success'=>false,'message'=>'Something went wrong !!'];
            }
        } catch (\Exception $e) {
            return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
        }
    }
    
    /**
     * Function : deleted
     * Desc : delete Banner data
     */
    public function deleted($id){ 
        try {
            $delete = $this->BannerRepository->delete($id);
            if($delete){   
                return ['success'=>true,'message'=>'Banner deleted successfully'];
            }else{
               return ['success'=>false,'message'=>'Something went wrong !!'];
           }
       } catch (\Exception $e) {
           return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
       }
    }
    /**
     * Function : status
     * Desc : Banner status update
     */
    public function status($id,$status){ 
        try {
            $category = $this->BannerRepository->updateStatus($id,$status);
            if($category){   
                return ['success'=>true,'message'=>($status=='active')?'Banner Activated Successfully':'Banner Inactive Successfully'];
            }else{
               return ['success'=>false,'message'=>'Something went wrong !!'];
           }
       } catch (\Exception $e) {
           return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
       }
    }
  
}