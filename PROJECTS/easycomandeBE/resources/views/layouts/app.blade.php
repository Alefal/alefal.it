<!DOCTYPE html>
<html lang="{{ config('app.locale') }}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'EasyComande') }}</title>

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link href="{{ asset('css/all.css') }}" rel="stylesheet">

</head>

<body>
    <div id="app" class="app app-default">

        @if (Auth::check())
        <aside class="app-sidebar" id="sidebar">
            <div class="sidebar-header">
                <a class="sidebar-brand" href="{{ url('/') }}">
                    <img class="logoSmall" src="{{ asset('img/logo-small.png') }}">
                </a>            
                <button type="button" class="sidebar-toggle">
                    <i class="fa fa-times"></i>
                </button>
            </div>
            <div class="sidebar-menu">
                <ul class="sidebar-nav">

                    <!-- Dashboard -->
                    <li class="active">
                        <a href="{{ url('/home') }}">
                            <div class="icon">
                                <i class="fa fa-tasks" aria-hidden="true"></i>
                            </div>
                            <div class="title">AMMINISTRAZIONE</div>
                        </a>
                    </li>

                    <!-- Sights -->
                    <li class="dropdown">
                        <a href="javascripot:void(0);">
                            <div class="icon">
                                <i class="fa fa-cogs" aria-hidden="true"></i>
                            </div>
                            <div class="title">Gestione</div>
                        </a>
                        <div class="dropdown-menu">
                            <ul>
                                <li class="section"><i class="fa fa-cogs" aria-hidden="true"></i> Gestione</li>
                                <li class="line"></li>
                                @if(Auth::user()->role == 'admin')
                                @endif
                                <li><a href="{{ url('/configurations') }}">Configurazioni</a></li>
                                <li><a href="{{ url('/categories') }}">Categorie</a></li>
                                <li><a href="{{ url('/menu') }}">Menu</a></li>
                                <li><a href="{{ url('/orders') }}">Ordinazioni</a></li>
                                <li><a href="{{ url('/items') }}">Piatti</a></li>
                                <li><a href="{{ url('/notes') }}">Note</a></li>
                                <li><a href="{{ url('/specials') }}">Speciali</a></li>
                                @if(Auth::user()->role == 'admin')
                                    <li><a href="{{ url('/extra') }}">Extra</a></li>
                                    <li><a href="{{ url('/state') }}">Stati</a></li>
                                    <li><a href="{{ url('/users') }}">Utenti</a></li>
                                    <li><a href="{{ url('/notifications') }}">Notifiche</a></li>
                                @endif
                            </ul>
                        </div>
                    </li>

                    @if(Auth::user()->role == 'admin')
                        <!-- JSON -->
                        <li class="dropdown">
                            <a href="{{ url('/json') }}">
                                <div class="icon">
                                    <i class="fa fa-code" aria-hidden="true"></i>
                                </div>
                                <div class="title">JSON</div>
                            </a>
                        </li>
                    @endif

                </ul>
            </div>
            <div class="sidebar-footer" style="padding: 25px !important;text-align: center;">
                <div class="appVersion">
                    <span class="badge badge-danger">Version 2.0.2</span>
                </div>
            </div>
        </aside>
        @endif

        <div class="app-container">

            @if (Auth::check())
            <nav class="navbar navbar-default" id="navbar">
                <div class="container-fluid">
                    <div class="navbar-collapse collapse in">
                        <ul class="nav navbar-nav navbar-mobile">
                            <li>
                                <button type="button" class="sidebar-toggle">
                                <i class="fa fa-bars"></i>
                            </button>
                            </li>
                            <li class="logo">
                                <a class="navbar-brand" href="{{ url('/') }}">
                                    {{ config('app.name', 'EasyComande') }}
                                </a>
                            </li>
                            <li>
                                <button type="button" class="navbar-toggle">
                                <img class="profile-img" src="{{ asset('img/flat-avatar.png') }}">
                            </button>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-left">
                            <li class="navbar-title">AMMINISTRAZIONE</li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown profile">
                                <a href="/html/pages/profile.html" class="dropdown-toggle" data-toggle="dropdown">
                                    <img class="profile-img" src="{{ asset('img/flat-avatar.png') }}">
                                    <div class="title">Profile</div>
                                </a>
                                <div class="dropdown-menu">
                                    <div class="profile-info">
                                        <h4 class="username">{{ Auth::user()->name }}</h4>
                                    </div>
                                    <ul class="action">
                                        <li>
                                            <span class="badge badge-danger pull-right">{{ Auth::user()->role }}</span>
                                        </li>
                                        <li>
                                            <a href="{{ route('logout') }}" onclick="event.preventDefault();document.getElementById('logout-form').submit();">
                                                Esci
                                            </a>
                                            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                                {{ csrf_field() }}
                                            </form>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
            </nav>
            @endif @yield('content')

            </div>

        </div>

        <!-- Scripts -->
        <script src="{{ asset('js/app.js') }}"></script>
        <script src="{{ asset('js/all.js') }}"></script>

        <script src="{{ asset('js/jquery-ui.min.js') }}" ></script>

        <script src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=hohsbo3zqb8d3y3c1i7323r4ite25f3mnjzg4imjf7zknhxa"></script>
        <script>
            tinymce.init({
                selector: 'textarea',
                plugins: "link"
            });
        </script>

        <!-- Da eliminare e includere in webpack
        <script src="{{ asset('js/jquery-3.2.1.min.js') }}"></script>
        <script src="{{ asset('js/sweetalert-dev.js') }}"></script>
        <script src="../js/custom.js"></script>
        -->

        <!-- Tutte le librerie JS sono incluse nel file app.js -->

</body>

</html>
