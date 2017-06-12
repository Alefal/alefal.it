<?php

namespace App\Http\Controllers;

use App\Order;
use App\State;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class OrdersController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $items = Order::orderBy('client','ASC')->paginate(100);
        $states = State::all();

        return view('orders.index',compact('items','states'))
            ->with('i', ($request->input('page', 1) - 1) * 5);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $states = State::all();
        return view('orders.create',compact('states'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'client' => 'required',
            'date' => 'required',
            'totalorder' => 'required',
            'totalservice' => 'required',
            'state_id' => 'required'
        ]);

        Order::create($request->all());
        return redirect()->route('orders.index')
                        ->with('success','Item created successfully');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $item = Order::find($id);
        $states = State::all();
        return view('orders.show',compact('item','states'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $item  = Order::find($id);
        $states = State::all();

        $selectedState   = Order::find($id)->state_id;

        return view('orders.edit',compact('item','states','selectedState'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'client' => 'required',
            'date' => 'required',
            'totalorder' => 'required',
            'totalservice' => 'required',
            'state_id' => 'required'
        ]);

        Order::find($id)->update($request->all());
        return redirect()->route('orders.index')
                        ->with('success','Item updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Order::find($id)->delete();
        return redirect()->route('orders.index')
                        ->with('success','Item deleted successfully');
    }
}
