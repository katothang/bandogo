<?php

namespace App\Http\Controllers\backend;
use App\Http\Requests\{AddProductRequest,EditProductRequest};
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\models\product;
use App\models\category;

class ProductController extends Controller
{
    function GetAddProduct()
    {
        $data['categorys']=category::all()->toarray();
        return view("backend.product.addproduct",$data);
    }
    function GetEditProduct($id_product)
    {
        $data['prd']=product::find($id_product);
        $data['categorys']=category::all()->toarray();
        return view("backend.product.editproduct",$data);
    }
    function GetListProduct()
    {
        $data['products'] = product::paginate(4);
        return view("backend.product.listproduct",$data);
    }
    function PostAddProduct(AddProductRequest $r)
    {
        $prd = new product();
        $prd->code=$r->code;
        $prd->name=$r->name;
        $prd->slug=str_slug($r->name);
        $prd->price=$r->price;
        $prd->featured=$r->featured;
        $prd->state=$r->state;
        $prd->info=$r->info;
        $prd->describe=$r->describe;
        if($r->hasFile('img'))
        {
         
            $file=$r->img;
            $file_name=str_slug($r->name).'.'.$file->getClientOriginalExtension();
            $file->move('public/backend/img',$file_name);
            $prd->img=$file_name;
        }
        else
        {
            $prd->img='no-img.jpg';
        }

        $prd->category_id=$r->category;
        $prd->save();
        return redirect('admin/product')->with('thongbao','Đã Thêm Sản phẩm thành Cồng');
    }
    function PostEditProduct(EditProductRequest $r,$id_product)
    {
        $prd=product::find($id_product);
        $prd->code=$r->code;
        $prd->name=$r->name;
        $prd->slug=str_slug($r->name);
        $prd->price=$r->price;
        $prd->featured=$r->featured;
        $prd->state=$r->state;
        $prd->info=$r->info;
        $prd->describe=$r->describe;
        if($r->hasFile('img'))
        {
            if($prd->img!='no-img.jpg')
            {
                unlink('public/backend/img/'.$prd->img);
            }
           
            $file=$r->img;
            $file_name=str_slug($r->name).'.'.$file->getClientOriginalExtension();
            $file->move('public/backend/img',$file_name);
            $prd->img=$file_name;
        }

        $prd->category_id=$r->category;
        $prd->save();
      return redirect()->back()->with('thongbao','Đã sửa Thành Công!');
    }
    function DelProduct($id_product)
    {
        product::destroy($id_product);
        return redirect('admin/product')->with('thongbao',"Đã xoá thành công");
    }
}
