import { Injectable } from '@angular/core';

import * as $ from 'jquery';

@Injectable()
export class SharedService {

  leftPanel: boolean = false;
  rightPanel: boolean = false;

  constructor() { }

  showLeftPanel() {
    this.leftPanel = !this.leftPanel;
    if(this.leftPanel) {
      $('#wrapper').animate({
        marginLeft: '25%'
      }, 400);
    } else {
      $('#wrapper').animate({
        marginLeft: '0'
      }, 400);
    }
  }
  showRightPanel() {
    this.rightPanel = !this.rightPanel;
    if(this.rightPanel) {
      $('#wrapper').animate({
        marginRight: '25%'
      }, 400);
    } else {
      $('#wrapper').animate({
        marginRight: '0'
      }, 400);
    }
  }
}
