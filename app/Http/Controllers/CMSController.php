<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Http\Requests\CMSRequest;
use App\Models\CMS;
use Carbon\Carbon;
use Redirect;
use Session;
use DataTables;

class CMSController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function __construct(CMS $cms){
        $this->cms   = $cms;
     }
    public function index(){
        return view('Admin.cms.index');
    }
    public function getData(Request $request){
        try {
            $cms = $this->cms->get();
            return datatables()->of($cms)->toJson();
        } catch (\Exception $e) {
            return redirect('cms')->with('error',$e->getMessage());
        }
    }
    public function edit($id){ 
        $cms = $this->cms->where("id",$id)->first();
        return view('Admin.cms.edit',compact('cms'));
    }
    public function update(CMSRequest $request){
        try {
            $cms  = $this->cms->where('id',$request['id'])->update(['content_en'=>$request['content_en_msg'],'content_hindi'=>$request['content_hindi_msg']]);
            if($cms){   
                return ['success'=>true,'message'=>'CMS update successfully'];
            }else{
               return ['success'=>false,'message'=>'Something went wrong !!'];
            }
        } catch (\Exception $e) {
            return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
        }
    }
   
}