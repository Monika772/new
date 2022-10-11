<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class BannerRequest extends FormRequest
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
        if(!empty($this->id)){
            return [
                'image' => 'required|unique:banners,image,' . $this->id.',id,status,!deleted'
             ];
        }else{
            return [
                'image' => 'required|unique:banners,image,deleted,status',
             ];
        }   
    }
     /**
     * Custom message for validation
     *
     * @return array
     */
    public function messages()
    {
        return [
            'image.required'=>'Please choose image',
            'image.unique'=>'The image alreay exist',
            'image'=>'File required',
        ];
    }
}