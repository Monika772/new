<div class="modal-dialog modal-sm modal-dialog-centered" role="document">
    <form method="POST" action="{{url('category/store')}}" enctype="multipart/form-data" id="addbanner">
        @csrf
       <div class="modal-content">
            <div class="modal-header text-left">
                <span class="modal-heading">Add Banner</span>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <em class="bx bx-x"></em>
                </button>
            </div>
            <div class="modal-body p_15">
                <div class="form-group">
                    <label for="">Image</label>
                    <input id="image" type="file" name="image" class="form-control" onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0]);$('#blah').css('display','block');" required="required">
                </div>
                <div class="form-group">
                    <img id="blah" width="50" height="50" style="display:none;"/>
                </div>
            </div>
            <div class="modal-footer text-center">
                <button type="button" data-dismiss="modal" aria-label="Close" class="btn btn-danger btn-close" id="cancelBtn">Cancel</button>
                <button type="button" class="btn btn-primary" id="banner_save">Save</button>
            </div>
        </div>
        </form> 
    </div>
   
    {!! JsValidator::formRequest('App\Http\Requests\BannerRequest','#addbanner') !!}
    <script>
        
     $("#banner_save").on('click', (function (e) {
           e.preventDefault();
           var frm = $('#addbanner');
           if (frm.valid()) {
               showButtonLoader('banner_save', 'Save', 'disable');
               $.ajax({
                   url: "{{url('banners/store')}}",
                   type: "POST",
                   data: new FormData(frm[0]),
                   contentType: false,
                   cache: false,
                   processData: false,
                   success: function (response)
                   {
                       showButtonLoader('banner_save', 'Save', 'enable');
                       if(response.success){
                           toastr.success(response.message);
                           $("#BannerModel").modal('hide');
                           $('#table').DataTable().ajax.reload();
                           location.reload();
                       }else{
                           toastr.error(response.message);
                       }
                   },
                   error: function (response) {
                       showButtonLoader('banner_save', 'Save', 'enable');
                       (response.message)?toastr.error(response.message, 'Category'):'';
                       $(".invalid-feedback").text('');
                       $(".invalid-feedback").css('display','block');
                       var errors = $.parseJSON(response.responseText);
                        $.each(errors.errors, function (key, val) {
                          $("#" + key + "-error").text(val);
                        });
                   },
               });
           }
       }));
       </script>

 