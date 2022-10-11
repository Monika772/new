<?php 
namespace App\Repository;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use App\Models\SubCategory;
use App\Models\Category;
use Illuminate\SuTeamspport\Facades\Storage;
use App\Helpers\CommonHelper;

class SubCategoryRepository {

    public function __construct(){
        $this->subcat = new SubCategory();
        $this->cat=new Category();
    }
    public function getCategoryList(){
        return $this->subcat->with('categories')->where('status','!=','inactive')->orderBy('id','desc')->get();
    }
    public function getAllActiveCategory(){
        return $this->subcat->where('status','active')->orderBy('id','asc')->get();
    }    
    public function store($request){
        $imge="";
        if($request->hasfile('image')){
            $file = $request->file('image');
            $filename = time() . '.' . $request->file('image')->extension();
            $destinationPath = storage_path('app/subcategory');
            $file->move($destinationPath, $filename);
            $imge=$filename;
         }
        $requestData = ['categories_id'=>$request->categories_id,'name_en' => ucfirst($request->name_en),'name_hindi' => ucfirst($request->name_hindi),"status"=>'active',"image"=>$imge];
        return $this->subcat->insert($requestData);
    }
    public function getRecord($id){
        return $this->subcat->where('id',$id)->first();
   }

    public function update($request){
        $id = $request->id;
        if($request->hasfile('image')){
            $file = $request->file('image');
            $filename = time() . '.' . $request->file('image')->extension();
            $destinationPath = storage_path('app/subcategory');
            $file->move($destinationPath, $filename);
            $req['image']=$filename;
        }
        $req['categories_id']=$request->categories_id;
        $req['name_en']  = $request->name_en;
        $req['name_hindi']  = $request->name_hindi;
       
       return $this->subcat->where('id',$id)->update($req);
    }

    public function delete($id) {
       return $this->subcat->where('id',$id)->update(['status'=>'deleted']);
    }
    public function updateStatus($id,$status) {
        return $this->subcat->where('id',$id)->update(['status'=>$status]);
     }
    public function getRecordCategory(){
        return $this->cat->where('status','active')->orderBy('id','asc')->get();
    }
    
     
}