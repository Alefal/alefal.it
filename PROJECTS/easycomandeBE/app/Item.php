<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    //protected $table = 'menu';
    protected $primaryKey = 'id';

    protected $fillable=[
        'id',
        'menu_id',
        'sort',
        'quantity',
        'total',
        'service',
        'note',
        'order_id',
        'state_id',
        'menuname',
        'statename'
    ];
}
