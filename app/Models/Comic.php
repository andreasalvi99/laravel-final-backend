<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Comic extends Model
{
    public function brand() {
       return $this->belongsTo(Brand::class);
    }

    public function characters() {
        return $this->belongsToMany(Character::class);
    }
}
