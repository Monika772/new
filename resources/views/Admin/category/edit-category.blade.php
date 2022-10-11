<div class="modal-dialog modal-sm modal-dialog-centered" role="document">
    <form method="POST" action="{{url('category/store')}}" enctype="multipart/form-data" id="editCategory">
        @csrf
       <div class="modal-content">
            <div class="modal-header text-left">
                <span class="modal-heading">Edit Category</span>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <em class="bx bx-x"></em>
                </button>
            </div>
            <div class="modal-body p_15">
                <div class="form-group">
                    <label for="">Category Name (EN)</label>
                    <input type="hidden" name="id" value="{{$record->id}}">
                    <input type="text" name="name_en" class="form-control" placeholder="Category Name (EN)" value="{{$record->name_en}}" aria-describedby="category_name-error">
                    <span id="name_en-error" class="invalid-feedback"></span>
                </div>
                <div class="form-group">
                    <label for="">Category Name (HI)</label>
                    <input type="text" name="name_hindi" class="form-control" placeholder="Category Name (HI)" value=" {{$record->name_hindi}} ">
                    <span id="name_hindi-error" class="invalid-feedback"></span>
                </div>
                <div class="form-group">
                    <label for="">Category File</label>
                    <input id="image" type="file" name="image" class="form-control" onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0])" required="required">
                    <!-- <input type="file" name="image" class="form-control" placeholder=""> -->
                </div>
                <div class="form-group">
                    <img id="blah" src="{{ url($record->image_url) }}" width="50" height="50" alt="">
                </div>
            </div>
        
            <div class="modal-footer text-center">
                <button type="button" data-dismiss="modal" aria-label="Close" class="btn btn-danger btn-close" id="cancelBtn">Cancel</button>
                <button type="button" class="btn btn-primary" id="category_save">Update</button>
            </div>
        </div>
        </form> 
    </div>
   
    {!! JsValidator::formRequest('App\Http\Requests\CategoryRequest','#addCategory') !!}
    <script>
        
     $("#category_save").on('click', (function (e) {
           e.preventDefault();
           var frm = $('#editCategory');
           if (frm.valid()) {
               showButtonLoader('category_save', 'Save', 'disable');
               $.ajax({
                   url: "{{url('category/update')}}",
                   type: "POST",
                   data: new FormData(frm[0]),
                   contentType: false,
                   cache: false,
                   processData: false,
                   success: function (response)
                   {
                       showButtonLoader('category_save', 'Save', 'enable');
                       if(response.success){
                           toastr.success(response.message);
                           $("#CategoryModel").modal('hide');
                           $('#table').DataTable().ajax.reload();
                       }else{
                           toastr.error(response.message);
                       }
                   },
                   error: function (response) {
                       showButtonLoader('category_save', 'Save', 'enable');
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

 