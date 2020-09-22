<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\models\{product,category};
class IndexController extends Controller
{
    public function GetIndex()
    {
        $data['prd_new']=product::orderby('id','desc')->take(4)->get();
        $data['prd_featured']=product::where('featured',1)->take(4)->get();
       return view('frontend.index',$data);
    }
    
    public function GetAbout()
    {
        echo "Đây là trang about";
    }
    public function GetContact()
    {
        return view("frontend.contact");
    } 
    function GetPrdCate($slug_cate)
    {
       $data['products']=category::where('slug',$slug_cate)->first()->prd()->paginate(6);
       $data['categorys']=category::all();
       return view('frontend.product.shop',$data);
    }
    
    function GetFilter(request $r)
    {
        $data['products']=product::whereBetween('price', [$r->start, $r->end])->paginate(6);
        $data['categorys']=category::all();
        return view('frontend.product.shop',$data);
    }
}
