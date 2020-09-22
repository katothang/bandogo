<?php

namespace App\Http\Controllers\frontend;

use Illuminate\Support\Facades\Auth;
use App\Http\Requests\LoginRequest;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class LoginController extends Controller
{
    function GetLogin()
    {
        return view("frontend.login.login");
    }
    function PostLogin(LoginRequest $request)
    {
       $email=$request->email;
       $password=$request->password;
       if(Auth::attempt(['email' => $email, 'password' => $password]))
       {
            //echo "Dang nhap dung";
            return redirect('admin');
       }
       else
       {
           //echo "Dang nhap sai" ;
           return redirect()->back()->with("Thong bao","Tài khoản hoặc mật khẩu không chính xác");
       }
    }
}
