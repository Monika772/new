<?php 
namespace App\Repository;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use App\Models\User;
use App\Models\Permissions;
use Illuminate\Support\Facades\Storage;
use App\Helpers\CommonHelper;
use Hash;
class SubAdminRepository   {

    public function __construct(User $user,Permissions $permissions){
        $this->user = $user;  
        $this->permissions = $permissions;
    }
    /**
     * function : getSubAdminList
     * desc : get subadmin list
     * @return array
     */
    public function getSubAdminList($request){
        $subAdmin =  $this->user->where('status','!=','deleted')
                        ->where('role_id','2')->orderBy('id','desc')->get();
        if(!empty($subAdmin)){
            foreach($subAdmin as $subAdn){
                $arr = explode(",",$subAdn['permissions']);
                $permission_name =  $this->permissions
                                    ->selectRaw('GROUP_CONCAT(name) as name')->whereIn('id',$arr)->first();
                $subAdn['role_permission']  =$permission_name['name'];
           }
        }
        return $subAdmin;
    }
    /**
     * function : getSubAdminPermissionsList
     * desc : get subadmin permission list
     * @return array
     */
    public function getSubAdminPermissionsList(){
        return $this->permissions->where('status','active')->orderBy('name','asc')->get();
    }
   
         
    public function store($request){
        $image='';
        if(!empty($request->image)){
            $image = CommonHelper::imageCompressUploads($request,'pro_image');
        }
         $permissions = implode(",",$request['permission']);
         $password  = Hash::make($request['password']);
         $user_password  = $request['password'];
         return $this->user->create(['first_name' => ucfirst($request->first_name),'last_name' => ucfirst($request->last_name), 'email' => $request['email'],'mobile' => $request['mobile'] ,'status' => 'inactive' ,'password' => $password,'user_password' => $user_password , 'permissions' => $permissions,'role_id'=>'2','mobile_verify_status'=>'1','profile_image'=>$image]);
   }

    public function getRecord($id){
        return $this->user->where('id',$id)->first();
    }

    public function update($request){
        $id=$request->id;
      if(!empty($request->password)){
            $req['password'] = Hash::make($request['password']);
            $req['user_password'] = $request['password'] ;
        }
       $req['permissions']  = implode(",",$request['permission']);
       $req['first_name']   = $request->first_name;
       $req['last_name']    = $request->last_name;
       $req['email']        = $request->email;
       $req['mobile']       = $request->mobile;
       $req['status']= $request->status;
       if(!empty($request->image)) {
            $req['profile_image'] = CommonHelper::imageCompressUploads($request,'pro_image');
       }
       return $this->user->where('id',$id)->update($req);
    }

    public function delete($id) {
        return $this->user->destroy($id);
    }
    public function updateStatus($id,$status) {
        return $this->user->where('id',$id)->update(['status'=>$status]);
     }

}