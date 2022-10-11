<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class GigrrTypeRequest extends FormRequest
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
                'gigrr_type_name' => 'required|unique:gigrr_types,name,' . $this->id.',id,status,!deleted',
             ];
        }else{
            return [
                'name' => 'required|unique:gigrr_types,name,deleted,status'
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
            'name.required'=>'Please enter gigrr type name',
            'name.unique'=>'The Category name alreay exist',
            'gigrr_type_name.unique'=>'The Gigrr Type name alreay exist',
            'gigrr_type_name.required'=>'Please enter gigrr type name',

        ];
    }
}