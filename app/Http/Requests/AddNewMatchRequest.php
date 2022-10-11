<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AddNewMatchRequest extends FormRequest
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
        if(isset(request()->id) && !empty(request()->id)){
            return [
                'tournament_id'=>'required',
                'description'=>'required',
                'teamA'=>'required',
                'teamB'=>'required',
                'match_date'=>'required',
                'match_time'=>'required',
                'status'=>'required',
                'is_announced'=>'required',
                'match_status'=>'required',
             ];
        }else{
            return [
                'tournament_id'=>'required',
                'description'=>'required',
                'teamA'=>'required',
                'teamB'=>'required',
                'match_date'=>'required',
                'match_time'=>'required',
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
            'tournament_id.required'=>'Tournament field is required',
            'teamA.required'=>'Please Select Team A',
            'teamB.required'=>'Please Select Team B',
            'is_announced.required'=>'Please Select Announce Type',
            'match_status.required'=>'Please Select Match Status',
        ];
    }
}