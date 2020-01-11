import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';

@Injectable()
export class AuthGuard implements CanActivate {
    constructor(
        private router: Router
    ) {}

    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot) {
        if (localStorage.getItem('currentUser')) {
            const user: any = JSON.parse(localStorage.getItem('currentUser'));
            if (user.logged) {
                return true;
            }
            return false;
        }
        this.router.navigate(['/login']);
        return false;
    }
}
