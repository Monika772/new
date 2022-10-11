<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DeviceInfo extends Model{

    protected  $primaryKey = 'id';
    protected $table = 'user_device_details';

    protected $fillable = ['id','device_id','device_token','device_type','os','app_version'];
   
}