<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    //protected $table = 'menu';
    protected $primaryKey = 'id';

    protected $fillable=[
        'id',
        'quantity',
        'total',
        'service',
        'note',
        'menu_id',
        'order_id',
        'state_id',
        'menuname',
        'statename'
    ];

    public function item()
    {
        return $this->belongsTo('App\Menu');
    }
}
