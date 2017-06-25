@extends('layouts.app') @section('content')

<div class="row">
    <div class="col-lg-12 margin-tb">
        <div class="card card-mini">
            <div class="card-header">
                <h4 class="card-title">
                    Aggiungi nuovo
                </h4>
                <div class="card-action">
                    <a href="{{ route('users.index') }}">
                        <i class="fa fa-arrow-circle-o-left fa-3x fa-fw" aria-hidden="true"></i>
                    </a>
                </div>
            </div>
            <div class="card-body">

                @if (count($errors) > 0)
                <div class="alert alert-danger">
                    <strong>Attenzione!</strong> Ci sono problemi con i dati inseriti.<br><br>
                    <ul>
                        @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
                @endif 
                
                {!! Form::open(array('route' => 'users.store','method'=>'POST')) !!}

                    {!! Form::hidden('remember_token', 'no', array('placeholder' => 'remember_token','class' => 'form-control')) !!}
                
                    <div class="row">
                        <div class="col-xs-6 col-md-6">
                            <div class="form-group">
                                <label for="name">Nome</label>
                                {!! Form::text('name', null, array('placeholder' => 'Nome','class' => 'form-control')) !!}
                            </div>
                        </div>
                        <div class="col-xs-6 col-md-6">
                            <div class="form-group">
                                <label for="Prezzo">Email</label>
                                {!! Form::text('email', null, array('placeholder' => 'Email','class' => 'form-control')) !!}
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 col-xs-12 center">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Password</label>
                                <div class="col-md-9">
                                    {!! Form::text('password', null, array('placeholder'  => 'Password','class' => 'form-control')) !!}
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 col-xs-12 center">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Ruolo</label>
                                <div class="col-md-9">
                                    <select name="role" class="form-control">
                                        <option value="admin">Administrator</option>
                                        <option value="manager">Manager</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row padding">
                        <div class="col-md-12 col-xs-12 center">
                            <div class="form-group">
                                <!--
                                <input type="submit" value="Salva" class="submit" name="submit" id="btn-sights" />
                                -->
                                <button type="submit" class="btn btn-primary btn-lg btn-block">
                                    <i class="fa fa-floppy-o" aria-hidden="true"></i> Salva
                                </button>
                            </div>
                        </div>
                    </div>

                {!! Form::close() !!}

            </div>
        </div>
    </div>
</div>

@endsection