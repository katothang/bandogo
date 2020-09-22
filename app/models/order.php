<?php

namespace App\models;

use Illuminate\Database\Eloquent\Model;

class order extends Model
{
    protected $table="order";
    public function order_detail()
    {
        return $this->hasMany('App\models\order_detail', 'order_id', 'id');
    }
}
