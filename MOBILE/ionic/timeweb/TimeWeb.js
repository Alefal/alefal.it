angular.module('myApp', [])
	.controller('myCtrl', function ($scope, $http) {
		$scope.autenticationTimeWeb = function() {
			var data = $.param({
					TIPOAUT: 0,
					AZIONE: 'RICHIESTAAUTENTIFICAZIONE',
					NOMEPAGATTUALE: 'MOSTRALOGIN',
					USERNAME: '567falale',
					PASSWORD: 'alefal567',
					btnConf: 'Conferma',
					JSESSIONID: 'ciaoBelli'
				});
			$http.post("http://presenze.its.na.it/twits/TwNet.dll", data).success(function(data, status) {
				console.log(data);
			})
		};   

		$scope.getBadge = function() {
			var data = $.param({
					DATAINIZIO: '01/09/2015',
					DATAFINE: '01/10/2015',
					IDDIPSELECTED: 15004,
					GRIDTIMBRELAB: 'DATA',
					AZIONE: 'CARTELLINO',
					NOMEPAGATTUALE: 'VISUALIZZA TPAGINACARTELLINO',
					STAMPA: 'sconosciuta'
				});
			$http.post("http://presenze.its.na.it/twits/TwNet.dll", data).success(function(data, status) {
				console.log(data);
			})
		};  	
	})
	
/*	
<div ng-controller="myCtrl">
	<button ng-click="autenticationTimeWeb()">Login</button>
	<button ng-click="getBadge()">Badge</button>
</div>
*/