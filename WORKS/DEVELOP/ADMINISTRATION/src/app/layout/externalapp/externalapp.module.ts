import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ExternalAppRoutingModule } from './externalapp-routing.module';
import { ExternalAppComponent } from './externalapp.component';
import { PageHeaderModule } from './../../shared';
import { TranslateModule } from '@ngx-translate/core';

@NgModule({
    imports: [
        CommonModule, 
        ExternalAppRoutingModule,
        PageHeaderModule,
        TranslateModule
    ],
    declarations: [ExternalAppComponent]
})
export class ExternalAppModule {}
