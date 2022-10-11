@extends('Website.layouts.app')
@section('title', 'Setting Management')
@push('header_styles')
<style type="text/css">
    .invalid-feedback{color:red;}
</style>
@endpush  
@section('heading')
<h1>Setting</h1>
@endsection

@section('breadcrumb')
<!-- comment by jyoti<ol class="breadcrumb">
    <li><a href="{{ url('/home') }}"><em class="fa fa-dashboard"></em>Dashboard</a></li>
    <li><a href="#">Setting </a></li>
</ol> -->
@endsection
<link href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>

@section('content')
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Settings</h3>
        </div>
        <!-- /.box-header -->
        
        <!-- /.box-header -->
        <div class="box-body setting-table-box">
          <table id="table" class="table table-bordered table-striped">
            <thead>
            <tr>
              <th>S.No</th>   
              <th>Name</th>
              <th>Value</th>
             <th>Action</th>
              
            </tr>
            </thead>
            <tbody>
              @if(!empty($settings))
              
              @foreach($settings as $key => $setting )
              <tr>
                <th>{{$key+1}}</th>   
                <th>{{$setting->description}}</th>
                <th>{{$setting->value}}</th>
              <th><a class="btn_edit" onclick="showEditSettingForm({{$setting->id}})" ><i class="bx bx-edit"></i></a></th>
            </tr>
              @endforeach
              @endif
            </tbody>
          </table>
        </div>

        <!-- /.box-body -->
      </div>
      <!-- /.box -->
    </div>
    <!-- /.col -->
  </div>
  <!-- /.row -->
  
<!-- Modal -->
<div class="modal fade" id="SettingModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  
  </div>
@endsection
<script>
 function showEditSettingForm(id){
  $.ajax({
        url: "{{url('setting/edit')}}"+"/"+id,
        type: 'get',
        success: function (res) {
          $("#SettingModel").html(res);
          $("#SettingModel").modal();
        }
    });
}
    </script>

