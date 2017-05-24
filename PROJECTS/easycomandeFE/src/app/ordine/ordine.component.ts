import { Component, OnInit } from '@angular/core';
import { Location } from '@angular/common';
import { Router, ActivatedRoute, Params } from '@angular/router';

import { Ordine } from '../_models/ordine';

@Component({
  selector: 'app-ordine',
  templateUrl: './ordine.component.html',
  styleUrls: ['./ordine.component.css']
})
export class OrdineComponent implements OnInit {

  ordine: Ordine;

  constructor(
    private location: Location,
    private router: Router,
    private route: ActivatedRoute,
  ) { }

  ngOnInit(): void {
    this.route.params
      .subscribe(params => {
        this.ordine = JSON.parse(params['order']);
        console.log('%o', this.ordine);
      });
  }

  backToOrders() {
    console.log('backToOrders');
    //this.location.back();
    this.router.navigate(['/home']);
  }

}
