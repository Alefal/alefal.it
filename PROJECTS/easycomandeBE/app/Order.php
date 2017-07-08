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
        'covered', 
        'totalorder', 
        'totalservice',
        'state_id'
    ];

    /**
     * Get the items
     */
    public function items()
    {
        return $this->hasMany('App\Item')
                    ->orderBy('sort','ASC')
                    ->orderBy('id','ASC');
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
        return $this->hasMany('App\Special')
                    ->orderBy('sort','ASC')
                    ->orderBy('id','ASC');
    }
}
