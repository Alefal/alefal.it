@extends('layouts.app') 

@section('content')

@if ($message = Session::get('success'))
<div class="alert alert-success">
    <p>{{ $message }}</p>
</div>
@endif

<div class="row">
    <div class="col-lg-12 margin-tb">

        <div class="card">
            <div class="card-header">
                <h4 class="card-title">
                    Extra
                </h4>
                <div class="card-action">
                    <a href="{{ route('extra.create') }}">
                        <i class="fa fa-plus-circle fa-3x fa-fw" aria-hidden="true"></i>
                    </a>
                </div>
            </div>
            <div class="card-body no-padding">
                <div class="table-responsive">
                    <table class="table card-table table-striped">
                        <thead>
                            <tr>
                                <th></th>
                                <th>Name</th>
                                <th>Price</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($items as $key => $item)
                            <tr class="@if ($key > 0 && $key % 2) odd @else even @endif">
                                <td>
                                    @if ($item->img == "") 
                                        <img src="{{ asset('img/no_image.jpg') }}" class="img-thumbnail imgThumbSmall" />
                                    @else 
                                        <img src="{{ $item->img }}" class="img-thumbnail imgThumbSmall" />
                                    @endif
                                </td>
                                <td>{{ $item->name }}</td>
                                <td>{{ $item->price }}</td>
                                <td align="right">
                                    <div class="btn-group">
                                        <a class="btn btn-default btn-xs" href="{{ route('extra.show',$item->id) }}">
                                            <i class="fa fa-eye fa-1x fa-lg" aria-hidden="true"></i>
                                        </a>
                                        <a class="btn btn-default btn-xs" href="{{ route('extra.edit',$item->id) }}">
                                            <i class="fa fa-pencil fa-1x fa-lg" aria-hidden="true"></i>
                                        </a>
                                        {!! Form::open(['method' => 'DELETE','route' => ['extra.destroy', $item->id],'style'=>'display:inline']) !!} 
                                        {!! Form::button('<span class="fa fa-minus-circle fa-1x fa-lg"></span>', ['id' => '', 'class' => 'btn btn-danger btn-xs buttonDelete']) !!} 
                                        {!! Form::close() !!}
                                    </div>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

{!! $items->render() !!} 

@endsection