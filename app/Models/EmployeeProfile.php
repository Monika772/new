<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class EmployeeProfile extends Model{

    protected  $primaryKey = 'id';
    protected $table = 'employes_profile';

    protected $fillable = ['id','user_id','aadhar_number','aadhar_front_image','aadhar_back_image','vaccine_certificate','experience_year','experience_month','price_from','price_to','rate_type','price_criteria','availibility','shift','created_at','updated_at','upi_id'];
    protected $appends = ['aadhar_front_image_url','aadhar_back_image_url','vaccine_certificate_url','experience'];
    public function skills(){
        return $this->hasMany('App\Models\EmployeeSkills','user_id','user_id');
    }
    public function bank(){
        return $this->hasOne('App\Models\BankAccountDetails','user_id','user_id');
    }
    public function employeeImages(){
        return $this->hasMany('App\Models\EmployeeImages','user_id','user_id');
    }
    public function getAadharFrontImageUrlAttribute(){
        if(!empty($this->aadhar_front_image)){
            return url('storage/app/employee_profile').'/'.$this->aadhar_front_image;  
        }else{
            return url('storage/app/default-profile.jpg'); 
        }
    }
    public function getAadharBackImageUrlAttribute(){
        if(!empty($this->aadhar_back_image)){
            return url('storage/app/employee_profile').'/'.$this->aadhar_back_image;  
        }else{
            return url('storage/app/default-profile.jpg'); 
        }
    }
    public function getVaccineCertificateUrlAttribute(){
        if(!empty($this->vaccine_certificate)){
            return url('storage/app/employee_profile').'/'.$this->vaccine_certificate;  
        }
    }
    public function getExperienceAttribute(){
        $experience = '';
        if(!empty($this->experience_year) && $this->experience_year > 0){
            $experience = $this->experience_year." years";
        }
        if(!empty($this->experience_month) && $this->experience_month > 0){
            $month = $this->experience_month." months";
            if(!empty($experience)){
                return $experience." and ".$month;
            }
        }
        return $experience;
    }
}