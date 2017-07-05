<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{
    protected $table = 'menu';
    protected $primaryKey = 'id';

    protected $fillable=[
        'id',
        'photo', 
        'name', 
        'description',
        'price',
        'priceoffer',
        'category_id'
    ];
}
