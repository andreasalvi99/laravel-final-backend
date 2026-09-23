<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\Comic;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function store(Request $request) {

        $data = $request->validate([
            'firstname' => ['required'],
            'lastname' => ['required'],
            'email' => ['required', 'email'],
            'address_type' => ['required'],
            'address' => ['required'],
            'city' => ['required'],
            'house_number' => ['required'],
            'province' => ['required', 'string', 'size:2', 'alpha'],
            'zipcode' => ['required', 'digits:5'],
            'shipping_method' => ['required', 'in:standard,express'],
            'comics' => ['required', 'array', 'min:1'],
            'comics.*.comic_id' => ['required', 'integer', 'exists:comics,id'],
            'comics.*.quantity' => ['required', 'integer', 'min:1']
        ]);

        $productsTotal = 0;

        foreach($data['comics'] as $cartItem) {
            $comic = Comic::findOrFail($cartItem['comic_id']);
            $productsTotal += $comic->price * $cartItem['quantity'];
        }

        $shippingCost = $data['shipping_method'] === 'express' ? 5.99 : 0;

        $total = $productsTotal + $shippingCost;
        
        $newOrder = new Order();

        $newOrder->firstname = $data['firstname'];
        $newOrder->lastname = $data['lastname'];
        $newOrder->email = $data['email'];
        $newOrder->address_type = $data['address_type'];
        $newOrder->address = $data['address'];
        $newOrder->city = $data['city'];
        $newOrder->house_number = $data['house_number'];
        $newOrder->province = $data['province'];
        $newOrder->zipcode = $data['zipcode'];
        $newOrder->total = $total;
        $newOrder->shipping_method = $data['shipping_method'];

        $newOrder->save();

        foreach($data['comics'] as $cartItem) {
            $comic = Comic::findOrFail($cartItem['comic_id']);
            $newOrder->comics()->attach($comic->id, [
                'quantity' => $cartItem['quantity'], 
                'price'=>$comic->price,
                ]);
        }

        return response()->json(['order' => $newOrder], 201);
    }

    public function show(Order $order) {
        return response()->json([
            'order' => $order->load('comics')
        ]);
    }
}
