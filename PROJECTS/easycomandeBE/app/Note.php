<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Note extends Model
{
    //protected $table = 'menu';
    protected $primaryKey = 'id';

    protected $fillable=[
        'id',
        'note',
        'order_id'
    ];
}
