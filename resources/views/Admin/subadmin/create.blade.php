@extends('Website.layouts.app')
@section('title', env('APP_NAME'))
@push('header_styles')
<style type="text/css">
  .invalid-feedback {
    color: red;
  }
</style>
@endpush
@section('heading')
<h1>Add New Sub Admin </h1>
@endsection

@section('breadcrumb')
<!-- comment by jyoti
<ol class="breadcrumb">
    <li><a href="{{ url('/home') }}"><em class="fa fa-dashboard"></em>Dashboard</a></li>
    <li><a href="{{ url('/wholesale') }}">SubAdmin </a></li>
    <li><a href="#">Add SubAdmin </a></li>
</ol>-->
@endsection

@section('content')
<div class="row">
  <div class="col-xs-12">
    <div class="box">
      <div class="box-header">
        <h3 class="box-title"> Add New Sub Admin</h3>
      </div>
      <div class="box-body">
        <div class="row">

          <form method="POST" action="{{url('subadmin/store')}}" enctype="multipart/form-data" id="subadminFrm">
            @csrf
           
               <div class="col-md-6 col-sm-12">
                   <div class="row d-flex  align-items-center">
                    
                    <div class="form-group col-md-3">
                      <img style="object-fit:cover" src="{{url('storage/app/avatars/logo.png')}}" width="100px" height="100px" class="img-circle" alt="" id="preview-image">
                    </div>
                    <div class="form-group col-md-9">
                     <div class="upload-btn-wrapper">
                     <button class="btn"><i class="bx bx-camera"></i> Upload Image</button>
                    <input type="file" name="image" class="form-control" accept="image/*" onchange="previewImage(event)">
                     </div>
                  </div>
                   </div>
                    <div class="row">
                    <div class="form-group col-md-6 col-sm-12">
                      <label for="">First Name <span style="color:red"> *</span></label>
                      <input type="text" name="first_name" class="form-control" placeholder="First Name">
                    </div>
                    <div class="form-group col-md-6 col-sm-12">
                      <label for="">Last Name <span style="color:red"> *</span></label>
                      <input type="text" name="last_name" class="form-control" placeholder="Last Name">
                    </div>
                    </div>
                    <div class="form-group">
                      <label for=""> Email </label> <span style="color:red"> *</span>
                      <input type="email" name="email" class="form-control" placeholder="Email">
                    </div>
                    <div class="row">
                    <div class="form-group col-md-6 col-sm-12">
                      <label for=""> Mobile </label> <span style="color:red"> *</span>
                      <input type="text" name="mobile" class="form-control" placeholder="Mobile">
                    </div>
                    <div class="form-group col-md-6 col-sm-12">
                      <label for="">Password </label> <span style="color:red"> *</span>
                      <input type="text" name="password" class="form-control" placeholder="Password">
                    </div>
                    </div>
                   
               </div>

              <div class="form-group col-md-6 col-sm-12">
                @if(isset($permissions) && !empty($permissions))
                <table id="table" class="table table-bordered table-striped Table__modified">
                  <thead>
                    <tr>
                      <th>S.No</th>
                      <th>Name</th>
                      <th>Permissions</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $i = 0; ?>
                    @foreach($permissions as $permission)
                    <?php $i++; ?>
                    <tr>
                      <td>{{$i}}</td>
                      <td>{{$permission->name}}</td>
                      <td><input type="checkbox" id="{{$permission->route}}" name="permission[]" value="{{$permission->id}}"></td>
                    </tr>

                    @endforeach
                    
                  </tbody>
                </table>
              
                @endif
              </div>

              <div class="form-group col-md-12" style="margin-top:20px">


                <button type="button" id="subadminBtn" class="btn btn-primary">Submit</button>
                <a class="btn btn-danger btn-close" href="{{URL::previous()}}">Cancel</a>
              </div>
           
          </form>
        </div>
        <script src="{{URL::TO('public/js/jquery.min.js')}}"></script>
        {!! JsValidator::formRequest('App\Http\Requests\AddSubadminRequest','#subadminFrm') !!}
      </div>

      <!-- /.box-body -->
    </div>
    <!-- /.box -->
  </div>
  <!-- /.col -->
</div>
<!-- /.row -->

<script>
  const previewImage = e => {
    const preview = document.getElementById('preview-image');
    preview.src = URL.createObjectURL(e.target.files[0]);
    preview.onload = () => URL.revokeObjectURL(preview.src);
  };
  $("#subadminBtn").on('click', (function(e) {
    e.preventDefault();
    var frm = $('#subadminFrm');
    if (frm.valid()) {
      showButtonLoader('subadminBtn', 'Save', 'disable');
      $.ajax({
        url: "{{url('subadmin/store')}}",
        type: "POST",
        data: new FormData(frm[0]),
        contentType: false,
        cache: false,
        processData: false,
        success: function(response) {
          showButtonLoader('subadminBtn', 'Save', 'enable');
          if (response.success) {
            toastr.success(response.message);
            location.href = "{{url('/subadmin')}}"
          } else {
            toastr.error(response.message);
          }
        },
        error: function(response) {
          showButtonLoader('subadminBtn', 'Save', 'enable');
          (response.message) ? toastr.error(response.message, 'SubAdmin'): '';
          $(".invalid-feedback").text('');
          $(".invalid-feedback").css('display', 'block');
          var errors = $.parseJSON(response.responseText);
          $.each(errors.errors, function(key, val) {
            $("#" + key + "-error").text(val);
          });
        },
      });
    }
  }));
</script>
@endsection