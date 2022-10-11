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
<h1> FAQ </h1>
@endsection


@section('content')
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <div class="d-flex justify-content-between w-100 align-items-center">
          <h3 class="box-title"> FAQ</h3>
          <div>
            <a class="btn btn-block btn-primary" href="{{url('faq/create')}}">Add New + </a>
          </div>
         </div>
         </div>
    

        <div class="box-body faq-table-box">
         <table id="table" class="table table-bordered table-striped">
            <thead>
            <tr>
              <th>S.No</th>   
              <!-- <th>Role</th> -->
              <th>Question</th>
              <!-- <th>Status</th> -->
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
<script src="{{ url('admin/bower_components/jquery/dist/jquery.min.js') }}"></script>
<script src="{{ url('admin/dist/js/jquery.dataTables.min.js') }}" defer></script>
<script src="{{ url('admin/bower_components/datepicker/js/jquery-ui.min.js') }}" defer></script>

<script type="text/javascript">
var index_url = "{{url('faq/getData')}}";

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
        // { data: null,
        //   render: function(data){
        //     return '<a>'+data.user_role+'</a>';
        //   }
        // },
        { data: null,
          render: function(data){
            return '<a>'+data.title_en+'</a>';
          }
        },
        // { data: null,
        //   render: function(data){
        //     var checked='';
        //     if(data.status=='active'){
        //       checked='checked';
        //     }
        //      return '<label class="cl-switch"><input type="checkbox" '+checked+'  data-id="'+data.id+'" data-url="{{url("faq/status")}}" onclick="updateStatus(this)" id="checkbox'+data.id+'"><span class="switcher"></span><span class="label">Toggle Switch</span></label>';
        //   }
        // },
        { data: null,
          render: function(data){
            var edit_button = "<a class='btn_edit' href='{{ url("/faq/edit/") }}/"+data.id+"' ><i class='bx bx-edit'></i></a>";
            var delete_button = '<a class="btn_edit" data-id="'+data.id+'" href="javascript:void(0)" data-url="{{url("faq/deleted")}}" onclick="deletePopup(this)" id="delete_record"><i class="bx bx-trash" style="color:red"></i></a>';
            return edit_button + delete_button;
          }, orderable: "false"
        },
        
      ]
    });
 });

 
</script>

@endpush