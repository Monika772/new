<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class VriantRequest extends FormRequest
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
                'product_id' => 'required|unique:product_vairant,product_id,' . $this->id.',id,status,!0',
                'variant_name' => 'required|unique:product_vairant,variant_name,' . $this->id.',id,status,!0',
             ];
        }else{
            return [
                'product_id' => 'required|unique:product_vairant,product_id,0,status',
                'variant_name' => 'required|unique:product_vairant,variant_name,0,status',
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
            'product_id.required'=>'Please enter product id',
            'variant_name.unique'=>'The variant name alreay exist',
        ];
    }
}