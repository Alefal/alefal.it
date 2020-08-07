import { Component, OnInit } from '@angular/core';
import { CreateService } from '../../../../shared/services/create.service';

@Component({
  selector: 'wizard-operation',
  templateUrl: './operation.component.html',
  styleUrls: ['./operation.component.css']
})
export class OperationComponent implements OnInit {

  constructor(public createService: CreateService) { }

  ngOnInit() {
  }

}
