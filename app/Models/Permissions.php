<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Permissions extends Model
{

    protected  $primaryKey = 'id';
    protected $table = 'permissions';

    protected $fillable = [
        'name',
        'route',
        'status',
        'created_at',
        'updated_at',
     ];
}