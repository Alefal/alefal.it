import { Component, Input, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: []
})
export class AppProfileComponent {

  @Input() appConfig$: any;

  @Output('callFunction') callFunctionEmitter = new EventEmitter<any>();

  constructor() { }

  callFunction(func) {
    this.callFunctionEmitter.emit(func);
  }
}
