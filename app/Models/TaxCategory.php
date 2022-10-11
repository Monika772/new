<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TaxCategory extends Model
{
    protected  $primaryKey = 'id';
    protected $table = 'tax_category';

    protected $fillable = ['name','status','tax'];
}
