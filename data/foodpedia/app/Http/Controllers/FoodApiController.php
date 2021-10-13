<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use App\Models\Food;
use App\Models\Order;
use App\Models\User;

class FoodApiController extends Controller
{
    public function index()
    {
        $foods=Food::all();
        return response()->json(['data'=>$foods]);
    }
    public function filter($category)
    {
        $foods=DB::table('food')->where('category','=',$category)->get();
        return response()->json(['data'=>$foods]);
    }
    public function store(Request $request)
    {
        $order=Order::create($request->all());
        return response()->json(['data'=>$order]);
    }
    public function edit($id)
    {
        $food=Food::find($id);
        return response()->json(['data'=>$food]);
    }
    public function userRegist(Request $request)
    {
        $user=User::create([
            'name'=>$request->name,
            'phone'=>$request->phone,
            'email'=>$request->email,
            'username'=>$request->username,
            'password'=>Hash::make($request->password),
        ]);
        return response()->json(['data'=>$user]);
    }
    public function userLogin(Request $request)
    {
        if (Auth::attempt([
            'username' => $request->username,
             'password' => $request->password,
             ])) {
           $user=Auth::user();
           $token=Str::random(60);
           $data['user']=$user;
           $data['token']=$token;
           return response()->json(['data'=>$data],200);
        }
        return response()->json([
            
            'data'=>'',
            'pesan'=>'Login Gagal'
        ],401);
    }
    public function userCart($id)
    {
        $cart=DB::table('orders')
        ->join('food','orders.id_menu','=','food.id')
        ->join('users','orders.id_user','=','users.id')
        ->where('id_user','=',$id)
        ->select('food.menu','food.price','orders.quantity','orders.status')
        ->get();
      
        return response()->json(['data'=>$cart]);
    }
    
}
