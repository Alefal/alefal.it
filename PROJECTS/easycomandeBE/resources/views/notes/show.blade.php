@extends('layouts.app') @section('content')

<div class="row">
    <div class="col-lg-12 margin-tb">
        <div class="card card-mini">
            <div class="card-header">
                <h4 class="card-title">
                    {{ $item->note }}
                </h4>
                <div class="card-action">
                    <a href="{{ route('notes.edit',$item->id) }}">
                        <i class="fa fa-pencil fa-3x fa-fw" aria-hidden="true"></i>
                    </a>
                    <a href="{{ route('notes.index') }}">
                        <i class="fa fa-arrow-circle-o-left fa-3x fa-fw" aria-hidden="true"></i>
                    </a>
                </div>
            </div>
            <div class="card-body">

                <div class="section">
                    <div class="section-title">Information</div>
                    <div class="section-body">

                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <label class="control-label">Note:</label> {{ $item->note }}
                            </div>
                             <div class="col-md-6 col-sm-6">
                                <label class="control-label">Order for:</label> 
                                @foreach($orders as $order)
                                    @if ($item->order_id == $order->id) 
                                        {{ $order->client }}
                                    @endif
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

@endsection