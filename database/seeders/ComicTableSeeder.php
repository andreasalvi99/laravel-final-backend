<?php

namespace Database\Seeders;

use App\Models\Brand;
use App\Models\Comic;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ComicTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $dc = Brand::where('name', 'Marvel Comics')->first();
        
        $newComic = new Comic();

        $newComic->title = 'AQUAMAN #49';
        $newComic->description = "La verità su come Aquaman abbia perso la memoria viene finalmente rivelata! Ma Arthur riuscirà ad affrontare la scioccante realtà? Chi sceglierà di sposare la Regina Mera? E come riuscirà Arthur a sfuggire alle fauci della terrificante Madre Squalo? Le maree del cambiamento stanno arrivando e tutto porterà allo storico AQUAMAN #50 del prossimo mese!";
        $newComic->cover_img = 'comics/aquaman-1.avif';
        $newComic->price = 3.99;
        $newComic->release_date = '2019-06-19';
        $newComic->brand_id = $dc->id;

        $newComic->save();
    }
}
