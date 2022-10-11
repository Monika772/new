@extends('Website.layouts.app')

@section('title', env('APP_NAME'))

@section('heading')
<h1> Employer Details</h1>
@endsection

@section('breadcrumb')
<ol class="breadcrumb">
    <li><a href="{{ url('/home') }}"><em class="fa fa-dashboard"></em>Dashboard</a></li>
    <li><a href="#">Employer</a></li>
</ol>
@endsection

@section('content')
<div class="row">
  <div class="col-xs-12">
    <div class="box">
      <div class="box-header">
        <div class="d-flex justify-content-between w-100 align-items-center">
          <h3 class="box-title"> Created At : {{$employers['created_at']}}</h3>
          <div class="">
            <div class="rigth-side-head">
              <h4> <span><strong>Status : - </strong> {{ucfirst($employers['status'])}}</span></h3>
            </div>
          </div>
        </div>
      </div>
      <div class="box-body">
        <!---map--->
        <div class="location-box mb-2">
        <div style="width: 100%">
           <iframe width="100%" height="300px" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?q={{$employers->latitude}},{{$employers->longitude}}&z=10&output=embed"></iframe>
            </div>
        </div>

        <!---location---->
        <div class="location-box mb-2">
          <div class="d-flex">
            <div class="location-head">
              <h4 class="gray-text">Location</h4>
            </div>
            <div class="location-details">
              <hr>
              <ul>
                <li class="d-flex"><i class="bx bx-map" style="color:#00b24d"></i>{{$employers['address']}}</li>
                
              </ul>
            </div>
          </div>
        </div>
     
        <div class="customer-box-details mb-2">
          <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-12">
              <div class="customer-box">
                <h4 class="gray-text mb-2">Employeer Details</h4>
                <div class="d-flex mb-1">
                  <div class="col-3">Name</div>
                  <div class="col-7">{{$employers['full_name']}}</div>
                </div>
                <div class="d-flex mb-1">
                  <div class="col-3">Email Address</div>
                  <div class="col-7">{{($employers['email'])?$employers['email']:"N/A"}}</div>
                </div>
                <div class="d-flex mb-1">
                  <div class="col-3">Phone Number</div>
                  <div class="col-7">{{$employers['phone_number']}}</div>
                </div>
               
              </div>
            </div>
           
        </div>

     
 
        <div class="customer-box-details mb-2">
          <div class="row">
            <div class="col-md-12 col-sm-12">
              <h4 class="gray-text mb-2">Employeer Details</h4>
            </div>
            <div class="box-body gigs-table-box gigr-table-box">
          <table id="table" class="table table-bordered table-striped ">
            <thead>
            <tr>
              <th>S.No</th>   
              <th>Business Name</th>
              <th>Business Address</th>
              <th>Category</th>
           </tr>
            </thead>
            <tbody>
              @if(isset($employers['employersBusiness']) && !empty($employers['employersBusiness']) && count($employers['employersBusiness'])>0)
              @php $i=1; @endphp
              @foreach($employers['employersBusiness'] as $business)
              <tr>
                <td>{{$i}}</td>   
                <td>{{ucfirst($business['business_name'])}}</td>
                <td>{{$business['business_address']}}</td>
                <td>{{$business['category']['name']}}</td>
             </tr>
             @php $i++; @endphp
             @endforeach
             @endif
          </table>
        </div>
        
      </div>
    </div>
        
        <div class="customer-box-details mb-2">
          <div class="row">
            <div class="col-md-12 col-sm-12">
              <h4 class="gray-text mb-2">Gigs Details</h4>
            </div>
            <div class="box-body gigs-table-box gigr-table-box">
          <table id="table" class="table table-bordered table-striped ">
            <thead>
            <tr>
              <th>S.No</th>   
              <th>Name</th>
              <th>Address</th>
              <th>Start DateTime</th>
              <th>End DateTime</th>
              <th>Amount</th>
              <th>Status</th>
            </tr>
            </thead>
            <tbody>
              @if(isset($employers['gigs']) && !empty($employers['gigs']) && count($employers['gigs'])>0)
              @php $i=1; @endphp
              @foreach($employers['gigs'] as $gigs)
              <tr>
                <td>{{$i}}</td>   
                <td>{{ucfirst($gigs['gig_name'])}}</td>
                <td>{{$gigs['gig_address']}}</td>
                <td>{{$gigs['gigs_start_date']." ".$gigs['gigs_starttime']}}</td>
                <td>{{$gigs['gigs_end_date']." ".$gigs['gigs_endtime']}}</td>
                <td>{{$gigs['from_amount']." - ".$gigs['to_amount']}}</td>
                <td>{{ucfirst($gigs['status'])}}</td>
             </tr>
             @php $i++; @endphp
             @endforeach
             @endif
          </table>
        </div>
        
      </div>
    </div>


         <!---Item Image---->
         @if(isset($employers['BusinessImages']) && !empty($employers['BusinessImages']))
         <div class="customer-box-details">
          <div class="row">
            <div class="col-md-12 col-sm-12">
              <h4 class="gray-text mb-2">Business Images</h4>
            </div>
           
          </div>
          <div class="Item_image">
              <div class="d-flex row flex-wrap">
                @foreach($employers['BusinessImages'] as $images)
                  <div class="item-img-box"> 
                    <div class="p-2">
                      <img src="{{$images->image}}" alt="">
                    </div>
                  </div>
                  @endforeach
              </div>
            </div>
        </div>
        @endif
    
       
     
      </div>
    </div>
  </div>
</div>
@endsection

@push('footer_script')

@endpush