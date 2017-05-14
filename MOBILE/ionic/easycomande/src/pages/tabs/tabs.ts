import { Component } from '@angular/core';

import { ComandePage }      from '../comande/comande';
import { MenuPage }         from '../menu/menu';

@Component({
  selector: 'page-tabs',
  templateUrl: 'tabs.html'
})
export class TabsPage {

  tab1Root = ComandePage;
  tab2Root = MenuPage;

  constructor() {

  }
}