<?php

namespace Database\Seeders;

use App\Models\Brand;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class BrandTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $newBrand = new Brand();

        $newBrand->name = 'DC Comics';
        $newBrand->description = 'DC Comics è una delle principali case editrici americane di fumetti, conosciuta per personaggi leggendari come Batman, Superman, Wonder Woman e per universi narrativi che hanno influenzato generazioni di lettori.';

    }
}
