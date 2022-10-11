@extends('Website.layouts.app')
@section('title', 'Profile')
@push('header_styles')
<style type="text/css">
    .invalid-feedback {
        color: red;
    }
</style>
@endpush
@section('heading')
<h1>Edit Profile</h1>
@endsection

@section('breadcrumb')
<!--comment by jyoti <ol class="breadcrumb">
    <li><a href="{{ url('/home') }}"><i class="fa fa-dashboard"></i>Dashboard</a></li>
    <li><a href="#">Profile</a></li>
</ol> -->
@endsection

@section('content')

<div id="msg"></div>
 <!-- Form Start -->
 <div class="container-fluid pt-4 px-4">
    <div class="row g-4">
                    <div class="col-sm-12 col-xl-6">
                        <div class="bg-light rounded h-100 p-4">
                            <h6 class="mb-4">Edit Profile</h6>
                            <form method="POST" action="{{url('profile/update')}}" id="profile-form" enctype="multipart/form-data">
                                @csrf
                                <div class="mb-3">
                                    <img  id="profile_image" src="storage/app/{{Auth()->user()->profile_image}}" width="100px" height="100px" class="img-circle ml-2" alt="User Image">
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Profile</label>
                                    <input type="file" class="form-control" name="profile_image" accept="image/*" onchange="previewImage(event)">
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <!-- <input type="email" class="form-control" id="exampleInputEmail1"
                                        aria-describedby="emailHelp"> -->
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Name</label>
                                    <input type="text" name="first_name" value="{{ $user_record->name }}" class="form-control" placeholder="Name">
                                    <!-- <input type="password" class="form-control" id="exampleInputPassword1"> -->
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Email</label>
                                    <input type="text" name="email" value="{{ $user_record->email }}" class="form-control" placeholder="Email">
                                    <!-- <input type="text" name="first_name" value="{{ $user_record->name }}" class="form-control" placeholder="Name"> -->
                                    <!-- <input type="password" class="form-control" id="exampleInputPassword1"> -->
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Phone Number</label>
                                    <input type="text" name="mobile" value="{{ $user_record->mobile }}" class="form-control" placeholder="Phone Number">
                                    <!-- <input type="text" name="email" value="{{ $user_record->email }}" class="form-control" placeholder="Email"> -->
                                    <!-- <input type="text" name="first_name" value="{{ $user_record->name }}" class="form-control" placeholder="Name"> -->
                                    <!-- <input type="password" class="form-control" id="exampleInputPassword1"> -->
                                </div>
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                            <script src="{{URL::TO('public/js/jquery.min.js')}}"></script>
                            {!! JsValidator::formRequest('App\Http\Requests\ProfileRequest','#profile-form') !!}
                        </div>
                    </div>
                    <div class="col-sm-12 col-xl-6">
                        <div class="bg-light rounded h-100 p-4">
                            <h6 class="mb-4">Reset Password</h6>
                            <form method="POST" action="{{url('profile/reset_password')}}" id="reset-password">
                                @csrf
                                <div class="row mb-3">
                                    <label for="inputEmail3" class="col-sm-2 col-form-label">Old Password</label>
                                    <div class="col-sm-10">
                                        <input type="password" name="old_password" class="form-control" placeholder="Old Password">
                                        <!-- <input type="email" class="form-control" id="inputEmail3"> -->
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="inputPassword3" class="col-sm-2 col-form-label">New Password</label>
                                    <div class="col-sm-10">
                                    <input type="password" name="new_password" id="new_password" class="form-control" placeholder="New Password">
                                        <!-- <input type="password" class="form-control" id="inputPassword3"> -->
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="inputPassword3" class="col-sm-2 col-form-label">Conform Password</label>
                                    <div class="col-sm-10">
                                    <input type="password" name="conform_password" id="conform_password" class="form-control" placeholder="Conform Password">
                                    <!-- <input type="password" name="new_password" id="new_password" class="form-control" placeholder="New Password"> -->
                                    <!-- <input type="password" class="form-control" id="inputPassword3"> -->
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                            {!! JsValidator::formRequest('App\Http\Requests\ChangePasswordRequest','#reset-password') !!}
                        </div>
                    </div>
    </div>
</div>
            <!-- Form End -->



@endsection

@push('footer_styles')
@endpush

@push('footer_script')
<script>
    const previewImage = e => {
        const preview = document.getElementById('profile_image');
        preview.src = URL.createObjectURL(e.target.files[0]);
        preview.onload = () => URL.revokeObjectURL(preview.src);
    };
</script>


<script type="text/javascript">
    $('#state_id').change(function() {
        var stateID = $(this).val();
        if (stateID) {
            $.ajax({
                type: "GET",
                url: "{{url('api/get_city_list')}}/" + stateID,
                success: function(res) {
                    if (res) {
                        $("#city_id").empty();
                        $.each(res, function(id, city_name) {
                            $("#city_id").append('<option value="' + id + '">' + city_name + '</option>');
                        });

                    } else {
                        $("#city_id").empty();
                    }
                }
            });
        } else {
            $("#city_id").empty();
        }
    });
</script>



@endpush