<?php 
namespace App\Repository;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use App\Models\TaxCategory;
use Illuminate\SuTeamspport\Facades\Storage;
use App\Helpers\CommonHelper;

class TaxCategoryRepository {

    public function __construct(){
        $this->teaxcat = new TaxCategory();
    }
    public function getCategoryList(){
        return $this->teaxcat->where('status','=','active')->orderBy('id','desc')->get();
    }
    public function getAllActiveCategory(){
        return $this->teaxcat->where('status','active')->orderBy('id','asc')->get();
    }    
    public function store($request){
        $requestData = ['name' => ucfirst($request->name),"tax"=>$request->tax,"status"=>'active'];
        return $this->teaxcat->insert($requestData);
    }
    public function getRecord($id){
        return $this->teaxcat->where('id',$id)->first();
   }

    public function update($request){
        $id = $request->id;
        $req['name']  = $request->name;
        $req['tax']  = $request->tax;
       return $this->teaxcat->where('id',$id)->update($req);
    }

    public function delete($id) {
       return $this->teaxcat->where('id',$id)->update(['status'=>'deleted']);
    }
    public function updateStatus($id,$status) {
        return $this->teaxcat->where('id',$id)->update(['status'=>$status]);
     }
    
    // public function getGigrrTypesList(){
    //     return $this->gigrr_types->where('status','active')->orderBy('name','asc')->get();
    // }
     
}