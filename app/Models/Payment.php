<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Payment extends Model{

    protected  $primaryKey = 'id';
    protected $table = 'payments';

    protected $fillable = ['id','employer_id','candidate_id','gigs_id','discount','amount','candidate_income','admin_commission','admin_income','status','transaction_id','payment_response','payment_mode','candidate_transfer_amount','created_at','updated_at'];
    protected $appends = ['currency'];
    public function getCurrencyAttribute(){
        return config('constants.currency_sysmbol');
     }
    public function gigs(){
        return $this->belongsTo('App\Models\Gigs','gigs_id','id');
    }
    public function candidate(){
        return $this->hasOne('App\User','id','candidate_id')->select('id','role_id','name','email','profile_image','latitude','longitude');
    }
    public function employer(){
        return $this->hasOne('App\User','id','employer_id')->select('id','role_id','name','email','profile_image','latitude','longitude');
    }
}