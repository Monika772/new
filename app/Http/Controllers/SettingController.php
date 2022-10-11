<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Http\Requests\SettingRequest;
use App\Models\Settings;
use App\Models\User;
use Carbon\Carbon;
use Redirect;
use Session;
use DataTables;

class SettingController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function __construct(Settings $setting,User $user){
        $this->setting   = $setting;
        $this->user      = $user;
     }
    public function index(){
        $settings = $this->setting->get();
        return view('Admin.setting.index',compact('settings'));
    }
    public function edit($id){ 
        $setting = $this->setting->where("id",$id)->first();
        return view('Admin.setting.edit-form',compact('setting'));
    }
    public function update(SettingRequest $request){
        try {
            $setting  = $this->setting->where('id',$request['id'])->update(['value'=>$request['value']]);
            if($setting){   
                return ['success'=>true,'message'=>'Setting update successfully'];
            }else{
               return ['success'=>false,'message'=>'Something went wrong !!'];
            }
        } catch (\Exception $e) {
            return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
        }
    }
    public function updateIsImageOption($status){ 
        try {
            $status = $this->setting->where('id','1')->update(['is_image'=>$status]);
            if($status){   
                return ['success'=>true,'message'=>($status=='1')?'Image show status set successfully':'Image hide status set successfully'];
            }else{
               return ['success'=>false,'message'=>'Something went wrong !!'];
           }
       } catch (\Exception $e) {
           return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
       }
    }
}