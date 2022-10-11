<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Http\Requests\FAQRequest;
use App\Repository\FAQRepository;
use Carbon\Carbon;
use Redirect;
use Session;
use DataTables;

class FAQController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function __construct(FAQRepository $faq){
        $this->faq   = $faq;
     }
     /**
      * Function : index
      * Desc : load listing page
      */
    public function index(){
        return view('Admin.faq.index');
    }
    /**
     * Function : getData
     * Desc : get FAQ Data
     */
    public function getData(Request $request){
        try {
            $faq = $this->faq->getData($request);
            return datatables()->of($faq)->toJson();
        } catch (\Exception $e) {
            return redirect('faq')->with('error',$e->getMessage());
        }
    }
    /**
     * Funcrion : create
     * Desc : load add new FAQ Form
     */
    public function create(){
        return view('Admin.faq.create');
    }
       /**
     * Function : store
     * Desc : save faq data
     */
    public function store(FAQRequest $request){
        try {
             $insert= $this->faq->store($request);
             if($insert){   
                 return ['success'=>true,'message'=>'New faq added successfully'];
            }else{
                return ['success'=>false,'message'=>'Something went wrong !!'];
            }
        } catch (\Exception $e) {
            return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
        }
    }
    /**
     * Function : edit
     * Desc : load edit view
     * @param $id
     */
    public function edit($id){ 
        $faq = $this->faq->getRecord($id);
        return view('Admin.faq.edit',compact('faq'));
    }
    /**
     * Function : update
     * Desc : update FAQ Data 
     */
    public function update(FAQRequest $request){
        try {
            $result = $this->faq->update($request);
            if($result){   
                return ['success'=>true,'message'=>'FAQ update successfully'];
            }else{
               return ['success'=>false,'message'=>'Something went wrong !!'];
            }
        } catch (\Exception $e) {
            return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
        }
    }
     /**
     * Function : deleted
     * Desc : delete faq data
     */
    public function deleted($id){ 
        try {
            $delete = $this->faq->delete($id);
            if($delete){   
                return ['success'=>true,'message'=>'FAQ deleted successfully'];
            }else{
               return ['success'=>false,'message'=>'Something went wrong !!'];
           }
       } catch (\Exception $e) {
           return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
       }
    }
    /**
     * Function : status
     * Desc : faq status update
     */
    public function status($id,$status){ 
        try {
            $faq = $this->faq->updateStatus($id,$status);
            if($faq){   
                return ['success'=>true,'message'=>($status=='active')?'FAQ Activated Successfully':'FAQ Inactive Successfully'];
            }else{
               return ['success'=>false,'message'=>'Something went wrong !!'];
           }
       } catch (\Exception $e) {
           return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
       }
    }
   
}