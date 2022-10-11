<?php

namespace App\Exports;

use App\Models\User;
use App\Models\Order;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Events\AfterSheet;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Events\BeforeExport;
use Illuminate\Support\Facades\Schema;
use Carbon\Carbon;

class OrderExport implements FromCollection ,ShouldAutoSize , WithHeadings , WithEvents
{
    
    private $month;
    private $year;
    private $order_status;
    private $day;
    
    public function __construct($month,$year,$order_status,$day)
    {
        $this->month = $month;
        $this->year = $year;
        $this->order_status = $order_status;
        $this->day=$day;
    }
    
    public function collection()
    { 
     $datas=[];
       $order_status= $this->order_status;
       $month = $this->month;
       $year = $this->year;
       $day = $this->day;
        $orders = Order::select('tbl_order.*',
                                'tbl_product.product_name as ProductName',
                                'tbl_product.id as ProductID',
                                'users.doc_aprove_status as doc_aprove_status',
                                'users.first_name as customerFirstname',
                                'users.last_name as customerLastname')
                ->join('users', 'tbl_order.user_id', '=', 'users.id')
                ->join('tbl_product', 'tbl_order.product_id', '=', 'tbl_product.id')
                ->join('tbl_inventory','tbl_product.id','=','tbl_inventory.product_id');
                
                if($order_status=='pending_varification'){
                    $orders->where('users.doc_aprove_status',0);
                }
                if($order_status=='waiting_shipment'){
                    $orders->where('tbl_order.status',1);
                }
                if($order_status=='overdue_shipment'){
                    $orders->where(function ($orders) use ($order_status) {
                        $orders->whereRaw( "DATE(tbl_order.estimate_start_datetime) <=  '".Carbon::today()->toDateString()."'")
                        ->orWhereRaw("DATE(tbl_order.delivery_datetime) <= '".Carbon::today()->toDateString()."'");
                    });
                }
                
                if(!empty($month))
                {
                    $orders->whereRaw('MONTH(tbl_order.created_at) = ?',[$month]);
                }
                
                if(!empty($day))
                {
                    $orders->whereRaw('DAY(tbl_order.created_at) = ?',[$day]);
                }
                
                if(!empty($year))
                {
                    $orders->whereRaw('YEAR(tbl_order.created_at) = ?',[$year]);
                }
        $order= $orders->get();
         
        foreach ($order as $key => $value) {
            $datas[$key]['Customerfullname'] = $value->customerFirstname.' '.$value->customerLastname;
            $datas[$key]['OrderID'] = $value->order_id;
            $datas[$key]['ProductName'] = $value->ProductName;
            $datas[$key]['serial_number'] = $value->serial_number;
            $datas[$key]['estimate_start_datetime'] = $value->estimate_start_datetime;
            $datas[$key]['estimate_end_datetime'] = $value->estimate_end_datetime;
            $datas[$key]['apply_rate'] = $value->apply_rate; 
            $datas[$key]['delivery_type_status'] = ($value->delivery_type == 1)? "by delivery boy" : "self on shop";
            $datas[$key]['first_amount'] = $value->first_amount; 
            $datas[$key]['doc_aprove'] = ($value->doc_aprove_status == 1)? "YES" : "NO";
            switch ($value->status) {
                     case 0:
                       $datas[$key]['status']='Pending';
                        break;
                    case 1:
                       $datas[$key]['status']='Order';
                        break;
                    case 2:
                        $datas[$key]['status']='In-transist';
                        break;
                    case 3:
                        $datas[$key]['status']='Delivered';
                        break;
                     case 4:
                        $datas[$key]['status']='Return Initiated';
                        break;
                     case 5:
                        $datas[$key]['status']='Completed';
                        break;
                     case 6:
                         $datas[$key]['status']='Cancelled';
                        break;
                     case 7:
                       $datas[$key]['status']='Resume order';
                        break;
                     case 8:
                        $datas[$key]['status']='Resume return initiated';
                        break;
                     case 9:
                        $datas[$key]['status']='Lost product';
                        break;
                     case 10:
                        $datas[$key]['status']='Damage Product';
                        break;
                    case 11:
                        $datas[$key]['status']='Cancelled by delivery boy';
                        break;
                     case 12:
                        $datas[$key]['status']='Cancelled by shopkeeper';
                        break;
                    default:
                         $datas[$key]['status']= "0";
                }
                 
        }        
       return collect($datas);
    }
    
     public function headings(): array
    {        
     // return  Schema::Connection('business')->getColumnListing('users');        
         return [
            'Customer Name',
            'OrderID',
            'Product Name',
            'Inventory Sr. No.',
            'Estimate StartDate',
            'Estimate EndDate',
            'Apply Rate',
            'Delivery Type',
            'First Amount',
            'Doc Approve',
            'Status'
        ]; 
    }
    
    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function (AfterSheet $event) {
                 $event->sheet->getDelegate()->getStyle('A1:N1')->applyFromArray([
                    'font' => [
                         'bold' => true, 
                        //'size' => 14,
                    ],
                     
                ]);
            $event->sheet->getStyle('A1:Z1000')->applyFromArray([
                'alignment' =>[
                   'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
               ],
                'font' => [
                   'size' => 9
               ],
               
             ]); 
                 
            },
        ];
    }
    
    
}
