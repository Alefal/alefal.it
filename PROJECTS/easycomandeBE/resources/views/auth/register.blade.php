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
                    <form class="form-signin" role="form" method="POST" action="{{ route('register') }}">
                        {{ csrf_field() }}

                        <div class="input-group form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                            <span class="input-group-addon" id="basic-addon1">
                            <i class="fa fa-user" aria-hidden="true"></i></span>
                            <input id="name" type="text" class="form-control" name="name" value="{{ old('name') }}" required autofocus placeholder="Name" />
                        </div>
                        @if ($errors->has('name'))
                            <span class="help-block">
                                <strong>{{ $errors->first('name') }}</strong>
                            </span>
                        @endif

                        <div class="input-group form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                            <span class="input-group-addon" id="basic-addon1">
                            <i class="fa fa-envelope" aria-hidden="true"></i></span>
                            <input id="email" type="text" class="form-control" name="email" value="{{ old('email') }}" required placeholder="E-Mail Address" />
                        </div>
                        @if ($errors->has('email'))
                            <span class="help-block">
                                <strong>{{ $errors->first('email') }}</strong>
                            </span>
                        @endif

                        <div class="input-group form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                            <span class="input-group-addon" id="basic-addon1">
                            <i class="fa fa-key" aria-hidden="true"></i></span>
                            <input id="password" type="password" class="form-control" name="password" required placeholder="Password" />
                        </div>
                        @if ($errors->has('password'))
                            <span class="help-block">
                                <strong>{{ $errors->first('password') }}</strong>
                            </span>
                        @endif

                        <div class="input-group form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                            <span class="input-group-addon" id="basic-addon1">
                            <i class="fa fa-key" aria-hidden="true"></i></span>
                            <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required placeholder="Confirm Password" />
                        </div>

                        <div class="text-center">
                            <button class="btn btn-success btn-submit btn-large" type="submit">Register</button>
                        </div>
                    </form>

                    <div class="form-line">
                        <div class="title">OR</div>
                    </div>

                    <div class="form-footer">
                        <a href="{{ route('login') }}">Login</a>
                    </div>

                </div>
            </div>
        </div>
        <div class="app-footer">
        </div>
    </div>
</div>
@endsection

<!--
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Register</div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" method="POST" action="{{ route('register') }}">
                        {{ csrf_field() }}

                        <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                            <label for="name" class="col-md-4 control-label">Name</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control" name="name" value="{{ old('name') }}" required autofocus>

                                @if ($errors->has('name'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('name') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                            <label for="email" class="col-md-4 control-label">E-Mail Address</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}" required>

                                @if ($errors->has('email'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                            <label for="password" class="col-md-4 control-label">Password</label>

                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control" name="password" required>

                                @if ($errors->has('password'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="password-confirm" class="col-md-4 control-label">Confirm Password</label>

                            <div class="col-md-6">
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-4">
                                <button type="submit" class="btn btn-primary">
                                    Register
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
-->