<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class TaxCategoryRequest extends FormRequest
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
                'tax'=>'required',
                'name' => 'required|unique:tax_category,name,' . $this->id.',id,status,!0',
             ];
        }else{
            return [
                'tax'=>'required',
                'name' => 'required|unique:tax_category,name,0,status',
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
            'tax.required'=>'Please enter Tax',
            'name.required'=>'Please enter Tax category name',
            'name.unique'=>'The Category name alreay exist',
        ];
    }
}