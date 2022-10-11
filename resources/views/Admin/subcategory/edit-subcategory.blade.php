<div class="modal-dialog modal-sm modal-dialog-centered" role="document">
<form method="POST" action="{{url('subcategory/store')}}" enctype="multipart/form-data" id="editSubCat">
        @csrf
        <div class="modal-content">
            <div class="modal-header text-left">
                <span class="modal-heading">Edit Sub Category</span>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <em class="bx bx-x"></em>
                </button>
            </div>
            <div class="modal-body p_15">
            <div class="form-group">
                <label for="">Parent Category</label>
                    <select class="form-control" name="categories_id">
                        <option value="0">Select Parent Categroy</option>
                        @if(isset($record_category))
                            @foreach($record_category as $value)
                            <option {{ isset($record->categories_id) &&  $record->categories_id==$value->id ? 'selected' :'' }} value="{{ $value->id }}">{{ $value->name_en }}</option>
                            @endforeach
                        @endif
                    </select>
                </div>
                <div class="form-group">
                    <label for="">Sub Category Name (EN)</label>
                    <input type="hidden" name="id" value="{{$record->id}}">
                    <input type="text" name="name_en" class="form-control" placeholder="Sub Category Name" value="{{$record->name_en}}">
                </div>
                 <div class="form-group">
                    <label for="">Sub Category Name (HI)</label>
                    <input type="text" name="name_hindi" class="form-control" placeholder="Sub Category Name" value="{{$record->name_hindi}}">
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
                <button type="button" class="btn btn-primary" id="subcat_save">Update</button>
            </div>
        </div>
</form>
</div>
{!! JsValidator::formRequest('App\Http\Requests\SubCategoryRequest','#addSubCat') !!}
<script>
        
     $("#subcat_save").on('click', (function (e) {
           e.preventDefault();
           var frm = $('#editSubCat');
           if (frm.valid()) {
               showButtonLoader('subcat_save', 'Save', 'disable');
               $.ajax({
                   url: "{{url('subcategory/update')}}",
                   type: "POST",
                   data: new FormData(frm[0]),
                   contentType: false,
                   cache: false,
                   processData: false,
                   success: function (response)
                   {
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