import { Component } from '@angular/core';
import { StoreService } from '../../../shared/services/store.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: []
})
export class AppHeaderComponent {
  constructor(private storeService: StoreService) { }
}
