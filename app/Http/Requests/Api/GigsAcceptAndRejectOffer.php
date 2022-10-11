<?php

namespace App\Http\Requests\Api;
use App\Http\Requests\Api\ApiResponse;

class GigsAcceptAndRejectOffer extends ApiResponse
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
            'gigs_id' => 'integer',
            'status' => 'required|in:accept,cancel'
        ];
    }
}