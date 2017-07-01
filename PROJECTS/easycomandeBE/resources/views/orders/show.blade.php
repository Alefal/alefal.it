@extends('layouts.app') @section('content')

<div class="row">
    <div class="col-lg-12 margin-tb">
        <div class="card card-mini">
            <div class="card-header">
                <h4 class="card-title">
                    {{ $order->client }}
                    <br />
                    {{ Carbon\Carbon::parse($order->date)->format('d/m/Y') }} ore {{ Carbon\Carbon::parse($order->date)->format('h:m') }}
                </h4>
                <div class="card-action">
                    <a href="{{ route('orders.edit',$order->id) }}">
                        <i class="fa fa-pencil fa-3x fa-fw" aria-hidden="true"></i>
                    </a>
                    <a href="{{ route('orders.index') }}">
                        <i class="fa fa-arrow-circle-o-left fa-3x fa-fw" aria-hidden="true"></i>
                    </a>
                    @if ($order->state_id == 1) <!-- PENDING -->
                        <a id="" href="javascript:printOrder('1','{{ str_replace("'","",$order) }}','{{ str_replace("'","",$items) }}','{{ str_replace("'","",$specials) }}','{{ str_replace("'","",$notes) }}','{{ str_replace("'","",$configurations) }}');" click="">
                            <i class="fa fa-print fa-3x fa-fw" aria-hidden="true"></i>
                        </a>
                     @endif
                    @if ($order->state_id == 2) <!-- COMPLETED -->
                        <a id="" href="javascript:printOrder('2','{{ str_replace("'","",$order) }}','{{ str_replace("'","",$items) }}','{{ str_replace("'","",$specials) }}','{{ str_replace("'","",$notes) }}','{{ str_replace("'","",$configurations) }}');" click="">
                            <i class="fa fa-credit-card fa-3x fa-fw" aria-hidden="true"></i>
                        </a>
                    @endif
                </div>
            </div>
            <div class="card-body">

                <div class="row">

                    <div class="col-md-9 col-sm-6">
                        <div class="section">
                            <div class="section-body">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>QTY</th>
                                            <th>PIATTO</th>
                                            <th>TOTALE</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($items as $item)
                                            <tr>
                                                <td>{{$item->quantity}}x</td>
                                                <td>
                                                    {{$item->menuname}}
                                                    <br />
                                                    @if ($item->note != '') 
                                                        <em>({{ $item->note }})</em>
                                                    @endif
                                                </td>
                                                <td>{{$item->total}}</td>
                                            </tr>
                                        @endforeach

                                        @foreach($specials as $special)
                                            <tr>
                                                <td>1x</td>
                                                <td>
                                                    {{$special->special}}
                                                    <br />
                                                    @if ($special->note != '') 
                                                        <em>({{ $special->note }})</em>
                                                    @endif
                                                </td>
                                                <td>{{$special->price}}</td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-12">
                        <div class="section">
                            <div class="section-title"><strong>Totali:</strong></div>
                            <div class="section-body">
                                <h4>
                                    <label class="control-label">Ordinazioni:</label> {{ $order->totalorder }}
                                    <br />

                                    @if (count($configurations) > 0)
                                        @foreach($configurations as $conf)
                                            @if ($conf->key == 'serviceenable' && $conf->enable)
                                                <label class="control-label">Servizio (10%):</label> {{ $order->totalservice }}
                                            @endif
                                            @if ($conf->key == 'coveredenable' && $conf->enable)
                                                <label class="control-label">Num. Coperti:</label> {{ $order->covered }}
                                                <br />
                                                <label class="control-label">Coperti:</label> {{ $order->totalservice }}
                                            @endif
                                        @endforeach
                                    @endif
                                </h4>
                            </div>
                        </div>

                        <div class="section">
                            <div class="section-title"><strong>Stato:</strong></div>
                            <div class="section-body">
                                @foreach($states as $state)
                                    @if ($order->state_id == $state->id) 
                                        <em>{{ $state->state }}</em>
                                    @endif
                                @endforeach
                            </div>
                        </div>

                        @if (count($notes) > 0)
                            <div class="section">
                                <div class="section-title"><strong>Note:</strong></div>
                                <div class="section-body">
                                    @foreach($notes as $note)
                                        {{ $note->note }}
                                        <br />
                                    @endforeach
                                </div>
                            </div>
                        @endif
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>

@endsection