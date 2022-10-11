<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AddSubcategoryRequest extends FormRequest
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
        if(!empty($this->id))
         {
          return [
              'category_id'=>'required',
              'name' =>'required|unique:subcategory,name,' . $this->id,
          ];
         }else{
          return [
            'name' => 'required|string',
            'category_id'=>'required',
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
            'image.required'=>'Category Image is required',
            'name.required'=>'Category Name is required',
            'category_id.required'=>'Please select category',
         ];
    }
}
