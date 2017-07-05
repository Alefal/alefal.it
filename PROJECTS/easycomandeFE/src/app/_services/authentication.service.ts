import { Injectable } from '@angular/core';
import { Http, Headers, Response } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map'

@Injectable()
export class AuthenticationService {
    
    constructor(private http: Http) { }

    login(username: string, password: string) {
        let host    = 'http://localhost:8000';
        //let host    = 'http://192.168.1.100/cicos/BE/public';
        //let host    = 'http://www.easycomande.it/rianna/BE/public';

        let url     = '/jsondata/auth/'+username+'/'+password;

        return this.http.get(host + '' + url)
            .map(this.extractData);
    }

    private extractData(res: Response) {
        let body = res.json();
        return body || {};
    }

    logout() {
        // remove user from local storage to log user out
        localStorage.removeItem('currentUser');        
        localStorage.removeItem('currentUserEmail');        
        localStorage.removeItem('currentUserPass');        
        localStorage.removeItem('currentUserRemeberMe');        
        localStorage.removeItem('api_token');        
    }

    checkUserLogged() {
        if (localStorage.getItem('currentUser')) {
            return true;
        } else {
            return false;
        }
    }
}