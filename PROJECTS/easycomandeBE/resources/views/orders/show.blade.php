@extends('layouts.app') @section('content')

<div class="row">
    <div class="col-lg-12 margin-tb">
        <div class="card card-mini">
            <div class="card-header">
                <h4 class="card-title">
                    {{ $item->client }}
                </h4>
                <div class="card-action">
                    <a href="{{ route('orders.edit',$item->id) }}">
                        <i class="fa fa-pencil fa-3x fa-fw" aria-hidden="true"></i>
                    </a>
                    <a href="{{ route('orders.index') }}">
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
                                <label class="control-label">Name:</label> {{ $item->client }}
                                <br />
                                <label class="control-label">Slug:</label> {{ $item->date }}
                                <br />                                
                                <label class="control-label">State:</label> 
                                @foreach($states as $state)
                                    @if ($item->state_id == $state->id) 
                                        {{ $state->state }}
                                    @endif
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="section">
                            <div class="section-title">Total</div>
                            <div class="section-body">
                                <label class="control-label">Order:</label> {{ $item->totalorder }}
                                <br />
                                <label class="control-label">Service:</label> {{ $item->totalservice }}
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

@endsection