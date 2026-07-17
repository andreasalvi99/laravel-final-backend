<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Comic;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use PDO;

class ComicController extends Controller
{
    public function index(Request $request) {

        $query = Comic::query();

        if($request->filled('search')) {
            $query->where('title', 'LIKE', '%' . $request->query('search') . '%');
        };

        $comics = $query->get();

        // $comics = Comic::all();

       $comic = DB::select("SELECT description FROM comics WHERE id = 1");

        dd([
            'php_version' => PHP_VERSION,
            'pdo_drivers' => PDO::getAvailableDrivers(),
        ]);
            
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
