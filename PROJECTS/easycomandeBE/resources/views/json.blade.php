@extends('layouts.app')

@section('content')

<div class="row">
    <div class="col-lg-12 margin-tb">

        <div class="card">
            <div class="card-header">
                <h4 class="card-title">
                    JSON Response
                </h4>
            </div>
            <div class="card-body no-padding">
                <div class="table-responsive">
                    <table class="table card-table table-striped">
                        <thead>
                            <tr>
                                <th>Section</th>
                                <th>Call</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>categories</td>
                                <td>
                                    jsondata/categories <i class="fa fa-code fa-lg" aria-hidden="true"></i>
                                </td>
                                <td align="right">
                                    <div class="btn-group">
                                        <a class="btn btn-default btn-xs" target="_blank" href="jsondata/categories">
                                            <i class="fa fa-eye fa-1x fa-lg" aria-hidden="true"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>menu</td>
                                <td>
                                    jsondata/menu <i class="fa fa-code fa-lg" aria-hidden="true"></i>
                                </td>
                                <td align="right">
                                    <div class="btn-group">
                                        <a class="btn btn-default btn-xs" target="_blank" href="jsondata/menu">
                                            <i class="fa fa-eye fa-1x fa-lg" aria-hidden="true"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>menu for category</td>
                                <td>
                                    jsondata/menuforcat/{catId} <i class="fa fa-code fa-lg" aria-hidden="true"></i>
                                </td>
                                <td align="right">
                                    <div class="btn-group">
                                        <a class="btn btn-default btn-xs" target="_blank" href="jsondata/menuforcat/1">
                                            <i class="fa fa-eye fa-1x fa-lg" aria-hidden="true"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>orders</td>
                                <td>
                                    jsondata/orders <i class="fa fa-code fa-lg" aria-hidden="true"></i>
                                </td>
                                <td align="right">
                                    <div class="btn-group">
                                        <a class="btn btn-default btn-xs" target="_blank" href="jsondata/orders">
                                            <i class="fa fa-eye fa-1x fa-lg" aria-hidden="true"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>extra</td>
                                <td>
                                    jsondata/extra <i class="fa fa-code fa-lg" aria-hidden="true"></i>
                                </td>
                                <td align="right">
                                    <div class="btn-group">
                                        <a class="btn btn-default btn-xs" target="_blank" href="jsondata/extra">
                                            <i class="fa fa-eye fa-1x fa-lg" aria-hidden="true"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>state</td>
                                <td>
                                    jsondata/state <i class="fa fa-code fa-lg" aria-hidden="true"></i>
                                </td>
                                <td align="right">
                                    <div class="btn-group">
                                        <a class="btn btn-default btn-xs" target="_blank" href="jsondata/state">
                                            <i class="fa fa-eye fa-1x fa-lg" aria-hidden="true"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>users</td>
                                <td><i class="fa fa-asterisk fa-lg" aria-hidden="true"></i> jsondata/users</td>
                                <td align="right">
                                    <div class="btn-group">
                                        <a class="btn btn-default btn-xs" target="_blank" href="jsondata/users">
                                            <i class="fa fa-eye fa-1x fa-lg" aria-hidden="true"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
</div>

@endsection
