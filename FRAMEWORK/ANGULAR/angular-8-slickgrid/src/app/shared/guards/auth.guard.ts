import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';

@Injectable()
export class AuthGuard implements CanActivate {

    constructor(private router: Router) {}

    canActivate(r) {
        if (localStorage.getItem('userCurrent')) {
            const user: any = JSON.parse(localStorage.getItem('userCurrent'));
            if (user) {
                return true;
            }
        }
        this.router.navigate(['login']);
        return false;
    }
}
