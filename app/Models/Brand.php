<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Brand extends Model
{
    public function comics() {
       return $this->hasMany(Comic::class);
    }
}
