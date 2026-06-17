<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use App\Models\Comic;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class BrandController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $brands = Brand::all();

        return view('brands.index', compact('brands'));
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

        $newBrand = new Brand();

        $newBrand->name = $data['name'];
        $newBrand->description = $data['description'];

        if(array_key_exists('logo', $data)) {
            $img_url = Storage::putFile('brands', $data['logo']);
            $newBrand->logo = $img_url;
        }

        $newBrand->save();
        
        return redirect()->route('brands.index');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
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
    public function update(Request $request, Brand $brand)
    {
        $data = $request->all();

        $brand->name = $data['name'];
        $brand->description = $data['description'];
        
        if(array_key_exists('logo', $data)) {
            Storage::delete($brand->logo);
            $img_url = Storage::putFile('brands', $data['logo']);
            $brand->logo = $img_url;
        }
        
        $brand->update();

        return redirect()->route('brands.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
