import { Injectable, ViewChild } from '@angular/core';
import { FormGroup, FormBuilder, FormControl, Validators } from '@angular/forms';
import { Observable, Subject } from 'rxjs';
import { MatStepper } from '@angular/material';

@Injectable()
export class CreateService {

  stepCorrelationComplete: boolean = true;
  stepIntroductionComplete: boolean = true;
  stepOperationComplete: boolean = true;
  
  stepCorrelationError: boolean = false;
  stepIntroductionError: boolean = false;
  stepOperationError: boolean = false;

  opcObject: any = {}

  stepper: MatStepper;

  constructor() {
    this.opcObject = {};
    this.opcObject.correlation = '';
    this.opcObject.introduction = '';
    this.opcObject.operation = '';
  }

  checkCorrelationStep() {
    this.stepCorrelationError = false;
    if(this.opcObject.correlation == '') {
      this.stepCorrelationError = true;
      return false;
    }
    this.stepper.next();
  }
  checkIntroductionStep() {
    this.stepIntroductionError = false;
    if(this.opcObject.introduction == '') {
      this.stepIntroductionError = true;
      return false;
    }
    this.stepper.next();
  }
  checkOperationStep() {
    this.stepOperationError = false;
    if(this.opcObject.operation == '') {
      this.stepOperationError = true;
      return false;
    }
    this.stepper.next();
  }
}