import { Component, OnInit } from '@angular/core';
import { animate, state, style, transition, trigger, query } from '@angular/animations';
import { SharedService } from 'src/app/shared/services/shared.service';

@Component({
  selector: 'app-left',
  templateUrl: './left.component.html',
  styleUrls: ['./left.component.css'],
  animations: [
    // In - Out
    trigger('slideInOut', [
      state('in', style({
        //transform: 'translate3d(0,0,0)'
        'margin-left': '0'
      })),
      state('out', style({
        //transform: 'translate3d(100%, 0, 0)'
        'margin-left': '-25%'
      })),
      transition('in => out', animate('400ms ease-in-out')),
      transition('out => in', animate('400ms ease-in-out'))
    ]),
  ]
})
export class LeftComponent implements OnInit {

  constructor(private sharedService: SharedService) { }

  ngOnInit() {
  }

}
