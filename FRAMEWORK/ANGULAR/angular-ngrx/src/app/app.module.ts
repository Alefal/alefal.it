
import { BrowserModule } from '@angular/platform-browser';
import { NgModule, APP_INITIALIZER } from '@angular/core';
import { RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { HttpClientModule, HttpClient } from '@angular/common/http';
import { LocationStrategy, PathLocationStrategy } from '@angular/common';
import { FlexLayoutModule } from '@angular/flex-layout';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { ToastrModule } from 'ngx-toastr';
import { NgxSpinnerModule } from "ngx-spinner";

import { AppRoutes } from './app.routing';
import { AppComponent } from './app.component';


import { SharedModule } from './shared/shared.module';
import { SpinnerComponent } from './shared/modules/spinner.component';

export function initializeApp(appConfig: AppConfigService) {
  return () => appConfig.load(false);
}
import { MaterialModule } from './shared/material-module';

// import { NgcCookieConsentModule, NgcCookieConsentConfig } from 'ngx-cookieconsent';
// const cookieConfig: NgcCookieConsentConfig = {
//   cookie: {
//     domain: 'localhost' // or 'your.domain.com' // it is mandatory to set a domain, for cookies to work properly (see https://goo.gl/S2Hy2A)
//   },
//   position: 'bottom-right',
//   palette: {
//     popup: {
//       background: '#000'
//     },
//     button: {
//       background: '#f1d600'
//     }
//   },
//   theme: 'block', //block | classic | edgeless
//   type: 'opt-out'
// };

import { environment } from '../environments/environment';

////////// START: NGRX Store
import { StoreModule } from '@ngrx/store';
import { StoreDevtoolsModule } from '@ngrx/store-devtools';
import { EffectsModule } from '@ngrx/effects';

import * as fromApps from './store/reducers/app.reducer';
import * as fromAuth from './auth/store/reducers/auth.reducer';
import * as fromLayouts from './features/layouts/store/reducers/layouts.reducer';
import * as fromUser from './features/users/store/reducers/user.reducer';

import { AppEffects } from './store/effects/app.effects';
import { AuthEffects } from './auth/store/effects/auth.effects';
import { LayoutsEffects } from './features/layouts/store/effects/layouts.effects';
import { UserEffects } from './features/users/store/effects/user.effects';
import { AppConfigService } from './shared/services/appconfig.service';
////////// END: NGRX Store

@NgModule({
  declarations: [
    AppComponent,
    SpinnerComponent,
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    MaterialModule,
    FormsModule,
    FlexLayoutModule,
    HttpClientModule,
    SharedModule,
    RouterModule.forRoot(AppRoutes),
    ToastrModule.forRoot(),
    NgxSpinnerModule,
    !environment.production ? StoreDevtoolsModule.instrument() : [],

    ////////// START: NGRX Store
    StoreModule.forRoot({ appState: fromApps.createAppReducer }),
    StoreModule.forFeature('authState', fromAuth.createAuthReducer),
    StoreModule.forFeature('layoutState', fromLayouts.createLayoutsReducer),
    StoreModule.forFeature('userState', fromUser.createUserReducer),

    StoreDevtoolsModule.instrument({
      maxAge: 25, // Retains last 25 states
      //logOnly: environment.production, // Restrict extension to log-only mode
    }),
    EffectsModule.forRoot(
      [
        AppEffects,
        AuthEffects,
        LayoutsEffects,
        UserEffects
      ]
    ),
    ////////// END: NGRX Store

    // NgcCookieConsentModule.forRoot(cookieConfig),
  ],
  providers: [
    AppConfigService,
    {
      provide: APP_INITIALIZER,
      useFactory: initializeApp,
      deps: [AppConfigService],
      multi: true
    },
    {
      provide: LocationStrategy,
      useClass: PathLocationStrategy,
    }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
