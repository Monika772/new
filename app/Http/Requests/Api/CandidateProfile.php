<?php

namespace App\Http\Requests\Api;
use App\Http\Requests\Api\ApiResponse;

class CandidateProfile extends ApiResponse
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
            'full_name' => 'required|string',
            'country_code' => 'required|string',
           // 'profile_image'=>'nullable|required',
            'mobile_no' => 'required|numeric',
            'email'=>'nullable|email',
            'address'=>'required|string',
            'latitude'=>'required',
            'longitude'=>'required',
            'gender'=>'required|in:male,female,other',
            'dob'=>'required',
            'skills'=>'required',
            'experience_year'=>'required',
            'experience_month'=>'required',
            'price_from'=>'required',
            'price_to'=>'required',
            'price_criteria'=>'required|in:hourly,daily,weekly,monthly',
            'avaliblity'=>'required',
            'shift'=>'required|in:day,evening,night',
          ];
    }
}