@extends('layouts.app')

@section('content')

<div class="row">
    <div class="col-lg-12 margin-tb">
        <div class="card card-mini">
            <div class="card-header">
                <h4 class="card-title">
                    Create New Item
                </h4>
                <div class="card-action">
                    <a href="{{ route('notes.index') }}">
                        <i class="fa fa-arrow-circle-o-left fa-3x fa-fw" aria-hidden="true"></i>
                    </a>
                </div>
            </div>
            <div class="card-body">

                @if (count($errors) > 0)
                    <div class="alert alert-danger">
                        <strong>Whoops!</strong> There were some problems with your input.<br><br>
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                {!! Form::open(array('route' => 'notes.store','method'=>'POST')) !!}
                
                <div class="row">
                    <div class="col-xs-6 col-md-6">
                        <div class="form-group">
                            <label for="name">Note</label>
                            {!! Form::text('note', null, array('placeholder' => 'Note','class' => 'form-control')) !!}
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-6">
                        <div class="form-group">
                            <label for="categories">Orders</label>
                            <select class="form-control" name="order_id">
                                @foreach($orders as $item)
                                    <option value="{{$item->id}}">{{$item->client}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row padding">
                    <div class="col-md-12 col-xs-12 center">
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-lg btn-block">
                                <i class="fa fa-floppy-o" aria-hidden="true"></i> Save
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