@extends('Website.layouts.app')

@section('title', env('APP_NAME'))
@push('header_styles')
<style>
    .invalid-feedback{color:red;}
</style>
@endpush   

@section('heading')
<h1> CMS </h1>
@endsection

@section('breadcrumb')
<!--comment by jyoti <ol class="breadcrumb">
    <li><a href="{{ url('/home') }}"><i class="fa fa-dashboard"></i>Dashboard</a></li>
    <li><a href="{{ url('/cms') }}">CMS</a></li>
    <li><a href="#">Edit</a></li>
</ol> -->
@endsection


@section('content')
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Update CMS </h3>
        </div>
        <!-- /.box-header -->
        
        <!-- /.box-header -->
        <div class="box-body">

        <form method="POST" action="{{url('cms/update/')}}/{{ $cms->id }}" id="edit-form">
                @csrf 
            <div class="form-group col-md-12">
                    <label for="">Title (English) <span style="color:red"> *</span></label>
                    <input type="text" name="title_en" value="{{ $cms->title_en }}" class="form-control" placeholder="Title" readonly>
            </div>
            <div class="form-group col-md-12">
                  <label class="font-medium mb-2" style="display: block;">Content (English)</label>
                  <textarea class="form-control" id="content_en" name="content_en">{{ $cms->content_en }}</textarea>
                  <input type="hidden" name="content_en_msg" id="content_en_msg" value="" aria-describedby="content_en_msg-error">
                  <span id="content_en_msg-error" class="invalid-feedback"></span>
            </div>

            <div class="form-group col-md-12">
                    <label for="">Title (Hindi) <span style="color:red"> *</span></label>
                    <input type="text" name="title_hindi" value="{{ $cms->title_hindi }}" class="form-control" placeholder="Title Hindi" readonly>
            </div>
            <div class="form-group col-md-12">
                  <label class="font-medium mb-2" style="display: block;">Content (English)</label>
                  <textarea class="form-control" id="content_hindi" name="content_hindi">{{ $cms->content_hindi }}</textarea>
                  <input type="hidden" name="content_hindi_msg" id="content_hindi_msg" value="" aria-describedby="content_hindi_msg-error">
                  <span id="content_hindi_msg-error" class="invalid-feedback"></span>
            </div>
              <div class="">
                   
                    <div class="col-xs-12 text-right">
                      <input type="hidden" name="id" value="{{$cms->id}}">
                        <button type="button" id="cmsBtn" class="btn btn-primary">Submit</button>
                    </div>
                </div>
            </form>
            <script src="{{URL::TO('public/js/jquery.min.js')}}"></script>
            {!! JsValidator::formRequest('App\Http\Requests\CMSRequest','#edit-form') !!}
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
  var content_en =  CKEDITOR.replace( 'content_en' );
  var content_hindi = CKEDITOR.replace( 'content_hindi' );
  $("#cmsBtn").on('click', (function (e) {
           e.preventDefault();
           var frm = $('#edit-form');
           let content_en_msg = content_en.getData();
              $("#content_en_msg").val(content_en_msg);
              let content_hindi_msg = content_hindi.getData();
              $("#content_hindi_msg").val(content_hindi_msg);
           if (frm.valid()) {
               showButtonLoader('cmsBtn', 'Submit', 'disable');
               $.ajax({
                   url: "{{url('cms/update/')}}",
                   type: "POST",
                   data: new FormData(frm[0]),
                   contentType: false,
                   cache: false,
                   processData: false,
                   success: function (response)
                   {
                       showButtonLoader('cmsBtn', 'Submit', 'enable');
                       if(response.success){
                           toastr.success(response.message);
                           location.href="{{url('/cms')}}"
                       }else{
                           toastr.error(response.message);
                       }
                   },
                   error: function (response) {
                       showButtonLoader('cmsBtn', 'Submit', 'enable');
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
