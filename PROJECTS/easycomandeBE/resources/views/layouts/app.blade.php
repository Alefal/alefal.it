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

    <link href="{{ asset('/vendor/jasekz/laradrop/css/styles.css') }}" rel="stylesheet" type="text/css">

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
                                <i class="fa fa-plus" aria-hidden="true"></i>
                            </div>
                            <div class="title">Add</div>
                        </a>
                        <div class="dropdown-menu">
                            <ul>
                                <li class="section"><i class="fa fa-map-marker" aria-hidden="true"></i> POI</li>
                                <li class="line"></li>
                                <li><a href="{{ url('/categories') }}">Categories</a></li>
                                <li><a href="{{ url('/menu') }}">Menu</a></li>
                                <li><a href="{{ url('/orders') }}">Orders</a></li>
                                <li><a href="{{ url('/items') }}">Items</a></li>
                                <li><a href="{{ url('/notes') }}">Notes</a></li>
                                <li><a href="{{ url('/specials') }}">Specials</a></li>
                                <li><a href="{{ url('/extra') }}">Extra</a></li>
                                <li><a href="{{ url('/state') }}">States</a></li>
                                <li><a href="{{ url('/users') }}">Users</a></li>
                            </ul>
                        </div>
                    </li>

                    <!-- Users -->
                    <li class="dropdown">
                        <a href="{{ url('/filegator') }}">
                            <div class="icon">
                                <i class="fa fa-upload" aria-hidden="true"></i>
                            </div>
                            <div class="title">File Manager</div>
                        </a>
                    </li>

                    <!-- JSON -->
                    <li class="dropdown">
                        <a href="{{ url('/json') }}">
                            <div class="icon">
                                <i class="fa fa-code" aria-hidden="true"></i>
                            </div>
                            <div class="title">JSON</div>
                        </a>
                    </li>

                </ul>
            </div>
            <div class="sidebar-footer">
                <ul class="menu">
                    <li>
                        <a href="/" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-cogs" aria-hidden="true"></i>
                        </a>
                    </li>
                    <li><a href="#"><span class="flag-icon flag-icon-th flag-icon-squared"></span></a></li>
                </ul>
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
                                    {{ config('app.name', 'Costa Eventi') }}
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
                            <!-- TODO
                            <li class="navbar-search hidden-sm">
                                <input id="search" type="text" placeholder="Search..">
                                <button class="btn-search"><i class="fa fa-search"></i></button>
                            </li>
                            -->
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <!-- TODO
                            <li class="dropdown notification">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <div class="icon"><i class="fa fa-shopping-basket" aria-hidden="true"></i></div>
                                    <div class="title">New Orders</div>
                                    <div class="count">0</div>
                                </a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <li class="dropdown-header">Ordering</li>
                                        <li class="dropdown-empty">No New Ordered</li>
                                        <li class="dropdown-footer">
                                            <a href="#">View All <i class="fa fa-angle-right" aria-hidden="true"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            -->

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
                                        <!-- TODO
                                        <li>
                                            <a href="#">
                                                <span class="badge badge-danger pull-right">5</span> My Inbox
                                            </a>
                                        </li>
                                        -->
                                        <li>
                                            <a href="{{ route('logout') }}" onclick="event.preventDefault();
                                                        document.getElementById('logout-form').submit();">
                                                Logout
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

                <!-- Modal LARADROP -->
                <div class="modal fade" id="modalLaradrop" tabindex="-1" role="dialog" aria-labelledby="modalLaradropLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                <h4 class="modal-title" id="modalLaradropLabel">Upload Image</h4>
                            </div>
                            <div class="modal-body">
                                <div class="laradrop" laradrop-csrf-token="{{ csrf_token() }}"></div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>

        <!-- Scripts -->
        <script src="{{ asset('js/app.js') }}"></script>
        <script src="{{ asset('js/all.js') }}"></script>

        <script src="{{ asset('js/jquery-ui.min.js') }}" ></script>
        <script src="{{ asset('vendor/jasekz/laradrop/js/enyo.dropzone.js') }}"></script>
        <script src="{{ asset('vendor/jasekz/laradrop/js/laradrop.js') }}"></script>

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
    <script src="{{ asset('js/custom.js') }}"></script>
    -->

        <!-- Tutte le librerie JS sono incluse nel file app.js -->

</body>

</html>
