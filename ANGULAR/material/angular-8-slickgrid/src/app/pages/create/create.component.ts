import { Component, OnInit, ViewChild } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { CreateService } from '../../shared/services/create.service';
import { MatStepper } from '@angular/material';

@Component({
  selector: 'app-create',
  templateUrl: './create.component.html',
  styleUrls: ['./create.component.css']
})
export class CreateComponent implements OnInit {

  @ViewChild('stepper', {static: false}) private stepper: MatStepper;
  
  constructor(
    public createService: CreateService
  ) {}

  ngOnInit() {
    setTimeout(() => {
      this.createService.stepper = this.stepper;
    }, 0);
  }

}
