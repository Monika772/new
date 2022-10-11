<?php 
namespace App\Repository;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use App\Models\Category;
use Illuminate\SuTeamspport\Facades\Storage;
use App\Helpers\CommonHelper;

class CategoryRepository {

    public function __construct(){
        $this->category = new Category();
    }
    public function getCategoryList(){
        return $this->category->where('status','!=','inactive')->orderBy('id','desc')->get();
    }
    public function getCategoryListApi($request){
        $language  =   isset($request['language'])?$request['language']:'en';
        $name      =   ($language=='en')?'name_en as name':'name_hindi as name';
        $orderByname =   ($language=='en')?'name_en':'name_hindi';
        return $this->category->select('id',$name,'images')->where('status','active')->orderBy($orderByname,'asc')->get();
    }
    public function getAllActiveCategory(){
        return $this->category->where('status','active')->orderBy('id','asc')->get();
    }    
    public function store($request){
        $imge="";
        if($request->hasfile('image')){
            $file = $request->file('image');
            $filename = time() . '.' . $request->file('image')->extension();
            $destinationPath = storage_path('app/category');
            $file->move($destinationPath, $filename);
            $imge = $filename;
        }
        
        $requestData = ['name_en' => ucfirst($request->name_en),"name_hindi"=>$request->name_hindi,'status'=>'active',"images"=>$imge];
        return $this->category->insert($requestData);
    }
    public function getRecord($id){
        return $this->category->where('id',$id)->first();
   }

    public function update($request){
        $id = $request->id;
        if($request->hasfile('image')){
            $file = $request->file('image');
            $filename = time() . '.' . $request->file('image')->extension();
            $destinationPath = storage_path('app/category');
            $file->move($destinationPath, $filename);
            $req['images']  = $filename;
        }
        $req['name_en']  = $request->name_en;
        $req['name_hindi']  = $request->name_hindi;
        
       return $this->category->where('id',$id)->update($req);
    }

    public function delete($id) {
       return $this->category->where('id',$id)->update(['status'=>'deleted']);
    }
    public function updateStatus($id,$status) {
        return $this->category->where('id',$id)->update(['status'=>$status]);
    }
}