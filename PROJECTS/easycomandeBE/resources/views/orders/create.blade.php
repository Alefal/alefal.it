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
                    <a href="{{ route('orders.index') }}">
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

                {!! Form::open(array('route' => 'orders.store','method'=>'POST')) !!}
                
                <div class="row">
                    <div class="col-xs-6 col-md-3">
                        <div class="form-group">
                            <label for="name">Cliente</label>
                            {!! Form::text('client', null, array('placeholder' => 'Cliente','class' => 'form-control')) !!}
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-3">
                        <div class="form-group">
                            <label for="city">Coperti</label>
                             {!! Form::number('covered', 0, array('placeholder' => 'Coperti','class' => 'form-control','step' => '1')) !!}
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-3">
                        <div class="form-group">
                            <label for="name">Totale Ordine</label>
                            {!! Form::number('totalorder', 0, array('placeholder' => 'Totale Ordine','class' => 'form-control','step' => '0.1')) !!}
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-3">
                        <div class="form-group">
                            <label for="city">Totale Servizio</label>
                             {!! Form::number('totalservice', 0, array('placeholder' => 'Totale Servizio','class' => 'form-control','step' => '0.1')) !!}
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 col-xs-12">
                        <div class="form-group">
                            <label for="date">Data</label>
                            {!! Form::date('date', Carbon\Carbon::parse('now')->format('D/M/Y'), array('placeholder' => 'Data','class' => 'form-control')) !!}
                        </div>
                    </div>
                    <div class="col-md-6 col-xs-12">
                        <div class="form-group">
                            <label for="states">Stato</label>
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
                            <!--
                            <input type="submit" value="Salva" class="submit" name="submit" id="btn-structures" />
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