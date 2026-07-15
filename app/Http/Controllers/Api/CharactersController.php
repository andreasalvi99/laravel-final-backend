<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Character;
use Illuminate\Http\Request;

class CharactersController extends Controller
{
    public function index(Request $request) {

        $search = $request->query('search');

        $query = Character::query();

        if($request->filled('search')) {
            $query->where('name', 'LIKE', '%' . $request->query('search') . '%');
        };

        $characters= $query->get();

        return response()->json([
            'success' => true,
            'results' => $characters
        ]);
    }

    public function show(Character $character) {
        $character->load('comics');
        
       return response()->json([
        'success' => true,
        'results' => $character
       ]);
    }
}
