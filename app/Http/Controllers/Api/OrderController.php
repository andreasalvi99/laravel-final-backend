<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function store(Request $request)
    {

        $data = $request->all();

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
        $newOrder->total = $data['total'];
        $newOrder->shipping_method = $data['shipping_method'];

        $newOrder->save();

        foreach($data['comics'] as $comic) {
            $newOrder->comics()->attach($comic['comic_id'], [
                'quantity' => $comic['quantity'], 
                'price'=>$comic['price'],
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
