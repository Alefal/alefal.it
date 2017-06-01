﻿import { Injectable } from '@angular/core';
import { Http, Headers, Response } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map'

@Injectable()
export class AuthenticationService {

    //Test with VM
    host = 'http://192.168.164.133/easycomande';
    //host = 'http://localhost/alefal.it/PROJECTS/easycomande';
    //host = 'http://192.168.1.100/alefal.it/PROJECTS/easycomande';
    //host = 'http://www.amalficoastapps.it/demo/easycomande';
    
    constructor(private http: Http) { }

    login(username: string, password: string) {
        let url = '/api/user/generate_auth_cookie/?username=' + username + '&password=' + password + '&insecure=cool';

        return this.http.get(this.host + '' + url)
            .map((response: Response) => {
                // login successful if there's a jwt token in the response
                let user = response.json();
                if (user && user.cookie) {
                    // store user details and jwt token in local storage to keep user logged in between page refreshes
                    localStorage.setItem('currentUser', JSON.stringify(user));
                }
                return user;
            });
    }

    logout() {
        // remove user from local storage to log user out
        localStorage.removeItem('currentUser');        
    }

    checkUserLogged() {
        if (localStorage.getItem('currentUser')) {
            return true;
        } else {
            return false;
        }
    }
}