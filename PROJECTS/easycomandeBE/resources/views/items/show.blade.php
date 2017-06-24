@extends('layouts.app') @section('content')

<div class="row">
    <div class="col-lg-12 margin-tb">
        <div class="card card-mini">
            <div class="card-header">
                <h4 class="card-title"></h4>
                <div class="card-action">
                    <a href="{{ route('items.edit',$item->id) }}">
                        <i class="fa fa-pencil fa-3x fa-fw" aria-hidden="true"></i>
                    </a>
                    <a href="{{ route('items.index') }}">
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
                                <label class="control-label">Qnt:</label> {{ $item->quantity }}
                            </div>
                             <div class="col-md-6 col-sm-6">
                                <label class="control-label">Totale:</label> {{ $item->total }}
                                <br />
                                <label class="control-label">Servizio:</label> {{ $item->service }}
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

@endsection