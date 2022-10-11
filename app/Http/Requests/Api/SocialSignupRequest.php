<?php

namespace App\Http\Requests\Api;
use App\Http\Requests\Api\ApiResponse;

class SocialSignupRequest extends ApiResponse
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
            'social_id'=>'required|integer',
            'social_type' => 'required|in:facebook,google,apple',
            'full_name' => 'required|string',
            'role'=>'required|integer',
            'country_code'=>'required|string',
            'mobile_no'=>'required|min:10|unique:users,mobile',
            'address'=>'required|string',
            'latitude'=>'required',
            'longitude'=>'required'
        ];
    }
}