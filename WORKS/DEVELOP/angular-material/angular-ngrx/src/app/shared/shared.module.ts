import { NgModule, APP_INITIALIZER } from '@angular/core';

import { MenuItems } from './modules/menu-items/menu-items';
import { AccordionAnchorDirective, AccordionLinkDirective, AccordionDirective } from './modules/accordion';

import { LanguageTranslationModule } from './modules/language-translation/language-translation.module'
import { AppConfigService } from './services/appconfig.service';
import { HttpService } from './services/http.service';
import { SharedService } from './services/shared.service';
import { StoreService } from './services/store.service';
import { AuthGuard } from './guards/auth.guard';

export function initializeApp(appConfig: AppConfigService) {
  return () => appConfig.load(false);
}

@NgModule({
  imports: [
    LanguageTranslationModule,
  ],
  declarations: [
    AccordionAnchorDirective,
    AccordionLinkDirective,
    AccordionDirective
  ],
  exports: [
    AccordionAnchorDirective,
    AccordionLinkDirective,
    AccordionDirective
  ],
  providers: [
    AuthGuard,
    MenuItems,
    HttpService,
    SharedService,
    StoreService,
    AppConfigService,
    {
      provide: APP_INITIALIZER,
      useFactory: initializeApp,
      deps: [AppConfigService],
      multi: true
    },
  ]
})
export class SharedModule { }
