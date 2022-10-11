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
<h1> Notifications</h1>
@endsection


@section('content')
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title"> Notifications Management</h3>
         
        </div>
        <div class="box-body employee-table-box">
          <table id="table" class="table table-bordered table-striped">
            <thead>
            <tr>
              <th>S.No</th>   
              <th>Message</th>
              <th>Created At</th>
              
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
var index_url = "{{url('notification/getData')}}";
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
            return data.message;
          }
        },
        { data: null,
          render: function(data){
            return data.created_at
          }
        },
      ]
    });
 });

</script>

@endpush 