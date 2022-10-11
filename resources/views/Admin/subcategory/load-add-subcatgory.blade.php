<div class="modal-dialog modal-sm modal-dialog-centered" role="document">
    <form method="POST" action="{{url('subcategory/store')}}" enctype="multipart/form-data" id="addSubcat">
        @csrf
       <div class="modal-content">
            <div class="modal-header text-left">
                <span class="modal-heading">Add Sub Category</span>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <em class="bx bx-x"></em>
                </button>
            </div>
            <div class="modal-body p_15">
            <div class="form-group">
            <label for="">Parent Category</label>
                <select class="form-control" name="categories_id">
                    <option value="">Select Parent Categroy</option>
                    @if(isset($record))
                        @foreach($record as $value)
                        <option value="{{ $value->id }}">{{ $value->name_en }}</option>
                        @endforeach
                    @endif
                </select>
                    <!-- <label for="">Sub Category Name (EN)</label>
                    <input type="text" name="name_en" class="form-control" placeholder="Sub Category Name"> -->
                </div>
                <div class="form-group">
                    <label for="">Sub Category Name (EN)</label>
                    <input type="text" name="name_en" class="form-control" placeholder="Sub Category Name">
                </div>
                 <div class="form-group">
                    <label for="">Sub Category Name (HI)</label>
                    <input type="text" name="name_hindi" class="form-control" placeholder="Sub Category Name">
                </div>
                
                <div class="form-group">
                    <label for="">Image</label>
                    <input id="image" type="file" name="image" class="form-control" onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0]);$('#blah').css('display','block');" required="required">

                    <!-- <input type="file" name="image" class="form-control" placeholder=""> -->
                </div>
                <div class="form-group">
                    <img id="blah" width="50" height="50" style="display:none;"/>
                </div>
            </div>
            <div class="modal-footer text-center">
                <button type="button" data-dismiss="modal" aria-label="Close" class="btn btn-danger btn-close" id="cancelBtn">Cancel</button>
                <button type="button" class="btn btn-primary" id="subcat_save">Save</button>
            </div>
        </div>
        </form> 
    </div>
   
    {!! JsValidator::formRequest('App\Http\Requests\SubCategoryRequest','#addSubcat') !!}
    <script>
        
     $("#subcat_save").on('click', (function (e) {
           e.preventDefault();
           var frm = $('#addSubcat');
           if (frm.valid()) {
               showButtonLoader('subcat_save', 'Save', 'disable');
               $.ajax({
                   url: "{{url('subcategory/store')}}",
                   type: "POST",
                   data: new FormData(frm[0]),
                   contentType: false,
                   cache: false,
                   processData: false,
                   success: function (response)
                   {
                    console.log(response);
                       showButtonLoader('subcat_save', 'Save', 'enable');
                       if(response.success){
                           toastr.success(response.message);
                           $("#SubCatModel").modal('hide');
                           $('#table').DataTable().ajax.reload();
                       }else{
                           toastr.error(response.message);
                       }
                   },
                   error: function (response) {
                       showButtonLoader('subcat_save', 'Save', 'enable');
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

 