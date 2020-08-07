import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { routerTransition } from '../../../shared/router.animations';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';

import { SharedService } from '../../../shared/services/shared.service';
import { StoreService } from '../../../shared/services/store.service';

import { NgxSpinnerService } from 'ngx-spinner';
import { User } from '../../../shared/models/interfaces/user.interface';
import { Auth } from '../../../shared/models/interfaces/auth.interface';

@Component({
    selector: 'app-login',
    templateUrl: './login.component.html',
    styleUrls: ['./login.component.scss'],
    animations: [routerTransition()]
})
export class LoginComponent implements OnInit {
    
    @Input() auth: Auth;
    @Input() appConfig$: any;
  
    @Output('authentication') authenticationEmitter = new EventEmitter<Auth>();

    constructor() {}

    ngOnInit(): void {}

    onLoggedIn(auth: Auth) {
        this.authenticationEmitter.emit(auth);
    }
}
