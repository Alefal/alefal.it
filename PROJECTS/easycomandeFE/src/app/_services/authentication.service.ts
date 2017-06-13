import { Injectable } from '@angular/core';
import { Http, Headers, Response } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map'

@Injectable()
export class AuthenticationService {
    
    constructor(private http: Http) { }

    login(username: string, password: string) {
       
        let user = '{"status":"ok","cookie":"manager|1498594528|wMOUVNoDXabZuO8Z36fIuQzykhuAr51bW1KVFLa9Uup|a8c18b06c0242a2b4eae96aa3cd1b153377b9358c547d2d94a07516643f564ae","cookie_name":"wordpress_logged_in_6f218fbacc4196119d6944f2a57b20b9","user":{"id":4,"username":"manager","nicename":"manager","email":"alefalwebmaster1@gmail.com","url":"","registered":"2016-05-09 14:07:41","displayname":"Ale Fal","firstname":"Ale","lastname":"Fal","nickname":"manager","description":"","capabilities":{"shop_manager":true},"avatar":null}}';
        localStorage.setItem('currentUser', JSON.stringify(user));
        return user;

        /***
        //////////Official release
        //let host = 'http://192.168.1.100/easycomande';
        //let host = 'http://localhost/alefal.it/PROJECTS/easycomande';
        //let host = 'http://192.168.1.100/alefal.it/PROJECTS/easycomande';
        //let host = 'http://www.amalficoastapps.it/demo/easycomande';

        let url = '/api/user/generate_auth_cookie/?username=' + username + '&password=' + password + '&insecure=cool';

        return this.http.get(host + '' + url)
            .map((response: Response) => {
                // login successful if there's a jwt token in the response
                let user = response.json();
                if (user && user.cookie) {
                    // store user details and jwt token in local storage to keep user logged in between page refreshes
                    localStorage.setItem('currentUser', JSON.stringify(user));
                }
                return user;
            });
        ***/
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