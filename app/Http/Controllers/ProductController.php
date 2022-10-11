<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Repository\CategoryRepository;
use App\Repository\ProductRepository;
use App\Http\Requests\ProductRequest;
use App\Http\Requests\VriantRequest;

use Carbon\Carbon;
use Redirect;
use Session;
use DataTables;

class ProductController extends Controller
{
    /**
     * Show the application tournament.
     * @return \Illuminate\Contracts\Support\Renderable
     */

    public function __construct(){  
        $this->categoryRepository = new CategoryRepository(); 
        $this->productRepository = new ProductRepository();
    }
    /**
     * Function : index
     * Desc : category view load
     */
    public function index(Request $request){
          $category = $this->productRepository->getProductsList($request);
        return view('Admin.products.index',compact('category'));
    }
    /**
     * Function : getData
     * Desc : get category data
     */
    public function getData(Request $request){ 
        try {
            $products = $this->productRepository->getProductsList($request);
            return datatables()->of($products)->toJson();
        } catch (\Exception $e) {
            return redirect('products')->with('error',$e->getMessage());
        }
    }
    /**
     * Function : create
     * Desc : category create view
     */
    public function create(){
        $sub_cat = $this->productRepository->getAllActiveCategory();
        $category = $this->productRepository->getAllActivePrentCategory();
        $taxcategories=$this->productRepository->getTaxCategoryList();
        return view('Admin.products.add',compact('category','sub_cat','taxcategories'));
    }
     /**
     * Function : show
     * Desc : show variant view 
     */
    public function show($id){ 
        $record = $this->productRepository->getRecordvariant($id);
         return view('Admin.products.view-variant',compact('record'));
    }
     /**
     * Function : store
     * Desc : save category data
     */
    public function store(ProductRequest $request){
        try {

            $varinent=isset($request->variant_name) ? $request->variant_name : '';
            $quantity=isset($request->quantity) ? $request->quantity : '';
            $unit_price=isset($request->unit_price) ? $request->unit_price : '';
            for($i=0;$i<count($varinent); $i++){
                if(empty($varinent[$i]) && empty($quantity[$i]) && empty($unit_price[$i])){
                    return redirect('products/create')->with('error','Please fill variant !!');
                }
            }
            //echo "variant_name=".$request->variant_name[0]."<br>quantity=".$request->quantity[0]."<br>unit_price=".$request->unit_price[0];die;
            //if($request->varaint_count==0){
            // if(empty($request->variant_name[0]) && empty($request->quantity[0])  && empty($request->unit_price[0])){
            //     return redirect('products/create')->with('error','Please fill at least one variant !!');
            // }
            $insert= $this->productRepository->store($request);
             if($insert){
                return redirect('products')->with('success','New product added successfully');
                //redirect()->rout('products.index')->Message('success','New product added successfully');   
            }else{
                return redirect('products/create')->with('error','Something went wrong !!');
               // redirect()->rout('products.index')->Message('error','New product added successfullySomething went wrong !!');  
                //return ['success'=>false,'message'=>'Something went wrong !!'];
            }
        } catch (\Exception $e) {
            return redirect('products')->with('error','Something went wrong !!');
           // return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
        }
    }  

    

     /**
     * Function : deleted
     * Desc : delete category data
     */
    public function deleted($id){ 
        try {
            $delete = $this->productRepository->delete($id);
            if($delete){   
                return ['success'=>true,'message'=>'Product deleted successfully'];
            }else{
               return ['success'=>false,'message'=>'Something went wrong !!'];
           }
       } catch (\Exception $e) {
           return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
       }
    }  

    public function edit($id){
        $products = $this->productRepository->getRecordProduct($id);
        $sub_cat = $this->productRepository->getAllActiveCategory();
        $category = $this->productRepository->getAllActivePrentCategory();
        $taxcategories=$this->productRepository->getTaxCategoryList();
        return view('Admin.products.edit',compact('products','sub_cat','category','taxcategories'));
    }

    /**
     * Function : update
     * Desc : update category view data
     */
    public function update(ProductRequest $request){ 
        try {
            $result = $this->productRepository->update($request);
            if($result){   
                return redirect('products')->with('success','product edit successfully');
            }else{
                return redirect('products')->with('error','Something went wrong !!');
            }
        }catch (\Exception $e) { 
            return redirect('products')->with('error','Something went wrong !!');
           // return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
        }
    }
     /**
     * Function : status
     * Desc : gigrr type status update
     */
    public function status($id,$status){ 
        try {
            $gigrrTypes = $this->productRepository->updateStatus($id,$status);
            if($gigrrTypes){   
              return ['success'=>true,'message'=>($status=='active')?'Product Activated Successfully':'Product Inactive Successfully'];
            }else{
              return ['success'=>false,'message'=>'Something went wrong !!'];
           }
       } catch (\Exception $e) {
           return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
       }
    }
    public function subcategory($id){
        try {
            $gigrrTypes = $this->productRepository->getSubcatgeory($id);
            if($gigrrTypes){   
              return ['success'=>true,'data'=>$gigrrTypes];
            }else{
              return ['success'=>false,'message'=>'Something went wrong !!'];
           }
       }  catch (\Exception $e) {
           return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
       }
    }
}