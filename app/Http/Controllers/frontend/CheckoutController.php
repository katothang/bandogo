<?php

namespace App\Http\Controllers\frontend;

use  App\Http\Requests\CheckoutRequest;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Cart;
use App\models\{order,order_detail};


class CheckoutController extends Controller
{
    public function GetCheckout()
    {
        $data['cart']=Cart::content();
        $data['total']=Cart::total(0,"",".");
        return view('frontend.checkout.checkout',$data);
    } 
    
    public function GetComplete($order_id)
    {
        $data['order']=order::find($order_id);
        return view('frontend.checkout.complete',$data);
    }
    public function PostCheckout(CheckoutRequest $request)
    {
        $order=new order;
        $order->full=$request->fullname;
        $order->address=$request->address;
        $order->email=$request->email;
        $order->phone=$request->phone;
        $order->total=Cart::total(0,"","");
        $order->state=0;
        $order->save();

        foreach (Cart::content() as $item) {
            $prd=new order_detail;
            $prd->code=$item->id;
            $prd->name=$item->name;
            $prd->price=round($item->price,0); // hàm làm tròn
            $prd->quantity=$item->qty;
            $prd->img=$item->options->img;
            $prd->order_id=$order->id;
            $prd->save();
        }
        Cart::destroy();
        return redirect('checkout/complete/'.$order->id);
    }
}
