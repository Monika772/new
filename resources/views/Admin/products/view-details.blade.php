@extends('Website.layouts.app')

@section('title', env('APP_NAME'))

@section('heading')
<h1> Employee Details</h1>
@endsection

@section('breadcrumb')
<ol class="breadcrumb">
    <li><a href="{{ url('/home') }}"><em class="fa fa-dashboard"></em>Dashboard</a></li>
    <li><a href="#">Employee</a></li>
</ol>
@endsection

@section('content')
<div class="row">
  <div class="col-xs-12">
    <div class="box">
      <div class="box-header">
        <div class="d-flex justify-content-between w-100 align-items-center">
          <h3 class="box-title"> Created At : {{$employee['created_at']}}</h3>
          <div class="">
            <div class="rigth-side-head">
              <h4> <span><strong>Status : - </strong> {{ucfirst($employee['status'])}}</span></h3>
            </div>
          </div>
        </div>
      </div>
      <div class="box-body">
        <!---map--->
        <div class="location-box mb-2">
        <div style="width: 100%">
           <iframe width="100%" height="300px" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?q={{$employee->latitude}},{{$employee->longitude}}&z=10&output=embed"></iframe>
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
                <li class="d-flex"><i class="bx bx-map" style="color:#00b24d"></i>{{$employee['address']}}</li>
                
              </ul>
            </div>
          </div>
        </div>
        <!---Diver and customer details---->
        <div class="customer-box-details mb-2">
          <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-12">
              <div class="customer-box">
                <h4 class="gray-text mb-2">Employee Details</h4>
                <div class="d-flex mb-1">
                  <div class="col-3">Name</div>
                  <div class="col-7">{{$employee['full_name']}}</div>
                </div>
                <div class="d-flex mb-1">
                  <div class="col-3">Email Address</div>
                  <div class="col-7">{{($employee['email'])?$employee['email']:"N/A"}}</div>
                </div>
                <div class="d-flex mb-1">
                  <div class="col-3">Phone Number</div>
                  <div class="col-7">{{$employee['phone_number']}}</div>
                </div>
                <div class="d-flex mb-1">
                  <div class="col-3">DOB</div>
                  <div class="col-7">{{$employee['dob']}}</div>
                </div>
                <div class="d-flex mb-1">
                  <div class="col-3">Availibility</div>
                  <div class="col-7">{{ucfirst($employee['employeeProfile']['availibility'])}}</div>
                </div>
              </div>
            </div>
         
            <div class="col-lg-4 col-md-6 col-sm-12">

              <div class="customer-box">
                <h4 class="gray-text mb-2">Personal Details</h4>
                <div class="d-flex mb-1">
                  <div class="col-3">Aadhar Number</div>
                  <div class="col-7">{{isset($employee['employeeProfile']['aadhar_number'])?$employee['employeeProfile']['aadhar_number']:"N/A"}}</div>
                </div>
                <div class="d-flex mb-1">
                  <div class="col-3">Gender</div>
                  <div class="col-7">{{ucfirst($employee['gender'])}}</div>
                </div>
                <div class="d-flex mb-1">
                  <div class="col-3">Experience</div>
                  <div class="col-7">
                  {{isset($employee['employeeProfile']['experience'])?$employee['employeeProfile']['experience']:"N/A"}}
                  </div>
                </div>  
                  <div class="d-flex mb-1">
                    <div class="col-3">Price Criteria</div>
                    <div class="col-7">({{$employee['employeeProfile']['price_from']}} - {{$employee['employeeProfile']['price_to']}})/{{$employee['employeeProfile']['price_criteria']}}</div>
                  </div>
                  <div class="d-flex mb-1">
                    <div class="col-3">Shift</div>
                    <div class="col-7">{{ucfirst($employee['employeeProfile']['shift'])}}</div>
                  </div>
              </div>

            </div>
            <div class="col-lg-4 col-md-6 col-sm-12">

              <div class="customer-box">
                <h4 class="gray-text mb-2">Bank Account Details</h4>
                <div class="d-flex mb-1">
                  <div class="col-3">Bank Name</div>
                  <div class="col-7">{{isset($employee['employeeProfile']['bank']['bank_name'])?$employee['employeeProfile']['bank']['bank_name']:"N/A"}}</div>
                </div>
                <div class="d-flex mb-1">
                  <div class="col-3">Account Type</div>
                  <div class="col-7">{{isset($employee['employeeProfile']['bank']['account_type'])?$employee['employeeProfile']['bank']['account_type']:"N/A"}}</div>
                </div>
                <div class="d-flex mb-1">
                  <div class="col-3">Account Number</div>
                  <div class="col-7">{{isset($employee['employeeProfile']['bank']['account_number'])?$employee['employeeProfile']['bank']['account_number']:"N/A"}}</div>
                </div>
                <div class="d-flex mb-1">
                  <div class="col-3">IFSC Code</div>
                  <div class="col-7">
                  {{isset($employee['employeeProfile']['bank']['ifsc_code'])?$employee['employeeProfile']['bank']['ifsc_code']:"N/A"}}
                  </div>
                </div>  
                  <div class="d-flex mb-1">
                    <div class="col-3">A/C Holder Name</div>
                    <div class="col-7">{{isset($employee['employeeProfile']['bank']['account_holder_name'])?$employee['employeeProfile']['bank']['account_holder_name']:"N/A"}}</div>
                  </div>
             
              </div>

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
              <th>Gig's Name</th>
              <th>Employer Name</th>
              <th>Gigs Address</th>
              <th>Offer Price</th>
             <th>Status</th>
            </tr>
            </thead>
            <tbody>
              @if(isset($employee['gigsRequest']) && !empty($employee['gigsRequest']) && count($employee['gigsRequest'])>0)
              @php $i=1; @endphp
              @foreach($employee['gigsRequest'] as $gig_request)
              <tr>
                <td>{{$i}}</td>   
                <td>{{$gig_request['gigs']['gig_name']}}</td>
                <td>{{$gig_request['gigs']['employer']['first_name']}}</td>
                <td>{{$gig_request['gigs']['gig_address']}}</td>
                <td>{{$gig_request['offer_amount']}}/{{$gig_request['gigs']['price_criteria']}}</td>
                <td>{{$gig_request['status']}}</td>
             </tr>
             @php $i++; @endphp
             @endforeach
             @endif
          </table>
        </div>
        
      </div>
    </div>


         <!---Item Image---->
         @if(isset($employee['employeeProfile']['employeeImages']) && !empty($gigs['employeeProfile']['employeeImages']))
         <div class="customer-box-details">
          <div class="row">
            <div class="col-md-12 col-sm-12">
              <h4 class="gray-text mb-2">Candidates Images</h4>
            </div>
           
          </div>
          <div class="Item_image">
              <div class="d-flex row flex-wrap">
                @foreach($employee['employeeProfile']['employeeImages'] as $images)
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
    
         <div class="customer-box-details">
          <div class="row">
            <div class="col-md-12 col-sm-12">
              <h4 class="gray-text mb-2">Image</h4>
            </div>
          </div>
          <div class="Item_image">
              <div class="d-flex row flex-wrap">
             
                 @if(!empty($employee['employeeProfile']['aadhar_front_image']))
                  <div class="item-img-box"> 
                    <div class="p-2">
                      <img src="{{$employee['employeeProfile']['aadhar_front_image_url']}}" alt="">
                    </div>
                  </div>
                  @endif
                  @if(!empty($employee['employeeProfile']['aadhar_back_image']))
                  <div class="item-img-box"> 
                    <div class="p-2">
                      <img src="{{$employee['employeeProfile']['aadhar_back_image_url']}}" alt="">
                    </div>
                  </div>
                  @endif
              
              </div>
            </div>
        </div>
     
      </div>
    </div>
  </div>
</div>
@endsection

@push('footer_script')

@endpush