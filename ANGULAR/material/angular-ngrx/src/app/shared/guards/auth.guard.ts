import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';
import { Store, select } from '@ngrx/store';
import { map, take } from 'rxjs/operators';
import { Observable } from 'rxjs';

import AppState from '../../store/state/app.state';
import { getUserAuthStatus } from '../../auth/store/selectors/auth.selectors';

@Injectable()
export class AuthGuard implements CanActivate {

    appIsAuthenticated$: Observable<any>;

    constructor(
        private router: Router,
        private store: Store<{ appState: AppState }>
    ) { 
        this.appIsAuthenticated$ = this.store.pipe(select(getUserAuthStatus));
    }

    canActivate(): Observable<boolean> {
        return this.appIsAuthenticated$
            .pipe(map(authUser => {
                console.log('authUser',authUser);
                
                if (!authUser) {
                    this.router.navigate(['login']);
                }
                return authUser;
            }))
    }

    // canActivate(r) {
    //     if (localStorage.getItem('currentUser')) {
    //         const user: any = JSON.parse(localStorage.getItem('currentUser'));
    //         if (user.logged) {
    //             return true;
    //         }
    //         return false;
    //     }
    // }
}
