import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';

import { AppComponent } from './app.component';
import { ArticoloComponent } from './articolo/articolo.component';
import { ArticoloFormReactiveComponent } from './articolo-form-reactive/articolo-form-reactive.component';

@NgModule({
  declarations: [
    AppComponent,
    ArticoloComponent,
    ArticoloFormReactiveComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    ReactiveFormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
