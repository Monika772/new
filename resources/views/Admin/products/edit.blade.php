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
    <li><a href="#">Edit Product </a></li>
</ol>
@endsection

@section('content')
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
       
         
        
        <!-- /.box-header -->
        
        <!-- /.box-header -->
        <div class="">

            <div class="Distributor-add-box">
                 <h3 class="box-title">Edit New Product </h3>
            <form method="POST" action="{{url('products/update')}}" enctype="multipart/form-data" id="add-product">
              @csrf
              <input type="hidden" value="{{ $products->id }}"  name="id" class="form-control">

              <div class="row">
                  <div class="col-md-3">
                      <!-- <div class="form-group"> -->
                        <label for="">Categories</label> <span style="color:red"> *</span>
                        <select  class="form-control"  name="categories_id">
                          <option value="0">Select Categories</option>
                          @if(isset($category))
                            @foreach($category as $value)
                            <option value="{{ $value->id }}" {{ isset($products->categories_id) && $products->categories_id == $value->id ? 'selected' : ''}} >{{ $value->name_en }} ({{ $value->name_hindi }})</option>
                            @endforeach
                          @endif
                        </select>
                        <!-- <input type="text" value="{{ $products->categories_id }}"  name="categories_id" class="form-control" placeholder="categories_id"> -->
                    <!-- </div> -->
                  </div>
                  <div class="col-md-3">
                    <!-- <div class="form-group"> -->
                        <label for="">SubCategories</label> <span style="color:red"> *</span>
                        <select  class="form-control"  name="sub_categories_id">
                          <option value="0">Select sub_categories_id</option>
                          @if(isset($sub_cat))
                            @foreach($sub_cat as $value)
                            <option value="{{ $value->id }}" {{ isset($products->sub_categories_id) && $products->sub_categories_id == $value->id ? 'selected' : ''}} >{{ $value->name_en }} ({{ $value->name_hindi }})</option>
                            @endforeach
                          @endif
                        </select>
                        <!-- <input type="text" value="{{ $products->sub_categories_id }}" name="sub_categories_id" class="form-control" placeholder="sub_categories_id"> -->
                    <!-- </div> -->
                  </div>
                  <div class="col-md-3">
                    
                      <label for="">Tax Id</label> <span style="color:red"> *</span>
                      <select  class="form-control"  name="tax_id">
                      <option value="">Select Tax Categories</option>
                      @if(isset($taxcategories))
                        @foreach($taxcategories as $value)
                        <option value="{{ $value->id }}" {{ isset($value->id) && $value->id==$products->tax_id ? 'selected' : '' }} >{{ $value->name }}</option>
                        @endforeach
                      @endif
                    </select>
                      <!-- <textarea  value="{{ old('tax_id') }}" required id="tax_id" name="tax_id" class="form-control" placeholder="Tax Id"></textarea> -->
                   
                  </div>
                  <div class="col-md-3">
                    <div class="form-group">
                      <label for="">Name (EN)</label>
                      <input type="text" value="{{ $products->name_en }}" name="name_en" class="form-control" placeholder="name_en">
                    </div>
                  </div>
                  <div class="col-md-2">
                    <div class="form-group ">
                      <label for="">Name (HI)</label> <span style="color:red"> *</span>
                      <input type="text" value="{{ $products->name_hindi }}" name="name_hindi" class="form-control" placeholder="name_hindi">
                    </div>
                  </div>
                  <div class="col-md-2">
                    <div class="form-group">
                      <label for="">Product Code</label> <span style="color:red"> *</span>
                      <textarea  value="{{ $products->product_code }}" id="product_code" name="product_code" class="form-control" placeholder="product_code">{{ $products->product_code }}</textarea>
                    </div>
                  </div>
                  <!-- <div class="col-md-4">
                    <div class="form-group">
                      <label for="">Tax Id</label> <span style="color:red"> *</span>
                      <textarea  value="{{ $products->tax_id }}" required id="tax_id" name="tax_id" class="form-control" placeholder="tax_id">{{ $products->tax_id }}</textarea>
                    </div>
                  </div> -->
                  <div class="col-md-2">
                    <div class="form-group">
                      <label for="">Description (HI)</label> <span style="color:red"> *</span>
                      <textarea  value="{{ $products->description_hindi }}" id="description_hindi" name="description_hindi" class="form-control" placeholder="description_hindi">{{ $products->description_hindi }}</textarea>
                    </div>
                  </div>
                  <div class="col-md-3">
                    <div class="form-group">
                      <label for="">Description (EN)</label> <span style="color:red"> *</span>
                      <textarea  value="{{ $products->description_en }}" id="description_en" name="description_en" class="form-control" placeholder="description_en">{{ $products->description_en }}</textarea>
                    </div>
                  </div>
                  <div class="col-md-3">
                    <div class="form-group">
                      <label for="">Product Image</label>
                      <input id="image" type="file" name="image" class="form-control image-upload">
                    </div>
                      <img id="blah" src="{{ url($products->image->image_url) }}" width="50" height="50"/>
                  </div>
              </div>
               <div class="button-sec">
                  <a class="btn btn-danger btn-close" href="{{URL::previous()}}">Cancel</a>
                  <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>  
            {!! JsValidator::formRequest('App\Http\Requests\ProductRequest','#add-product') !!}

            </div>
            <script src="{{URL::TO('public/js/jquery.min.js')}}"></script>
           
        </div>

        <!-- /.box-body -->
      </div>
      <!-- /.box -->
    </div>
    <!-- /.col -->
  </div>
  <!-- /.row -->
@endsection
<script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
<script
      src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
      crossorigin="anonymous"
    ></script>  
<script>
  CKEDITOR.replace( 'description_en' );
  $(document).ready(function () {

$('#image').on('change', function () {
  var output = document.getElementById('blah');
  output.src = URL.createObjectURL(event.target.files[0]);
  output.onload = function() {
    URL.revokeObjectURL(output.src)
    $('#blah').css('display','block');
  }
});

});

</script>