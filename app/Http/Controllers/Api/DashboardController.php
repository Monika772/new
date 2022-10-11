<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use App\Models\Category;
use App\Models\Products;
use App\Models\Banners;
use Carbon\Carbon;
use Validator;

class DashboardController extends Controller
{
    public function __construct(){
        $this->category = new Category();
        $this->product  = new Products();
        $this->banners  = new Banners();
    }
    public function dashboard(Request $request){
        try {
            $language  =   isset($request['language'])?$request['language']:'en';
            $name      =   ($language=='en')?'name_en as name':'name_hindi as name';
            $category  =   $this->category->take(6)->select('id',$name,'images')->where('status','active')->get();
            $products  =   $this->product->take(3)->select('id',$name)->with("image")->where('status','active')->get();
            $banners   = $this->banners->select('id','image')->where('status','active')->get();
            return response()->json(['success'=>true,'message' => '',"banners"=>$banners,'category'=>$category,'product'=>$products]);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 403);
        }
    }
}