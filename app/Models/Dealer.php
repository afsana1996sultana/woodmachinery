<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Dealer extends Model
{
    use HasFactory;
    protected $guard= ['dealer'];
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
