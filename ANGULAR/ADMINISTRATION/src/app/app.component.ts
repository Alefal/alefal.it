import { Component, OnInit } from '@angular/core';
import { SharedService } from './shared/services/shared.service';

@Component({
    selector: 'app-root',
    templateUrl: './app.component.html',
    styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
    constructor(private sharedService: SharedService) {
        this.sharedService.setConfirmVariables();
    }

    ngOnInit() {
        this.sharedService.getSettings();
        this.sharedService.getUserProfile();
    }
}
