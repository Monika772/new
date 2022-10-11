<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Repository\GigrrTypeRepository;
use App\Http\Requests\GigrrTypeRequest;
use Carbon\Carbon;
use Redirect;
use Session;
use DataTables;

class GigrrTypeController extends Controller
{
    /**
     * Show the application tournament.
     * @return \Illuminate\Contracts\Support\Renderable
     */

    public function __construct(GigrrTypeRepository $gigrrTypeRepository){   
        $this->gigrrTypeRepository = $gigrrTypeRepository;
    }
    /**
     * Function : index
     * Desc : gigrr type view load
     */
    public function index(Request $request){
        return view('Admin.gigrr-type.index');
    }
    /**
     * Function : getData
     * Desc : get gigrr type data
     */
    public function getData(Request $request){ 
        try {
            $gigrrTypes = $this->gigrrTypeRepository->getData($request);
            return datatables()->of($gigrrTypes)->toJson();
        } catch (\Exception $e) {
            return redirect('gigrr-type')->with('error',$e->getMessage());
        }
    }
    /**
     * Function : create
     * Desc : gigrr type create view
     */
    public function create(){
        return view('Admin.gigrr-type.load-add-gigrr-type');
    }
    /**
     * Function : store
     * Desc : save gigrr type data
     */
    public function store(GigrrTypeRequest $request){
        try {
             $insert= $this->gigrrTypeRepository->store($request);
             if($insert){   
                 return ['success'=>true,'message'=>'New gigrr type added successfully'];
            }else{
                return ['success'=>false,'message'=>'Something went wrong !!'];
            }
        } catch (\Exception $e) {
            return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
        }
    }
    /**
     * Function : edit
     * Desc : edit gigrr type view 
     */
    public function edit($id){ 
        $record = $this->gigrrTypeRepository->getRecord($id);
         return view('Admin.gigrr-type.edit-gigrr-type',compact('record'));
    }
    /**
     * Function : update
     * Desc : update gigrr type view data
     */
    public function update(GigrrTypeRequest $request){ 
        try {
            $result = $this->gigrrTypeRepository->update($request);
            if($result){   
                return ['success'=>true,'message'=>'Gigrr Type update successfully'];
            }else{
               return ['success'=>false,'message'=>'Something went wrong !!'];
            }
        }catch (\Exception $e) { 
            return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
        }
    }
    /**
     * Function : deleted
     * Desc : delete gigrr type data
     */
    public function deleted($id){ 
        try {
            $delete = $this->gigrrTypeRepository->delete($id);
            if($delete){   
                return ['success'=>true,'message'=>'Gigrr deleted successfully'];
            }else{
               return ['success'=>false,'message'=>'Something went wrong !!'];
           }
       } catch (\Exception $e) {
           return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
       }
    }
    /**
     * Function : status
     * Desc : gigrr type status update
     */
    public function status($id,$status){ 
        try {
            $gigrrTypes = $this->gigrrTypeRepository->updateStatus($id,$status);
            if($gigrrTypes){   
              return ['success'=>true,'message'=>($status=='active')?'Gigrr Activated Successfully':'Gigrr Inactive Successfully'];
            }else{
              return ['success'=>false,'message'=>'Something went wrong !!'];
           }
       } catch (\Exception $e) {
           return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
       }
    }
  
}