import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { LayoutComponent } from './layout/layout.component';
import { HeaderComponent } from './header/header.component';
import { FooterComponent } from './footer/footer.component';
import { LeftComponent } from './panels/left/left.component';
import { RightComponent } from './panels/right/right.component';

import { PostComponent } from '../container/post/post.component';
import { CollectionComponent } from '../container/post/collection/collection.component';
import { DetailComponent } from '../container/post/detail/detail.component';

@NgModule({
  declarations: [
    LayoutComponent, 
    HeaderComponent, 
    FooterComponent,
    LeftComponent,
    RightComponent,
    // NGRX
    PostComponent,
    CollectionComponent,
    DetailComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
  ],
  exports: [LayoutComponent]
})
export class UiModule { }
