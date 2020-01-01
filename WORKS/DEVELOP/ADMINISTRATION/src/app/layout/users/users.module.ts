import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { UsersRoutingModule } from './users-routing.module';
import { UsersComponent } from './users.component';
import { PageHeaderModule } from './../../shared';
import { TranslateModule } from '@ngx-translate/core';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';

import { DataTablesModule } from 'angular-datatables';

@NgModule({
    imports: [
        CommonModule,
        UsersRoutingModule,
        PageHeaderModule,
        FormsModule,
        NgbModule,
        ReactiveFormsModule,
        TranslateModule,
        DataTablesModule
    ],
    declarations: [UsersComponent]
})
export class UsersModule {}
