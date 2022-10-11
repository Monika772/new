<?php 
namespace App\Repository;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use App\Models\Banners;
use Illuminate\SuTeamspport\Facades\Storage;
use App\Helpers\CommonHelper;

class BannerRepository {

    public function __construct(){
        $this->banners = new Banners();
    }
    public function getBannerList(){
        return $this->banners->where('status','=','active')->orderBy('id','desc')->get();
    }
    public function getAllActiveCategory(){
        return $this->banners->where('status','active')->orderBy('id','asc')->get();
    }    
    public function store($request){
        $imge="";
        if($request->hasfile('image')){
            $file = $request->file('image');
            $filename = time() . '.' . $request->file('image')->extension();
            $destinationPath = storage_path('app/banners');
            $file->move($destinationPath, $filename);
            $imge = $filename;
        }
        $requestData = ["image"=>$imge,'status'=>'active'];
        return $this->banners->insert($requestData);
    }
    public function getRecord($id){
        return $this->banners->where('id',$id)->first();
   }

    public function update($request){
        $id = $request->id;
        if($request->hasfile('image')){
            $file = $request->file('image');
            $filename = time() . '.' . $request->file('image')->extension();
            $destinationPath = storage_path('app/banners');
            $file->move($destinationPath, $filename);
            $req['image']  = $filename;
        }else{
            $req['image']=isset($request->image) ? $request->image : '';
        }
        
        
       return $this->banners->where('id',$id)->update($req);
    }

    public function delete($id) {
       return $this->banners->where('id',$id)->update(['status'=>'deleted']);
    }
    public function updateStatus($id,$status) {
        return $this->banners->where('id',$id)->update(['status'=>$status]);
    }
}