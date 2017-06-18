import { Injectable }       from '@angular/core';
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
        console.log('getCallHttp: ' + call + ' | ' + username + ' | ' + password);

        //////////New BackEnd
        let host    = 'http://localhost:8000';
        let url     = '';

        //LOGIN
        if (call == 'authentication') {
            url = 'jsondata/auth/'+username+'/'+password;
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
            url = '/jsondata/order/save/'+JSON.stringify(object);
        }
        else if (call == 'getOrderChangeOrderState') {
            url = '/jsondata/order/change/state/'+id;
        }
        else if (call == 'getOrderDelete') {
            url = '/jsondata/order/delete/'+id;
        }
        else if (call == 'getOrderChangeLineItemState') {
            url = '/jsondata/item/change/state/'+id;
        }
        else if (call == 'getOrderDeleteLineItem') {
            url = '/jsondata/item/delete/'+id;
        }

        else if (call == 'getOrderChangeSpecialState') {
            url = '/jsondata/special/change/state/'+id;
        }
        else if (call == 'getOrderDeleteSpecial') {
            url = '/jsondata/special/delete/'+id;
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
            url = '/jsondata/note/delete/'+id;
        }

        console.log('URL: ' + host + '' + url);

        return this.http.get(host + '' + url)
                    .map(this.extractData)
                    .catch(this.handleError);
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