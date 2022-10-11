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
<h1> Employers </h1>
@endsection

@section('breadcrumb')
<!-- <ol class="breadcrumb">
    <li><a href="{{ url('/employees') }}"><em class="fa fa-dashboard"></em>Dashboard</a></li>
    <li><a href="#"> Employers</a></li>
</ol> -->
@endsection

@section('content')
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title"> Employers Management</h3>
        </div>
        <div class="box-body Employers-table-box">
          <table id="table" class="table table-bordered table-striped">
            <thead>
            <tr>
              <th>S.No</th>
              <th>Image</th>   
              <th>Name</th>
              <th>Phone No</th>
              <th>Address</th>
              <th>Profile Status</th>
              <th>Status</th>
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



@endsection
@push('footer_script')
<script src="{{ url('admin/dist/js/jquery.dataTables.min.js') }}" defer></script>
<script src="{{ url('admin/bower_components/datepicker/js/jquery-ui.min.js') }}" defer></script>

<script type="text/javascript">
var role_id="{{Auth()->user()->role_id}}";
var index_url = "{{url('employers/getData')}}";
$(function() { 
  $('#table').DataTable({
      "targets": [0], 
      processing: true,
      serverSide: false,
      scrollX : true,
      ajax: {
          url: index_url,
          data: function ( d ) {
                 
          },
          type: 'GET',
      },
      columns: [
        {data: 'SrNo',
            render: function (data, type, row, meta) {
                return meta.row + 1;
            }, searchable: false, sortable: false
        },
        { data: null,
          render: function(data){
            return '<img class="img-circle" src="'+data.image_url+'" style="width:50px;height:50px;object-fit:contain">';
          }
        },
        
        { data: null,
          render: function(data){
            return '<a>'+data.full_name+'</a>';
          }
        },
      
        { data: null,
          render: function(data){
            return (data.mobile)?data.mobile:'N/A';
          }
        },
        { data: null,
          render: function(data){
            return (data.address)?data.address:'N/A';
          }
        },
        { data: null,
          render: function(data){
            if(data.profile_status=='login'){
              return 'Signup';
            }else if(data.profile_status=='otp-verify'){
              return 'Completed';
            }
            return '<a>'+data.profile_status+'</a>';
          }
        },
        { data: null,
          render: function(data){
            var checked=disabled_checkbox='';
            if(data.status=='active'){
              checked='checked';
            }
            if(data.profile_status!="otp-verify"){
              disabled_checkbox='disabled';
            }
             return '<label class="cl-switch"><input type="checkbox" '+checked+' '+disabled_checkbox+'  data-id="'+data.id+'" data-url="{{url("employers/status")}}" onclick="updateStatus(this)" id="checkbox'+data.id+'"><span class="switcher"></span></label>';
          }
        },
        { data: null,
          render: function(data){
            var show_button = ' <a class="btn_edit" href="{{url("employers/show")}}/'+data.id+'"><i class="fa fa-eye" aria-hidden="true"></i></a>';
          var delete_button='';
          if(role_id=='1'){
            delete_button = '<a class="btn_edit" data-id="'+data.id+'" href="javascript:void(0)" data-url="{{url("employers/deleted")}}" onclick="deletePopup(this)" id="delete_record" title="Delete Employer"><i class="bx bx-trash" style="color:red"></i></a>';
          }
          var chat_button=''
          if(data.profile_status=="otp-verify"){
             chat_button = ' <a class="btn_edit" href="{{url("common/chat")}}/'+data.id+'"><i class="fa fa-comment" aria-hidden="true"></i></a>';
            }
          return show_button + delete_button + chat_button ;
          },  orderable: "false"
        },
      ]
    });
 });

</script>

@endpush 