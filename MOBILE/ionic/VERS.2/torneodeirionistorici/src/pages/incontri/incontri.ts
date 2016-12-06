import { Component } from '@angular/core';
import { NavParams, NavController, LoadingController, ModalController } from 'ionic-angular';

import { HttpService }          from '../../providers/http-service';
import { ConnectivityService }  from '../../providers/connectivity-service';

import { TabellinoModal }       from './tabellino-modal';
import { LiveModal }            from './live-modal';

@Component({
  selector: 'page-incontri',
  templateUrl: 'incontri.html'
})
export class Incontri {

  incontri: any;
  incontriAll: any;
  loading: any;
  errorMessage: String;
  errorMessageView: any;

  tipologiaTorneo: string;
  group: number;
  type: string;
  round: number;

  constructor(
    public params: NavParams,
    public navCtrl: NavController,
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    public modalCtrl: ModalController, 
    public connectivityService: ConnectivityService
  ) { 
    this.tipologiaTorneo = params.get('tipologia'); //league | tournament
    this.group  = params.get('group');
    this.type   = params.get('type');
    this.round  = params.get('round');

    console.log('this.round: ' + this.round);
  }

  ionViewDidLoad() {
    if(this.connectivityService.connectivityFound) {
      this.getData();
    } else {
      if(localStorage.getItem('getIncontri_'+this.round) === null) {
        this.connectivityService.showInfoNoData();
      } else {
        this.incontri = JSON.parse(localStorage.getItem('getIncontri_'+this.round));
        this.connectivityService.showInfo();
      }
    }
  }
  getData(){
    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
      //content: 'Please wait...'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getIncontri','',this.round,this.type,this.group,this.tipologiaTorneo)
      .then(res => {
        //console.log('SUCCESS: ' + JSON.stringify(res));

        if(res[0].response[0].result == 'OK') {
          this.incontri     = res[0].matchs;
          this.incontriAll  = res[0].matchs;

          for (let mtc of this.incontri) {
            //console.log(mtc['match_date'] + ' | ' +mtc['match_time']);
            //console.log(this.convertToDate(mtc['match_date']));
            //console.log(this.convertTime12to24(mtc['match_time']));  

            //Date incontri in MILLISECONDI: confrontare con la data odierna per inviare LocalNotification
            let dateString = this.convertToDate(mtc['match_date'])+' '+this.convertTime12to24(mtc['match_time']);
            let dateMatch = new Date(dateString);
            let currentTime = new Date();

            if(dateMatch.getTime() < currentTime.getTime()) {
              console.log('GIOCATA');  
            } else {
              console.log('DA GIOCARE');                
            }
          }

          localStorage.setItem('getIncontri_'+this.round,JSON.stringify(this.incontri));
        } else {
          this.incontri = 'Nessun dato! Riprovare più tardi.';
        }

        this.loading.dismiss();
      })
      .catch(error => {
        console.log('ERROR: ' + error);
        this.errorMessage = 'Si è verificato un errore. Riprovare più tardi!';
        this.errorMessageView = true;
        this.loading.dismiss();
      });
  }

  getItems(ev) {
    this.incontri = this.incontriAll;
    var val = ev.target.value;
    //this.productFilter = this.products;

    // if the value is an empty string don't filter the items
    if (val && val.trim() != '') {
      this.incontri = this.incontri.filter((item) => {
        return (item.homeName.toLowerCase().indexOf(val.toLowerCase()) > -1 || item.awayName.toLowerCase().indexOf(val.toLowerCase()) > -1);
      })
    }
  }
  onCancel(ev) {
    this.incontri = this.incontriAll;
  }

  tabellino(id,teamHome,teamAway,result,home_team_id,away_team_id,home_team_logo,away_team_logo) {
    //if(this.connectivityService.connectivityFound) {
      let modal = this.modalCtrl.create(TabellinoModal, { 
        id:id,
        teamHome:teamHome,
        teamAway:teamAway,
        result:result,
        home_team_id: home_team_id,
        away_team_id: away_team_id,
        tipologiaTorneo: this.tipologiaTorneo,
        home_team_logo: home_team_logo,
        away_team_logo: away_team_logo 
      });
      modal.present();
    //} else {
      //this.connectivityService.showAlert();
    //}
  }

  live(matchId,homeName,awayName,result,home_team_logo,away_team_logo) {
    if(this.connectivityService.connectivityFound) {
      let modal = this.modalCtrl.create(LiveModal, { 
        matchId: matchId ,
        homeName:homeName,
        awayName:awayName,
        result:result,
        tipologiaTorneo: this.tipologiaTorneo,
        home_team_logo: home_team_logo,
        away_team_logo: away_team_logo 
      });
      modal.present();
    } else {
      this.connectivityService.showAlert();
    }
  }

  convertToDate(dateStr) {
    var parts = dateStr.split('/');
    var year  = parts[2];
    var mount = parts[1]; 
    var day   = parts[0]; 
     
    return year+'-'+mount+'-'+day;
    //return new Date(parts[2], parts[1] - 1, parts[0]);
  }
  convertTime12to24(time12h) {
    const [time, modifier] = time12h.split(' ');
    let [hours, minutes] = time.split(':');
    //console.log(hours+' | '+minutes+' | '+modifier);
    
    if (hours === '12') {
      hours = '00';
    }
    if (modifier === 'pm') {
      hours = parseInt(hours, 10) + 13;
    }
    return hours + ':' + minutes;
  }

}