<?php

namespace App\Http\Controllers;

use App\Special;
use App\Order;
use App\State;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class SpecialsController extends Controller
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
        $items = Special::orderBy('specials.special','ASC')->paginate(100);
        $orders = Order::all();

        return view('specials.index',compact('items','orders'))
            ->with('i', ($request->input('page', 1) - 1) * 5);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $orders = Order::all();
        $states = State::all();
        return view('specials.create',compact('orders','states'));
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
            'special' => 'required',
            'price' => 'required',
            'order_id' => 'required'
        ]);

        $item = new Special();
        $item->special      = $request->special;
        $item->price        = $request->price;
        $item->note         = $request->note;
        $item->order_id     = $request->order_id;
        $item->state_id     = $request->state_id;

        $stateName  = State::find($item->state_id)->state;
        $item->statename    = $stateName;

        //Save ITEM
        $item->save();

        //Save ORDER
        recalculateTotalOrder($request->order_id);

        //Special::create($request->all());
        return redirect()->route('specials.index')
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
        $item = Special::find($id);
        $orders = Order::all();

        return view('specials.show',compact('item','orders'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $item       = Special::find($id);
        $orders     = Order::all();
        $states     = State::all();

        $selectedOrder   = Special::find($id)->order_id;
        $selectedState   = Special::find($id)->state_id;
        
        return view('specials.edit',compact('item','orders','states','selectedOrder','selectedState'));
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
            'special' => 'required',
            'price' => 'required',
            'order_id' => 'required'
        ]);

        $item = Special::find($id);
        $item->special      = $request->special;
        $item->price        = $request->price;
        $item->note         = $request->note;
        $item->state_id     = $request->state_id;

        //Save ITEM
        $item->save();
        
        //Save ORDER
        recalculateTotalOrder($request->order_id);

        //Special::find($id)->update($request->all());
        return redirect()->route('specials.index')
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
        //Special::find($id)->delete();

        $item = Special::find($id);
        $orderId = $item->order_id;
        $item->delete();

        //Save ORDER
        recalculateTotalOrder($orderId);

        return redirect()->route('specials.index')
                        ->with('success','Item deleted successfully');
    }
}
