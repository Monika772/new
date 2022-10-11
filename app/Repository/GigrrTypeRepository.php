<?php 
namespace App\Repository;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use App\Models\GiggrTypes;
use Illuminate\SuTeamspport\Facades\Storage;
use App\Helpers\CommonHelper;

class GigrrTypeRepository {

    public function __construct(GiggrTypes $gigrr_types){
        $this->gigrr_types = $gigrr_types;
    }
    public function getData(){
        return $this->gigrr_types->where('status','!=','deleted')->orderBy('id','desc')->get();
    }
    public function getGigrrTypesList(){
        return $this->gigrr_types->where('status','active')->orderBy('name','asc')->get();
    }
       
    public function store($request){
        $requestData = ['name' => ucfirst($request->name),'status'=>'active'];
        return $this->gigrr_types->insert($requestData);
    }
    public function getRecord($id){
        return $this->gigrr_types->where('id',$id)->first();
   }

    public function update($request){
        $id = $request->id;
        $req['name']  = $request->gigrr_type_name;
       return $this->gigrr_types->where('id',$id)->update($req);
    }

    public function delete($id) {
       return $this->gigrr_types->where('id',$id)->update(['status'=>'deleted']);
    }
    public function updateStatus($id,$status) {
        return $this->gigrr_types->where('id',$id)->update(['status'=>$status]);
     }  
}