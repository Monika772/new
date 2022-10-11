@extends('Website.layouts.app')
@section('title', env('APP_NAME'))
@push('header_styles')
<link href="{{ url('admin/dist/css/jquery.dataTables.min.css') }}" rel="stylesheet">
<link rel="stylesheet" href="{{ url('admin/bower_components/Ionicons/css/ionicons.min.css') }}">
<link rel="stylesheet" href="{{ url('admin/bower_components/datepicker/css/jquery-ui.css') }}">
<link rel="stylesheet" href="{{ url('admin/dist/css/sweetalert.css') }}">
<script src="{{ url('admin/dist/js/sweetalert.js') }}"></script>
@endpush
@push('header_script')
@endpush
@section('heading')
<h1>Banners</h1>
@endsection
@section('breadcrumb')
code comment by jyoti <ol class="breadcrumb">
    <li><a href="{{ url('/home') }}"><i class="fa fa-dashboard"></i>Dashboard</a></li>
    <li><a href="#"> Banners</a></li>
</ol>
@endsection

@section('content')
<div class="row">
  <div class="col-xs-12">
    <div class="box">
      <div class="box-header">
        <div class="d-flex justify-content-between w-100 align-items-center">
          <h3 class="box-title">Banners</h3>
          <div>
            <a class="btn btn-block btn-primary" onclick="ShowAddCategoryForm()">Add New + </a>
          </div>
        </div>
      </div>


      <div class="box-body">
        <table id="table1" class="table table-bordered table-striped">
          <thead>
            <tr>
              <th>S.No</th>
              <th>Image</th>
              <th>Action</th>
            </tr>
          </thead>
        </table>
      </div>
      <!-- /.box -->
    </div>
    <!-- /.col -->
  </div>
  <!-- /.row -->
  <!-- Modal -->
  <div class="modal fade" id="BannerModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">

  </div>
  @endsection
  @push('footer_script')

  
  <script src="{{ url('admin/dist/js/jquery.dataTables.min.js') }}" defer></script>
  <script src="{{ url('admin/bower_components/datepicker/js/jquery-ui.min.js') }}" defer></script>
  <script type="text/javascript">
    var index_url = "{{url('banners/getData')}}";

    function ShowAddCategoryForm() {
      $.ajax({
        url: "{{url('banners/create')}}",
        type: 'get',
        success: function(res) {
          $("#BannerModel").html(res);
          $("#BannerModel").modal();
        }
      });
    }

    
    $(function() {
      var role_id = "{{Auth()->user()->role_id}}";
      $('#table1').DataTable({
        "targets": [0],
        processing: true,
        serverSide: false,
        scrollX: true,
        responsive: true,
        ajax: index_url,
        columns: [
          {
            data: 'SrNo',
            render: function(data, type, row, meta) {
              return meta.row + 1;
            },
            searchable: false,
            sortable: false
          },
          {
            data: null,
            render: function(data) {
              return '<img src='+data.image_url+' widht="150" height="100" />';
            }
          },
          
          {
            data: null,
            render: function(data) {
              var delete_button = '<a class="btn_edit" data-id="' + data.id + '" href="javascript:void(0)" data-url="{{url("banners/deleted")}}" onclick="deletePopup(this)" id="delete_record"><i class="bx bx-trash" style="color:red"></i></a>';
              return  delete_button;
            },
            orderable: "false"
          },

        ]
      });
    });
  </script>

  @endpush