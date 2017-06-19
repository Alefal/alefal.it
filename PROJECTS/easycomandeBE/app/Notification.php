<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{
    protected $primaryKey = 'id';

    protected $fillable=[
        'id',
        'client',
        'message',
        'state',
        'order_id'
    ];
}
