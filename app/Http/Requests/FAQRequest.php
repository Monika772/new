<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class FAQRequest extends FormRequest
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
               'title_hindi'=>'required|string',
               'title_en'=>'required|string',
        ];

    }
    public function messages()
    {
        return [
            'title_hindi'=>'Please enter faq question',
            'title_en'=>'Please enter faq question'
        ];
    }
}
