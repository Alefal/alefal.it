import { Component, OnInit } from '@angular/core';
import { CreateService } from '../../../../shared/services/create.service';

@Component({
  selector: 'wizard-introduction',
  templateUrl: './introduction.component.html',
  styleUrls: ['./introduction.component.css']
})
export class IntroductionComponent implements OnInit {

  constructor(public createService: CreateService) { }

  ngOnInit() {
  }

}
