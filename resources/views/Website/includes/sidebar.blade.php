<!-- sidebar: style can be found in sidebar.less -->
  
@php  $seg1=Request::segment(1);  @endphp
@php  $seg2=Request::segment(2);   @endphp
<section class="sidebar">
  
  <?php $permissions = CommonHelper::getLoginUserPermissions(); ?>

       <!-- Sidebar Start -->
       <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-light navbar-light">
                <a href="{{url('home')}}" class="navbar-brand mx-4 mb-3">
                <img src="{{ url('admin/assetsnew/logo/logo.jpg') }}" alt="" width="160px" height="50px">

                    <!-- <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>DASHMIN</h3> -->
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                    <img class="rounded-circle" src="storage/app/{{Auth()->user()->profile_image}}" width="50px" height="50px" class="img-circle ml-2" alt="User Image">

                        <!-- <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;"> -->
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">
                        <h6 class="mb-0">{{Auth()->user()->name}}</h6>
                        <span>Admin</span>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                    <a href="{{url('home')}}" class="nav-item nav-link <?php if( $seg1=='home'){ echo 'active'; } ?>"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                    <div class="nav-item dropdown <?php if( $seg1=='users'){ echo 'active'; } ?>">
                        <a href="#" class="nav-link dropdown-toggle <?php if( $seg1=='users'){ echo 'active'; } ?>" data-bs-toggle="dropdown"><i class="fa fa-users me-2"></i>Users</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="{{ url('users') }}" class="dropdown-item">Users</a>
                        </div>
                    </div>
                    <a href="widget.html" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Widgets</a>
                    <!-- <a href="form.html" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>Forms</a>
                    <a href="table.html" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Tables</a>
                    <a href="chart.html" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>Charts</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Pages</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="signin.html" class="dropdown-item">Sign In</a>
                            <a href="signup.html" class="dropdown-item">Sign Up</a>
                            <a href="404.html" class="dropdown-item">404 Error</a>
                            <a href="blank.html" class="dropdown-item">Blank Page</a>
                        </div>
                    </div> -->
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->
    </section>
