@extends('Website.layouts.app')

@section('title', env('APP_NAME'))


@push('header_styles')

<link href="{{ url('admin/dist/css/jquery.dataTables.min.css') }}" rel="stylesheet">
<link rel="stylesheet" href="{{ url('admin/bower_components/Ionicons/css/ionicons.min.css') }}">
<link rel="stylesheet" href="{{ url('admin/bower_components/datepicker/css/jquery-ui.css') }}">

@endpush

@push('header_script')
@endpush

@section('heading')
<h1> Sub Admin </h1>
@endsection


@section('content')


<div class="row" >
  <div class="col-xs-12">
    <div class="box">
      <div class="box-header">
        <div class="d-flex justify-content-between w-100 align-items-center">
          <h3 class="box-title"> Sub Admin Management</h3>
          <div class="">
            <a class="btn btn-block btn-primary" href="{{url('subadmin/create')}}">Add New + </a>
          </div>
        </div>
      </div>
      <div class="box-body subadmin-table-box">
        <table id="table" class="table table-bordered table-striped">
          <thead>
            <tr>
              <th>Image</th>
              <th>Name</th>
              <th>Email</th>
              <th>Status</th>
              <th>Permissions</th>
              <th>Action</th>
            </tr>
          </thead>
        </table>
      </div>
    </div>
  </div>
</div>





@endsection

@push('footer_styles')
@endpush

@push('footer_script')


<script src="{{ url('admin/dist/js/jquery.dataTables.min.js') }}" defer></script>
<script src="{{ url('admin/bower_components/datepicker/js/jquery-ui.min.js') }}" defer></script>

<script type="text/javascript">
  $('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
    $($.fn.dataTable.tables(true)).DataTable()
      .columns.adjust();
  });

  $(document).ready(function() {

    $('.datatable1').DataTable({
      bFilter: false,
      bLengthChange: false,
      bInfo: false,
      scrollX: true,
    });

  });

  var index_url = "{{url('subadmin/getData')}}";

  $(function() {
    var role_id = "{{Auth()->user()->role_id}}";
    var message = "' Are you sure to delete this Subadmin ?'";
    $('#table').DataTable({
      "targets": [0],
      processing: true,
      serverSide: false,
      scrollX: true,
      responsive: true,
      ajax: index_url,
      columns: [{
          data: null,
          render: function(data) {
            return '<img class="img-circle" src="' + data.profile_image + '" style="width:50px;height:50px;object-fit:contain">';
          }
        },

        {
          data: null,
          render: function(data) {
            return '<a>' + data.full_name + '</a>';
          }
        },

        {
          data: null,
          render: function(data) {
            return '<a>' + data.email + '</a>';
          }
        },
        {
          data: null,
          render: function(data) {
            var checked = '';
            if (data.status == 'active') {
              checked = 'checked';
            }
            return '<label class="cl-switch"><input type="checkbox" ' + checked + '  data-id="' + data.id + '" data-url="{{url("subadmin/status")}}" onclick="updateStatus(this)" id="checkbox' + data.id + '"><span class="switcher"></span><span class="label">Toggle Switch</span></label>';
          }
        },
        {
          data: null,
          render: function(data) {
            return '<a>' + data.role_permission + '</a>';
          }
        },
        {
          data: null,
          render: function(data) {

            var edit_button = '<a class="btn_edit" href="{{url("subadmin/edit")}}/' + data.id + '"><i class="bx bx-edit"></i></a>';
            var delete_button = '';
            if (role_id == '1') {
              delete_button = '<a class="btn_edit" data-id="' + data.id + '" href="javascript:void(0)" data-url="{{url("subadmin/deleted")}}" onclick="deletePopup(this)" id="delete_record"><i class="bx bx-trash"></i></a>';
            }
            return edit_button + delete_button;
          },
          orderable: "false"
        },

      ]
    });
  });
</script>

@endpush