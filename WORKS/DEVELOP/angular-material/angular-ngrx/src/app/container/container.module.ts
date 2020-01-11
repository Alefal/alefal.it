import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { UserComponent } from './user/user.component';
import { CollectionComponent } from './user/collection/collection.component';
import { DetailComponent } from './user/detail/detail.component';
import { MaterialModule } from '../demo-material-module';

@NgModule({
  declarations: [
    // USER
    UserComponent,
    CollectionComponent,
    DetailComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    MaterialModule
  ],
  exports: []
})
export class ContainerModule { }
