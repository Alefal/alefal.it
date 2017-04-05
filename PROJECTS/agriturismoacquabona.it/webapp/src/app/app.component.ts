import { Component } from '@angular/core';
import {ContactService}    from './contact.service';
import {Email}             from './interfaces/Email';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'Benvenuti in Agriturismo Acquabona!';
  sendmessage   = 'false';
  errormessage  = 'false';

  constructor(private _contactService : ContactService) { 
    this.sendmessage   = 'false';
    this.errormessage  = 'false';
  }

  public message: Email = {name: '', email: '', subject: '', message: ''};
  onSubmit() {
      this._contactService.postEmail(this.message).subscribe(
        response => this.handleResponse(response),
        error => this.handleResponse(error)
      );
    }
 
    handleResponse(response){
      debugger;
      console.log('msg is: {response.status}');
 
      if(response.statusText =='OK'){
        this.message = {name: '', email: '', subject: '', message: ''};
        this.sendmessage = 'true';
      } else {
        this.errormessage = 'true';
      }
      /*
      if(response.status =='error'){
      }
      */
    }
}
