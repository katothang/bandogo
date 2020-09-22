<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\models\product;
use Cart;
class CartController extends Controller
{
    public function GetCart()
    {
        $data['cart']=Cart::content();
        $data['total']=Cart::total(0,"",".");
        return view('frontend.cart.cart',$data);
    } 
    function AddCart(request $r)
    {
        $prd=product::find($r->id_product);
        if($r->has('quantity'))
        {
            $qty=$r->quantity;
        }
        else {
            $qty=1;
        }
        Cart::add([
            'id' => $prd->code, 
            'name' => $prd->name, 
            'qty' => $qty, 
            'price' => $prd->price, 
            'weight' => 0, 
            'options' => ['img' => $prd->img]]);
            return redirect('cart');
    }
    function UpdateCart($rowId,$qty)
    {
        Cart::update($rowId, $qty); 
        return "success";
    }
    function DelCart($rowId)
    {
        Cart::remove($rowId);
        return redirect()->back();
    }
}
