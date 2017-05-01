import { Component } from '@angular/core';
import { LanguageService }    from './language.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'Benvenuti in Agriturismo Acquabona!';

  langIT: boolean = false;
  langEN: boolean = false;

  constructor(private language: LanguageService) { }

  ngOnInit() {
    if(this.language.check() == 'it' || this.language.check() == 'IT') {
      this.langIT = true;
      this.langEN = false;
    } else {
      this.langIT = false;
      this.langEN = true;
    }
  }

  changeLang(lang) {
    this.language.changeLang(lang);

    if(lang == 'it' || lang == 'IT') {
      this.langIT = true;
      this.langEN = false;
    } else {
      this.langIT = false;
      this.langEN = true;
    }
  }

}
