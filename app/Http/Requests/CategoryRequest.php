<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CategoryRequest extends FormRequest
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
                'name_en' => 'required|unique:categories,name_en,' . $this->id.',id,status,!deleted',
                'name_hindi' => 'required|unique:categories,name_hindi,' . $this->id.',id,status,!deleted',
             ];
        }else{
            return [
                'name_en' => 'required|unique:categories,name_en,deleted,status',
                'name_hindi' => 'required|unique:categories,name_hindi,deleted,status',
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
            'name_en.required'=>'Please enter category name',
            'name_hindi.required'=>'Please enter category name',
            'name_en.unique'=>'The Category name alreay exist',
            'name_hindi.unique'=>'The Category name alreay exist',
            'image'=>'image required',
        ];
    }
}