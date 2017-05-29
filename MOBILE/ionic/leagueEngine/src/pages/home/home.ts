import { Component, ViewChild } from '@angular/core';
import { Nav }   from 'ionic-angular';
import { NavController, NavParams, LoadingController, ActionSheetController }  from 'ionic-angular';

import { Network } from '@ionic-native/network';

import { PostsPage }      from '../posts/posts';
import { Squadre }        from '../squadre/squadre';
import { Incontri }       from '../incontri/incontri';
import { Classifica }     from '../classifica/classifica';
import { Statistiche }    from '../statistiche/statistiche';

import { HttpService }          from '../../providers/http-service';
import { ConnectivityService }  from '../../providers/connectivity-service';

//import { FillPipe }             from '../../pipes/fill-pipe';

@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {
  @ViewChild(Nav) nav: Nav;

  tournament: any;
  tournamentName: string;
  tournamentType: string;
  tournamentTeams: number;
  tournamentRound: number;

  tournamentRounds: string[] = [];

  sponsors: any;

  loading: any;
  errorMessage: String;
  errorMessageView: any;

  showPage: boolean = false;
  networkFound: any;

  constructor(
    public navCtrl: NavController, 
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    public params: NavParams, 
    public connectivityService: ConnectivityService,
    public actionSheetCtrl: ActionSheetController,
    private network: Network
  ) { }

  ionViewDidLoad() {
    this.networkFound = this.connectivityService.connectivityFound;
    
    console.log('home_1 - connectivityFound: '+this.connectivityService.connectivityFound);
    
    setTimeout(() => {
      console.log('Network.connection: '+JSON.stringify(this.network.type));

      if (this.network.type !== 'none' || this.connectivityService.connectivityFound) {
        console.log('Connection found!');
        this.getData();
      } else {
        this.showPage = true;
        //Torneo
        this.tournament = JSON.parse(localStorage.getItem('getTorneo'));
        this.tournamentName   = this.tournament[0].tour_name;
        this.tournamentType   = this.tournament[0].tour_type;        
        this.tournamentTeams  = this.tournament[0].tour_teams;  //Math.log2(this.tournamentTeams)
        this.tournamentRound  = this.tournament[0].tour_round;
        this.getRounds(this.tournamentRound);
        //Sponsors
        this.sponsors = localStorage.getItem('getSponsors');

        this.connectivityService.showInfo();
      }
    }, 0);
  }

  getData(){
    console.log('Campionato');

    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
    });
    this.loading.present();

    //getTorneo
    this.httpService
      .getCallHttp('getTorneo','','','','','')
      .subscribe(res => {
        if(res[0].response[0].result == 'OK') {
          this.tournament = JSON.stringify(res[0].tournament);
          console.log('-> '+this.tournament.length);
          
          if(this.tournament.length > 2) {
            this.tournamentName   = res[0].tournament[0].tour_name;
            this.tournamentType   = res[0].tournament[0].tour_type;
            this.tournamentTeams  = res[0].tournament[0].tour_teams;  //Math.log2(this.tournamentTeams)
            this.tournamentRound  = res[0].tournament[0].tour_round;

            this.getGiocatori(this.tournamentType);
          } else {
            console.log('home_3: nessun dato');
          }
          this.getRounds(this.tournamentRound);
          localStorage.setItem('getTorneo',this.tournament);
        } else {
          this.tournament = 'Nessun dato! Riprovare più tardi.';
        }
        this.showPage = true;
        this.loading.dismiss();
      },
      error => {
        console.log('ERROR: ' + error);
        this.showPage = true;
        this.errorMessage = 'Si è verificato un errore. Riprovare più tardi!';
        this.errorMessageView = true;
        this.loading.dismiss();
      });   
  }

  navigate(section,tipologia,round) {
    console.log('-> '+section+' | '+tipologia+' | '+round);
    console.log('-> '+this.connectivityService.connectivityFound);

    if(section == 'Squadre'){
      this.navCtrl.push(Squadre, {
        tipologia: tipologia
      });
    } else if(section == 'Incontri'){
      this.navCtrl.push(Incontri, {
        tipologia: tipologia
      });
    } else if(section == 'ScontriDiretti'){
      this.navCtrl.push(Incontri, {
        tipologia: tipologia,
        type: 'knockout',
        round: parseInt(round)+1
      });
    } else if(section == 'Classifica'){
      this.navCtrl.push(Classifica, {
        tipologia: tipologia
      });
    } else if(section == 'Statistiche'){
      this.navCtrl.push(Statistiche, {
        tipologia: tipologia
      });
    }
  }

  getRounds(rounds) {
    if(rounds == 5) {
      for(let i = 1; i <= rounds; i++) {
        if(i == 5) {
          this.tournamentRounds.push('Finale');
        } else if(i == 4) {
          this.tournamentRounds.push('Semifinale');
        } else if(i == 3) {
          this.tournamentRounds.push('Quarti');
        } else if(i == 2) {
          this.tournamentRounds.push('Ottavi');
        } else if(i == 1) {
          this.tournamentRounds.push('Sedicesimi');
        } else { 
          this.tournamentRounds.push('Round '+i);
        }
      }
    } else if(rounds == 4) {
       for(let i = 1; i <= rounds; i++) {
        if(i == 4) {
          this.tournamentRounds.push('Finale');
        } else if(i == 3) {
          this.tournamentRounds.push('Semifinale');
        } else if(i == 2) {
          this.tournamentRounds.push('Quarti');
        } else if(i == 1) {
          this.tournamentRounds.push('Ottavi');
        } else { 
          this.tournamentRounds.push('Round '+i);
        }
      }
    } else if(rounds == 3) {
      for(let i = 1; i <= rounds; i++) {
        if(i == 3) {
          this.tournamentRounds.push('Finale');
        } else if(i == 2) {
          this.tournamentRounds.push('Semifinale');
        } else if(i == 1) {
          this.tournamentRounds.push('Quarti');
        } else { 
          this.tournamentRounds.push('Round '+i);
        }
      }
    } else if(rounds == 2) {
      for(let i = 1; i <= rounds; i++) {
        if(i == 2) {
          this.tournamentRounds.push('Finale');
        } else if(i == 1) {
          this.tournamentRounds.push('Semifinale');
        } else { 
          this.tournamentRounds.push('Round '+i);
        }
      }
    } else if(rounds == 1) {
      for(let i = 1; i <= rounds; i++) {
        if(i == 1) {
          this.tournamentRounds.push('Finale');
        } else { 
          this.tournamentRounds.push('Round '+i);
        }
      }
    } else {
      console.log('ND');
    }
  }
  
  getGiocatori(tipologiaTorneo) {
    //getGiocatori
    this.httpService
      .getCallHttp('getGiocatoriAll','','','','',tipologiaTorneo)
      .subscribe(res => {
        //console.log('SUCCESS: ' + JSON.stringify(res));

        if(res[0].response[0].result == 'OK') {
          localStorage.setItem('getGiocatori',JSON.stringify(res[0].atleti));
        } else {
          localStorage.setItem('getGiocatori','ND');
        }
      },
      error => {
        console.log('ERROR: ' + error);
      });
  }

  doRefresh(refresher) {
    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
    });
    this.loading.present();

    window.location.reload();
  }

  openPage() {
    this.navCtrl.setRoot(HomePage);
  }
}