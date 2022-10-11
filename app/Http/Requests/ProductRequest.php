<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ProductRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        if(!empty($this->id)){
            return [
                'categories_id'=>'required',
                'sub_categories_id'=>'required',
                'tax_id'=>'required',
                'product_code'=>'required',
                'name_en' => 'required|unique:products,name_en,' . $this->id.',id,status,!active',
                'name_hindi' => 'required|unique:products,name_hindi,' . $this->id.',id,status,!active',
                'description_en'=>'required',
                'description_hindi'=>'required',
                'image'=>"required",
             ];
        }else{
            return [
                'categories_id'=>'required',
                'sub_categories_id'=>'required',
                'tax_id'=>'required',
                'name_en' => 'required|unique:products,name_en,active,status',
                'name_hindi' => 'required|unique:products,name_hindi,active,status',
                'description_en'=>'required',
                'description_hindi'=>'required',
                'image'=>"required",
             ];
        }   
    }
     /**
     * Custom message for validation
     *
     * @return array
     */
    public function messages()
    {
        return [
            'categories_id.required'=>'Please select category',
            'sub_categories_id.required'=>'Please select sub category',
            'tax_id.required'=>'Please select tax category',
            'product_code'=>'Please enter product code',
            'name_en.required'=>'Please enter product name',
            'name_hindi.unique'=>'The product name alreay exist',
            'description_en.required'=>'Please enter  product description',
            'description_hindi.unique'=>'The  product alreay exist',
            'image'=>"Please choose product image",
        ];
    }
}