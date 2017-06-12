<?php

namespace App;

//use App\Item;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $primaryKey = 'id';

    protected $fillable=[
        'id',
        'date', 
        'client', 
        'totalorder', 
        'totalservice',
        'state_id'
    ];

    /**
     * Get the items
     */
    public function items()
    {
        $itemsArray = $this->hasMany('App\Item');
        return $itemsArray;
    }

    /**
     * Get the notes
     */
    public function notes()
    {
        return $this->hasMany('App\Note');
    }

    /**
     * Get the specials
     */
    public function specials()
    {
        return $this->hasMany('App\Special');
    }
}
