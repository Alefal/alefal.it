@extends('layouts.app') @section('content')

<div class="row">
    <div class="col-lg-12 margin-tb">
        <div class="card card-mini">
            <div class="card-header">
                <h4 class="card-title">
                    {{ $item->key }}
                </h4>
                <div class="card-action">
                    <a href="{{ route('configurations.edit',$item->id) }}">
                        <i class="fa fa-pencil fa-3x fa-fw" aria-hidden="true"></i>
                    </a>
                    <a href="{{ route('configurations.index') }}">
                        <i class="fa fa-arrow-circle-o-left fa-3x fa-fw" aria-hidden="true"></i>
                    </a>
                </div>
            </div>
            <div class="card-body">

                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="section">
                            <div class="section-title">Informazioni</div>
                            <div class="section-body">
                                <label class="control-label">Chiave:</label> {{ $item->key }}
                                <br />
                                <label class="control-label">Descrizione:</label> {{ $item->label }}
                                <br />
                                <label class="control-label">Valore:</label> {{ $item->value }}
                                <br />
                                <label class="control-label">Abilitato:</label> 
                                @if ($item->enable)
                                    SI
                                @else
                                    NO
                                @endif
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

@endsection