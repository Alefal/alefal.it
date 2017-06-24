@extends('layouts.app') @section('content')

<div class="row">
    <div class="col-lg-12 margin-tb">
        <div class="card card-mini">
            <div class="card-header">
                <h4 class="card-title">
                    Modifica: {{ $item->name }}
                </h4>
                <div class="card-action">
                    <a href="{{ route('configurations.index') }}">
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
                @endif {!! Form::model($item, ['method' => 'PATCH','route' => ['configurations.update', $item->id]]) !!}

                <div class="row">
                    <div class="col-xs-6 col-md-6">
                        <div class="form-group">
                            <label for="Chiave">Chiave</label>
                            {!! Form::text('key', null, array('placeholder' => 'Chiave','class' => 'form-control')) !!}
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-6">
                        <div class="form-group">
                            <label for="Descrizione">Descrizione</label>
                            {!! Form::text('label', null, array('placeholder' => 'Descrizione','class' => 'form-control')) !!}
                        </div>
                    </div>
                </div>

                <div class="row">
                     <div class="col-xs-6 col-md-6">
                        <div class="form-group">
                            <label for="Abilitato">Abilitato</label>
                            <select class="form-control" name="enable">
                                @if ($item->enable)
                                    <option value="0">NO</option>
                                    <option value="1" selected="selected">SI</option>
                                @else
                                    <option value="0">NO</option>
                                    <option value="1">SI</option>
                                @endif
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-6">
                        <div class="form-group">
                            <label for="Valore">Valore</label>
                             {!! Form::text('value', null, array('placeholder' => 'Valore','class' => 'form-control')) !!}
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