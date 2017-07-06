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
                                <td>auth</td>
                                <td>
                                    <i class="fa fa-code fa-lg" aria-hidden="true"></i> jsondata/auth/{email}/{password}
                                </td>
                                <td align="right">
                                    <div class="btn-group">
                                        <a class="btn btn-default btn-xs" target="_blank" href="jsondata/auth/admin@easycomande.it/Abc123def">
                                            <i class="fa fa-eye fa-1x fa-lg" aria-hidden="true"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>configurations</td>
                                <td>
                                    <i class="fa fa-code fa-lg" aria-hidden="true"></i> jsondata/configurations
                                </td>
                                <td align="right">
                                    <div class="btn-group">
                                        <a class="btn btn-default btn-xs" target="_blank" href="jsondata/configurations">
                                            <i class="fa fa-eye fa-1x fa-lg" aria-hidden="true"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>categories</td>
                                <td>
                                    <i class="fa fa-code fa-lg" aria-hidden="true"></i> jsondata/categories
                                </td>
                                <td align="right">
                                    <div class="btn-group">
                                        <a class="btn btn-default btn-xs" target="_blank" href="jsondata/categories?api_token=Pwbo7CmLtqAP5TvIHYFZPqkmetJFTi9UZIfxE1GLeBFFJgzZ8DvhdTEiGFxf">
                                            <i class="fa fa-eye fa-1x fa-lg" aria-hidden="true"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>menu</td>
                                <td>
                                    <i class="fa fa-code fa-lg" aria-hidden="true"></i> jsondata/menu
                                </td>
                                <td align="right">
                                    <div class="btn-group">
                                        <a class="btn btn-default btn-xs" target="_blank" href="jsondata/menu?api_token=Pwbo7CmLtqAP5TvIHYFZPqkmetJFTi9UZIfxE1GLeBFFJgzZ8DvhdTEiGFxf">
                                            <i class="fa fa-eye fa-1x fa-lg" aria-hidden="true"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>menu for category</td>
                                <td>
                                    <i class="fa fa-code fa-lg" aria-hidden="true"></i> jsondata/menuforcat/{catId}
                                </td>
                                <td align="right">
                                    <div class="btn-group">
                                        <a class="btn btn-default btn-xs" target="_blank" href="jsondata/menuforcat/1?api_token=Pwbo7CmLtqAP5TvIHYFZPqkmetJFTi9UZIfxE1GLeBFFJgzZ8DvhdTEiGFxf">
                                            <i class="fa fa-eye fa-1x fa-lg" aria-hidden="true"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>orders</td>
                                <td>
                                    <i class="fa fa-code fa-lg" aria-hidden="true"></i> jsondata/orders
                                </td>
                                <td align="right">
                                    <div class="btn-group">
                                        <a class="btn btn-default btn-xs" target="_blank" href="jsondata/orders?api_token=Pwbo7CmLtqAP5TvIHYFZPqkmetJFTi9UZIfxE1GLeBFFJgzZ8DvhdTEiGFxf">
                                            <i class="fa fa-eye fa-1x fa-lg" aria-hidden="true"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>order</td>
                                <td>
                                    <i class="fa fa-code fa-lg" aria-hidden="true"></i> jsondata/order/{orderId}
                                </td>
                                <td align="right">
                                    <div class="btn-group">
                                        <a class="btn btn-default btn-xs" target="_blank" href="jsondata/order/7?api_token=Pwbo7CmLtqAP5TvIHYFZPqkmetJFTi9UZIfxE1GLeBFFJgzZ8DvhdTEiGFxf">
                                            <i class="fa fa-eye fa-1x fa-lg" aria-hidden="true"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>specialsfororder</td>
                                <td>
                                    <i class="fa fa-code fa-lg" aria-hidden="true"></i> jsondata/specialsfororder/{orderId}
                                </td>
                                <td align="right">
                                    <div class="btn-group">
                                        <a class="btn btn-default btn-xs" target="_blank" href="jsondata/specialsfororder/7?api_token=Pwbo7CmLtqAP5TvIHYFZPqkmetJFTi9UZIfxE1GLeBFFJgzZ8DvhdTEiGFxf">
                                            <i class="fa fa-eye fa-1x fa-lg" aria-hidden="true"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>notesfororder</td>
                                <td>
                                    <i class="fa fa-code fa-lg" aria-hidden="true"></i> jsondata/notesfororder/{orderId}
                                </td>
                                <td align="right">
                                    <div class="btn-group">
                                        <a class="btn btn-default btn-xs" target="_blank" href="jsondata/notesfororder/7?api_token=Pwbo7CmLtqAP5TvIHYFZPqkmetJFTi9UZIfxE1GLeBFFJgzZ8DvhdTEiGFxf">
                                            <i class="fa fa-eye fa-1x fa-lg" aria-hidden="true"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>extra</td>
                                <td>
                                    <i class="fa fa-code fa-lg" aria-hidden="true"></i> jsondata/extra
                                </td>
                                <td align="right">
                                    <div class="btn-group">
                                        <a class="btn btn-default btn-xs" target="_blank" href="jsondata/extra?api_token=Pwbo7CmLtqAP5TvIHYFZPqkmetJFTi9UZIfxE1GLeBFFJgzZ8DvhdTEiGFxf">
                                            <i class="fa fa-eye fa-1x fa-lg" aria-hidden="true"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>state</td>
                                <td>
                                    <i class="fa fa-code fa-lg" aria-hidden="true"></i> jsondata/state
                                </td>
                                <td align="right">
                                    <div class="btn-group">
                                        <a class="btn btn-default btn-xs" target="_blank" href="jsondata/state?api_token=Pwbo7CmLtqAP5TvIHYFZPqkmetJFTi9UZIfxE1GLeBFFJgzZ8DvhdTEiGFxf">
                                            <i class="fa fa-eye fa-1x fa-lg" aria-hidden="true"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>users</td>
                                <td> <i class="fa fa-code fa-lg" aria-hidden="true"></i> jsondata/users</td>
                                <td align="right">
                                    <div class="btn-group">
                                        <a class="btn btn-default btn-xs" target="_blank" href="jsondata/users?api_token=Pwbo7CmLtqAP5TvIHYFZPqkmetJFTi9UZIfxE1GLeBFFJgzZ8DvhdTEiGFxf">
                                            <i class="fa fa-eye fa-1x fa-lg" aria-hidden="true"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>OTHERS</td>
                                <td> 
                                    <i class="fa fa-code fa-lg" aria-hidden="true"></i> jsondata/notifications
                                    <br />
                                    <i class="fa fa-code fa-lg" aria-hidden="true"></i> jsondata/notifications/check/{orderId}
                                    <br />
                                    <i class="fa fa-code fa-lg" aria-hidden="true"></i> jsondata/order/save/{request}
                                    <br />
                                    <i class="fa fa-code fa-lg" aria-hidden="true"></i> jsondata/order/change/state/{itemId}
                                    <br />
                                    <i class="fa fa-code fa-lg" aria-hidden="true"></i> jsondata/order/delete/{orderId}
                                    <br />
                                    <i class="fa fa-code fa-lg" aria-hidden="true"></i> jsondata/item/change/state/{itemId}/{orderId}
                                    <br />
                                    <i class="fa fa-code fa-lg" aria-hidden="true"></i> jsondata/item/delete/{itemId}/{orderId}
                                    <br />
                                    <i class="fa fa-code fa-lg" aria-hidden="true"></i> jsondata/special/change/state/{itemId}/{orderId}
                                    <br />
                                    <i class="fa fa-code fa-lg" aria-hidden="true"></i> jsondata/special/delete/{specialId}/{orderId}
                                    <br />
                                    <i class="fa fa-code fa-lg" aria-hidden="true"></i> jsondata/note/delete/{noteId}/{orderId}
                                    <br />
                                    <i class="fa fa-code fa-lg" aria-hidden="true"></i> jsondata/order/print/{orderId}
                                </td>
                                <td align="right"></td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
</div>

@endsection
