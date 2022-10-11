@extends('Website.layouts.app')
@section('title', env('APP_NAME'))
@push('header_styles')
<link  href="{{ url('admin/dist/css/jquery.dataTables.min.css') }}" rel="stylesheet">
<link rel="stylesheet" href="{{ url('admin/bower_components/Ionicons/css/ionicons.min.css') }}">
<link rel="stylesheet" href="{{ url('admin/bower_components/datepicker/css/jquery-ui.css') }}">
@endpush   
@push('header_script')
@endpush
@section('heading')
<h1> Chat</h1>
@endsection

@section('breadcrumb')
<ol class="breadcrumb">
    <li><a href="{{ url('/home') }}"><em class="fa fa-dashboard"></em>Dashboard</a></li>
    <li><a href="#">Chat</a></li>
</ol> 
@endsection

@section('content')
<div class="row">
   <div class="col-sm-12">
      <div class="card">

        <div class="card-header chat_topbar">
            <div class="media">
               <div class="media-body">
                  <div class=""> <b> <h3> Chat with {{$userDetails->first_name}} </h3> </b> </div>
               </div>
               <em class="icon-options-vertical f-24 p-absolute msg-ellipsis hidden-md-down"></em>
            </div>
        </div>

        <div class="card-block myContainer">
            <div class="row">
          
               <div class="col-md-12 messages-content border-0" >

                  <div id="chatContainer" class="chat_message_list_scroll" >
                  @if(!empty($chatDetails))
               @foreach($chatDetails as $content)
                  @if($content->from_user_id==$userId)
                  <div class="media">
                     <div class="media-body text-right">
                        <p class="msg-reply mbg-primary">
                            {{$content->message}} 
                        </p>
                        <p class="time_font" > 
                           <em class="icofont icofont-wall-clock f-12"></em>  
                              <small>{{$content->created_at}}  </small>
                        </p>
                     </p>

                     </div>
                     
                     <div class="media-right friend-box">
                        <a href="#">
                        <img  id="profile_image" src="{{Auth()->user()->profile_image}}" width="80" height="50" class="img-circle ml-2" alt="User Image">
                        </a>
                     </div>
                     
                  </div>
                  @else

                     <div class="media">
                     <div class="media-left friend-box">
                        <a href="#">
                        <img class="media-object rounded-circle" src="{{$userDetails->image_url}}" alt="admin" width="50" height="50" >
                        
                        </a>
                     </div>
                     <div class="media-body">
                         <p class="msg-send">
                           {{$content->message}} 

                        <p class="time_font" >
                           <em class="icofont icofont-wall-clock f-12"></em> 
                           <small>{{$content->created_at}} </small>
                       </p>
                     </div>
                  </div>
                  @endif
                  @endforeach
                  @endif
                  </div>
            <br>

            <form id="chatForm" enctype="multipart/form-data" action="{{url('common/sendMessage') }}" method="post" >
             @csrf
             <div class="messages-send">
               <div class="form-group">
                  <div class="input-group open_chatview">
                  <input type="hidden" name="cust_id" value="{{$userDetails->id}}" id="cust_id">
                  <input type="hidden" name="type" value="0" id="contentType">
                    <input type="text" name="message" id="chatBox" class="form-control new-msg" placeholder="Type A Message" aria-describedby="basic-addon2">
                     <span class="input-group-addon bg-white" id="basic-addon2">
                     
                        <button type="button" class="sendBtn" > 
                          <img src="{{url('public/images/send_message_icon.jpg')}}" width="25" >
                        </button>
                     </span>
                  </div>
                </div>
              </div>
            </form>

               
            </div>
         </div>
      </div>
   </div>
</div>


@endsection
@push('footer_script')
<script src="{{ url('admin/dist/js/jquery.dataTables.min.js') }}" defer></script>
<script src="{{ url('admin/bower_components/datepicker/js/jquery-ui.min.js') }}" defer></script>

<script type="text/javascript">
    
  chatUrl = "{{url('common/sendMessage') }}" ;
  getChatUrl = "{{url('common/getMessage') }}" ;

//sending Chat date - get Chat data
$('body').on('click','.sendBtn',function(){
    
     var getdate =  $("#chatBox").val();
     scrolled = 0;
     if(getdate != ""){
   
         $.ajax({
          type: "post",
          url: chatUrl ,
          data: new FormData($('#chatForm')[0]),
             processData: false,
             contentType: false,
             success: function (response) {
              $("#chatBox").val('');
              loadChatView();
              $('.chatContainer').scrollTop(1000000);
         }
       });
     } 
 });



 
  function loadChatView(){
   var cust_id = $('#cust_id').val(); 
   $.ajax({
         type: "POST",
         url: "{{url('common/getMessage') }}" ,
         data:  {"_token": "{{ csrf_token() }}",'cust_id':cust_id},
        success: function (response) {
             $('#chatContainer').html(response);
             $('.chat_message_list_scroll').scrollTop(1000000);
             $('.myContainer').scrollTop(1000000);
         }
     });
 
   } 
  
    setInterval(function(){
      loadChatView();
   }, 10000); 
  
  function getoutput(){
     var outputfile = $('#file').val();
     $('#chatBox').val(outputfile);
     $('#contentType').val('1');
 }



 </script>
 @endpush 