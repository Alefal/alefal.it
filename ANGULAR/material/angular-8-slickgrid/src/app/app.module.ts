
import { BrowserModule } from '@angular/platform-browser';
import { NgModule, APP_INITIALIZER } from '@angular/core';
import { RouterModule } from '@angular/router';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule, HttpClient } from '@angular/common/http';
import { LocationStrategy, PathLocationStrategy, HashLocationStrategy } from '@angular/common';

import { AppRoutingModule } from './app.routing.module';
import { AppComponent } from './app.component';

import { FlexLayoutModule } from '@angular/flex-layout';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { AppConfigService } from './shared/services/appconfig.service';
import { SharedModule } from './shared/shared.module';
import { SpinnerComponent } from './shared/modules/spinner.component';

export function initializeApp(appConfig: AppConfigService) {
 return () => appConfig.load(false);
}
import { MaterialModule } from './shared/material-module';
import { ToastrModule } from 'ngx-toastr';
import { NgxSpinnerModule } from 'ngx-spinner';

@NgModule({
  declarations: [
    AppComponent,
    SpinnerComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    MaterialModule,
    FormsModule,
    ReactiveFormsModule,
    FlexLayoutModule,
    HttpClientModule,
    SharedModule,
    AppRoutingModule,
    ToastrModule.forRoot(),
    NgxSpinnerModule
  ],
  providers: [
    // AppConfigService,
    // {
    //   provide: APP_INITIALIZER,
    //   useFactory: initializeApp,
    //   deps: [AppConfigService],
    //   multi: true
    // },
    {
      provide: LocationStrategy,
      useClass: HashLocationStrategy //PathLocationStrategy
    }
  ],
  bootstrap: [AppComponent]
})
export class AppModule {}
