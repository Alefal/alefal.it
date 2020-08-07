import { Component, OnInit } from '@angular/core';
import { routerTransition } from '../../router.animations';

@Component({
    selector: 'app-externalapp',
    templateUrl: './externalapp.component.html',
    styleUrls: ['./externalapp.component.scss'],
    animations: [routerTransition()]
})
export class ExternalAppComponent implements OnInit {
    constructor() {}

    ngOnInit() {}
}
