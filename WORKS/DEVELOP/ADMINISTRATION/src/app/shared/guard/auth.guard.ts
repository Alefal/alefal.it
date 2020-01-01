import { Injectable } from '@angular/core';
import { Location } from '@angular/common';
import { CanActivate, ActivatedRoute, UrlSegment, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import { SharedService } from '../services/shared.service';

@Injectable()
export class AuthGuard implements CanActivate {
    constructor(
        private router: Router, 
        private activeRoute: ActivatedRoute,
        private location: Location,
        private sharedService: SharedService
    ) {}

    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot) {
        console.log(state.url);
        //this.location.path()
        if (localStorage.getItem('isLoggedin')) {
            if(this.sharedService.pathExistAndIsVisible(state.url)) {
                return true;
            } else {
                this.router.navigate(['/access-denied']);
                return false;
            }
        }
        this.router.navigate(['/login']);
        return false;
    }
}
