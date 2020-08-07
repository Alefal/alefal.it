import { NgModule } from '@angular/core';

import { MenuItems } from './modules/menu-items/menu-items';
import { AccordionAnchorDirective, AccordionLinkDirective, AccordionDirective } from './modules/accordion';
import { LanguageTranslationModule } from './modules/language-translation/language-translation.module';

import { HttpService } from './services/http.service';
import { SharedService } from './services/shared.service';
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
    MenuItems,
    AuthGuard,
    HttpService,
    SharedService
  ]
})
export class SharedModule { }
