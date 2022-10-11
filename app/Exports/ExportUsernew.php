<?php

namespace App\Exports;
use App\Models\User;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class ExportUsernew implements FromCollection,WithHeadings
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
    public function collection()
    {
        return User::where('role_id','=',NULL)
        ->where('mobile_verify_status','1')
        ->select('name','email','mobile','created_at')
        ->orderBy('id','desc')->get();
    }
}
