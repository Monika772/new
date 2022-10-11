<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Repository\CommonRepository;
use App\Helpers\CommonHelper;
use App\Models\User;
use Carbon\Carbon;
use Redirect;
use Session;
use DataTables;
use DB;

class CommonController extends Controller
{
    /**
     * Show the application view.
     * @return \Illuminate\Contracts\Support\Renderable
     */

    public function __construct(CommonRepository $commonRepository){   
        $this->commonRepository = $commonRepository;
    }

    public function chat($id){
        $chatDetails = $this->commonRepository->getChatDetails($id);
        $userDetails = CommonHelper::getUserDetails($id);
        $userId     = Auth::user()->id;
        return view('Admin.chat.chat-details',compact('chatDetails','userDetails','userId'));
    }

    public function sendMessage(Request $request){
        $chat = $this->commonRepository->saveChatAdmin($request);
        return response()->json(['success'=>'Msg send successfully !']);
    }

    public function getMessage(Request $request) {
        $id =$request['cust_id'];
        $chatDetails = $this->commonRepository->getChatDetails($id);
        $userDetails = CommonHelper::getUserDetails($id);
        $userId     = Auth::user()->id;
        return view('Admin.chat.chat-content',compact('userDetails','chatDetails','userId')) ;
      }

    public function loadChat(){
        $chatUsers = $this->commonRepository->loadChatUsers();
        return view('Admin.chat.load-chat',compact('chatUsers')) ;
    }
}