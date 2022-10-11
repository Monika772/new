<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class SettingRequest extends FormRequest
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
        return [
            'value'=>'required',
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
            'upi_id.required'=>'Please enter UPI ID',
            'upi_username.required'=>'Please enter upi user name',
            'app_version.required'=>'Distributor email field is required',
            'force_update.required'=>'Please select force update option',
            'message.required'=>'Please enter message',
            'load_wallet_commission.required'=>'The load wallet commission field is required'
        ];
    }
}