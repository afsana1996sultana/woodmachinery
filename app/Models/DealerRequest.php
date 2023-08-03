<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DealerRequest extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function user(){
    	return $this->belongsTo(User::class,'user_id','id');
    }
    public function product(){
        return $this->belongsTo(Product::class, 'product_id','id');
    }
    public function dealer_request_products(){
        return $this->hasMany('App\Models\DealerRequestProduct');
    }
}
