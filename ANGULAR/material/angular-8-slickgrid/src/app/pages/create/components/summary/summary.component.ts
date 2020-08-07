import { Component, OnInit } from '@angular/core';
import { CreateService } from '../../../../shared/services/create.service';

@Component({
  selector: 'wizard-summary',
  templateUrl: './summary.component.html',
  styleUrls: ['./summary.component.css']
})
export class SummaryComponent implements OnInit {

  constructor(public createService: CreateService) { }

  ngOnInit() {
  }

}
