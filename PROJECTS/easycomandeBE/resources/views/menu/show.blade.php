@extends('layouts.app') @section('content')

<div class="row">
    <div class="col-lg-12 margin-tb">
        <div class="card card-mini">
            <div class="card-header">
                <h4 class="card-title">
                    {{ $item->name }}
                </h4>
                <div class="card-action">
                    <a href="{{ route('menu.edit',$item->id) }}">
                        <i class="fa fa-pencil fa-3x fa-fw" aria-hidden="true"></i>
                    </a>
                    <a href="{{ route('menu.index') }}">
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
                                <label class="control-label">Nome:</label> {{ $item->name }}
                                <br />
                                <label class="control-label">Category:</label> 
                                @foreach($categories as $cat)
                                    @if ($item->category_id == $cat->id) 
                                        {{ $cat->name }}
                                    @endif
                                @endforeach
                            </div>
                             <div class="col-md-6 col-sm-6">
                                <label class="control-label">Prezzo:</label> {{ $item->price }}
                                <br />
                                <label class="control-label">Prezzo Offerta:</label> {{ $item->priceoffer }}
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <label class="control-label">Descrizione:</label>
                                <br />
                                {{ $item->description }}
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

@endsection