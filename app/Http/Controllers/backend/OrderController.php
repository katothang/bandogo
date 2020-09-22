<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\models\order;

class OrderController extends Controller
{
    function GetDetailOrder($id_order)
    {
        $data['orders']= order::find($id_order);
        return view("backend.order.detailorder",$data);
    }
    
    function GetOrder()
    {
        $data['orders']= order::where('state',0)->orderby('id','desc')->paginate(3);
        return view("backend.order.order",$data);
    }

    function GetProcessed()
    {
        $data['orders']= order::where('state',1)->orderby('updated_at','desc')->paginate(3);
        return view("backend.order.processed",$data);
    }
    
    function Paid($id_order)
    {
        $order=order::find($id_order);
        $order->state=1;
        $order->save();
        return redirect('admin/order/processed');
    }
}
