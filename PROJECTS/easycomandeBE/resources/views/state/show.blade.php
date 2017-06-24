@extends('layouts.app') @section('content')

<div class="row">
    <div class="col-lg-12 margin-tb">
        <div class="card card-mini">
            <div class="card-header">
                <h4 class="card-title">
                    {{ $item->state }}
                </h4>
                <div class="card-action">
                    <a href="{{ route('state.edit',$item->id) }}">
                        <i class="fa fa-pencil fa-3x fa-fw" aria-hidden="true"></i>
                    </a>
                    <a href="{{ route('state.index') }}">
                        <i class="fa fa-arrow-circle-o-left fa-3x fa-fw" aria-hidden="true"></i>
                    </a>
                </div>
            </div>
            <div class="card-body">

                <div class="section">
                    <div class="section-title">Informazioni</div>
                    <div class="section-body">

                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <label class="control-label">Nome:</label> {{ $item->state }}
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

@endsection