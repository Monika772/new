<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Validator;
use App\Repository\TaxCategoryRepository;
use App\Http\Requests\TaxCategoryRequest;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Redirect;
use Session;
use DataTables;

class TaxCategoryController extends Controller
{
    /**
     * Show the application tournament.
     * @return \Illuminate\Contracts\Support\Renderable
     */

    public function __construct(){   
        $this->taxtcategoryRepository = new TaxCategoryRepository();
    }
    /**
     * Function : index
     * Desc : products view load
     */
    public function index(Request $request){
        return view('Admin.taxcat.index');
    }
    
    /**
     * Function : getData
     * Desc : get category data
     */
    public function getData(Request $request){ 
        try {
            $products = $this->taxtcategoryRepository->getCategoryList($request);
            return datatables()->of($products)->toJson();
        } catch (\Exception $e) {
            return redirect('taxcat')->with('error',$e->getMessage());
        }
    }
    /**
     * Function : create
     * Desc : product create view
     */
    public function create(){
        return view('Admin.taxcat.load-add-tax');
    }

    /**
     * Function : store
     * Desc : save category data
     */
    public function store(TaxCategoryRequest $request){
        try {
            $insert= $this->taxtcategoryRepository->store($request);
             if($insert){   
                 return ['success'=>true,'message'=>'New Tax Category added successfully'];
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
        $record = $this->taxtcategoryRepository->getRecord($id);
         return view('Admin.taxcat.edit-tax',compact('record'));
    }
    /**
     * Function : update
     * Desc : update category view data
     */
    public function update(TaxCategoryRequest $request){ 
        try {
            $result = $this->taxtcategoryRepository->update($request);
            if($result){   
                return ['success'=>true,'message'=>'Tax Category update successfully'];
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
            $delete = $this->taxtcategoryRepository->delete($id);
            if($delete){   
                return ['success'=>true,'message'=>'Tax Category deleted successfully'];
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
            $category = $this->taxtcategoryRepository->updateStatus($id,$status);
            if($category){   
                return ['success'=>true,'message'=>($status=='active')?'Tax Category Activated Successfully':'Tax Category Inactive Successfully'];
            }else{
               return ['success'=>false,'message'=>'Something went wrong !!'];
           }
       } catch (\Exception $e) {
           return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
       }
    }
}
