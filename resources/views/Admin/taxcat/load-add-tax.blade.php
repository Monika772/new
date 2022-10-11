<div class="modal-dialog modal-sm modal-dialog-centered" role="document">
    <form method="POST" action="{{url('taxcat/store')}}" enctype="multipart/form-data" id="addtaxtCategory">
        @csrf
       <div class="modal-content">
            <div class="modal-header text-left">
                <span class="modal-heading">Add Tax Category</span>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <em class="bx bx-x"></em>
                </button>
            </div>
            <div class="modal-body p_15">
                <div class="form-group">
                    <label for="">Name</label>
                    <input type="text" name="name" class="form-control" placeholder="Name">
                </div>
                <div class="form-group">
                    <label for="">Tax</label>
                    <input type="text" name="tax" class="form-control" placeholder="Tax">
                </div>

                
                
            </div>
            <div class="modal-footer text-center">
                <button type="button" data-dismiss="modal" aria-label="Close" class="btn btn-danger btn-close" id="cancelBtn">Cancel</button>
                <button type="button" class="btn btn-primary" id="taxtcategory_save">Save</button>
            </div>
        </div>
        </form> 
    </div>
   
    {!! JsValidator::formRequest('App\Http\Requests\TaxCategoryRequest','#addtaxtCategory') !!}
    <script>
        
     $("#taxtcategory_save").on('click', (function (e) {
           e.preventDefault();
           var frm = $('#addtaxtCategory');
           if (frm.valid()) {
               showButtonLoader('taxtcategory_save', 'Save', 'disable');
               $.ajax({
                   url: "{{url('taxcat/store')}}",
                   type: "POST",
                   data: new FormData(frm[0]),
                   contentType: false,
                   cache: false,
                   processData: false,
                   success: function (response)
                   {
                       showButtonLoader('taxtcategory_save', 'Save', 'enable');
                       if(response.success){
                           toastr.success(response.message);
                           $("#taxtCategoryModel").modal('hide');
                           $('#table').DataTable().ajax.reload();
                       }else{
                           toastr.error(response.message);
                       }
                   },
                   error: function (response) {
                       showButtonLoader('taxtcategory_save', 'Save', 'enable');
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

 