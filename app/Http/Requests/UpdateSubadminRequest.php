<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateSubadminRequest extends FormRequest
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
        $id = request()->id;
        return [
            'first_name' => 'required',
            'last_name'=>'required',
            'email' => 'required|email|unique:users,email,'.$id,
            //'mobile' => 'required|mobile|unique:users',
            'password' => 'nullable|min:6',
            'permission'=>'required|array',
            'permission.*'=>'required|min:1'
            
         ];
       
        
    }

     /**
     * Custom message for validation
     *
     * @return array
     */
    public function messages()
    {
        return [
            'name.required'=>'Please enter team name'
        ];
    }
}