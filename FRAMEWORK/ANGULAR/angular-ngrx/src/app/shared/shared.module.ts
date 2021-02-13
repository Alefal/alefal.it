import { NgModule } from '@angular/core';

import { AccordionAnchorDirective, AccordionLinkDirective, AccordionDirective } from './modules/accordion';
import { LanguageTranslationModule } from './modules/language-translation/language-translation.module';

import { HttpService } from './services/http.service';
import { SharedService } from './services/shared.service';
import { StoreService } from './services/store.service';
import { AuthGuard } from './guards/auth.guard';

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
    HttpService,
    SharedService,
    StoreService
  ]
})
export class SharedModule { }
