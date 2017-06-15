<?php

namespace App\Http\Controllers;

use App\Item;
use App\Menu;
use App\Order;
use App\State;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ItemsController extends Controller
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
        $items = Item::orderBy('items.id','ASC')->paginate(100);
        $orders = Order::all();

        return view('items.index',compact('items','orders'))
            ->with('i', ($request->input('page', 1) - 1) * 5);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $menu = Menu::all();
        $orders = Order::all();
        $states = State::all();
        
        return view('items.create',compact('menu','orders','states'));
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
            'quantity' => 'required',
            'menu_id' => 'required',
            'order_id' => 'required',
            'state_id' => 'required'
        ]);

        $menu       = Menu::find($request->menu_id);
        $quantity   = $request->quantity;
        $total      = $menu->price * $quantity;
        $service    = ($menu->price * $quantity) * 10 / 100;
        
        $item = new Item();
        $item->quantity     = $quantity;
        $item->total        = $total;
        $item->service      = $service;
        $item->note         = $request->note;
        $item->menu_id      = $request->menu_id;
        $item->order_id     = $request->order_id;
        $item->state_id     = $request->state_id;

        $menuName   = Menu::find($item->menu_id)->name;
        $stateName  = State::find($item->state_id)->state;

        $item->menuname     = $menuName;
        $item->statename    = $stateName;

        $item->save();

        //Item::create($item);
        return redirect()->route('items.index')
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
        $item = Item::find($id);
        return view('items.show',compact('item'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $item   = Item::find($id);
        $menu   = Menu::all();
        $orders = Order::all();
        $states = State::all();

        $selectedMenu   = Item::find($id)->menu_id;
        $selectedOrder  = Item::find($id)->order_id;
        $selectedState  = Item::find($id)->state_id;

        return view('items.edit',compact('item','menu','orders','states','selectedMenu','selectedOrder','selectedState'));
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
            'quantity' => 'required',
            'menu_id' => 'required',
            'order_id' => 'required',
            'state_id' => 'required'
        ]);

        $menu       = Menu::find($request->menu_id);
        $quantity   = $request->quantity;
        $total      = $menu->price * $quantity;
        $service    = ($menu->price * $quantity) * 10 / 100;
        
        $item = Item::find($id);
        $item->quantity     = $quantity;
        $item->total        = $total;
        $item->service      = $service;
        $item->note         = $request->note;
        $item->menu_id      = $request->menu_id;
        $item->order_id     = $request->order_id;
        $item->state_id     = $request->state_id;

        $menuName   = Menu::find($item->menu_id)->name;
        $stateName  = State::find($item->state_id)->state;

        $item->menuname     = $menuName;
        $item->statename    = $stateName;

        $item->save();

        //Item::find($id)->update($request->all());
        return redirect()->route('items.index')
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
        Item::find($id)->delete();
        return redirect()->route('items.index')
                        ->with('success','Item deleted successfully');
    }
}
