import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';

import { PageHeaderComponent } from './page-header.component';
import { LanguageTranslationModule } from '../language-translation/language-translation.module';

import { TooltipModule } from 'ngx-bootstrap';

@NgModule({
    imports: [
        CommonModule, 
        RouterModule,
        LanguageTranslationModule,
        // NGX Bootstrap
        TooltipModule.forRoot(),
    ],
    declarations: [PageHeaderComponent],
    exports: [PageHeaderComponent]
})
export class PageHeaderModule {}
