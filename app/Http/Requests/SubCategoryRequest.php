<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class SubCategoryRequest extends FormRequest
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
                'name_en' => 'required|unique:sub_categories,name_en,' . $this->id.',id,status,!0',
                'name_hindi' => 'required|unique:sub_categories,name_hindi,' . $this->id.',id,status,!0',
             ];
        }else{
            return [
                'categories_id'=>'required',
                'name_en' => 'required|unique:sub_categories,name_en,0,status',
                'name_hindi' => 'required|unique:sub_categories,name_hindi,0,status',
                'image'=>'required',
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
            'name_en.required'=>'Please enter sub category name',
            'name_hindi.unique'=>'The Category name alreay exist',
            'description_en.required'=>'Please enter sub category description',
            'description_hindi.unique'=>'The Category description alreay exist',
            'image'=>'Please Choose any image',
        ];
    }
}