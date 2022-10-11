<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Repository\UserRepository;
use App\Exports\ExportUsernew;
use App\Imports\ImportUser;
use Carbon\Carbon;
use App\Models\User;
use Redirect;
use Session;
use DataTables;
use PDF;
use Excel;

class UserController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */

    public function __construct(UserRepository $user )
    {   
        $this->user = $user;
    }

    public function index(Request $request){
        return view('Admin.user.index');
    }
    public function getData(Request $request)
    {
        try {
            $users = $this->user->getUserList($request);
            return datatables()->of($users)->toJson();
        } catch (\Exception $e) {
            return redirect('users')->with('error',$e->getMessage());
        }
    } 
    public function downloadUserPDF(Request $request){
        $users = User::where('role_id','!=','1')->where('mobile_verify_status','1')->orderBy('id','desc')->get();
       
        $pdf = PDF::loadView('Admin.user.user-pdf', compact('users'));  
        return $pdf->download('user.pdf');
     }
     public function downloadUserExcel(Request $request){
        return Excel::download(new ExportUsernew, 'users.xlsx');
        // return Excel::download(new UserExport, 'userData.xlsx');
     }
     public function importView(Request $request){
        return view('Admin.user.importFile');
    }

    public function import(Request $request){
        Excel::import(new ImportUser, $request->file('file')->store('public/files'));
        return redirect()->back();
    }
     /**
     * Function : status
     * Desc : category status update
     */
    public function status($id,$status){ 
        try {
            $category = $this->user->updateStatus($id,$status);
            if($category){   
                return ['success'=>true,'message'=>($status=='active')?'user Activated Successfully':'user Inactive Successfully'];
            }else{
               return ['success'=>false,'message'=>'Something went wrong !!'];
           }
       } catch (\Exception $e) {
           return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
       }
    }
    /**
     * Function : deleted
     * Desc : delete category data
     */
    public function deleted($id){ 
        try {
            $delete = $this->user->delete($id);
            if($delete){   
                return ['success'=>true,'message'=>'user deleted successfully'];
            }else{
               return ['success'=>false,'message'=>'Something went wrong !!'];
           }
       } catch (\Exception $e) {
           return ['success'=>false,'message'=>$e->getMessage(),'errors'=>array('message'=>$e->getMessage())];
       }
    }
}
