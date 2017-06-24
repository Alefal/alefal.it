@extends('layouts.app')

@section('content')

<div class="row">
    <div class="col-lg-12 margin-tb">
        <div class="card card-mini">
            <div class="card-header">
                <h4 class="card-title">
                    Aggiungi nuovo
                </h4>
                <div class="card-action">
                    <a href="{{ route('specials.index') }}">
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

                {!! Form::open(array('route' => 'specials.store','method'=>'POST')) !!}
                
                <div class="row">
                    <div class="col-xs-6 col-md-4">
                        <div class="form-group">
                            <label for="name">Speciale</label>
                            {!! Form::text('special', null, array('placeholder' => 'Speciale','class' => 'form-control')) !!}
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-4">
                        <div class="form-group">
                            <label for="name">Prezzo</label>
                            {!! Form::number('price', null, array('placeholder' => 'Prezzo','class' => 'form-control')) !!}
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-4">
                        <div class="form-group">
                            <label for="categories">Ordinazioni</label>
                            <select class="form-control" name="order_id">
                                @foreach($orders as $order)
                                    <option value="{{$order->id}}">{{$order->client}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 col-xs-8 center">
                        <div class="form-group">
                            <label for="note">Nota</label>
                            {!! Form::text('note', null, array('placeholder' => 'Nota','class' => 'form-control')) !!}
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-4">
                        <div class="form-group">
                            <label for="state_id">Stato</label>
                            <select class="form-control" name="state_id">
                                @foreach($states as $state)
                                    <option value="{{$state->id}}">{{$state->state}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row padding">
                    <div class="col-md-12 col-xs-12 center">
                        <div class="form-group">
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