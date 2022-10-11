<?php

namespace App\Exports;

use App\Models\User;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Events\AfterSheet;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Events\BeforeExport;
use Illuminate\Support\Facades\Schema;

class PostsExport implements FromCollection ,ShouldAutoSize , WithHeadings , WithEvents
{
    
    private $id;
    
    public function __construct($id) {
        $this->id = $id;
    }
    
    public function collection()
    { 
        return User::where('id',$this->id)->get();
    }
    
     public function headings(): array
    {        
      return  Schema::Connection('business')->getColumnListing('users');        
       /* return [
            'Code',
            'Description',
            'Pos',
            'Mod A',
            'Mod B',
            'Charge',
        ];*/
    }
    
    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function (AfterSheet $event) {
                 $event->sheet->getDelegate()->getStyle('A1:N1')->applyFromArray([
                    'font' => [
                         'bold' => true,
                        //'size' => 14,
                    ]
                ]);
            },
        ];
    }
    
    
}
