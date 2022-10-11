<?php

namespace App\Http\Requests\Api;
use App\Http\Requests\Api\ApiResponse;

class LoginRequest extends ApiResponse
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
            'social_id'     => 'required',
            'social_type'   => 'required|string|in:facebook,google,apple',
            'device_token'  => 'required|string',
            'device_type'   => 'required|in:android,ios',
            'full_name'     => 'required|string',
            'email'         => 'nullable|email',
            'country_code'  => 'nullable|string',
            'mobile_no'     => 'nullable|numeric'
        ];
    }
}