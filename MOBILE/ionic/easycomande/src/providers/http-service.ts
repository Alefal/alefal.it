import { Injectable }       from '@angular/core';
import { AlertController }  from 'ionic-angular';

import { Http, Response, Headers, RequestOptions }   from '@angular/http';

import { Observable }       from 'rxjs/Observable';
//import { Observable }       from 'rxjs/Rx';
import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/map';
import 'rxjs/add/observable/throw';

@Injectable()
export class HttpService {
    constructor(private http: Http, public alertCtrl: AlertController) {
        this.http = http;
    }

    /**
    Installare chrome addons:
    https://chrome.google.com/webstore/detail/allow-control-allow-origi/nlfbmbojpeacfghkpbjhddihlkkiljbi?hl=en
    */
    getCallHttp(call, username, password, id, object) {
        console.log('getCallHttp: ' + call + ' | ' + username + ' | ' + password);

        //////////Official release
        //let host = 'http://192.168.1.100/easycomande';
        //let host = 'http://localhost/alefal.it/PROJECTS/easycomande';
        //let host = 'http://192.168.1.100/alefal.it/PROJECTS/easycomande';
        //let host = 'http://www.amalficoastapps.it/demo/easycomande';

        //New BackEnd
        let host = 'http://localhost:8000';

        let url     = '';
        //let headers = new Headers({ 'Content-Type': 'application/x-www-form-urlencoded' });
        let headers = new Headers({ 'Content-Type': 'application/json' });
        
        let options = new RequestOptions({ headers: headers });
        let body    = new URLSearchParams();

        //LOGIN: NON USATA
        if (call == 'authentication') {
            url = '/api/user/generate_auth_cookie/?username=' + username + '&password=' + password + '&insecure=cool';
        }
        //CATEGORIES
        else if (call == 'getProductsCategory') {
            url = '/jsondata/categories';
            //url = '/wp-content/plugins/alefal_woocommerce/services/ece_products_cat.php';
        }
        else if (call == 'getProductsByCategory') {
            url = '/jsondata/menuforcat/'+object;
            /*
            url = '/wp-content/plugins/alefal_woocommerce/services/ece_products_cat_filter.php';
            body.set('filterName','category');
            body.set('filterValue',object);
            */
        }

        //PRODUCTS: NON USATA
        else if (call == 'getProducts') {
            url = '/wp-content/plugins/alefal_woocommerce/services/ece_products.php';
        }

        //ORDERS
        else if (call == 'getOrders') {
            url = '/jsondata/orders';
            //url = '/wp-content/plugins/alefal_woocommerce/services/ece_orders.php?id=' + id;
        }
        else if (call == 'getOrder') {
            url = '/jsondata/order/'+id;
        }
        else if (call == 'getOrderSave') {
            url = '/jsondata/order/save/'+JSON.stringify(object);
            //url = '/wp-content/plugins/alefal_woocommerce/services/ece_order_save.php';
            //body.set('order',JSON.stringify(object));
        }
        else if (call == 'getOrderChangeOrderState') {
            url = '/jsondata/order/change/state/'+id;
        }
        else if (call == 'getOrderDelete') {
            url = '/jsondata/order/delete/'+id;
            //url = '/wp-content/plugins/alefal_woocommerce/services/ece_order_delete.php?id=' + id;
        }
        else if (call == 'getOrderChangeLineItemState') {
            url = '/jsondata/item/change/state/'+id;
        }
        else if (call == 'getOrderDeleteLineItem') {
            url = '/jsondata/item/delete/'+id;
            /*
            url = '/wp-content/plugins/alefal_woocommerce/services/ece_order_delete_line_item.php';
            body.set('order',JSON.stringify(object));
            */
        }

        else if (call == 'getOrderChangeSpecialState') {
            url = '/jsondata/special/change/state/'+id;
        }
        else if (call == 'getOrderDeleteSpecial') {
            url = '/jsondata/special/delete/'+id;
            /*
            console.log('%o', object);
            url = '/wp-content/plugins/alefal_woocommerce/services/ece_order_delete_shipping.php';
            body.set('order',JSON.stringify(object));
            */
        }

        //ORDER NOTES
        //NON USATO
        else if (call == 'getOrderNote') {
            url = '/wp-content/plugins/alefal_woocommerce/services/ece_order_note.php?id=' + id;
            //url = '/wp-content/plugins/alefal_woocommerce/services/ece_order_note.php';
            //body.set('id',id);
        }
        //NON USATO
        else if (call == 'getOrderNoteSave') {
            //url = '/wp-content/plugins/alefal_woocommerce/services/ece_order_note_save.php?id=' + id + '&orderNotes=' + JSON.stringify(object);
            url = '/wp-content/plugins/alefal_woocommerce/services/ece_order_note_save.php';
            body.set('id',id);
            body.set('orderNotes',JSON.stringify(object));
        }
        else if (call == 'getOrderNoteDelete') {
            url = '/jsondata/note/delete/'+id;
            //url = '/wp-content/plugins/alefal_woocommerce/services/ece_order_note_delete.php?id=' + id;
        }

        console.log('URL: ' + host + '' + url);

        /*
        return this.http.post(host + '' + url, body.toString(), options)
            .map(this.extractData)
            .catch(this.handleError);
        */

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
        let alert = this.alertCtrl.create({
          title: 'Attenzione',
          subTitle: 'Problemi di comunicazione con il server',
          buttons: ['OK']
        });
        alert.present();
        console.error(errMsg);
        return Observable.throw(errMsg);
    }
}