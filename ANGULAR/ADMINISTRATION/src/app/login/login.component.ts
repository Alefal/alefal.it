import { Component, OnInit } from '@angular/core';
import { routerTransition } from '../router.animations';
import { Router } from '@angular/router';

import { HttpService } from '../shared/services/http.service';
import { ToastrService } from 'ngx-toastr';
import { SpinnerService } from '../shared/services/spinner.service';
import { SharedService } from '../shared/services/shared.service';

@Component({
    selector: 'app-login',
    templateUrl: './login.component.html',
    styleUrls: ['./login.component.scss'],
    animations: [routerTransition()]
})
export class LoginComponent implements OnInit {

    public username: string;
    public password: string;

    constructor(
        public sharedService: SharedService,
        private httpService: HttpService,
        private toastr: ToastrService,
        private router: Router,
        private spinner: SpinnerService
    ) {}

    ngOnInit() {
        if(!localStorage.getItem('languageInUse')) {
            localStorage.setItem('languageInUse', 'en');
        }
    }

    onLoggedin() {
        // Debug
        localStorage.setItem('isLoggedin', 'true');
        this.router.navigate(['/dashboard']);

        // this.spinner.show();
        // let rawData = '{\"username\":\"'+this.username+'\",\"password\":\"'+this.password+'\"}';
        // this.httpService.postCallHttp('/rest/auth/login_check',rawData)
        //     .subscribe((data: any) => {
        //         this.spinner.hide();
        //         console.log('data',data);
        //         if(data && data.responseCode == 200 && data.responseMessage == 'LOGIN OK') {
        //             localStorage.setItem('isLoggedin', 'true');
        //             localStorage.setItem('userLoggedin', JSON.stringify(data.payload));
        //             // USER PROFILE
        //             this.sharedService.getUserProfile();
        //             this.router.navigate(['/dashboard']);
        //         } else {
        //             this.toastr.error('Username or Password Invalid', 'Authentication Failed!!!');
        //         }
        //     });
    }
}