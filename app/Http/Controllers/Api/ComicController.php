<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Comic;
use Illuminate\Http\Request;

class ComicController extends Controller
{
    public function index(Request $request) {

        $search = $request->query('search');

        $query = Comic::query();

        if($search) {
            $query->where('title', 'LIKE', "%{$search}%");
        };

        $comics = $query->get();

        // $comics = Comic::all();
            
        return response()->json(
            [
                'success' => true,
                'data' => $comics
            ]
        );   
    }

    public function show(Comic $comic) {

        $comic->load('characters', 'brand');

        return response()->json([
            'success' => true,
            'data' => $comic
        ]);
    }
}
