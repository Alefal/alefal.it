import { Component, OnInit, Input } from '@angular/core';
import { CreateService } from '../../../../shared/services/create.service';

@Component({
  selector: 'wizard-correlation',
  templateUrl: './correlation.component.html',
  styleUrls: ['./correlation.component.css']
})
export class CorrelationComponent implements OnInit {

  constructor(public createService: CreateService) {}

  ngOnInit() {}
}
