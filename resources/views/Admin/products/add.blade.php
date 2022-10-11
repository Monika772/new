@extends('Website.layouts.app')
@section('title', 'Products Management')
@push('header_styles')
<style type="text/css">
    .invalid-feedback{color:red;}
    .Distributor-add-box {
    max-width: 100%;
    padding: 0 20px;
    padding-bottom: 20px;
}
.Distributor-add-box h3.box-title {
    text-align: center;
    padding: 20px 0;
}
input.form-control, textarea#address {
    border-radius: 5px;
}
.Distributor-add-box h3.box-title {
    padding: 20px 0;
    border-bottom: 1px solid #eee;
    margin-bottom: 22px;
    padding-top: 0;
    text-align: left;
    font-size: 18px;
}
</style>
@endpush  
@section('heading')
<h1>Products <small>Management</small></h1>
@endsection

@section('breadcrumb')
<ol class="breadcrumb">
    <li><a href="{{ url('/home') }}"><i class="fa fa-dashboard"></i>Dashboard</a></li>
    <li><a href="{{ url('/products') }}">Products </a></li>
    <li><a href="#">Add Product </a></li>
</ol>
@endsection
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
@section('content')
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
      <div class="box-header">
        <div class="d-flex justify-content-between w-100 align-items-center">
          <h3 class="box-title"> Add New Products</h3>
          <div>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                        Add Variant
            </button>
          </div>
        </div>
      </div>
         
        
        <!-- /.box-header -->
        
        <!-- /.box-header -->
        <div class="">
      
          <div class="Distributor-add-box">
            <form method="POST" action="{{url('product/store')}}" enctype="multipart/form-data" id="add-product">
              @csrf
              <div class="row">
                  <div class="col-md-4">
                  <label for="">Categories</label> <span style="color:red"> *</span>
                    <select  class="form-control"  name="categories_id" onchange="SubCatgeory(this.value);">
                      <option value="">Select Categories</option>
                      @if(isset($category))
                        @foreach($category as $value)
                        <option value="{{ $value->id }}">{{ $value->name_en }} ({{ $value->name_hindi }})</option>
                        @endforeach
                      @endif
                    </select>
                      <div class="col-md-3">
                      <span id="categories_id-error" class="invalid-feedback"></span>
                      </div>
                  </div>
                  <div id="subcategory">
                  </div>
                 <div class="col-md-4">
                      <label for="">Tax Id</label> <span style="color:red"> *</span>
                      <select  class="form-control"  name="tax_id" aria-describedby="tax_id-error">
                      <option value="">Select Tax Categories</option>
                      @if(isset($taxcategories))
                        @foreach($taxcategories as $value)
                        <option value="{{ $value->id }}">{{ $value->name }}</option>
                        @endforeach
                      @endif
                    </select>
                    <span id="tax_id-error" class="invalid-feedback"></span>
                  </div>
                  <div class="col-md-4">
                    <div class="form-group">
                      <label for="">Product Code</label> <span style="color:red"> *</span>
                      <input type="text" value="{{ old('product_code') }}" name="product_code" class="form-control" placeholder="Product Code"  aria-describedby="product_code-error">
                      <span id="product_code-error" class="invalid-feedback"></span>
                    </div>
                  </div>
                  <div class="col-md-4">
                    <div class="form-group">
                      <label for="">Name (EN)</label>
                      <input type="text" value="{{ old('name_en') }}" name="name_en" class="form-control" placeholder="Name (EN)" aria-describedby="name_en-error">
                      <span id="name_en-error" class="invalid-feedback"></span>
                    </div>
                  </div>
                  <div class="col-md-4">
                    <div class="form-group">
                      <label for="">Name (HI)</label> <span style="color:red"> *</span>
                      <input type="text" value="{{ old('name_hindi') }}" name="name_hindi" class="form-control" placeholder="Name (HI)" aria-describedby="name_hindi-error">
                      <span id="name_hindi-error" class="invalid-feedback"></span>
                    </div>
                  </div>
                 <div class="col-md-4">
                    <div class="form-group">
                      <label for="">Product Image</label>
                      <input id="image" type="file" name="image" class="form-control image-upload">
                    </div>
                     
                  </div>
                  <div class="col-md-4">
                    <div class="form-group">
                      <img id="blah" width="100" height="100" style="display:none;"/>
                    </div>
                 </div>
                  <div class="form-group col-md-12">
                    <div class="form-group">
                      <label for="">Description (HI)</label> <span style="color:red"> *</span>
                      <textarea  value="{{ old('description_hindi') }}" id="description_hindi" name="description_hindi" class="form-control" placeholder="Description (HI)"></textarea>
                    </div>
                  </div>
                  <div class="form-group col-md-12">
                    <div class="form-group">
                      <label for="">Description (en)</label> <span style="color:red"> *</span>
                      <textarea  value="{{ old('description_en') }}" id="description_en" name="description_en" class="form-control" placeholder="Description (en)"></textarea>
                    </div>
                  </div>
              </div>
                  <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header text-left">
                  <span class="modal-heading">Add Variant</span>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <em class="bx bx-x"></em>
                  </button>
               </div>
                  <div class="modal-body p_15 row">
                    <div id="variant" class="">
                    <div class="form-group col-md-5">
                          <label for="">Variant Name</label>
                          <input type="text" name="variant_name[]" class="form-control" placeholder="Variant Name">
                      </div>
                      <div class="form-group col-md-3">
                          <label for="">Qaunatiy</label>
                          <input type="text" name="quantity[]" class="form-control" placeholder="Qaunatiy">
                      </div>
                      <div class="form-group col-md-3">
                          <label for="">Per Imge Price</label>
                          <input type="text" name="unit_price[]"  class="form-control" placeholder="Per Imge Price">
                      </div>
                      <div class="form-group col-md-1">
                          <label for=""></label>
                          <a href="javascript:plus()"><i class="fa fa-plus"></i></a>
                      </div>
                    </div>
                    <div class="form-group">
                        <img id="blah" width="50" height="50" style="display:none;"/>
                    </div>
                </div>
                <div class="modal-footer text-center">
                    <!-- <button type="button" data-dismiss="modal" aria-label="Close" class="btn btn-danger cancelbtn btn-close" id="cancelBtn">Cancel</button> -->
                    <button type="button" class="btn btn-danger" id="variant_save">Cancel</button>
                </div>
              </div>
            </div>
          </div>
            <input type="hidden" name="varaint_count" id="varaint_count" value="0">
                <div class="button-sec">
                  <a class="btn btn-danger btn-close" href="{{URL::previous()}}">Cancel</a>
                  <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>  
            {!! JsValidator::formRequest('App\Http\Requests\ProductRequest','#add-product') !!}
            </div>
           
        </div>

      </div>
    </div>
        <!-- /.box-body -->
      </div>
      <!-- /.box -->
    </div>
    <!-- /.col -->
  </div>
  <!-- /.row -->



<script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>

<script>
   var description_hindi =  CKEDITOR.replace( 'description_hindi' );
   var description_en =  CKEDITOR.replace( 'description_en' );
</script>       
<script>
  function SubCatgeory(value){
    $.ajax({
      url: "{{url('products/subcategory')}}" + "/" + value,
      type: 'get',
      success: function(res) {
        $("#subcategory").html(res.data);
      }
    });
  }
  var maxField = 3;
  var x = 1; 
  function plus(){
      var data = '<div class="data_'+x+'"><div class="form-group col-md-5">';
        data+=            '<label for="">Variant Name</label>';
        data+=            '<input type="text" name="variant_name[]" id="variant_name" class="form-control" placeholder="Variant Name">';
        data+=        '</div>';
        data+=        '<div class="form-group col-md-3">';
        data+=            '<label for="">Qaunatiy</label>';
        data+=            '<input type="text" name="quantity[]" class="form-control" placeholder="Qaunatiy">';
        data+=        '</div>';
        data+=        '<div class="form-group col-md-3">';
        data+=            '<label for="">Per Imge Price</label>';
        data+=            '<input type="text" name="unit_price[]" class="form-control" placeholder="Per Imge Price">';
        data+=        '</div>';
        data+=        '<div class="form-group col-md-1">';
        data+=            '<label for=""></label>';
        data+=            '<a href="javascript:minus();" class="remove_button"><i class="fa fa-minus"></i></a>';
        data+=        '</div></div>';
        if(x < maxField){ 
            x++; //Increment field counter
            $("#varaint_count").val(x);
           $("#variant").append(data);

        }
  }

  function minus(){
    x--;
    console.log(x);
    $(".data_"+x).remove();
  }
$(document).ready(function () {

  $('#image').on('change', function () {
    var output = document.getElementById('blah');
    output.src = URL.createObjectURL(event.target.files[0]);
    output.onload = function() {
      URL.revokeObjectURL(output.src)
      $('#blah').css('display','block');
    }
  });

  $('#variant_save').on('click', function () {
   $("input[name='variant_name[]']").val('');
   $("input[name='quantity[]']").val('');
   $("input[name='unit_price[]']").val('');
   $("#exampleModal").css("display","none");
   $("#exampleModal").addClass("in");
   $(".modal-backdrop").remove();
  });
  
});

 
</script>
@endsection
