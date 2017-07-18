﻿import { Injectable }       from '@angular/core';
import { Http, Response, Headers, RequestOptions, URLSearchParams }   from '@angular/http';

import { Observable }       from 'rxjs/Observable';
//import { Observable }       from 'rxjs/Rx';
import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/map';
import 'rxjs/add/observable/throw';

@Injectable()
export class HttpService {
    constructor(private http: Http) {
        this.http = http;
    }

    /**
    Installare chrome addons:
    https://chrome.google.com/webstore/detail/allow-control-allow-origi/nlfbmbojpeacfghkpbjhddihlkkiljbi?hl=en
    */
    getCallHttp(call, username, password, id, object) {
        //console.log('getCallHttp: ' + call + ' | ' + username + ' | ' + password);

        //////////New BackEnd
        //let host    = 'http://localhost:8000';
        //let host    = 'http://192.168.1.100/cicos/BE/public';
        //let host    = 'http://www.easycomande.it/rianna/BE/public';
        //////////DEMO
        let host    = 'http://www.amalficoastapps.it/easycomande/BE/public';
        let url     = '';

        let hostImage = host+'/resources/easycomande/photos';
        localStorage.setItem('hostImage',hostImage);

        let api_token = localStorage.getItem('api_token');
        let orderToSave;

        //LOGIN
        if (call == 'authentication') {
            url = 'jsondata/auth/'+username+'/'+password;
        }
        //CONFIGURATIONS
        else if (call == 'getConfigurations') {
            url = '/jsondata/configurations';
        }
        //CATEGORIES
        else if (call == 'getProductsCategory') {
            url = '/jsondata/categories';
        }
        else if (call == 'getProductsByCategory') {
            url = '/jsondata/menuforcat/'+object;
        }

        //ORDERS
        else if (call == 'getOrders') {
            url = '/jsondata/orders';
        }
        else if (call == 'getOrder') {
            url = '/jsondata/order/'+id;
        }
        else if (call == 'getOrderSave') {
            url = '/jsondata/order/save';
            orderToSave = object;
        }
        else if (call == 'getOrderChangeOrderState') {
            url = '/jsondata/order/change/state/'+id;
        }
        else if (call == 'getOrderDelete') {
            url = '/jsondata/order/delete/'+id;
        }

        //ITEMS
        else if (call == 'getOrderChangeLineItemState') {
            url = '/jsondata/item/change/state/'+id+'/'+object;
        }
        else if (call == 'getOrderChangeLineItemSortOrder') {
            url = '/jsondata/item/change/sort/'+id+'/'+object;
        }
        else if (call == 'getOrderDeleteLineItem') {
            url = '/jsondata/item/delete/'+id+'/'+object;
        }

        //SPECIALS
        else if (call == 'getOrderChangeSpecialState') {
            url = '/jsondata/special/change/state/'+id+'/'+object;
        }
        else if (call == 'getOrderChangeLineSpecialSortOrder') {
            url = '/jsondata/special/change/sort/'+id+'/'+object;
        }
        else if (call == 'getOrderDeleteSpecial') {
            url = '/jsondata/special/delete/'+id+'/'+object;
        }

        //ORDER NOTES
        //NON USATO
        else if (call == 'getOrderNote') {
            url = '/jsondata/notesfororder/'+id;
            //url = '/wp-content/plugins/alefal_woocommerce/services/ece_order_note.php?id=' + id;
        }
        //NON USATO
        else if (call == 'getOrderNoteSave') {
        }
        else if (call == 'getOrderNoteDelete') {
            url = '/jsondata/note/delete/'+id+'/'+object;
        }

        //NOTIFICATIONS: only FE
        else if (call == 'getNotifications') {
            url = '/jsondata/notifications';
        }
        else if (call == 'checkNotification') {
            url = '/jsondata/notifications/check/'+id;
        }

        //console.log('URL: ' + host + '' + url);

        if (call == 'getOrderSave') {
            //POST: http error 414, the request url is too long
            let headers = new Headers(
            {
                'Content-Type' : 'application/json',
                //'api_token': api_token
            });
            let options = new RequestOptions({ headers: headers });

            let data = JSON.stringify({
                orderToSave: orderToSave
            });

            return this.http.post(host + '' + url+'?api_token='+api_token, data, options)
                .map(this.extractData)
                .catch(this.handleError);
        } else {
            return this.http.get(host + '' + url+'?api_token='+api_token)
                .map(this.extractData)
                .catch(this.handleError);
        }
    }

    private extractData(res: Response) {
        let body = res.json();
        return body || {};
    }

    private handleError(error: Response | any) {
        // In a real world app, you might use a remote logging infrastructure
        let errMsg: string;
        if (error instanceof Response) {
            const body = error.json() || '';
            const err = body.error || JSON.stringify(body);
            errMsg = `${error.status} - ${error.statusText || ''} ${err}`;
        } else {
            errMsg = error.message ? error.message : error.toString();
        }
        console.error(errMsg);
        return Observable.throw(errMsg);
    }

    /*
    private getXsrfToken() {
        var cookies = document.cookie.split(';');
        var token = '';

        for (var i = 0; i < cookies.length; i++) {
            var cookie = cookies[i].split('=');
            if(cookie[0] == 'XSRF-TOKEN') {
                token = decodeURIComponent(cookie[1]);
            }
        }

        return token;
    }
    */
}