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
  
    getCallHttp(call,username,password) {
        console.log('getCallHttp: '+call+' | '+username+' | '+password);
        
       var host = '/PROJECTS/ece';
        
        var url = '';
        if(call == 'authentication') {
            url = '/api/user/generate_auth_cookie/?username='+username+'&password='+password+'&insecure=cool';
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