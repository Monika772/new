<?php 
namespace App\Repository;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use Illuminate\SuTeamspport\Facades\Storage;
use App\Helpers\CommonHelper;
use App\Models\Products;
use App\Models\ProductVariant;
use App\Models\ProductImage;
use App\Models\TaxCategory;
use App\Models\SubCategory;
use App\Models\Category;
class ProductRepository {

    public function __construct(){

        $this->product = new Products();
        $this->pro=new Products();
        $this->subcat = new SubCategory();
        $this->cat=new Category();
        $this->prod_variant=new ProductVariant();
        $this->product_img=new ProductImage();
        $this->taxca=new TaxCategory();
    }
    public function getSubcatgeory($id){
        $subcategory=$this->cat->where('id',$id)->get();
        $html=' <div class="col-md-3" ><label for="">SubCategories</label> <span style="color:red"> *</span><select  class="form-control"  name="sub_categories_id">
        <option value="">Select SubCategories</option>';
        if(!empty($subcategory)){
            foreach($subcategory as $value){
                $html.='<option value="'.$value->id.'">'.$value->name_en.'('. $value->name_hindi.')</option>';
            }
        }
        $html.='</select></div>';
        return $html;
    }
    public function getProductsList(){
        return $this->product->with("image","Taxcategory","category","subcategory")->where('status','!=','deleted')->orderBy('id','desc')->get();
    }
    public function getProductsListApi(){
        return $this->product->with("image","Taxcategory","category","subcategory")->where('products.status','=','active')->groupBy('products.id')->orderBy('products.id','desc')->get();
    }
    public function getRecordvariant($id){
        return $this->prod_variant->where('product_id',$id)->get();
    }
    public function getTaxCategoryList(){
        return $this->taxca->where('status','=','active')->orderBy('id','desc')->get();
    }
    public function getAllActiveProduct(){
        return $this->product->where('status','active')->orderBy('id','asc')->get();
    } 
    public function getProductList(){
        return $this->pro->where('status','!=','deleted')->orderBy('id','desc')->get();
    }
    public function getAllActiveCategory(){
        return $this->subcat->where('status','active')->orderBy('id','asc')->get();
    }    
    public function getAllActivePrentCategory(){
        return $this->cat->where('status','active')->orderBy('id','asc')->get();
    }
    public function store($request){
        $varinent=isset($request->variant_name) ? $request->variant_name : '';
        $quantity=isset($request->quantity) ? $request->quantity : '';
        $unit_price=isset($request->unit_price) ? $request->unit_price : '';

        $imge="";
        if($request->hasfile('image')){
            $file = $request->file('image');
            $filename = time() . '.' . $request->file('image')->extension();
            $destinationPath = storage_path('app/products');
            $file->move($destinationPath, $filename);
            $imge = $filename;
        }
        
        $requestData = ['categories_id'=>$request->categories_id,'sub_categories_id'=>$request->sub_categories_id,'name_en' => ucfirst($request->name_en),'name_hindi' => ucfirst($request->name_hindi),'product_code'=>$request->product_code,'tax_id'=>$request->tax_id,"description_hindi"=>$request->description_hindi,"description_en"=>$request->description_en];
        $product=$this->product->create($requestData);
        $this->product_img->create(["product_id"=>$product->id,"image_name"=>$imge]);
        for($i=0;$i<count($varinent); $i++){
            $this->prod_variant->create(["product_id"=>$product->id,"variant_name"=>$varinent[$i],"quantity"=>$quantity[$i],"per_image_price"=>$unit_price[$i]]);
        }
        return $product;
     }
    public function getRecord($id){
        return $this->subcat->where('id',$id)->first();
   }

    public function update($request){
        $id = $request->id;
        $req['categories_id'] = $request->categories_id;
        $req['sub_categories_id']= $request->sub_categories_id;
        $req['name_en']  = $request->name_en;
        $req['name_hindi']  = $request->name_hindi;
        $req['product_code']  = $request->product_code;
        $req['tax_id']  = $request->tax_id;
        $req['description_hindi']  = $request->description_hindi;
        $req['description_en']  = $request->description_en;
        $imge="";
        if($request->hasfile('image')){
            $file = $request->file('image');
            $filename = time() . '.' . $request->file('image')->extension();
            $destinationPath = storage_path('app/products');
            $file->move($destinationPath, $filename);
            $imge = $filename;
        }
        $req['description_en']  = $imge;
        $this->product_img->where('product_id',$id)->update(["image_name"=>$imge]);
       return $this->product->where('id',$id)->update($req);
    }

    public function delete($id) {
       return $this->product->where('id',$id)->update(['status'=>'deleted']);
    }
    public function updateStatus($id,$status) {
        return $this->product->where('id',$id)->update(['status'=>$status]);
     }
    public function getRecordProduct($id){
        return $data=$this->product->with("image")->where('id',$id)->first();
       
    }
    // public function getGigrrTypesList(){
    //     return $this->gigrr_types->where('status','active')->orderBy('name','asc')->get();
    // }

}