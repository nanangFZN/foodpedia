<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;



class UserApiController extends Controller
{
    public function index($id)
    {
        $user=User::find($id);
        return response()->json(['data'=>$user]);
    }
    public function update(Request $request ,$id)
    {
        $user=User::find($id);
        $user->update($request->all());
        return response()->json(['data'=>$user]);
    }
}
