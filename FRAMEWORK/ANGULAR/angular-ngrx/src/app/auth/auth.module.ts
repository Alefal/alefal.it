import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { AuthRoutingModule } from './auth-routing.module';

import { AuthComponent } from './containers/auth.component';
import { LoginComponent } from './components/login/login.component';

@NgModule({
    imports: [
        CommonModule,
        AuthRoutingModule,
        FormsModule
    ],
    declarations: [
        AuthComponent,
        LoginComponent
    ]
})
export class AuthModule {}
