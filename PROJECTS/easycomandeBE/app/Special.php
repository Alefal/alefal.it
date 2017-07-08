<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Special extends Model
{
    //protected $table = 'menu';
    protected $primaryKey = 'id';

    protected $fillable=[
        'id',
        'special',
        'sort',
        'price',
        'note',
        'order_id',
        'state_id',
        'statename'
    ];
}
