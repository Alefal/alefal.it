import { HttpClientModule } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { StoreModule } from '@ngrx/store';
import { StoreDevtoolsModule } from '@ngrx/store-devtools';

import { EffectsModule } from '@ngrx/effects';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { PostEffects } from './store/effects/post.effects';

import { createPostReducer } from './store/reducers/post.reducer';
import { UiModule } from './ui/ui.module';
import { SharedService } from './shared/services/shared.service';

@NgModule({
  declarations: [AppComponent],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    BrowserAnimationsModule,
    HttpClientModule,
    
    ////////// START: NGRX Store
    StoreModule.forRoot({ postState: createPostReducer }),
    //StoreModule.forFeature('OTHER', OTHER_Reducer),
    StoreDevtoolsModule.instrument({
      maxAge: 25, // Retains last 25 states
      //logOnly: environment.production, // Restrict extension to log-only mode
    }),
    EffectsModule.forRoot(
      [
        //OTHER_Effects,
        PostEffects
      ]
      ),
    ////////// END: NGRX Store
    UiModule,
  ],
  providers: [SharedService],
  bootstrap: [AppComponent]
})
export class AppModule {}
