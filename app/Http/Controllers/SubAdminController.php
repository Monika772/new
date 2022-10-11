<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Repository\SubAdminRepository;
use App\Http\Requests\AddSubadminRequest;
use App\Http\Requests\UpdateSubadminRequest;
use Carbon\Carbon;
use Redirect;
use Session;
use DataTables;

class SubAdminController extends Controller
{
    /**
     * Show the application category.
     * @return \Illuminate\Contracts\Support\Renderable
     */

    public function __construct(SubAdminRepository $subAdminRepository){   
        $this->subAdminRepository = $subAdminRepository;
    }

    public function index(Request $request){
        return view('Admin.subadmin.index');
    }
    public function getData(Request $request){
        try {
            $subadmin = $this->subAdminRepository->getSubAdminList($request);
            return datatables()->of($subadmin)->toJson();
        } catch (\Exception $e) {
            return redirect('subadmin')->with('error',$e->getMessage());
        }
    }
    public function create(){
        try {
            $permissions = $this->subAdminRepository->getSubAdminPermissionsList();
             return view('Admin.subadmin.create',compact('permissions'));
        } catch (\Exception $e) {
            return redirect('subadmin')->with('error',$e->getMessage());
        }
    }

    public function store(AddSubadminRequest $request){
        try {
            $subadmin= $this->subAdminRepository->store($request);
            if($subadmin){   
                return ['success'=>true,'message'=>'New subadmin created successfully'];
             }else{
               return ['success'=>false,'message'=>'Something went wrong !!'];
              }
        } catch (\Exception $e) {
            return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
        }
    }

    public function edit($id)
    { 
        $record = $this->subAdminRepository->getRecord($id);
        $permissions = $this->subAdminRepository->getSubAdminPermissionsList();
        return view('Admin.subadmin.edit',compact('record','permissions'));
    }

    public function update(UpdateSubadminRequest $request)
    { 
        try {
            $result = $this->subAdminRepository->update($request);
            if($result){   
                return ['success'=>true,'message'=>'Subadmin Update successfully'];
            }else{
               return ['success'=>false,'message'=>'Something went wrong !!'];
            }
        }catch (\Exception $e) { 
            return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
        }
     }

    public function deleted($id){ 
        try {
            $delete = $this->subAdminRepository->delete($id);
            if($delete){   
                return ['success'=>true,'message'=>'Subadmin deleted successfully'];
            }else{
               return ['success'=>false,'message'=>'Something went wrong !!'];
           }
       } catch (\Exception $e) {
           return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
       }
    }
    public function status($id,$status){ 
        try {
            $status = $this->subAdminRepository->updateStatus($id,$status);
            if($status){   
                return ['success'=>true,'message'=>($status=='active')?'Subadmin Actived Successfully':'Subadmin Inactive Successfully'];
            }else{
               return ['success'=>false,'message'=>'Something went wrong !!'];
           }
       } catch (\Exception $e) {
           return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
       }
    }

}