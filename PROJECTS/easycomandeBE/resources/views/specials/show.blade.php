@extends('layouts.app') @section('content')

<div class="row">
    <div class="col-lg-12 margin-tb">
        <div class="card card-mini">
            <div class="card-header">
                <h4 class="card-title">
                    {{ $item->special }}
                </h4>
                <div class="card-action">
                    <a href="{{ route('specials.edit',$item->id) }}">
                        <i class="fa fa-pencil fa-3x fa-fw" aria-hidden="true"></i>
                    </a>
                    <a href="{{ route('specials.index') }}">
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
                                <label class="control-label">Speciale:</label> {{ $item->special }}
                                <br />
                                <label class="control-label">Ordine per:</label> 
                                @foreach($orders as $order)
                                    @if ($item->order_id == $order->id) 
                                        {{ $order->client }}
                                    @endif
                                @endforeach
                            </div>
                             <div class="col-md-6 col-sm-6">
                                <label class="control-label">Prezzo:</label> {{ $item->price }}  
                                <br />
                                <label class="control-label">Nota:</label> {{ $item->note }}    
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

@endsection