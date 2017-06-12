<?php

namespace App\Http\Controllers;

use App\Note;
use App\Order;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class NotesController extends Controller
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
        $items = Note::orderBy('notes.note','ASC')->paginate(100);
        $orders = Order::all();

        return view('notes.index',compact('items','orders'))
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
        return view('notes.create',compact('orders'));
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
            'note' => 'required',
            'order_id' => 'required'
        ]);

        Note::create($request->all());
        return redirect()->route('notes.index')
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
        $item = Note::find($id);
        $orders = Order::all();

        return view('notes.show',compact('item','orders'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $item       = Note::find($id);
        $orders     = Order::all();

        $selectedOrder   = Note::find($id)->order_id;
        
        return view('notes.edit',compact('item','orders','selectedOrder'));
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
            'note' => 'required',
            'order_id' => 'required'
        ]);

        Note::find($id)->update($request->all());
        return redirect()->route('notes.index')
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
        Note::find($id)->delete();
        return redirect()->route('notes.index')
                        ->with('success','Item deleted successfully');
    }
}
