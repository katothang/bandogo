<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\models\order;
use Carbon\carbon; // Thư viện xử lý thời gian


class IndexController extends Controller
{
    function GetIndex()
    {
        $month_now=carbon::now()->format('m'); // lấy tháng hiện tại
        $year_now=carbon::now()->format('Y'); // lấy năm hiện tại
        for ($i=1; $i <= $month_now; $i++) 
        { 
            $dl['Tháng '.$i]=order::where('state',1)->whereMonth('updated_at',$i)->whereYear('updated_at',$year_now)->sum('total'); // tính tổng doanh thu theo tháng
        }
        $data['dl']=$dl;
        $data['so_dh']=order::where('state',1)->count();
        return view("backend.index",$data);
    }
    function Logout()
    {
        Auth::logout();
        return redirect('login');
    }
}
