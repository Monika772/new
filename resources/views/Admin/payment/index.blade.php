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
<h1> Payment</h1>
@endsection
@section('content')
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title"> Transaction Management</h3>
         
        </div>
        <div class="box-body employee-table-box">
          <table id="table" class="table table-bordered table-striped">
            <thead>
            <tr>
              <th>S.No</th>
              <th>Gigs<br> Name</th>
              <th>Employer<br>Name</th>
              <th>Candidate</th>
              <th>Amount</th>
              <th>Admin<br> Income</th>
              <th>Candidate<br> Income</th>
              <th>DateTime</th>
              
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
var index_url = "{{url('payment/getData')}}";
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
            return '<a>'+data.gigs.gig_name+'</a><br>('+data.gigs.gigs_id+')';
          }
        },
      
        { data: null,
          render: function(data){
            return data.employer.first_name;
          }
        },
        { data: null,
          render: function(data){
            return data.candidate.first_name;
          }
        },
        { data: null,
          render: function(data){
            return data.currency+data.amount;
          }
        },
        { data: null,
          render: function(data){
            return data.currency+data.admin_income;
          }
        },
        { data: null,
          render: function(data){
            return data.currency+data.candidate_income;
          }
        },
        { data: null,
          render: function(data){
            return data.created_at;
          }
        }
      ]
    });
 });

</script>

@endpush 