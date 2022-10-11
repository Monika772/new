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
<h1>User <small>Controlling</small></h1>
@endsection

@section('content')
<div class="container-fluid pt-4 px-4">
  <div class="row g-4">
  <div class="col-12">
      <div class="bg-light rounded h-100 p-4">
        <div id="mesg" style="text-align: center;"></div>
          <h6 class="mb-4">Responsive Table</h6>
              <div class="table-responsive">
                  <table class="table" id="table">
                    <thead>
                        <tr>
                          <th scope="col">S.No</th>
                          <th scope="col">Name</th>
                          <th scope="col">Email</th>
                          <th scope="col">Phone No</th>
                          <th scope="col">Status</th>
                          <th scope="col">Register Date</th>
                          <th scope="col">Action</th>
                        </tr>
                      </thead>
                    </table>
                </div>
            </div>
        </div>
  </div>
</div>
@endsection

@push('footer_script')


<script src="{{ url('admin/dist/js/jquery.dataTables.min.js') }}" defer></script>
<script src="{{ url('admin/bower_components/datepicker/js/jquery-ui.min.js') }}" defer></script>

<script type="text/javascript">

var index_url = "{{url('users/getData')}}";

$(function() {
      var role_id = "{{Auth()->user()->role_id}}";
      $('#table').DataTable({
        "targets": [0],
        processing: true,
        serverSide: false,
        scrollX: true,
        responsive: true,
        paging: true,
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
              return '<a>' + data.name + '</a>';
            }
          },
          {
            data: null,
            render: function(data) {
              return '<a>' + data.email + '</a>';
            }
          },//tax_id
          {
            data: null,
            render: function(data) {
              return '<a>' + data.mobile + '</a>';
            }
          },
          {
            data: null,
            render: function(data) {
              var checked = '';
              if (data.status == 'active') {
                checked = 'checked';
              }
              return '<div class="form-check form-switch"><label class="form-check-label" for="flexSwitchCheckDefault" style="margin-bottom: 17px;"><input class="form-check-input" type="checkbox" role="switch" '+ checked+' data-id="' + data.id + '" data-url="{{url("users/status")}}" onclick="updateStatus(this)" id="checkbox' + data.id + '"><span class="switcher"></span><span class="label"></span></label></div>';
            }
          },
          {
            data: null,
            render: function(data) {
              return '<a>' + data.created_at + '</a>';
            }
          },  
          {
           
            data: null,
            render: function(data) {
              return delete_button = '<a class="btn_edit" data-id="' + data.id + '" href="javascript:void(0)" data-url="{{url("users/deleted")}}" onclick="deletePopup(this)" id="delete_record"><i class="fa fa-trash" aria-hidden="true" style="color: red;"></i></a>';
            },
            orderable: "false"
          },

        ]
      });
    });//<a class="btn_edit" data-id="' + data.id + '" href="javascript:void(0)" data-url="{{url("users/deleted")}}" onclick="deletePopup(this)" id="delete_record"><i class="bx bx-trash" style="color:red !important"></i></a>
</script>


@endpush 