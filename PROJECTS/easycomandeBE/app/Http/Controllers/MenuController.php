<?php

namespace App\Http\Controllers;

use App\Menu;
use App\Category;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class MenuController extends Controller
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
        $items = Menu::orderBy('menu.category_id','ASC')->paginate(25);
        $categories = Category::all();

        return view('menu.index',compact('items','categories'))
            ->with('i', ($request->input('page', 1) - 1) * 5);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::all();
        return view('menu.create',compact('categories'));
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
            'photo'         => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'name'          => 'required',
            'price'         => 'required',
            'category_id'   => 'required'
        ]);

        $menu       = new Menu();
        if($request->file('photo') != null || $request->file('photo') != '') {
            $image = $request->file('photo');
            $photoName = time().'.'.$image->getClientOriginalExtension();
            $destinationPath = base_path(env('PUBLIC_PATH_PHOTOS'));
            $image->move($destinationPath, $photoName);
        
            $menu->photo        = $photoName;
        }

        $menu->name         = $request->name;
        $menu->description  = $request->description;
        $menu->price        = $request->price;
        $menu->priceoffer   = $request->priceoffer;
        $menu->category_id  = $request->category_id;

        $menu->save();

        /* UPDATE COUNT
        $menu           = Menu::create($request->all());
        $category_id    = $menu->category_id;

        $category = Category::find($category_id);
        $category->count = $category->count + 1;
        $category->save;
        */

        return redirect()->route('menu.index')
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
        $item = Menu::find($id);
        $categories = Category::all();

        return view('menu.show',compact('item','categories'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $item       = Menu::find($id);
        $categories = Category::all();

        $selectedCategory   = Menu::find($id)->category_id;
        $selectedPhoto      = env('PUBLIC_PATH_PHOTOS').'/'.Menu::find($id)->photo;
        
        return view('menu.edit',compact('item','categories','selectedCategory','selectedPhoto'));
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
            //'photo'         => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'name'          => 'required',
            'price'         => 'required',
            'category_id'   => 'required'
        ]);

        $menu       = Menu::find($id);
        if($request->file('photo') != null || $request->file('photo') != '') {
            $image              = $request->file('photo');
            $photoName          = time().'.'.$image->getClientOriginalExtension();
            $destinationPath    = base_path(env('PUBLIC_PATH_PHOTOS'));
            $image->move($destinationPath, $photoName);
        
            $menu->photo        = $photoName;
        } else {
            if($request->photo != '') {
                $menu->photo = $request->photo;
            } else {
                $menu->photo = '';                
            }
        }

        $menu->name         = $request->name;
        $menu->description  = $request->description;
        $menu->price        = $request->price;
        $menu->priceoffer   = $request->priceoffer;
        $menu->category_id  = $request->category_id;

        $menu->update();

        //Menu::find($id)->update($request->all());
        return redirect()->route('menu.index')
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
        Menu::find($id)->delete();
        return redirect()->route('menu.index')
                        ->with('success','Item deleted successfully');
    }
}
