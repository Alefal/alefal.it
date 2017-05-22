import { Component } from '@angular/core';
import { LanguageService }    from './language.service';

declare var jQuery:any;

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'Benvenuti in Agriturismo Acquabona!';

  langIT: boolean = false;
  langEN: boolean = false;

  showGalleryAgriturismo: boolean = false;
  showGalleryRistorante: boolean = false;
  showGalleryCamere: boolean = false;
  showGalleryPiatti: boolean = false;
  showGalleryFattoria: boolean = false;
  showGalleryAltro: boolean = false;

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

  openGallery(section) {
    console.log(section); //Agriturismo | Ristorante | Camere | Piatti | Fattoria | Altro

    this.showGalleryAgriturismo = false;
    this.showGalleryRistorante  = false;
    this.showGalleryCamere      = false;
    this.showGalleryPiatti      = false;
    this.showGalleryFattoria    = false;
    this.showGalleryAltro       = false;
    
    if(section == 'Agriturismo') {
      this.showGalleryAgriturismo = true;
    } else if(section == 'Ristorante') {
      this.showGalleryRistorante = true;
    } else if(section == 'Camere') {
      this.showGalleryCamere = true;
    } else if(section == 'Piatti') {
      this.showGalleryPiatti = true;
    } else if(section == 'Fattoria') {
      this.showGalleryFattoria = true;
    } else if(section == 'Altro') {
      this.showGalleryAltro = true;
    }
    
    setTimeout(function() {
      jQuery('#modalGallery'+section).modal('show');
      jQuery('.bxslider'+section).bxSlider({
          mode: 'fade',
          //adaptiveHeight: true,
          auto: true
      });
    },0);
  }

}
