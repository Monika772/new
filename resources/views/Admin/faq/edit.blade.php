@extends('Website.layouts.app')

@section('title', env('APP_NAME'))
@push('header_styles')
<style>
    .invalid-feedback{color:red;}
</style>
@endpush   

@section('heading')
<h1> FAQ </h1>
@endsection

@section('breadcrumb')
<!-- comment by jyoti <ol class="breadcrumb">
    <li><a href="{{ url('/home') }}"><i class="fa fa-dashboard"></i>Dashboard</a></li>
    <li><a href="{{ url('/faq') }}">FAQ</a></li>
    <li><a href="#">Edit</a></li>
</ol> -->
@endsection


@section('content')
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Update FAQ </h3>
        </div>
        <!-- /.box-header -->
        
        <!-- /.box-header -->
        <div class="box-body">

        <form method="POST" action="{{url('faq/update/')}}/{{ $faq->id }}" id="edit-form">
                @csrf 
                <div class="form-group col-md-12">
                <label for=""> Role </label> <span style="color:red"> *</span>
                <select data-size="8" name="role_type" data-live-search="true" class="form-control" placeholder="Select Role"  aria-describedby="role_type-error">
                    <option value=""> Please Select Role </option>
                    <option @if($faq->role_type == 'employees'){{'selected'}} @endif value="employees"> Employee </option> 
                    <option @if($faq->role_type == 'employers'){{'selected'}} @endif value="employers"> Employer</option>  
                </select>
                <span id="role_type-error" class="invalid-feedback"></span>
            </div> 
            <div class="form-group col-md-12">
                <label for="">Question <span style="color:red"> *</span></label>
                <input type="text" name="question" value="{{$faq->question}}" class="form-control" placeholder="Question">
            </div>
            <div class="form-group col-md-12">
                  <label for="">Answer</label><span style="color:red"> *</span>
                  <textarea class="form-control" id="answer" name="answer">{{$faq->answer}}</textarea>
                  <input type="hidden" name="answer_msg" id="answer_msg" value="{{$faq->answer}}" aria-describedby="answer_msg-error">
                  <span id="answer_msg-error" class="invalid-feedback"></span>
            </div>
              <div class="">
                   
                    <div class="col-xs-12 text-right">
                      <input type="hidden" name="id" value="{{$faq->id}}">
                        <button type="button" id="FAQBtn" class="btn btn-primary">Submit</button>
                    </div>
                </div>
            </form>
            <script src="{{URL::TO('public/js/jquery.min.js')}}"></script>
            {!! JsValidator::formRequest('App\Http\Requests\FAQRequest','#edit-form') !!}
        </div>

        <!-- /.box-body -->
      </div>
      <!-- /.box -->
    </div>
    <!-- /.col -->
  </div>
  <!-- /.row -->
  <script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
<script>
  CKEDITOR.replace( 'answer' );
  $("#FAQBtn").on('click', (function (e) {
           e.preventDefault();
           var frm = $('#edit-form');
           let msg = CKEDITOR.instances.answer.getData();
              $("#answer_msg").val(msg);
           if (frm.valid()) {
               showButtonLoader('FAQBtn', 'Submit', 'disable');
               $.ajax({
                   url: "{{url('faq/update/')}}",
                   type: "POST",
                   data: new FormData(frm[0]),
                   contentType: false,
                   cache: false,
                   processData: false,
                   success: function (response)
                   {
                       showButtonLoader('FAQBtn', 'Submit', 'enable');
                       if(response.success){
                           toastr.success(response.message);
                           location.href="{{url('/faq')}}"
                       }else{
                           toastr.error(response.message);
                       }
                   },
                   error: function (response) {
                       showButtonLoader('FAQBtn', 'Submit', 'enable');
                       (response.message)?toastr.error(response.message, 'CMS'):'';
                       $(".invalid-feedback").text('');
                       $(".invalid-feedback").css('display','block');
                       var errors = $.parseJSON(response.responseText);
                        $.each(errors.errors, function (key, val) {
                          $("#" + key + "-error").text(val);
                        });
                   },
               });
           }
       }));
  </script>
@endsection
