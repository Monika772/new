<div class="modal-dialog modal-sm modal-dialog-centered" role="document">
    <form method="POST" enctype="multipart/form-data" id="editCategory">
        @csrf
       <div class="modal-content">
            <div class="modal-header text-left">
                <span class="modal-heading">View Variant</span>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <em class="bx bx-x"></em>
                </button>
            </div>
            <div class="modal-body p_15">
               
                @foreach($record as $val)
                <div class="form-group">
                    <label for="">Variant Name</label>
                    <input type="text" name="name_hindi" class="form-control" disabled placeholder="Category Name (HI)" value=" {{$val['variant_name']}} ">
                </div>
                <div class="form-group">
                    <label for="">Quantity</label>
                    <input type="text" name="name_hindi" disabled class="form-control" placeholder="Category Name (HI)" value=" {{$val['quantity']}} ">
                </div>
                <div class="form-group">
                    <label for="">Price</label>
                    <input type="text" name="name_hindi" class="form-control" disabled placeholder="Category Name (HI)" value=" {{$val['per_image_price']}} ">
                </div>
                @endforeach
            </div>
        
            <div class="modal-footer text-center">
                <button type="button" data-dismiss="modal" aria-label="Close" class="btn btn-danger btn-close" id="cancelBtn">Cancel</button>
            </div>
        </div>
        </form> 
    </div>
   


 