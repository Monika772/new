@extends('Website.layouts.app')
@section('title', env('APP_NAME'))
@push('header_styles')
<link  href="{{ url('admin/dist/css/jquery.dataTables.min.css') }}" rel="stylesheet">
<link rel="stylesheet" href="{{ url('admin/bower_components/Ionicons/css/ionicons.min.css') }}">
<link rel="stylesheet" href="{{ url('admin/bower_components/datepicker/css/jquery-ui.css') }}">
<link rel="stylesheet" href="{{ url('admin/dist/css/sweetalert.css') }}">
<script src="{{ url('admin/dist/js/sweetalert.js') }}"></script>
@endpush   
@section('heading')
<h1> CMS </h1>
@endsection
@section('breadcrumb')
<!-- comment by jyoti <ol class="breadcrumb">
    <li><a href="{{ url('/home') }}"><i class="fa fa-dashboard"></i>Dashboard</a></li>
    <li><a href="#"> CMS</a></li>
</ol> -->
@endsection

@section('content')
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title"> CMS</h3>
         </div>
    

        <div class="box-body">
         <table id="table" class="table table-bordered table-striped">
            <thead>
            <tr>
              <th>S.No</th>   
              <th>Title (English)</th>
              <th>Title (Hindi)</th>
              <th>Updated At</th>
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

@endsection
@push('footer_script')
<script src="{{ url('admin/dist/js/jquery.dataTables.min.js') }}" defer></script>
<script src="{{ url('admin/bower_components/datepicker/js/jquery-ui.min.js') }}" defer></script>
<script type="text/javascript">
var index_url = "{{url('cms/getData')}}";

$(function() { 
  $('#table').DataTable({
      "targets": [0], 
      processing: true,
      serverSide: false,
      scrollX : true,
      responsive: true,
      ajax: index_url,
      columns: [
        {data: 'SrNo',
            render: function (data, type, row, meta) {
                return meta.row + 1;
            }, searchable: false, sortable: false
        },
        { data: null,
          render: function(data){
            return '<a>'+data.title_en+'</a>';
          }, searchable: false, sortable: false
        },
        { data: null,
          render: function(data){
            return '<a>'+data.title_hindi+'</a>';
          }, searchable: false, sortable: false
        },
        { data: null,
          render: function(data){
            return '<a>'+data.updated_at+'</a>';
          }
        },
        { data: null,
          render: function(data){
            var edit_button = "<a class='btn_edit' href='{{ url("/cms/edit/") }}/"+data.id+"' ><i class='bx bx-edit'></i></a>";
           
            return edit_button;
          }, orderable: "false"
        },
        
      ]
    });
 });

 
</script>

@endpush