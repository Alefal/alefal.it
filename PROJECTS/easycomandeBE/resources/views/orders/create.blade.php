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
                    <a href="{{ route('orders.index') }}">
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

                {!! Form::open(array('route' => 'orders.store','method'=>'POST')) !!}
                
                <div class="row">
                    <div class="col-xs-6 col-md-3">
                        <div class="form-group">
                            <label for="name">Client</label>
                            {!! Form::text('client', null, array('placeholder' => 'Client','class' => 'form-control')) !!}
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-3">
                        <div class="form-group">
                            <label for="city">Covered</label>
                             {!! Form::number('covered', 0, array('placeholder' => 'Covered','class' => 'form-control')) !!}
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-3">
                        <div class="form-group">
                            <label for="name">Total Order</label>
                            {!! Form::number('totalorder', 0, array('placeholder' => 'Total Order','class' => 'form-control')) !!}
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-3">
                        <div class="form-group">
                            <label for="city">Total Service</label>
                             {!! Form::number('totalservice', 0, array('placeholder' => 'Total Service','class' => 'form-control')) !!}
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 col-xs-12">
                        <div class="form-group">
                            <label for="date">Date</label>
                            {!! Form::date('date', Carbon\Carbon::parse('now')->format('D/M/Y'), array('placeholder' => 'Date','class' => 'form-control')) !!}
                        </div>
                    </div>
                    <div class="col-md-6 col-xs-12">
                        <div class="form-group">
                            <label for="states">State</label>
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
                            <input type="submit" value="Save" class="submit" name="submit" id="btn-structures" />
                            -->
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