import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { TranslateModule } from '@ngx-translate/core';
import { MaterialModule } from '../../shared/material-module';

import { CreateRoutingModule } from './create-routing.module';
import { CreateComponent } from './create.component';
import { CorrelationComponent } from './components/correlation/correlation.component';
import { IntroductionComponent } from './components/introduction/introduction.component';
import { OperationComponent } from './components/operation/operation.component';
import { SummaryComponent } from './components/summary/summary.component';

import { CreateService } from '../../shared/services/create.service';
import { SharedService } from '../../shared/services/shared.service';

@NgModule({
  declarations: [
    CorrelationComponent,
    CreateComponent,
    IntroductionComponent,
    OperationComponent,
    SummaryComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    CreateRoutingModule,
    MaterialModule,
    TranslateModule
  ],
  exports: [
    CreateComponent,
    IntroductionComponent,
    OperationComponent,
    SummaryComponent
  ],
  providers: [ 
    SharedService,
    CreateService
  ]
})
export class CreateModule { }
