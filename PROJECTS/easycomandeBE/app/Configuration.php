<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Configuration extends Model
{
    protected $primaryKey = 'id';

    protected $fillable=[
        'id',
        'key', 
        'enable', 
        'label', 
        'value'
    ];
}
