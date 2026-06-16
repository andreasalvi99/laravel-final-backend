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

        $newBrand->name = 'Marvel Comics';
        $newBrand->description = 'Marvel Comics è una storica casa editrice statunitense di fumetti fondata nel 1939, conosciuta in tutto il mondo per aver creato alcuni dei personaggi più celebri della cultura pop, tra cui Spider-Man, Iron Man, Captain America e gli Avengers.';
        $newBrand->logo = 'brands/marvel-logo.svg';

        $newBrand->save();

    }
}
