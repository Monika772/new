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
<h1>Products Management</h1>
@endsection
@section('breadcrumb')
<!--code comment by jyoti <ol class="breadcrumb">
    <li><a href="{{ url('/home') }}"><i class="fa fa-dashboard"></i>Dashboard</a></li>
    <li><a href="#"> Category</a></li>
</ol> -->
@endsection

@section('content')
<div class="row">
  <div class="col-xs-12">
    <div class="box">
      <div class="box-header">
        <div class="d-flex justify-content-between w-100 align-items-center">
          <h3 class="box-title">Product</h3>
          <div>
            <a class="btn btn-block btn-primary" href="{{url('products/create')}}">Add New + </a>
          </div>
        </div>
      </div>


      <div class="box-body">
        <table id="table" class="table table-bordered table-striped">
          <thead>
            <tr>
              <th>S.No</th>
              <th>Category</th>
              <th>SubCategory</th>
              <th>Name (EN)</th>
              <th>Name (HI)</th>
              <th>Tax Category</th>
              <th>Variant</th>
              <th>Image</th>
              <th>status</th>
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
  <div class="modal fade" id="ProductModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">

  </div>
  @endsection
  @push('footer_script')
  <script src="{{ url('admin/dist/js/jquery.dataTables.min.js') }}" defer></script>
  <script src="{{ url('admin/bower_components/datepicker/js/jquery-ui.min.js') }}" defer></script>
  <script type="text/javascript">
    var index_url = "{{url('product/getData')}}";

    function ShowAddProductForm() {
      $.ajax({
        url: "{{url('taxcat/create')}}",
        type: 'get',
        success: function(res) {
          $("#ProductModel").html(res);
          $("#ProductModel").modal();
        }
      });
    }
    function ShowVariantForm(id) {
      $.ajax({
        url: "{{url('product/show')}}" + "/" + id,
        type: 'get',
        success: function(res) {
          $("#ProductModel").html(res);
          $("#ProductModel").modal();
        }
      });
    }
    function ShowEditProductForm(id) {
      $.ajax({
        url: "{{url('taxcat/edit')}}" + "/" + id,
        type: 'get',
        success: function(res) {
          console.log(res);
          $("#ProductModel").html(res);
          $("#ProductModel").modal();
        }
      });
    }
    $(function() {
      var role_id = "{{Auth()->user()->role_id}}";
      $('#table').DataTable({
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
              return '<a>' + data.category.name_en + '('+data.category.name_hindi+')'+'</a>';
            }
          },
          {
            data: null,
            render: function(data) {
              return '<a>' + data.subcategory.name_en +'('+data.subcategory.name_hindi+')'+'</a>';
            }
          },
          {
            data: null,
            render: function(data) {
              return '<a>' + data.name_en + '</a>';
            }
          },
          // {
          //   data: null,
          //   render: function(data) {
          //     return '<a>' + data.sub_categories_id + '</a>';
          //   }
          // },
          {
            data: null,
            render: function(data) {
              return '<a>' + data.name_hindi + '</a>';
            }
          },//tax_id
          {
            data: null,
            render: function(data) {

              if(data.taxcategory.name=='GST'){
                return '<a>' + data.taxcategory.name + ' %0</a>';
              }else{
                return '<a>' + data.taxcategory.name + '</a>';
              }

            }
          },
          {
            data: null,
            render: function(data) {
              return '<a class="btn_edit" data-toggle="modal" onclick="ShowVariantForm(' + data.id + ')"><a style="color:blue;" href="javascript:void(0)">'+data.total_variants+'</a></a>';
            }
          },
          {
            data: null,
            render: function(data) {
              return '<img src='+data.image.image_url+' widht="50" height="50" />';
            }
          },
          {
            data: null,
            render: function(data) {
              var checked = '';
              if (data.status == 'active') {
                checked = 'checked';
              }
              return '<label class="cl-switch"><input type="checkbox" '+ checked+' data-id="' + data.id + '" data-url="{{url("product/status")}}" onclick="updateStatus(this)" id="checkbox' + data.id + '"><span class="switcher"></span><span class="label">Toggle Switch</span></label>';
            }
          },  
          {
            data: null,
            render: function(data) {
              var edit_button = '<a class="btn_edit" href="products/edit/'+ data.id +'"><i class="bx bx-edit"></i></a>';
              var delete_button = '';
              if (role_id == '1') {
                delete_button = '<a class="btn_edit" data-id="' + data.id + '" href="javascript:void(0)" data-url="{{url("product/deleted")}}" onclick="deletePopup(this)" id="delete_record"><i class="bx bx-trash" style="color:red !important"></i></a>';
              }
              return  edit_button + delete_button;
            },
            orderable: "false"
          },

        ]
      });
    });
  </script>

  @endpush