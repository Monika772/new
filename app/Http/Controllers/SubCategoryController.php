<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Repository\SubCategoryRepository;
use App\Http\Requests\SubCategoryRequest;
use Carbon\Carbon;
use Redirect;
use Session;
use DataTables;

class SubCategoryController extends Controller
{
    /**
     * Show the application tournament.
     * @return \Illuminate\Contracts\Support\Renderable
     */

    public function __construct(){   
        $this->subcategoryRepository = new SubCategoryRepository();
    }
    /**
     * Function : index
     * Desc : products view load
     */
    public function index(Request $request){
        return view('Admin.subcategory.index');
    }
    
    /**
     * Function : getData
     * Desc : get category data
     */
    public function getData(Request $request){ 
        try {
            $products = $this->subcategoryRepository->getCategoryList($request);
            return datatables()->of($products)->toJson();
        } catch (\Exception $e) {
            return redirect('subcategory')->with('error',$e->getMessage());
        }
    }
    /**
     * Function : create
     * Desc : product create view
     */
    public function create(){
        $record = $this->subcategoryRepository->getRecordCategory();
        return view('Admin.subcategory.load-add-subcatgory',compact('record'));
    }

    /**
     * Function : store
     * Desc : save category data
     */
    public function store(SubCategoryRequest $request){
        try {
            $insert= $this->subcategoryRepository->store($request);
             if($insert){   
                 return ['success'=>true,'message'=>'New SubCategory added successfully'];
            }else{
                return ['success'=>false,'message'=>'Something went wrong !!'];
            }
        } catch (\Exception $e) {
            return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
        }
    }       

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Function : edit
     * Desc : edit category view 
     */
    public function edit($id){ 
        $record = $this->subcategoryRepository->getRecord($id);
        $record_category = $this->subcategoryRepository->getRecordCategory();
         return view('Admin.subcategory.edit-subcategory',compact('record','record_category'));
    }
    /**
     * Function : update
     * Desc : update category view data
     */
    public function update(SubCategoryRequest $request){ 
        try {
            $result = $this->subcategoryRepository->update($request);
            if($result){   
                return ['success'=>true,'message'=>'SubCategory update successfully'];
            }else{
               return ['success'=>false,'message'=>'Something went wrong !!'];
            }
        }catch (\Exception $e) { 
            return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
        }
    }
   
    /**
     * Function : deleted
     * Desc : delete category data
     */
    public function deleted($id){ 
        try {
            $delete = $this->subcategoryRepository->delete($id);
            if($delete){   
                return ['success'=>true,'message'=>'SubCategory deleted successfully'];
            }else{
               return ['success'=>false,'message'=>'Something went wrong !!'];
           }
       } catch (\Exception $e) {
           return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
       }
    }
    /**
     * Function : status
     * Desc : category status update
     */
    public function status($id,$status){ 
        try {
            $category = $this->subcategoryRepository->updateStatus($id,$status);
            if($category){   
                return ['success'=>true,'message'=>($status=='active')?'SubCategory Activated Successfully':'SubCategory Inactive Successfully'];
            }else{
               return ['success'=>false,'message'=>'Something went wrong !!'];
           }
       } catch (\Exception $e) {
           return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
       }
    }
}
