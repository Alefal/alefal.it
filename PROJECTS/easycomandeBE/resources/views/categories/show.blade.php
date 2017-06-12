@extends('layouts.app') @section('content')

<div class="row">
    <div class="col-lg-12 margin-tb">
        <div class="card card-mini">
            <div class="card-header">
                <h4 class="card-title">
                    {{ $item->name }}
                </h4>
                <div class="card-action">
                    <a href="{{ route('categories.edit',$item->id) }}">
                        <i class="fa fa-pencil fa-3x fa-fw" aria-hidden="true"></i>
                    </a>
                    <a href="{{ route('categories.index') }}">
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
                                <label class="control-label">Name:</label> {{ $item->name }}
                                <br />
                                <label class="control-label">Slug:</label> {{ $item->slug }}
                                <br />
                                <label class="control-label">Count:</label> {{ $item->count }}
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="section">
                            <div class="section-title">Description</div>
                            <div class="section-body">
                                {!! $item->description !!}
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

@endsection