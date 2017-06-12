@extends('layouts.app') @section('content')

<div class="row">
    <div class="col-lg-12 margin-tb">
        <div class="card card-mini">
            <div class="card-header">
                <h4 class="card-title">
                    {{ $item->id }}
                </h4>
                <div class="card-action">
                    <a href="{{ route('items.index') }}">
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
                @endif {!! Form::model($item, ['method' => 'PATCH','route' => ['items.update', $item->id]]) !!}

               <div class="row">
                    <div class="col-xs-6 col-md-4">
                        <div class="form-group">
                            <label for="quantity">Quantity</label>
                            {!! Form::number('quantity', null, array('placeholder' => 'Quantity','class' => 'form-control')) !!}
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-4">
                        <div class="form-group">
                            <label for="menu_id">Menu</label>
                            <select class="form-control" name="menu_id">
                                @foreach($menu as $item)
                                    <option value="{{ $item->id }}" {{ $selectedMenu == $item->id ? 'selected="selected"' : '' }}>{{ $item->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-4">
                        <div class="form-group">
                            <label for="order_id">Order</label>
                            <select class="form-control" name="order_id">
                                @foreach($orders as $item)
                                    <option value="{{ $item->id }}" {{ $selectedOrder == $item->id ? 'selected="selected"' : '' }}>{{ $item->client }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-6 col-md-8">
                        <div class="form-group">
                            <label for="note">Note</label>
                            {!! Form::text('note', null, array('placeholder' => 'Note','class' => 'form-control')) !!}
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-4">
                        <div class="form-group">
                            <label for="state_id">State</label>
                            <select class="form-control" name="state_id">
                                @foreach($states as $item)
                                    <option value="{{ $item->id }}" {{ $selectedState == $item->id ? 'selected="selected"' : '' }}>{{ $item->state }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 col-xs-12 center">
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-lg btn-block">
                                <i class="fa fa-floppy-o" aria-hidden="true"></i> Edit
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