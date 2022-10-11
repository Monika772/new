<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Http\Requests\MessageRequest;
use App\Repository\MessageRepository;
use Carbon\Carbon;
use Redirect;
use Session;
use DataTables;


class MessageController extends Controller
{
    public function __construct(MessageRepository $message){   
        $this->message = $message;
    }
    public function index(){
        return view('Admin.message.index');
    }
    public function sendMessage(MessageRequest $request){
        try {
            $message= $this->message->sendMessage($request);
            if($message)
           {   
               return redirect('message')->with('success','Message send successfully');
           }else{
               return redirect('message')->with('error','Something went wrong !!');
           }
       } catch (\Exception $e) {
           return redirect('message')->with('error',$e->getMessage());
       }
    }
    
}