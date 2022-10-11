<?php

namespace App\Http\Requests\Api;
use App\Http\Requests\Api\ApiResponse;

class SignupRequest extends ApiResponse
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
            'name' => 'required|string',
            'email' => 'required|string',
            'shop_name' => 'required|string',
            'address'=>'required|string',
            'pincode'=>'required|numeric'
          ];
    }
}