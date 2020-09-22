<?php

namespace App\Http\Controllers\backend;
use App\Http\Requests\{AddCategoryRequest,EditCategoryRequest};
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\models\category;

class CategoryController extends Controller
{
    function GetCategory()
    {
        $data['categorys']=category::all()->toarray();
        return view("backend.category.category",$data);
    }
    function PostCategory(AddCategoryRequest $request)
    {
        //dd($request->all());
        if( GetLevel(category::all()->toarray(),$request->parent,1)>2)
        {
            return redirect()->back()->with('error','Giao diện web không hỗ trợ Danh mục lớn hơn 2 cấp');
        }
        
        $cate=new category;
        $cate->name=$request->name;
        $cate->slug= str_slug($request->name);
        $cate->parent=$request->parent;
        $cate->save();
        return redirect()->back()->with('thongbao','Đã thêm danh mục thành công'.$request->name);
    }
    function GetEditCategory($id_category)
    {
        $data['cate']=category::find($id_category);
        $data['categorys']=category::all()->toarray();
        
        return view("backend.category.editcategory",$data);
    }

    function PostEditCategory(EditCategoryRequest $r,$id_category)
    {
        if(   GetLevel(category::all()->toarray(),$r->parent,1)>2   )
        {
            return redirect()->back()->with('error','Giao diện web không hỗ trợ Danh mục lớn hơn 2 Cấp');
        }
          
        $cate=category::find($id_category);     
        $cate->name=$r->name;
        $cate->slug= str_slug($r->name);
        $cate->parent=$r->parent;
        $cate->save();
        return redirect()->back()->with('thongbao','Đã sửa danh mục thành công');
    }
    function DelCategory($id_category)
    {
        $cate=category::find($id_category);
        category::where('parent',$id_category)->update(['parent'=>$cate->parent]);
        category::destroy($id_category);
        return redirect()->back()->with('thongbao','Đã Xoá Danh mục'); 
    }
}
