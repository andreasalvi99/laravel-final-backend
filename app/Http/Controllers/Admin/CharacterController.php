<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Character;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class CharacterController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $characters = Character::all();

        return view('characters.index', compact('characters'));
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

        $newCharacter = new Character();

        $newCharacter->name = $data['name'];
        $newCharacter->description = $data['description'];

        if(array_key_exists('character_img', $data)) {
            $img_url = Storage::putFile('characters', $data['character_img']);
            $newCharacter->character_img = $img_url;
        }

        if(array_key_exists('banner', $data)) {
            $img_url = Storage::putFile('characters-banner', $data['banner']);
            $newCharacter->banner = $img_url;
        }

        $newCharacter->save();

        return redirect()->route('characters.index');
        
    }

    /**
     * Display the specified resource.
     */
    public function show(Character $character)
    {
        return view('characters.show', compact('character'));
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
    public function update(Request $request, Character $character)
    {
        $data = $request->all();

        $character->name = $data['name'];
        $character->description = $data['description'];

        if(array_key_exists('character_img', $data)) {
            Storage::delete($character->character_img);
            $img_url = Storage::putFile('characters', $data['character_img']);
            $character->character_img = $img_url;
        }

         $img_url = Storage::putFile('characters-banner', $data['banner']);
            $character->banner = $img_url;

        // if(array_key_exists('banner', $data)) {
        //     Storage::delete($character->banner);
        //     $img_url = Storage::putFile('characters-banner', $data['banner']);
        //     $character->banner = $img_url;
        // }

        $character->update();

        return redirect()->route('characters.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Character $character)
    {
        $character->delete();

        return redirect()->route('characters.index');
    }
}
