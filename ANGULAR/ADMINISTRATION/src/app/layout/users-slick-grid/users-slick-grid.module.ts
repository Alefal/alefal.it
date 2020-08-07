import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { UsersSlickGridRoutingModule } from './users-slick-grid-routing.module';
import { UsersSlickGridComponent } from './users-slick-grid.component';
import { PageHeaderModule } from './../../shared';
import { TranslateModule } from '@ngx-translate/core';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';

import { DataTablesModule } from 'angular-datatables';
import { AngularSlickgridModule } from 'angular-slickgrid';

@NgModule({
    imports: [
        CommonModule,
        UsersSlickGridRoutingModule,
        PageHeaderModule,
        FormsModule,
        NgbModule,
        ReactiveFormsModule,
        TranslateModule,
        DataTablesModule,
        AngularSlickgridModule.forRoot({
            // add any Global Grid Options/Config you might want
            // to avoid passing the same options over and over in each grids of your App
            enableAutoResize: true,
            autoResize: {
              containerId: 'grid-container',
              sidePadding: 15
            }
        })
    ],
    declarations: [UsersSlickGridComponent]
})
export class UsersSlickGridModule { }
