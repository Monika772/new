<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Repository\CategoryRepository;
use App\Http\Requests\CategoryRequest;
use Carbon\Carbon;
use Redirect;
use Session;
use DataTables;

class CategoryController extends Controller
{
    /**
     * Show the application tournament.
     * @return \Illuminate\Contracts\Support\Renderable
     */

    public function __construct(CategoryRepository $categoryRepository){   
        $this->categoryRepository = $categoryRepository;
    }
    /**
     * Function : index
     * Desc : category view load
     */
    public function index(Request $request){
        return view('Admin.category.index');
    }
    /**
     * Function : getData
     * Desc : get category data
     */
    public function getData(Request $request){ 
        try {
            $category = $this->categoryRepository->getCategoryList($request);
            return datatables()->of($category)->toJson();
        } catch (\Exception $e) {
            return redirect('category')->with('error',$e->getMessage());
        }
    }
    /**
     * Function : create
     * Desc : category create view
     */
    public function create(){
        return view('Admin.category.load-add-category');
    }
    /**
     * Function : store
     * Desc : save category data
     */
    public function store(CategoryRequest $request){
        try {
             $insert= $this->categoryRepository->store($request);
             if($insert){   
                 return ['success'=>true,'message'=>'New category added successfully'];
                
            }else{
                return ['success'=>false,'message'=>'Something went wrong !!'];
            }
        } catch (\Exception $e) {
            return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
        }
    }
    /**
     * Function : edit
     * Desc : edit category view 
     */
    public function edit($id){ 
        $record = $this->categoryRepository->getRecord($id);
         return view('Admin.category.edit-category',compact('record'));
    }
    /**
     * Function : update
     * Desc : update category view data
     */
    public function update(CategoryRequest $request){ 
        try {
            $result = $this->categoryRepository->update($request);
            if($result){   
                return ['success'=>true,'message'=>'Category update successfully'];
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
            $delete = $this->categoryRepository->delete($id);
            if($delete){   
                return ['success'=>true,'message'=>'Category deleted successfully'];
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
            $category = $this->categoryRepository->updateStatus($id,$status);
            if($category){   
                return ['success'=>true,'message'=>($status=='active')?'Category Activated Successfully':'Category Inactive Successfully'];
            }else{
               return ['success'=>false,'message'=>'Something went wrong !!'];
           }
       } catch (\Exception $e) {
           return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
       }
    }
  
}