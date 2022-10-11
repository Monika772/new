<?php

namespace App\Models;


use Laravel\Passport\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use App\Helpers\CommonHelper;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'role_id',
        'name',
        'email',
        'otp',
        'mobile_verify_status',
        'profile_image',
        'password',
        'role',
        'remember_token',
        'status',
        'device_token',
        'device_type',
        'access_token',
        'mobile',
        'gst_number',
        'shop_name','created_at','updated_at'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = ['password'];
   
    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = ['email_verified_at' => 'datetime'];
    // public function getAgeAttribute(){
    //     return ($this->dob)?(new \Carbon\Carbon($this->dob))->age:"";
    // }
    // public function getRatingAttribute(){
    //     return CommonHelper::getUserRatings($this->id);
    // }
    // public function getBankAccountStatusAttribute(){
    //     return CommonHelper::getBankAccountStatus($this->id,$this->role_id);
    // }

    
    // public function getImageUrlAttribute(){
    //     return CommonHelper::getUserImageURL($this->id);
    //  }
    // public function getProfileImageAttribute($value){
    //     if(!empty($value)){
    //         return url('storage/app').'/'.$value;  
    //     }else{
    //         return url('storage/app/pro_image/default.jpg'); 
    //     }
    // }
    // public function gigsRequest(){
    //     return $this->hasMany('App\Models\GigsRequest','employe_id','id');
    // }
    // public function employeeProfile(){
    //     return $this->hasOne('App\Models\EmployeeProfile','user_id','id');
    // }
    // public function employersBusiness(){
    //     return $this->hasMany('App\Models\EmployersBusiness','user_id','id');
    // }
    // public function employeeSkills(){
    //     return $this->hasMany('App\Models\EmployeeSkills','user_id','id');
    // }
    // public function employeeImages(){
    //     return $this->hasMany('App\Models\EmployeeImages','user_id','id');
    // }
    // public function scopeIsNotServeJob($query){
    //     $query->where('serve_job', '0');
    // }
    // public function scopeIsServeJob($query){
    //     $query->where('serve_job', '1');
    // }
    public function scopeActive($query){
        $query->where('status', 'active');
    }
    public function scopeNotDeleted($query){
        $query->where('status', '!=','deleted');
    }
    public function useraddress(){
        return $this->hasOne('App\Models\UserAddress','user_id','id');
    }
    // public function scopeCandidate($query){
    //     $query->where('role_id','4');
    // }
    // public function scopeEmployer($query){
    //     $query->where('role_id','3');
    // }
    // public function businessImages(){
    //     return $this->hasMany('App\Models\EmployersBusiness','user_id','id');
    // }
    // public function gigs(){
    //     return $this->hasMany('App\Models\Gigs','employer_id','id');
    // }
    protected $appends = ['image_url'];
    public function getImageUrlAttribute(){
        return CommonHelper::getImageFullUrl('users',$this->profile_image);
    }
}
