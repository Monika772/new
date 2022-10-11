<?php

namespace App\Models;
use App\Helpers\CommonHelper;
use Illuminate\Database\Eloquent\Model;

class BankAccountDetails extends Model{

    protected  $primaryKey = 'id';
    protected $table = 'bank_account_details';

    protected $fillable = ['id','role','user_id','account_holder_name','bank_name','account_number','account_type','ifsc_code','fund_account_id','status','created_at','updated_at'];
    
}