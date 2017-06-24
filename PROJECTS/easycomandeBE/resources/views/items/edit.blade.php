@extends('layouts.app') @section('content')

<div class="row">
    <div class="col-lg-12 margin-tb">
        <div class="card card-mini">
            <div class="card-header">
                <h4 class="card-title"></h4>
                <div class="card-action">
                    <a href="{{ route('items.index') }}">
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
                @endif {!! Form::model($item, ['method' => 'PATCH','route' => ['items.update', $item->id]]) !!}

               <div class="row">
                    <div class="col-xs-6 col-md-4">
                        <div class="form-group">
                            <label for="quantity">Qnt</label>
                            {!! Form::number('quantity', null, array('placeholder' => 'Qnt','class' => 'form-control')) !!}
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-4">
                        <div class="form-group">
                            <label for="menu_id">Menu</label>
                            <select class="form-control disabled" name="menu_id">
                                @foreach($menu as $piatto)
                                    <option value="{{ $piatto->id }}" {{ $selectedMenu == $piatto->id ? 'selected="selected"' : '' }}>{{ $piatto->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-4">
                        <div class="form-group">
                            <label for="order_id">Ordinazione</label>
                            <select class="form-control disabled" name="order_id">
                                @foreach($orders as $order)
                                    <option value="{{ $order->id }}" {{ $selectedOrder == $order->id ? 'selected="selected"' : '' }}>{{ $order->client }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 col-xs-8 center">
                        <div class="form-group">
                            <label for="note">Note</label>
                            {!! Form::text('note', null, array('placeholder' => 'Note','class' => 'form-control')) !!}
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-4">
                        <div class="form-group">
                            <label for="state_id">Stato</label>
                            <select class="form-control" name="state_id">
                                @foreach($states as $state)
                                    <option value="{{ $state->id }}" {{ $selectedState == $state->id ? 'selected="selected"' : '' }}>{{ $state->state }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 col-xs-12 center">
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-lg btn-block">
                                <i class="fa fa-floppy-o" aria-hidden="true"></i> Modifica
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