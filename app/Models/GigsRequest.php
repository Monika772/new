<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Helpers\CommonHelper;
class GigsRequest extends Model
{

    protected  $primaryKey = 'id';
    protected $table = 'gigs_request';
    protected $fillable = ['id','gigs_id','employe_id','status','offer_amount','agreed_amount','start_otp','end_otp','created_at','updated_at'];
    protected $appends = ['distance','candidate_rating','rating_from_employer','rating_to_employer','payment_status','employee_name'];
    public function getDistanceAttribute(){
        return rand(1,2);
     }
    public function getEmployeeNameAttribute(){
        return CommonHelper::getEmployeeName($this->employe_id);
    }
    public function getCandidateRatingAttribute(){
        return CommonHelper::getUserRatings($this->employe_id);
    }
    public function getRatingFromEmployerAttribute(){
        return CommonHelper::getRatingFromEmployer($this->employe_id,$this->gigs_id);
    }
    public function getRatingToEmployerAttribute(){
        return CommonHelper::getRatingToEmployer($this->employe_id,$this->gigs_id);
    }
    public function getPaymentStatusAttribute(){
        return CommonHelper::checkPaymentStatus($this->employe_id,$this->gigs_id);
    }
    public function gigs(){
        return $this->belongsTo('App\Models\Gigs','gigs_id');
    }
    public function candidate(){
        return $this->hasOne('App\User','id','employe_id')->select('id','role_id','name','email','profile_image','latitude','longitude');
    }
    public function candidateImages(){
        return $this->hasMany('App\Models\EmployeeImages','user_id','employe_id');
    }
    
}