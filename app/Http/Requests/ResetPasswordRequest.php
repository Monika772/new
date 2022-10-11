<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
class ResetPasswordRequest extends FormRequest
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
            'password' => 'required|min:6|max:20',
            'password_confirmation' => 'required|same:password|min:6|max:20'
        ];
    }
      public function messages()
    {
        return [
            'password_confirmation.same'=>'Password and confirm password must be same.'
        ];
    } 
}