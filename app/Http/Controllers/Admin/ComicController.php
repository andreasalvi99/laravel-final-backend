<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use App\Models\Character;
use App\Models\Comic;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ComicController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $comics = Comic::all();
        $brands = Brand::all();
        $characters = Character::all();

        return view('comics.index', compact('comics', 'brands', 'characters'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = $request->all();

        // dd($data);

        $newComic = new Comic();
        
        $newComic->brand_id = $data['brand_id'];
        $newComic->title = $data['title'];
        $newComic->description = $data['description'];
        $newComic->price = $data['price'];
        $newComic->release_date = $data['release_date'];

        if(array_key_exists('cover_img', $data)) {
            $img_url = Storage::putFile('comics', $data['cover_img']);
            $newComic->cover_img = $img_url;
        }

        $newComic->save();

        $newComic->characters()->attach($data['characters']);

        return redirect()->route('comics.index');
    }

    /**
     * Display the specified resource.
     */
    public function show(Comic $comic)
    {
        $characters = Character::all();

        return view('comics.show', compact('comic', 'characters'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Comic $comic)
    {
        $data = $request->all();

        

        $comic->title = $data['title'];
        $comic->description = $data['description'];
        $comic->brand_id = $data['brand_id'];
        $comic->price = $data['price'];
        $comic->release_date = $data['release_date'];

        // dd($data);

        if(array_key_exists('cover_img', $data)) {
            Storage::delete($comic->cover_img);
            $img_url = Storage::putFile('comics', $data['cover_img']);
            $comic->cover_img = $img_url;
        }

        $comic->update();

        return redirect()->route('comics.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Comic $comic)
    {
        $comic->delete();

        return redirect()->route('comics.index');
    }
}
