@extends('layouts.app') @section('content')

<div class="row">
    <div class="col-lg-12 margin-tb">
        <div class="card card-mini">
            <div class="card-header">
                <h4 class="card-title">
                    Edit: {{ $item->name }}
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
                    <strong>Whoops!</strong> There were some problems with your input.<br><br>
                    <ul>
                        @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
                @endif {!! Form::model($item, ['method' => 'PATCH','route' => ['users.update', $item->id]]) !!}

                <div class="section-body">
                    <div class="form-group">
                        <label class="col-md-3 control-label">Name</label>
                        <div class="col-md-9">
                            {!! Form::text('name', null, array('placeholder' => 'Name','class' => 'form-control')) !!}
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-3">
                            <label class="control-label">Email</label>
                        </div>
                        <div class="col-md-9">
                            {!! Form::text('email', null, array('placeholder' => 'Email','class' => 'form-control')) !!}
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Password</label>
                        <div class="col-md-9">
                            <div class="input-group">
                                <span class="input-group-addon">*</span> {!! Form::text('password', null, array('placeholder'
                                => 'Password','class' => 'form-control')) !!}
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label">Role</label>
                        <div class="col-md-9">
                            <div class="input-group">
                                <span class="input-group-addon">*</span>
                                <select name="role">
                                    <option value="admin">Administrator</option>
                                    <option value="manager">Manager</option>
                                </select>
                            </div>
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