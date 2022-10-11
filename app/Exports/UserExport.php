<?php

namespace App\Exports;

use App\Models\User;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\WithHeadings;
class UserExport implements FromQuery,WithHeadings
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function headings(): array
    {
        return [
            'Name',
            'Email',
            'Phone No',
            'CreatedAt'
        ];
    }
    public function query()
    {
        $user  = User::query()->where('role_id','=',NULL)
                    ->where('mobile_verify_status','1')
                    ->select('name','email','mobile','created_at')
                    ->orderBy('id','desc')->get();
    //    if(!empty($user)){
    //        foreach($user as $usr){
    //            $use->address = !empty($usr->address)?$usr->address:'N/A';
    //        }
    //    }
        return $user;
       
    }
   
}
