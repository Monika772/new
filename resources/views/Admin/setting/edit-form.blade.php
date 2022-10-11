<div class="modal-dialog modal-sm modal-dialog-centered" role="document">
    <form method="POST" action="{{url('settings/update')}}"  id="setting" enctype="multipart/form-data">
        @csrf
       <div class="modal-content">
           
            <div class="modal-header text-left">
                <span class="modal-heading">Setting</span>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <em class="bx bx-x"></em>
                </button>
            </div>
           <div class="modal-body p_15">
                    <div class="form-group">
                        <label for="">Description</label>
                        <input type="text" name="name" class="form-control" value="{{$setting->description}}" readonly disabled>
                     </div>
                   <div class="form-group">
                        <label for="">value</label>
                        <input type="hidden" name="id" class="form-control" value="{{$setting->id}}">
                        <input type="text" name="value" class="form-control" value="{{$setting->value}}">
                     </div>
            </div>
        
            <div class="modal-footer text-center">
                <button type="button" data-dismiss="modal" aria-label="Close" class="btn btn-danger btn-close" id="cancelBtn">Cancel</button>
                <button type="button" class="btn btn-primary" id="setting_save">Update</button>
            </div>
        </div>
        </form> 
    </div>
   
    {!! JsValidator::formRequest('App\Http\Requests\SettingRequest','#setting') !!}
    <script>
        
     $("#setting_save").on('click', (function (e) {
           e.preventDefault();
           var frm = $('#setting');
           if (frm.valid()) {
               showButtonLoader('setting_save', 'Save', 'disable');
               $.ajax({
                   url: "{{url('settings/update')}}",
                   type: "POST",
                   data: new FormData(frm[0]),
                   contentType: false,
                   cache: false,
                   processData: false,
                   success: function (response)
                   {
                       showButtonLoader('setting_save', 'Save', 'enable');
                       if(response.success){
                           toastr.success(response.message);
                           location.reload();
                      }else{
                           toastr.error(response.message);
                       }
                   },
                   error: function (response) {setting_save
                       showButtonLoader('category_save', 'Save', 'enable');
                       (response.message)?toastr.error(response.message, 'Team'):'';
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

 