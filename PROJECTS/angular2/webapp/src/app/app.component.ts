import { Component } from '@angular/core';
import {Email}             from './interfaces/Email';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'Angular 2';

  constructor() { 
    this.title = 'Alessandro';
    console.log(this.title);
    
  }

}