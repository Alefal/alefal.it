import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

import { AlertService, AuthenticationService } from '../_services/index';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  model: any = {};
  loading = false;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private authenticationService: AuthenticationService,
    private alertService: AlertService) { }

  ngOnInit() {
    // reset login status
    this.authenticationService.logout();
  }

  login() {
    this.loading = true;

    /*
    if (this.model.username == 'admin' && this.model.password == 'admin') {
      localStorage.setItem('currentUser', 'admin/admin');
      this.router.navigate(['/home']);
    } else {
      this.alertService.error('Authentication failed!');
      this.loading = false;
    }
    */
    
    this.authenticationService.login(this.model.username, this.model.password)
      .subscribe(data => {
        console.log('res: '+JSON.stringify(data));

        if(data.status == 'error') {
          this.alertService.error(data.error);
          this.loading = false;
        } else if(data.status == 'ok') {
          this.router.navigate(['/home']);
        } else {
          this.alertService.error('Authentication failed!');
          this.loading = false;
        }
      },
      error => {
        this.alertService.error(error);
        this.loading = false;
      });
    
  }

}
