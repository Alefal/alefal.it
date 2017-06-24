@extends('layouts.app') @section('content')

<div class="row">
    <div class="col-lg-12 margin-tb">
        <div class="card card-mini">
            <div class="card-header">
                <h4 class="card-title">
                    Modifica: {{ $item->name }}
                </h4>
                <div class="card-action">
                    <a href="{{ route('menu.index') }}">
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
                @endif {!! Form::model($item, ['method' => 'PATCH','route' => ['menu.update', $item->id]]) !!}

                <div class="row">
                    <div class="col-xs-6 col-md-4">
                        <div class="form-group">
                            <label for="name">Nome</label>
                            {!! Form::text('name', null, array('placeholder' => 'Nome','class' => 'form-control')) !!}
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-4">
                        <div class="form-group">
                            <label for="Prezzo">Prezzo</label>
                            {!! Form::text('price', null, array('placeholder' => 'Prezzo','class' => 'form-control')) !!}
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-4">
                        <div class="form-group">
                            <label for="id">Prezzo Offerta</label>
                            {!! Form::text('priceoffer', null, array('placeholder' => 'Prezzo Offerta','class' => 'form-control')) !!}
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-6 col-md-12">
                        <div class="form-group">
                            <label for="categories">Categorie</label>
                            <select class="form-control disabled" name="category_id">
                                @foreach($categories as $cat)
                                    <option value="{{ $cat->id }}" {{ $selectedCategory == $cat->id ? 'selected="selected"' : '' }}>{{ $cat->name }}</option>
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