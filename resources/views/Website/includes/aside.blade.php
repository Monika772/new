<!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-comments-o"></i></a></li>
     <!--  <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li> -->
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane active" id="control-sidebar-home-tab">
        <!-- <h3 class="control-sidebar-heading">Recent Activity</h3> -->
        <input type="text" name="search_chat" id="search_chat"  style="color: black;">
         <ul class="control-sidebar-menu" id="all_chat_users" style="padding: 7px;border-bottom: 1px solid red;">

        </ul>
        
        <ul class="control-sidebar-menu" id="all_users">

        </ul>
        <ul class="control-sidebar-menu">
          <li>
            <a href="{{ url('/chat/all') }}">
              <h4 class="control-sidebar-subheading" style="text-align:center">
                View all
              </h4>
            </a>
        </ul>
      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
   </div>
  </aside>
  <!-- /.control-sidebar -->
