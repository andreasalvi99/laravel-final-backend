<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;
use Stripe\StripeClient;

class PaymentController extends Controller
{
    public function createIntent(Order $order)
    {
        if ($order->status !== 'pending') {
            return response()->json([
                'message' => 'Questo ordine non può essere pagato.',
            ], 422);
        }

        $stripe = new StripeClient(config('services.stripe.secret'));

        $paymentIntent = $stripe->paymentIntents->create([
            'amount' => (int) round($order->total * 100),
            'currency' => 'eur',
            'automatic_payment_methods' => [
                'enabled' => true,
            ],
            'metadata' => [
                'order_id' => $order->id,
            ],
        ]);

        return response()->json([
            'clientSecret' => $paymentIntent->client_secret,
            'total'=>$order->total
        ]);
    }
}
