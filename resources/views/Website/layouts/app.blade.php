<!DOCTYPE html>

<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <title>@yield('title', 'Surakshakadi')</title>

  <meta name="description" content="@yield('meta_description', 'Gigrr')">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <link href="{{ url('admin/assetsnew/logo/logo.jpg') }}" rel="icon" sizes="32x32">
  <link rel="icon" type="image/jpg" href="{{ url('admin/assetsnew/logo/logo.jpg') }}" sizes="16x16" />
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  
  <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    <!-- Icon Font Stylesheet -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

  <link href="{{ url('admin/assetsnew/lib/owlcarousel/assets/owl.carousel.min.css') }}" rel="stylesheet">
  <link href="{{ url('admin/assetsnew/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css') }}" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    
    <link href="{{ url('admin/assetsnew/css/bootstrap.min.css') }}" rel="stylesheet">
    
    <!-- Template Stylesheet -->
    <link href="{{ url('admin/assetsnew/css/style.css') }}" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="{{URL::TO('public/css/toastr.min.css')}}">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

  @include('Website.includes.header')

  @include('Website.includes.sidebar')


  
      @include('Website.flash-message')
      @yield('content')

  @include('Website.includes.footer')

  
<!-- REQUIRED JS SCRIPTS -->
<!-- jQuery 3 -->

  <script type="text/javascript">
    setTimeout(function() {
      $('#myalert').fadeOut('fast');
    }, 5000); // <-- time in milliseconds
  </script>

  <script src="{{ url('admin/bower_components/jquery/dist/jquery.min.js') }}"></script>
  <script src="{{ url('admin/bower_components/bootstrap/dist/js/bootstrap.min.js') }}"></script>
  <script src="{{ url('admin/dist/js/adminlte.min.js') }}"></script>
  <script src="{{ url('admin/dist/js/swiper-bundle.min.js') }}"></script>
  <script src="{{URL::TO('public/js/toastr.min.js')}}"></script>
  <script type="text/javascript" src="{{ asset('vendor/proengsoft/laravel-jsvalidation/public/js/jsvalidation.js')}}"></script>
  <script src="{{URL::TO('public/js/bootstrap-select.min.js')}}"></script>




    <script>
     $(document).ready(function(){

     $('#search_chat').keyup(function(e){
     if(e.keyCode == 8)
       var name=$(this).val();
        get_search_list(name);
     })


     $("#search_chat").on('keypress',function(){
     var name=$(this).val();
        get_search_list(name);
     })
     })

    //Swiper Slider Js start
     var swiper = new Swiper(".mySwiper", {
            autoplay: {
                delay: 2500,
                disableOnInteraction: false,
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },

            breakpoints: {
                640: {
                    slidesPerView: 2,
                    spaceBetween: 20,
                },
                768: {
                    slidesPerView: 2,
                    spaceBetween: 20,
                },
                1024: {
                    slidesPerView: 3,
                    spaceBetween: 20,
                },
            },
        });
      //Swiper Slider Js End




    </script>

  @stack('footer_styles')
  @stack('footer_script')

