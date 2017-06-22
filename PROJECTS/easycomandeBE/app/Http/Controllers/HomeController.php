<?php

namespace App\Http\Controllers;

use App\Configuration;
use App\Category;
use App\Menu;
use App\Order;
use App\Item;
use App\Extra;
use App\Special;
use App\Note;
use App\State;
use App\User;

use Illuminate\Http\Request;

class HomeController extends Controller
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
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $numConfigurations      = Configuration::count();
        $numCategories          = Category::count();
        $numMenu                = Menu::count();
        $numOrders              = Order::count();
        $numItems               = Item::count();
        $numExtras              = Extra::count();
        $numSpecials            = Special::count();
        $numNotes               = Note::count();
        $numStates              = State::count();
        $numUsers               = User::count();

        return view('home',compact([
            'numConfigurations',
            'numCategories',
            'numMenu',
            'numOrders',
            'numItems',
            'numExtras',
            'numSpecials',
            'numNotes',
            'numStates',
            'numUsers'
        ]));
    }
}
