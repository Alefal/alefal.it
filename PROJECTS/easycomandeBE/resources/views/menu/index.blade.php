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
                    Menu
                </h4>
                <div class="card-action">
                    <a href="{{ route('menu.create') }}">
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
                                <th>Nome</th>
                                <th>Prezzo</th>
                                <th>Categoria</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($items as $key => $item)
                            <tr class="@if ($key > 0 && $key % 2) odd @else even @endif">
                                <td>
                                    @if ($item->photo == "") 
                                        <img src="{{ asset('img/no_image.jpg') }}" class="img-thumbnail imgThumbSmall" />
                                    @else 
                                        <img src="{{ asset(env('PUBLIC_PATH_PHOTOS_GET'))."\/".$item->photo }}" class="img-thumbnail imgThumbSmall" />
                                    @endif
                                </td>
                                <td>{{ $item->name }}</td>
                                <td>{{ $item->price }}</td>
                                <td>
                                    @foreach($categories as $cat)
                                        @if ($item->category_id == $cat->id) 
                                            {{ $cat->name }}
                                        @endif
                                    @endforeach
                                </td>
                                <td align="right">
                                    <div class="btn-group">
                                        <a class="btn btn-default btn-xs" href="{{ route('menu.show',$item->id) }}">
                                            <i class="fa fa-eye fa-1x fa-lg" aria-hidden="true"></i>
                                        </a>
                                        <a class="btn btn-default btn-xs" href="{{ route('menu.edit',$item->id) }}">
                                            <i class="fa fa-pencil fa-1x fa-lg" aria-hidden="true"></i>
                                        </a>
                                        {!! Form::open(['method' => 'DELETE','route' => ['menu.destroy', $item->id],'style'=>'display:inline']) !!} 
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