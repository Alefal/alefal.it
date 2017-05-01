import { Injectable } from '@angular/core';

@Injectable()
export class LanguageService {

  langInUse: string = '';

  constructor() {}

  check() { 
    console.log('check');
    console.log(localStorage.getItem('langInUse'));
    
    if(localStorage.getItem('langInUse') !== null) {
      this.langInUse = localStorage.getItem('langInUse')
      return this.langInUse;
    } else {
      let lang = navigator.language;
      console.log(lang);

      if(lang == 'it' || lang == 'IT') {
        localStorage.setItem('langInUse','IT');
      } else {
        localStorage.setItem('langInUse','EN');
      }
      return lang;
    }
  }

  changeLang(lang) {
    if(lang == 'it' || lang == 'IT') {
      localStorage.setItem('langInUse','IT');
    } else {
      localStorage.setItem('langInUse','EN');
    }
  }

}
