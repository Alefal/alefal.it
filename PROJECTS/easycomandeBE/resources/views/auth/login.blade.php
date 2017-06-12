@extends('layouts.app')

@section('content')

<div class="loginAuthentication app-login">
    <div class="flex-center">
        <div class="app-header"></div>
        <div class="app-body">
            <div class="app-block">
                <div class="app-form">
                    <div class="form-header">                    
                        <div class="app-brand"><span class="highlight">
                            <img src="img/logo-landing.png" />
                        </div>
                    </div>
                    <form class="form-signin" role="form" method="POST" action="{{ route('login') }}">
                        {{ csrf_field() }}

                        <div class="input-group form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                             <span class="input-group-addon" id="basic-addon1">
                            <i class="fa fa-user" aria-hidden="true"></i></span>
                            <input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}" required autofocus placeholder="E-Mail Address" />
                        </div>
                        @if ($errors->has('email'))
                            <span class="help-block">
                                <strong>{{ $errors->first('email') }}</strong>
                            </span>
                        @endif

                        <div class="input-group form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                            <span class="input-group-addon" id="basic-addon2">
                            <i class="fa fa-key" aria-hidden="true"></i></span>
                            <input id="password" type="password" class="form-control" name="password" required placeholder="Password" />
                        </div>
                        @if ($errors->has('password'))
                            <span class="help-block">
                                <strong>{{ $errors->first('password') }}</strong>
                            </span>
                        @endif

                        <div class="text-center">
                            <button class="btn btn-success btn-submit btn-large" type="submit">Login</button>
                        </div>

                        <!--
                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-4">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}> Remember Me
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-8 col-md-offset-4">
                                <button type="submit" class="btn btn-primary">
                                    Login
                                </button>

                                <a class="btn btn-link" href="{{ route('password.request') }}">
                                    Forgot Your Password?
                                </a>
                            </div>
                        </div>
                        -->
                    </form>

                     <div class="form-line">
                        <div class="title">&nbsp;</div>
                    </div>
                    <!--
                    <div class="form-footer">
                        <a href="{{ route('register') }}">Register</a>
                    </div>
                    -->

                </div>
            </div>
        </div>
        <div class="app-footer">
        </div>
    </div>
</div>

@endsection
