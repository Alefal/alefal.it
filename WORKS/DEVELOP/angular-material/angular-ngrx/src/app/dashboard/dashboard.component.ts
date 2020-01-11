import { Component, AfterViewInit, ViewEncapsulation } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';

import * as Chartist from 'chartist';
import { ChartType, ChartEvent } from 'ng-chartist';
import { AppConfigService } from '../shared/services/appconfig.service';
import { routerTransition } from '../router.animations';
import { StoreService } from '../shared/services/store.service';
declare var require: any;

const data: any = require('./data.json');

export interface Chart {
	type: ChartType;
	data: Chartist.IChartistData;
	options?: any;
	responsiveOptions?: any;
	events?: ChartEvent;
}

@Component({
	selector: 'app-dashboard',
	templateUrl: './dashboard.component.html',
	styleUrls: ['./dashboard.component.scss'],
	encapsulation : ViewEncapsulation.None,
	animations: [routerTransition()]
})
export class DashboardComponent implements AfterViewInit {

	constructor(
		private translate: TranslateService, 
		private storeService: StoreService
	) {
	}
	
	ngAfterViewInit() {
		console.log(this.storeService.appConfig.settings.apiServer.endPoint);
	}

	// Barchart
	barChart1: Chart = {
		type: 'Bar',
		data: data['Bar'],
		options: {
			seriesBarDistance: 15,
			high: 12,

			axisX: {
				showGrid: false,
				offset: 20
			},
			axisY: {
				showGrid: true,
				offset: 40
			},
			height: 360
		},

		responsiveOptions: [
			[
				'screen and (min-width: 640px)',
				{
					axisX: {
						labelInterpolationFnc: function(
							value: number,
							index: number
						): string {
							return index % 1 === 0 ? `${value}` : null;
						}
					}
				}
			]
		]
	};

	// This is for the donute chart
	donuteChart1: Chart = {
		type: 'Pie',
		data: data['Pie'],
		options: {
			donut: true,
			height: 260,
			showLabel: false,
			donutWidth: 20
		}
	};
}
