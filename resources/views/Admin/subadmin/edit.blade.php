@extends('Website.layouts.app')

@section('title', env('APP_NAME'))
@push('header_styles')
<style>
  .invalid-feedback {
    color: red;
  }
</style>
@endpush

@section('heading')
<h1>
  SubAdmin
</h1>
@endsection

@section('breadcrumb')
<!--comment by jyoti <ol class="breadcrumb">
    <li><a href="{{ url('/home') }}"><i class="fa fa-dashboard"></i>Dashboard</a></li>
    <li><a href="{{ url('/subadmin') }}">SubAdmin</a></li>
    <li><a href="#">Edit</a></li>
</ol> -->
@endsection


@section('content')
<div class="row">
  <div class="col-xs-12">
    <div class="box">
      <div class="box-header">
        <h3 class="box-title">Update SubAdmin </h3>
      </div>
      <!-- /.box-header -->

      <!-- /.box-header -->
      <div class="box-body">
        <div class="row">

          <form method="POST" action="{{url('subadmin/update/')}}/{{ $record->id }}" enctype="multipart/form-data" id="edit-form">
            @csrf

            <div class="col-md-6 col-sm-12">
              <div class="row d-flex align-items-center">
                <div class="form-group col-md-3">
                  <img style="object-fit:cover" src="{{$record->profile_image}}" width="100px" height="100px" class="img-circle" id="preview-image">
                </div>
                <div class="form-group col-md-9">
                  <div class="upload-btn-wrapper">
                    <button class="btn"><i class="bx bx-camera"></i> Upload Image</button>
                    <input type="file" name="image" class="form-control" accept="/image" onchange="previewImage(event)">
                  </div>
                </div>
              </div>

                <div class="row">
                  <div class="form-group col-md-6 col-sm-12">
                    <label for="">First Name <span style="color:red"> *</span></label>
                    <input type="text" name="first_name" value="{{ $record->first_name }}" class="form-control" placeholder="First Name">
                  </div>
                  <div class="form-group col-md-6 col-sm-12">
                    <label for="">Last Name <span style="color:red"> *</span></label>
                    <input type="text" name="last_name" value="{{ $record->last_name }}" class="form-control" placeholder="Last Name">
                  </div>
               
                <div class="form-group col-md-12 col-sm-12">
                  <label for=""> Email </label> <span style="color:red"> *</span>
                  <input type="email" name="email" value="{{ $record->email }}" class="form-control" placeholder="Email">
                </div>
                <div class="form-group col-md-6 col-sm-12">
                  <label for="">Password </label> <span style="color:red"> *</span>
                  <input type="text" name="password" value="{{ $record->user_password }}" class="form-control" placeholder="Password">
                </div>
                <div class="form-group col-md-6 col-sm-12">
                  <label for=""> Mobile </label> <span style="color:red"> *</span>
                  <input type="text" name="mobile" value="{{ $record->mobile }}" class="form-control" placeholder="Mobile">
                </div>
                <div class="form-group col-md-3">
                  <label for="">Update status</label>
                  <select data-live-search="true" name="status" class="form-control">
                    <option <?php if ($record->status == '1') {
                              echo "Selected";
                            } ?> value="1">Active</option>
                    <option <?php if ($record->status == '0') {
                              echo "Selected";
                            } ?> value="0">Inactive</option>
                    <option <?php if ($record->status == '2') {
                              echo "Selected";
                            } ?> value="2">Deleted</option>
                  </select>
                </div>
                </div>
              </div>

              <div class="form-group col-md-6 col-sm-12">
                @if(isset($permissions) && !empty($permissions))
                <table id="table" class="table table-bordered table-striped">
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
                      <th>{{$i}}</th>
                      <th>{{$permission->name}}</th>
                      <th><input type="checkbox" id="{{$permission->route}}" name="permission[]" value="{{$permission->id}}" <?php if (in_array($permission->id, explode(",", $record->permissions))) {
                                                                                                                                echo "checked";
                                                                                                                              } ?>></th>
                    </tr>

                    @endforeach
                  </tbody>
                </table>
                @endif
              </div>


              <div class="row">
                <div class="col-xs-9"></div>
                <div class="col-xs-3 pull-right">
                  <input type="hidden" name="id" value="{{$record->id}}">
                  <button type="button" id="playrBtn" class="btn btn-primary btn-block btn-flat">Submit</button>
                </div>
              </div>
            </div>
          </form>
          <script src="{{URL::TO('public/js/jquery.min.js')}}"></script>
          {!! JsValidator::formRequest('App\Http\Requests\UpdateSubadminRequest','#edit-form') !!}
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
    $("#playrBtn").on('click', (function(e) {
      e.preventDefault();
      var frm = $('#edit-form');
      if (frm.valid()) {
        showButtonLoader('playrBtn', 'Submit', 'disable');
        $.ajax({
          url: "{{url('subadmin/update/')}}",
          type: "POST",
          data: new FormData(frm[0]),
          contentType: false,
          cache: false,
          processData: false,
          success: function(response) {
            showButtonLoader('playrBtn', 'Submit', 'enable');
            if (response.success) {
              toastr.success(response.message);
              location.href = "{{url('/subadmin')}}"
            } else {
              toastr.error(response.message);
            }
          },
          error: function(response) {
            showButtonLoader('playrBtn', 'Submit', 'enable');
            (response.message) ? toastr.error(response.message, 'subadmin'): '';
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