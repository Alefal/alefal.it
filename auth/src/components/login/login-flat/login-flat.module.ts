import { NgModule, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { LoginFlat } from './login-flat';

import {TranslateModule} from '@ngx-translate/core';

@NgModule({
    declarations: [
        LoginFlat,
    ],
    imports: [
        IonicPageModule.forChild(LoginFlat),
        TranslateModule.forChild()
    ],
    exports: [
        LoginFlat
    ],
    schemas: [CUSTOM_ELEMENTS_SCHEMA]
})

export class LoginFlatModule { }
