import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { DashboardRoutingModule } from './dashboard-routing.module';
import { DashboardComponent } from './dashboard.component';
import { PageHeaderModule } from './../../shared';
import { TranslateModule } from '@ngx-translate/core';

@NgModule({
    imports: [
        CommonModule,
        DashboardRoutingModule,
        PageHeaderModule,
        TranslateModule
    ],
    declarations: [DashboardComponent]
})
export class DashboardModule {}
