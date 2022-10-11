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
<h1> Chat</h1>
@endsection


@section('content')
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title"> Chat Management</h3>
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

@endpush 