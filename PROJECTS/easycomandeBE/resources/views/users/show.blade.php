@extends('layouts.app') @section('content')

<div class="row">
    <div class="col-lg-12 margin-tb">
        <div class="card card-mini">
            <div class="card-header">
                <h4 class="card-title">
                    {{ $item->name }}
                </h4>
                <div class="card-action">
                    <a href="{{ route('users.edit',$item->id) }}">
                        <i class="fa fa-pencil fa-3x fa-fw" aria-hidden="true"></i>
                    </a>
                    <a href="{{ route('users.index') }}">
                        <i class="fa fa-arrow-circle-o-left fa-3x fa-fw" aria-hidden="true"></i>
                    </a>
                </div>
            </div>
            <div class="card-body">

                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="section">
                            <div class="section-title">Information</div>
                            <div class="section-body">
                                <label class="control-label">Name:</label> {{ $item->name }}
                                <br />
                                <label class="control-label">Email</label> {{ $item->email }}
                                <br />
                                <label class="control-label">Role</label> {{ $item->role }}
                                <br />
                                <label class="control-label">Created At:</label> {{ $item->created_at }}
                                <br />
                                <label class="control-label">Updated At:</label> {{ $item->updated_at }}
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    @endsection