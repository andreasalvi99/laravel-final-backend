<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Character extends Model
{
    public function comics() {
        return $this->belongsToMany(Comic::class);
    }
}
