@extends('layouts.app')

@section('content')

<div class="row homeSectionCount">

    @if(Auth::user()->role == 'admin')
        <!-- numConfigurations -->
        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
            <a class="card card-banner card-green-light" href="{{ url('/configurations') }}">
                <div class="card-body">
                    <i class="icon fa fa-cogs fa-4x"></i>
                    <div class="content">
                        <div class="title">Configurazioni</div>
                        <div class="value">{{ $numConfigurations }}</div>
                    </div>
                </div>
            </a>
        </div>
    @endif

    <!-- numCategories -->
    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
        <a class="card card-banner card-orange-light" href="{{ url('/categories') }}">
            <div class="card-body">
                <i class="icon fa fa-th-list fa-4x"></i>
                <div class="content">
                    <div class="title">Categorie</div>
                    <div class="value">{{ $numCategories }}</div>
                </div>
            </div>
        </a>
    </div>

    <!-- numMenu -->
    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
        <a class="card card-banner card-blue-light" href="{{ url('/menu') }}">
            <div class="card-body">
                <i class="icon fa fa-book fa-4x"></i>
                <div class="content">
                    <div class="title">Menu</div>
                    <div class="value">{{ $numMenu }}</div>
                </div>
            </div>
        </a>
    </div>

    <!-- numOrders -->
   <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
        <a class="card card-banner card-yellow-light" href="{{ url('/orders') }}">
            <div class="card-body">
                <i class="icon fa fa-pencil fa-4x"></i>
                <div class="content">
                    <div class="title">Ordinazioni</div>
                    <div class="value">{{ $numOrders }}</div>
                </div>
            </div>
        </a>
    </div>

    <!-- numItems -->
    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
        <a class="card card-banner card-orange-light" href="{{ url('/items') }}">
            <div class="card-body">
                <i class="icon fa fa-list-ol fa-4x"></i>
                <div class="content">
                    <div class="title">Prodotti</div>
                    <div class="value">{{ $numItems }}</div>
                </div>
            </div>
        </a>
    </div>

    <!-- numExtras -->
    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
        <a class="card card-banner card-green-light" href="{{ url('/extra') }}">
            <div class="card-body">
                <i class="icon fa fa-asterisk fa-4x"></i>
                <div class="content">
                    <div class="title">Extra</div>
                    <div class="value">{{ $numExtras }}</div>
                </div>
            </div>
        </a>
    </div>

    <!-- numSpecials -->
    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
        <a class="card card-banner card-yellow-light" href="{{ url('/specials') }}">
            <div class="card-body">
                <i class="icon fa fa-star fa-4x"></i>
                <div class="content">
                    <div class="title">Speciali</div>
                    <div class="value">{{ $numSpecials }}</div>
                </div>
            </div>
        </a>
    </div>

    <!-- numNotes -->
    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
        <a class="card card-banner card-blue-light" href="{{ url('/notes') }}">
            <div class="card-body">
                <i class="icon fa fa-sticky-note-o fa-4x"></i>
                <div class="content">
                    <div class="title">Note</div>
                    <div class="value">{{ $numNotes }}</div>
                </div>
            </div>
        </a>
    </div>

    @if(Auth::user()->role == 'admin')
        <!-- numStates -->
        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
            <a class="card card-banner card-orange-light" href="{{ url('/state') }}">
                <div class="card-body">
                    <i class="icon fa fa-clock-o fa-4x"></i>
                    <div class="content">
                        <div class="title">Stati</div>
                        <div class="value">{{ $numStates }}</div>
                    </div>
                </div>
            </a>
        </div>    

        <!-- numUsers -->
        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
            <a class="card card-banner card-yellow-light" href="{{ url('/users') }}">
                <div class="card-body">
                    <i class="icon fa fa-users fa-4x"></i>
                    <div class="content">
                        <div class="title">Utenti</div>
                        <div class="value">{{ $numUsers }}</div>
                    </div>
                </div>
            </a>
        </div>
    @endif

</div>

@endsection
