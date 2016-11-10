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
    getCallHttp(call,username,password) {
        console.log('getCallHttp: '+call+' | '+username+' | '+password);
        
        //var host = 'http://localhost/alefal.it/PROJECTS/ece';
        var host = 'http://www.amalficoastapps.it/demo/ece';
        
        var url = '';
        if(call == 'authentication') {
            url = '/api/user/generate_auth_cookie/?username='+username+'&password='+password+'&insecure=cool';
        } else if(call == 'getProductsCategory') {
            url = '/wp-content/plugins/alefal_woocommerce/services/ece_products_cat.php';
        } else if(call == 'getProducts') {
            url = '/wp-content/plugins/alefal_woocommerce/services/ece_products.php';
        } else if(call == 'getOrders') {
            url = '/wp-content/plugins/alefal_woocommerce/services/ece_orders.php';
        } else if(call == 'getCustomer') {
            url = '/wp-content/plugins/alefal_woocommerce/services/ece_users.php?role=stock_cliente';
        } else if(call == 'getSupplier') {
            url = '/wp-content/plugins/alefal_woocommerce/services/ece_users.php?role=stock_fornitore';
        }

        console.log('URL: '+url);

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