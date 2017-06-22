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
                    <a href="{{ route('configurations.index') }}">
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

                {!! Form::open(array('route' => 'configurations.store','method'=>'POST')) !!}
                
                <div class="row">
                    <div class="col-xs-6 col-md-6">
                        <div class="form-group">
                            <label for="Key">Key</label>
                            {!! Form::text('key', null, array('placeholder' => 'Key','class' => 'form-control')) !!}
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-6">
                        <div class="form-group">
                            <label for="name">Label</label>
                            {!! Form::text('label', null, array('placeholder' => 'Label','class' => 'form-control')) !!}
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-6 col-md-6">
                        <div class="form-group">
                            <label for="enable">Enable</label>
                            <select class="form-control" name="enable">
                                <option value="0">NO</option>
                                <option value="1">SI</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-6">
                        <div class="form-group">
                            <label for="city">Value</label>
                             {!! Form::text('value', null, array('placeholder' => 'Value','class' => 'form-control')) !!}
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