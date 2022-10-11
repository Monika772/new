<?php

namespace App\Http\Requests\Api;
use App\Http\Requests\Api\ApiResponse;

class CandidateKycRequest extends ApiResponse
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
            'aadhar_no' => 'required|integer',
            'aadhar_front_image' => 'required|string',
            'aadhar_back_image' => 'required|string',
          ];
    }
}