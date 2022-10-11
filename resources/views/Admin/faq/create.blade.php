@extends('Website.layouts.app')

@section('title', env('APP_NAME'))
@push('header_styles')
<style>
    .invalid-feedback{color:red;}
</style>
@endpush   

@section('heading')
<h1> FAQ</h1>
@endsection
@section('content')
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Create FAQ </h3>
        </div>
       <div class="box-body">

        <form method="POST" action="{{url('faq/save/')}}" id="add-form">
                @csrf 
            <div class="form-group col-md-12">
                <label for="">Question (HI)<span style="color:red"> *</span></label>
                <input type="text" name="title_hindi" value="" class="form-control" placeholder="Question">
            </div>
            <div class="form-group col-md-12">
                <label for="">Question (EN)<span style="color:red"> *</span></label>
                <input type="text" name="title_en" value="" class="form-control" placeholder="Question">
            </div>
            <div class="form-group col-md-12">
                  <label for="">Answer (EN)</label><span style="color:red"> *</span>
                  <textarea class="form-control" id="description_en" name="description_en"></textarea>
                  <input type="hidden" name="description_en" id="description_en" value="" aria-describedby="description_en-error">
                  <span id="description_en-error" class="invalid-feedback"></span>
            </div>
            <div class="form-group col-md-12">
                  <label for="">Answer (HI)</label><span style="color:red"> *</span>
                  <textarea class="form-control" id="description_hindi" name="description_hindi"></textarea>
                  <!-- <input type="hidden" name="description_hindi" id="description_hindi" value="" aria-describedby="description_hindi-error"> -->
                  <span id="description_hindi-error" class="invalid-feedback"></span>
            </div>
            <div class="">
              <div class="col-xs-12 text-right">
                <button type="button" id="faqBtn" class="btn btn-primary">Submit</button>
              </div>
            </div>
            </form>
            <script src="{{URL::TO('public/js/jquery.min.js')}}"></script>
            {!! JsValidator::formRequest('App\Http\Requests\FAQRequest','#add-form') !!}
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
  CKEDITOR.replace( 'description_en' );
  CKEDITOR.replace( 'description_hindi' );
  $("#faqBtn").on('click', (function (e) {
           e.preventDefault();
           var frm = $('#add-form');
           console.log(frm);
           //let msg = CKEDITOR.instances.answer.getData();
              //$("#description_en").val(msg);
          //     $("#description_hindi").val(msg);
           if (frm.valid()) {
               showButtonLoader('faqBtn', 'Submit', 'disable');
               $.ajax({
                   url: "{{url('faq/create/')}}",
                   type: "POST",
                   data: new FormData(frm[0]),
                   contentType: false,
                   cache: false,
                   processData: false,
                   success: function (response)
                   {
                       showButtonLoader('faqBtn', 'Submit', 'enable');
                       if(response.success){
                           toastr.success(response.message);
                           location.href="{{url('/faq')}}"
                       }else{
                           toastr.error(response.message);
                       }
                   },
                   error: function (response) {
                       showButtonLoader('faqBtn', 'Submit', 'enable');
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
