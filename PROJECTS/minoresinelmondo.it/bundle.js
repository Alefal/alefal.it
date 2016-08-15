var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
System.register("app.component", ['@angular/core'], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    var core_1;
    var AppComponent;
    return {
        setters:[
            function (core_1_1) {
                core_1 = core_1_1;
            }],
        execute: function() {
            AppComponent = (function () {
                function AppComponent() {
                    alert('eccomi');
                }
                AppComponent = __decorate([
                    core_1.Component({
                        selector: 'mnm',
                        templateUrl: 'app/app.component.html'
                    }), 
                    __metadata('design:paramtypes', [])
                ], AppComponent);
                return AppComponent;
            }());
            exports_1("AppComponent", AppComponent);
        }
    }
});
System.register("app.module", ['@angular/core', '@angular/platform-browser', "app.component"], function(exports_2, context_2) {
    "use strict";
    var __moduleName = context_2 && context_2.id;
    var core_2, platform_browser_1, app_component_1;
    var AppModule;
    return {
        setters:[
            function (core_2_1) {
                core_2 = core_2_1;
            },
            function (platform_browser_1_1) {
                platform_browser_1 = platform_browser_1_1;
            },
            function (app_component_1_1) {
                app_component_1 = app_component_1_1;
            }],
        execute: function() {
            AppModule = (function () {
                function AppModule() {
                }
                AppModule = __decorate([
                    core_2.NgModule({
                        imports: [
                            platform_browser_1.BrowserModule
                        ],
                        declarations: [
                            app_component_1.AppComponent
                        ],
                        bootstrap: [
                            app_component_1.AppComponent
                        ]
                    }), 
                    __metadata('design:paramtypes', [])
                ], AppModule);
                return AppModule;
            }());
            exports_2("AppModule", AppModule);
        }
    }
});
System.register("main", ['@angular/platform-browser-dynamic', "app.module"], function(exports_3, context_3) {
    "use strict";
    var __moduleName = context_3 && context_3.id;
    var platform_browser_dynamic_1, app_module_1;
    return {
        setters:[
            function (platform_browser_dynamic_1_1) {
                platform_browser_dynamic_1 = platform_browser_dynamic_1_1;
            },
            function (app_module_1_1) {
                app_module_1 = app_module_1_1;
            }],
        execute: function() {
            platform_browser_dynamic_1.platformBrowserDynamic().bootstrapModule(app_module_1.AppModule);
        }
    }
});
System.register("pipes/removespaces.pipe", ['@angular/core'], function(exports_4, context_4) {
    "use strict";
    var __moduleName = context_4 && context_4.id;
    var core_3;
    var RemoveSpaces;
    return {
        setters:[
            function (core_3_1) {
                core_3 = core_3_1;
            }],
        execute: function() {
            RemoveSpaces = (function () {
                function RemoveSpaces() {
                }
                RemoveSpaces.prototype.transform = function (value) {
                    //return value.replace(/ /g, '');               //space
                    return value.replace(/(\r\n|\n|\r)/gm, ''); //\n \r
                };
                RemoveSpaces = __decorate([
                    core_3.Pipe({
                        name: 'removeSpaces',
                        pure: false
                    }), 
                    __metadata('design:paramtypes', [])
                ], RemoveSpaces);
                return RemoveSpaces;
            }());
            exports_4("RemoveSpaces", RemoveSpaces);
        }
    }
});
System.register("providers/http-service", ['@angular/core', '@angular/http', 'rxjs/Rx', 'rxjs/add/operator/toPromise'], function(exports_5, context_5) {
    "use strict";
    var __moduleName = context_5 && context_5.id;
    var core_4, http_1;
    var HttpService;
    return {
        setters:[
            function (core_4_1) {
                core_4 = core_4_1;
            },
            function (http_1_1) {
                http_1 = http_1_1;
            },
            function (_1) {},
            function (_2) {}],
        execute: function() {
            HttpService = (function () {
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
                    core_4.Injectable(), 
                    __metadata('design:paramtypes', [http_1.Http])
                ], HttpService);
                return HttpService;
            }());
            exports_5("HttpService", HttpService);
        }
    }
});
//# sourceMappingURL=bundle.js.map