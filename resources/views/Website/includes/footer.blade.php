 <!-- Footer Start -->
 <div class="container-fluid pt-4 px-4">
                <div class="bg-light rounded-top p-4">
                    <div class="row">
                        <div class="col-12 col-sm-6 text-center text-sm-start">
                            &copy; <a href="#">Your Site Name</a>, All Right Reserved. 
                        </div>
                        <div class="col-12 col-sm-6 text-center text-sm-end">
                            <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                            Designed By <a href="https://htmlcodex.com">HTML Codex</a>
                        </br>
                        Distributed By <a class="border-bottom" href="https://themewagon.com" target="_blank">ThemeWagon</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer End -->
        </div>
        <!-- Content End -->  
        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
       Are You Sure You want to Delete ?
      </div>
      
      <div class="modal-footer">
        <input type="hidden" id="recordID" value="">
        <input type="hidden" id="route" value="">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="CloseModel()">Close</button>
        <button type="button" class="btn btn-primary" id="deleteRecords"  onclick="deleteRecord()">yes</button>
      </div>
    </div>
  </div>
</div>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

            <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script src="{{ url('admin/assetsnew/lib/chart/chart.min.js') }}"></script>
    <script src="{{ url('admin/assetsnew/lib/easing/easing.min.js') }}"></script>
    <script src="{{ url('admin/assetsnew/lib/waypoints/waypoints.min.js') }}"></script>
    <script src="{{ url('admin/assetsnew/lib/owlcarousel/owl.carousel.min.js') }}"></script>
    <script src="{{ url('admin/assetsnew/lib/tempusdominus/js/moment.min.js') }}"></script>
    
    <script src="{{ url('admin/assetsnew/lib/tempusdominus/js/moment-timezone.min.js') }}"></script>
    <script src="{{ url('admin/assetsnew/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js') }}"></script>
    <!-- Template Javascript -->
    <script src="{{URL::TO('public/js/toastr.min.js')}}"></script>

    <script>

function successToaster(message) {
    toastr.remove();
    toastr.options.closeButton = true;
    toastr.success(message, '', {timeOut: 5000});
}
function errorToaster(message) {
    toastr.remove();
    toastr.options.closeButton = true;
    toastr.error(message, '', {timeOut: 5000});
}
function showButtonLoader(id, text, action) {
  if (action === 'disable') {
      $('#' + id).prop('disabled', true);
  } else {
      $('#' + id).html(text);
      $('#' + id).prop('disabled', false);
  }
}
 //only number
 function onlyNumberKey(evt) {
    // Only ASCII charactar in that range allowed
    var ASCIICode = (evt.which) ? evt.which : evt.keyCode
    if (ASCIICode > 31 && (ASCIICode < 48 || ASCIICode > 57))
        return false;
        return true;
  }
function deletePopup(identifier){ 
   $("#recordID").val($(identifier).data('id'));  
  $("#route").val($(identifier).data('url')); 
  $("#exampleModal").modal('show');
}
function deleteRecord(){
  var route = $("#route").val();
  var id = $("#recordID").val();
    showButtonLoader('deleteRecords', 'Delete', 'disable');
    $.ajax({
        url: route+"/"+id,
        type: 'get',
        dataType: 'json',
        success: function (res) {
         showButtonLoader('deleteRecords', 'Delete', 'enable');
          $("#exampleModal").modal('hide');
          if (res.success == false) {
            $("#mesg").html("<span class='alert alert-danger alert-dismissible fade show'><button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button><strong>"+res.message+"</strong></span>");
                // toastr.error(res.message);
            } else {
              $("#mesg").html("<span class='alert alert-success alert-dismissible fade show'><button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button><strong>"+res.message+"</strong></span>");
                // toastr.success(res.message);
                $('#table').DataTable().ajax.reload();
                location.reload();

            }
        }
    });
}
function CloseModel(){
  $("#exampleModal").modal('hide');
}
function hideShowSidemenu(){
  $(".table,.dataTables_scrollHeadInner").css("width", '100%');
  
}
function updateStatus(identifier){ 
  var id = $(identifier).data('id');
  var url = $(identifier).data('url'); 
  var status='';
  if(!$('#'+identifier.id).is(':checked')){
    status='inactive';
  }else{
    status='active';
  }
$.ajax({
        url: url+"/"+id+"/"+status,
        type: 'get',
        dataType: 'json',
        success: function (res) {
          if (res.success == false) {
            $("#mesg").html("<span class='alert alert-success alert-dismissible fade show'><button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button><strong>"+res.message+"</strong></span>");
                //toastr.error(res.message);
            } else {
            $("#mesg").html("<span class='alert alert-success  alert-dismissible fade show'><button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button><strong>"+res.message+"</strong></span>");

                // toastr.success(res.message);
                $('#table').DataTable().ajax.reload();
            }
        }
    });
}

function showButtonLoader(id, text, action) {
            if (action === 'disable') {
                $('#' + id).html('Loading...<i class="fa fa-spinner fa-pulse"></i>');
                $('#' + id).prop('disabled', true);
            } else {
                $('#' + id).html(text);
                $('#' + id).prop('disabled', false);
            }
          }

          function readURL(input) {
          if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
              $('#previewHolder').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
          } else {
            alert('select a file to see preview');
            $('#previewHolder').attr('src', '');
          }
        }

        $("#filePhoto").change(function() {
          readURL(this);
        });
</script>