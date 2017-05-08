import {Injectable} from '@angular/core';
import {Http} from '@angular/http';

//import {Observable} from 'rxjs/Observable';
import 'rxjs/Rx';
import 'rxjs/add/operator/toPromise';
  
@Injectable() 
export class HttpService {  
    constructor(private http:Http) {
         this.http = http;
    }
  
    /**
    Installare chrome addons:
    https://chrome.google.com/webstore/detail/allow-control-allow-origi/nlfbmbojpeacfghkpbjhddihlkkiljbi?hl=en
    */
    getCallHttp(call,username,password,id,object) {
        console.log('getCallHttp: '+call+' | '+username+' | '+password);
        
        //var host = 'http://localhost/alefal.it/PROJECTS/easycomande';
        var host = 'http://www.amalficoastapps.it/demo/easycomande';
        
        var url = '';
        //LOGIN
        if(call == 'authentication') {
            url = '/api/user/generate_auth_cookie/?username='+username+'&password='+password+'&insecure=cool';
        } 
        //CATEGORIES
        else if(call == 'getProductsCategory') {
            url = '/wp-content/plugins/alefal_woocommerce/services/ece_products_cat.php';
        } 
        else if(call == 'getProductsByCategory') {
            url = '/wp-content/plugins/alefal_woocommerce/services/ece_products_cat_filter.php?filterName=category&filterValue='+object;
        }

        //PRODUCTS
        else if(call == 'getProducts') {
            url = '/wp-content/plugins/alefal_woocommerce/services/ece_products.php';
        }

        //ORDERS
        else if(call == 'getOrders') {
            url = '/wp-content/plugins/alefal_woocommerce/services/ece_orders.php?id='+id;
        }  
        else if(call == 'getOrderSave') {
            url = '/wp-content/plugins/alefal_woocommerce/services/ece_order_save.php?order='+JSON.stringify(object);
        }
        else if(call == 'getOrderDelete') {
            url = '/wp-content/plugins/alefal_woocommerce/services/ece_order_delete.php?id='+id;
        } 
        else if(call == 'getOrderDeleteLineItem') {
            url = '/wp-content/plugins/alefal_woocommerce/services/ece_order_delete_line_item.php?order='+JSON.stringify(object);
        } 
        else if(call == 'getOrderDeleteShipping') {
            console.log('%o',object);
            url = '/wp-content/plugins/alefal_woocommerce/services/ece_order_delete_shipping.php?order='+JSON.stringify(object);
        } 
        
        //ORDER NOTES
        else if(call == 'getOrderNote') {
            url = '/wp-content/plugins/alefal_woocommerce/services/ece_order_note.php?id='+id;
        } 
        else if(call == 'getOrderNoteSave') {
            url = '/wp-content/plugins/alefal_woocommerce/services/ece_order_note_save.php?id='+id+'&orderNotes='+JSON.stringify(object);
        } 
        else if(call == 'getOrderNoteDelete') {
            url = '/wp-content/plugins/alefal_woocommerce/services/ece_order_note_delete.php?id='+id+'&orderNotes='+JSON.stringify(object);
        }

        console.log('URL: '+host+''+url);

        /*
        var response = this.http.get(host+''+url).map(res => res.json()).subscribe(data => {
            return data;
        });
        */

        var response = this.http.get(host+''+url)
            .toPromise()
            .then(response => response.json())
            .catch(this.handleError);
            
        return response;
    }

    private handleError(error: any) {
        console.error('An error occurred', error);
        return Promise.reject(error.message || error);
    }
}