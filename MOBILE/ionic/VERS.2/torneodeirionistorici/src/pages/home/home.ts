import { Component }      from '@angular/core';
import { NavController, NavParams, LoadingController }  from 'ionic-angular';

import { Comunicati }     from '../comunicati/comunicati';
import { RioniNews }      from '../rioni-news/rioni-news';
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

  tournament: any;
  tournamentType: string;
  tournamentTeams: number;
  tournamentRound: number;

  tournamentRounds: string[] = [];

  loading: any;
  errorMessage: String;
  errorMessageView: any;

  constructor(
    public navCtrl: NavController, 
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    public params: NavParams, 
    public connectivityService: ConnectivityService
  ) { }

  ionViewDidLoad() {
    if(this.connectivityService.connectivityFound) {
      this.getData();
    } else {
      if(localStorage.getItem('getTorneo') === null) {
        this.connectivityService.showInfoNoData();
      } else {
        this.tournament = JSON.parse(localStorage.getItem('getTorneo'));
        this.tournamentType   = this.tournament[0].tour_type;
        this.tournamentTeams  = this.tournament[0].tour_teams;  //Math.log2(this.tournamentTeams)
        this.tournamentRound  = this.tournament[0].tour_round;
        this.getRounds(this.tournamentRound);

        this.connectivityService.showInfo();
      }
    }
  }
  getData(){
    this.loading = this.loadingCtrl.create({
      content: 'Please wait...'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getTorneo','','','','','')
      .then(res => {
        if(res[0].response[0].result == 'OK') {
          this.tournament = JSON.stringify(res[0].tournament);
          this.tournamentType   = res[0].tournament[0].tour_type;
          this.tournamentTeams  = res[0].tournament[0].tour_teams;  //Math.log2(this.tournamentTeams)
          this.tournamentRound  = res[0].tournament[0].tour_round;

          console.log('this.tournamentRound: '+this.tournamentRound);
          this.getRounds(this.tournamentRound);
          localStorage.setItem('getTorneo',this.tournament);
        } else {
          this.tournament = 'Nessun dato! Riprovare più tardi.';
        }
        this.loading.dismiss();
      })
      .catch(error => {
        console.log('ERROR: ' + error);
        this.errorMessage = 'Error!';
        this.errorMessageView = true;
        this.loading.dismiss();
      });
  }

  navigate(section,tipologia,round) {
    console.log('-> '+section+' | '+tipologia+' | '+round);
    console.log('-> '+this.connectivityService.connectivityFound);

    if(section == 'Comunicati'){
      this.navCtrl.push(Comunicati);
    } else if(section == 'RioniNews'){
      this.navCtrl.push(RioniNews);
    } else if(section == 'Squadre'){
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
  
}