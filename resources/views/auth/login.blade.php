<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>{{env('APP_NAME')}} | Log in</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
    <!-- Font Awesome -->
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <!-- Libraries Stylesheet -->
    <link href="{{ url('admin/assetsnew/lib/owlcarousel/assets/owl.carousel.min.css') }}" rel="stylesheet">
    <link href="{{ url('admin/assetsnew/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css') }}" rel="stylesheet" />
    
    <!-- Customized Bootstrap Stylesheet -->
    
    <link href="{{ url('admin/assetsnew/css/bootstrap.min.css') }}" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="{{ url('admin/assetsnew/css/style.css') }}" rel="stylesheet">
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet"> -->
    
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- iCheck -->
    <!-- <script type="text/javascript" src="{{ asset('vendor/proengsoft/laravel-jsvalidation/public/js/jsvalidation.js')}}"></script> -->
    <!-- <script src="admin/plugins/iCheck/icheck.min.js"></script> -->
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- Google Font -->
    <!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"> -->
</head>


<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Sign In Start -->
        <div class="container-fluid">
            <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                    <div class="bg-light rounded p-4 p-sm-5 my-4 mx-3" style="background-color:#f5f2f2ad !important;">
                    @include('Website.flash-message')
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <a href="{{ route('login') }}" class="">
                                <img src="{{ url('admin/assetsnew/logo/logo.jpg') }}" alt="" width="270px" height="60px">
                                <!-- <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>Surakshakadi</h3> -->
                            </a>
                            <!-- <h3>Sign In</h3> -->
                        </div>
                        <form method="POST" action="{{ route('login') }}" id="login_form">
                        @csrf
                        <div class="form-floating mb-3">
                            <input type="text" name="username" id="floatingInput" class="form-control form-control-solid h-auto py-6 px-6 rounded-lg" placeholder="name@example.com">
                            <!-- <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com"> -->
                            <label for="floatingInput">Email address</label>
                        </div>
                        <div class="form-floating mb-4">
                        <input type="password" name="password" id="floatingPassword" class="form-control form-control-solid h-auto py-6 px-6 rounded-lg" placeholder="Password">
                            <!-- <input type="password" class="form-control" id="floatingPassword" placeholder="Password"> -->
                            <label for="floatingPassword">Password</label>
                        </div>
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <!-- <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">Check me out</label>
                            </div> -->
                            <a style="cursor:pointer" href="{{url('forgotPassword')}}" > Forgot Password?</a>
                        </div>
                            <button type="submit" id="kt_login_signin_submit" class="btn btn-primary font-weight-bolder font-size-h6 my-3 mr-3">Sign In</button>
                    </form>
                        {!! JsValidator::formRequest('App\Http\Requests\LoginRequest','#login_form') !!}
                    </div>
                </div>
            </div>
        </div>
        <!-- Sign In End -->
    </div>
    <div class="modal fade" id="forgotPasswordPopup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
            <div class="form-group has-feedback">
                <label class="font-size-h6 font-weight-bolder text-dark">Email</label>
                <input type="text" name="email" class="form-control form-control-solid h-auto py-6 px-6 rounded-lg" placeholder="Email">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
            </div>
        </div>
    </div>
    <!-- Modal -->  
    
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script src="{{ url('admin/assetsnew/lib/chart/chart.min.js') }}"></script>
    
    <script src="{{ url('admin/assetsnew/lib/easing/easing.min.js') }}"></script>
    
    <script src="{{ url('admin/assetsnew/lib/waypoints/waypoints.min.js') }}"></script>
    
    <script src="{{ url('admin/assetsnew/lib/owlcarousel/owl.carousel.min.js') }}"></script>
    
    <script src="{{ url('admin/assetsnew/lib/tempusdominus/js/moment.min.js') }}"></script>
    
    <script src="{{url('admin/assetsnew/lib/tempusdominus/js/moment-timezone.min.js')}}"></script>
    
    <script src="{{ url('admin/assetsnew/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js') }}"></script>

    <!-- Template Javascript -->
    
    <script src="{{ url('admin/assetsnew/js/main.js') }}"></script>
    <script>
        function showForgotPasswordPopup(){
           $("#forgotPasswordPopup").modal();
        }
    $(function() {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' /* optional */
        });
    });
    </script>
</body>

</html>