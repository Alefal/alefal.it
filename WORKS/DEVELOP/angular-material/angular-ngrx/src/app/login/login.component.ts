import { Component, OnInit } from '@angular/core';
import { routerTransition } from '../router.animations';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';

import { SharedService } from '../shared/services/shared.service';
import { StoreService } from '../shared/services/store.service';

@Component({
    selector: 'app-login',
    templateUrl: './login.component.html',
    styleUrls: ['./login.component.scss'],
    animations: [routerTransition()]
})
export class LoginComponent implements OnInit {

    user: any;
    appTitle$: Observable<string>;
    appVersion$: Observable<string>;

    constructor(
        public sharedService: SharedService,
        private router: Router,
        private storeService: StoreService
    ) {
        this.user = {};
    }

    ngOnInit(): void {
        const currentUser: any = JSON.parse(localStorage.getItem('currentUser'));
        if (currentUser) {
            this.user = currentUser;
            if (this.user && this.user.rememberme) {
                this.onLoggedin();
            } else {
                this.user.username = this.user.email;
                localStorage.setItem('currentUser', JSON.stringify(this.user));
            }
        }
    }

    onLoggedin() {
        this.user.name = 'USERNAME';
        this.user.api_token = 'API_TOKEN';
        this.user.logged = true;
        localStorage.setItem('currentUser', JSON.stringify(this.user));
        this.router.navigate(['/dashboard']);

        // this.httpService.getCallHttp('/jsondata/auth/' + this.user.username + '/' + this.user.password)
        //     .subscribe((data: any) => {
        //         console.log('data', data);
        //         if (data && data.logged === 'autenticated') {
        //             this.user.name = data.name;
        //             this.user.api_token = data.api_token;
        //             this.user.logged = true;
        //             localStorage.setItem('currentUser', JSON.stringify(this.user));
        //             this.router.navigate(['/dashboard']);
        //         } else {
        //             this.toastr.error('Username or Password Invalid', 'Authentication Failed!!!');
        //             localStorage.removeItem('currentUser');
        //         }
        //     });
    }
}
