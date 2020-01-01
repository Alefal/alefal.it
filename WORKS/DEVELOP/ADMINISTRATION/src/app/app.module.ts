import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { NgModule, APP_INITIALIZER } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AuthGuard } from './shared';

import { ToastrModule } from 'ngx-toastr';
import { NgxSpinnerModule } from 'ngx-spinner';
import { ModalModule, TooltipModule } from 'ngx-bootstrap';

import { AppConfigService } from './shared/services/appconfig.service';
import { HttpService } from './shared/services/http.service';
import { SharedService } from './shared/services/shared.service';

import { LanguageTranslationModule } from './shared/modules/language-translation/language-translation.module';

import { AngularSlickgridModule } from 'angular-slickgrid';
import { SwtCommonGridPaginationComponent } from './shared/modules/angular-slickgrid/swt-common-grid-pagination.component';
import { SwtCommonGridComponent } from './shared/modules/angular-slickgrid/swt-common-grid.component';
import { DataTablesModule } from 'angular-datatables';

import { FullCalendarModule } from '@fullcalendar/angular'; // for FullCalendar!
import { SpinnerService } from './shared/services/spinner.service';

export function initializeApp(appConfig: AppConfigService) {
    return () => appConfig.load(false);
}

@NgModule({
    imports: [
        CommonModule,
        BrowserModule,
        BrowserAnimationsModule,
        HttpClientModule,
        LanguageTranslationModule,
        AppRoutingModule,
        ToastrModule.forRoot(),
        // NGX Bootstrap
        ModalModule.forRoot(),
        TooltipModule.forRoot(),
        // DataTable
        DataTablesModule,
        NgxSpinnerModule,
        AngularSlickgridModule.forRoot({
            // add any Global Grid Options/Config you might want
            // to avoid passing the same options over and over in each grids of your App
            enableAutoResize: true,
            autoResize: {
              containerId: 'grid-container',
              sidePadding: 15
            }
        }),
        FullCalendarModule // for FullCalendar!
    ],
    declarations: [
        AppComponent,
        SwtCommonGridComponent,
        SwtCommonGridPaginationComponent
    ],
    providers: [
        AuthGuard,
        SpinnerService,
        HttpService,
        SharedService,
        AppConfigService,
        {
        provide: APP_INITIALIZER,
        useFactory: initializeApp,
        deps: [AppConfigService],
        multi: true
        },
    ],
    bootstrap: [AppComponent]
})
export class AppModule {}
