import { Injectable } from '@angular/core';
import { Http, Headers, Response } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map'

@Injectable()
export class AuthenticationService {
    
    constructor(private http: Http) { }

    login(username: string, password: string) {
        let host    = 'http://localhost:8000';
        let url     = '/jsondata/auth/'+username+'/'+password;

        return this.http.get(host + '' + url)
            .map((response: Response) => {
                console.log('%ò',response);
                let user = response.json();
                if (user.logged == 'autenticated') {
                    localStorage.setItem('currentUser', user.name);
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