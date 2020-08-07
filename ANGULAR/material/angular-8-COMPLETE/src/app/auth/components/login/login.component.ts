import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { routerTransition } from '../../../shared/router.animations';

import { Auth } from '../../../shared/models/interfaces/auth.interface';

@Component({
    selector: 'app-login',
    templateUrl: './login.component.html',
    styleUrls: ['./login.component.scss'],
    animations: [routerTransition()]
})
export class LoginComponent implements OnInit {
    
    @Input() auth: Auth;
    @Output('authentication') authenticationEmitter = new EventEmitter<Auth>();

    constructor() {}

    ngOnInit(): void {}

    onLoggedIn(auth: Auth) {
        this.authenticationEmitter.emit(auth);
    }
}
