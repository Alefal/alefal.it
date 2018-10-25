import { Injectable } from '@angular/core';
import { AlertController, Platform, LoadingController } from 'ionic-angular';

import { Http, Response, Headers, RequestOptions } from '@angular/http';
import { HttpClient, HttpHeaders } from '@angular/common/http';

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
        //private http: Http, 
        private http: HttpClient, 
        public alertCtrl: AlertController,
        private _platform: Platform,
        public loadingCtrl: LoadingController
    ) {
        this.http = http;
    }

    getCallHttp(call, param1, param2, param3, param4): Observable<any> {
        console.log('getCallHttp: ' + call + ' | ' + param1 + ' | ' + param2);
        
        let host = 'http://localhost:8000';
        let url = '';
        let api_token  = localStorage.getItem('api_token');

        //LOGIN
        if (call == 'authentication') {
            url = '/jsondata/auth/'+param1+'/'+param2;
        }

        return this.http.get(host + '' + url+'?api_token='+api_token);
    }
}