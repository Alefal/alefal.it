<?php

namespace App\Http\Controllers;

use App\Notification;
use App\Order;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class NotificationsController extends Controller
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
        $items = Notification::orderBy('notifications.order_id','ASC')->paginate(100);
        $orders = Order::all();

        return view('notifications.index',compact('items','orders'))
            ->with('i', ($request->input('page', 1) - 1) * 5);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Notification::find($id)->delete();
        return redirect()->route('notifications.index')
                        ->with('success','Item deleted successfully');
    }
}
