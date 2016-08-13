"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var core_1 = require('@angular/core');
var http_1 = require('@angular/http');
require('rxjs/Rx');
require('rxjs/add/operator/toPromise');
var HttpService = (function () {
    function HttpService(http) {
        this.http = http;
        this.http = http;
    }
    HttpService.prototype.getCallHttp = function (call, subCategoryId, slugOrId) {
        console.log('getCallHttp: ' + call + ' | ' + subCategoryId + ' | ' + slugOrId);
        //var host = 'http://10.80.18.147/amalficoastapps.it/ACA/wordpress/';
        //var host = '/amalficoastapps.it/ACA/wordpress/';                        //proxies in ionic.project.json
        var host = 'http://www.amalficoastapps.it/cms/';
        var url = '';
        if (call == 'all') {
            url = '?json=get_posts&posts_per_page=-1';
        }
        else if (call == 'categories') {
            url = '?json=get_category_index';
        }
        else if (call == 'subcategories') {
            url = '?json=get_category_index&parent=' + subCategoryId;
        }
        else if (call == 'posts') {
            url = '?json=get_category_posts&slug=' + slugOrId + '&post_type=post';
        }
        else if (call == 'post') {
            url = '?json=get_post&id=' + slugOrId + '&post_type=post';
        }
        console.log(url);
        var response = this.http.get(host + '' + url)
            .toPromise()
            .then(function (response) { return response.json(); })
            .catch(this.handleError);
        return response;
    };
    HttpService.prototype.getWeather = function (lat, lon) {
        //var url = 'data/weather/forecast.io.json';
        //var url = 'https://api.forecast.io/forecast/0f2f94303ebb9e178f38212be3aec103/40.742723,14.468953?lang=it';
        var url = 'https://api.forecast.io/forecast/0f2f94303ebb9e178f38212be3aec103/' + lat + ',' + lon + '?lang=it';
        console.log('getWeather: ' + url + ' | ' + lat + ' | ' + lon);
        var response = this.http.get(url)
            .toPromise()
            .then(function (response) { return response.json(); })
            .catch(this.handleError);
        return response;
    };
    HttpService.prototype.getCountryName = function (lat, lon) {
        //var url = 'http://maps.googleapis.com/maps/api/geocode/json?latlng=40.742723,14.468953&sensor=true';
        var url = 'http://maps.googleapis.com/maps/api/geocode/json?latlng=' + lat + ',' + lon + '&sensor=true';
        console.log('getWeather: ' + url + ' | ' + lat + ' | ' + lon);
        var response = this.http.get(url)
            .toPromise()
            .then(function (response) { return response.json(); })
            .catch(this.handleError);
        return response;
    };
    HttpService.prototype.handleError = function (error) {
        console.error('An error occurred', error);
        return Promise.reject(error.message || error);
    };
    HttpService = __decorate([
        core_1.Injectable(), 
        __metadata('design:paramtypes', [http_1.Http])
    ], HttpService);
    return HttpService;
}());
exports.HttpService = HttpService;
//# sourceMappingURL=http-service.js.map