<?php

namespace App\Http\Requests\Api;
use App\Http\Requests\Api\ApiResponse;

class GigsRequest extends ApiResponse
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
            'category_id' => 'required|integer',
            'gigrr_type' => 'required|string',
            'gig_name' => 'required|string',
            'start_date' => 'required|date|date_format:Y-m-d',
            'end_date' => 'required|date|date_format:Y-m-d',
            'start_time'=>'required|date_format:H:i',
            'end_time'=>'required|date_format:H:i|after:time_start',
            'price_criteria'=>'required|in:hourly,daily,weekly,monthly,total',
            'from_amount'=>'required|numeric',
            'to_amount'=>'required|numeric'
        ];
    }
}