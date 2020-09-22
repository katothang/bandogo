<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CheckoutRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'fullname'=>'required|min:7',
            'email'=>'required|email',
            'address'=>'required',
            'phone'=>'required|min:7|max:11'   
            ];
    }
    public function messages()
    {
        return [
            'fullname.required'=>'Không được để trống Họ Tên',
            'fullname.min'=>'Họ Tên Không được nhỏ hơn 7 ký tự',
            'email.required'=>'Email không được để trống',
            'email.email'=>'Email Không đúng định dạng',
            'address.required'=>"Địa chỉ không được để trống",
            'phone.required'=>'Không được để trống Số Điện thoại',
            'phone.min'=>'Số Điện thoại không được nhỏ hơn 7 ký tự',
            'phone.max'=>'Số Điện thoại không được lớn hơn 11 ký tự',
        ];
    }

}
