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
        $dc = Brand::where('name', 'DC Comics')->first();

        $newComic = new Comic();

        $newComic->title = 'THE FLASH VOL. 1: STRANGE ATTRACTOR';
        $newComic->description = "non torna. Qualcosa di molto strano. La sua crescente comprensione dei propri poteri ha aperto a Wally nuove possibilità di avventure fantascientifiche e ha affinato i suoi sensi verso idee misteriose e sconosciute. Quando qualcosa sussurra dalle oscure vibrazioni oltre la Forza della Velocità, Wally dovrà sperimentare nuovi e creativi approcci ai suoi poteri mentre si troverà ad affrontare nuovi mondi, alleati enigmatici e terrori capaci di sconvolgere la mente! Inoltre, in Titans: Beast World Tour: Central City, sia Central City che Keystone City vengono colpite da spore mostruose, e tutta la Famiglia Flash dovrà scendere in campo! Flash Vol. 1: Lo Strano Attrattore segna l'inizio di una nuova era realizzata dal team composto dallo sceneggiatore Simon Spurrier (Coda, Damn Them All) e dall'artista Mike Deodato Jr. (Avengers, Not All Robots), con contributi aggiuntivi di autori e artisti legati alla Famiglia Flash, tra cui Alex Paknadel, A.L. Kaplan, Jarrett Williams e Serg Acuña. Contiene The Flash #1-6, Titans: Beast World Tour: Central City #1 e una storia tratta da The Flash #800.";
        $newComic->cover_img = 'comics/flash-v1-cover-a.avif';
        $newComic->price = 19.99;
        $newComic->release_date = '2024-07-09';
        $newComic->brand_id = $dc->id;

        $newComic->save();
    }
}
