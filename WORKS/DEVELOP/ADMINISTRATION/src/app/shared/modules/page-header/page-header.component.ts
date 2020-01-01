import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { SharedService } from '../../services/shared.service';

@Component({
    selector: 'app-page-header',
    templateUrl: './page-header.component.html',
    styleUrls: ['./page-header.component.scss']
})
export class PageHeaderComponent implements OnInit {
    @Input() key: string;
    @Input() heading: string;
    @Input() icon: string;
    @Input() title: string;
    // tslint:disable-next-line: no-output-on-prefix
    @Output() onClick = new EventEmitter();
    // tslint:disable-next-line: no-output-on-prefix
    @Output() onClickMassive = new EventEmitter();

    constructor(private sharedService: SharedService) {}

    ngOnInit() {}

    addItem() {
        this.onClick.emit();
    }
    filter() {
        this.onClick.emit();
    }
    massiveLoading() {
        this.onClickMassive.emit();
    }
}
