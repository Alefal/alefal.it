import {Injectable} from '@angular/core';
import {Http} from '@angular/http';
import {Observable} from 'rxjs/Observable';
import 'rxjs/Rx';
import 'rxjs/add/operator/toPromise';
  
@Injectable() 
export class HttpService {  
    constructor(private http:Http) {
         this.http = http;
    }
  
    getCallHttp(call,subCategoryId,slugOrId) {
        console.log('getCallHttp: '+call+' | '+subCategoryId+' | '+slugOrId);
        
        //var host = 'http://10.80.18.147/amalficoastapps.it/ACA/wordpress/';
        //var host = '/amalficoastapps.it/ACA/wordpress/';                        //proxies in ionic.project.json
        var host = 'http://www.amalficoastapps.it/cms/';
        var url = '';
        if(call == 'all') {
            url = '?json=get_posts&posts_per_page=-1';
        } else if(call == 'categories') {
             url = '?json=get_category_index';
        } else if(call == 'subcategories') {
            url = '?json=get_category_index&parent='+subCategoryId;
        } else if(call == 'posts') {
            url = '?json=get_category_posts&slug='+slugOrId+'&post_type=post';
        } else if(call == 'post') {
            url = '?json=get_post&id='+slugOrId+'&post_type=post';
        }

        console.log(url);

        var response = this.http.get(host+''+url)
               .toPromise()
               .then(response => response.json())
               .catch(this.handleError);
        return response;
    }

    getWeather(lat,lon) {
        //var url = 'data/weather/forecast.io.json';
        //var url = 'https://api.forecast.io/forecast/0f2f94303ebb9e178f38212be3aec103/40.742723,14.468953?lang=it';
        var url = 'https://api.forecast.io/forecast/0f2f94303ebb9e178f38212be3aec103/'+lat+','+lon+'?lang=it';
        console.log('getWeather: '+url+' | '+lat+' | '+lon);

        var response = this.http.get(url)
               .toPromise()
               .then(response => response.json())
               .catch(this.handleError);
        return response;
    }

    getCountryName(lat,lon) {
        //var url = 'http://maps.googleapis.com/maps/api/geocode/json?latlng=40.742723,14.468953&sensor=true';
        var url = 'http://maps.googleapis.com/maps/api/geocode/json?latlng='+lat+','+lon+'&sensor=true';
        console.log('getWeather: '+url+' | '+lat+' | '+lon);

        var response = this.http.get(url)
               .toPromise()
               .then(response => response.json())
               .catch(this.handleError);
        return response;
    }

    private handleError(error: any) {
        console.error('An error occurred', error);
        return Promise.reject(error.message || error);
    }
}