import { Component, Input, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: []
})
export class AppHeaderComponent {

  @Input() appConfig$: any;
  @Input() appIsAuthenticated$: any;
  @Input() userLogged$: any;
  
  @Output('callFunction') callFunctionEmitter = new EventEmitter<any>();
  
  constructor() { }

  callFunction(func) {
    this.callFunctionEmitter.emit(func);
  }
}
