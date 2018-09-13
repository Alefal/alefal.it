import { Injectable } from '@angular/core';
import { AlertController, Platform, LoadingController } from 'ionic-angular';

import { Http, Response, Headers, RequestOptions } from '@angular/http';

import { Observable }       from 'rxjs/Observable';
//import { Observable }       from 'rxjs/Rx';
import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/map';
import 'rxjs/add/observable/throw';

//import { WebSocketService } from './websocket.service';

@Injectable()
export class HttpService {

    loading: any;

    constructor(
        private http: Http, 
        public alertCtrl: AlertController,
        private _platform: Platform,
        public loadingCtrl: LoadingController
    ) {
        this.http = http;
    }

    getCallHttp(call, username, password, id, object) {
        console.log('getCallHttp: ' + call + ' | ' + username + ' | ' + password);
        
        let host = 'http://localhost:8000';
        let url = '';
        let api_token  = localStorage.getItem('api_token');

        //LOGIN
        if (call == 'authentication') {
            url = '/jsondata/auth/'+username+'/'+password;
        }

        console.log('URL: ' + host + '' + url + '?api_token=' + api_token);

        return this.http.get(host + '' + url+'?api_token='+api_token)
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