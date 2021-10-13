<?php

namespace App\Http\Controllers;

use App\Models\Food;
use Illuminate\Http\Request;

class FoodController extends Controller
{
    public function index()
    {
       $foods= Food::all();
        return view('pages.index',compact(['foods']));
    }
    public function menu()
    {
        return view('pages.addmenu');
    }
    public function store(Request $request)
    {
        Food::create($request->all());
        return redirect('/');
    }
    public function edit($id)
    {
        $food=Food::find($id);
       // dd($food);
        return view('pages.edit',compact(['food']));
    }
    public function update(Request $request,$id)
    {
        $food=Food::find($id);
        $food->update($request->all());
        return redirect('/');
    }
}
