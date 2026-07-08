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

        $previous = Comic::where('id', '<', $comic->id)
            ->orderBy('id', 'desc')
            ->first();

        $next = Comic::where('id', '>', $comic->id)
            ->orderBy('id')
            ->first();

        return response()->json([
            'success' => true,
            'data' => $comic,
            'previous' => $previous,
            'next'=> $next
        ]);
    }
}
