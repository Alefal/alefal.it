var module = angular.module('app', ['onsen']);
		
///// List RSS home
module.controller('listsNews', function($scope){
	
	refresh();

	$scope.refreshFeed = function() {
		console.log('refreshFeed');
		refresh();		
	};

});

///// List feed saved
module.controller('listsRSS', function($scope){
	var list = localStorage.getItem('feed_list');
    if (list == null) {
        $scope.listsRSS = new Array();
    } else {
        $scope.listsRSS = JSON.parse(list);
    }


	$scope.deleteItemRss = function(idRss) {
		console.log('deleteItemRss: '+idRss);	

		if (idRss != '') {
        	// Save to local storage
        	deleteFeed(idRss);
    	}
	};

	$scope.setCheckedItemRss = function(idRss) {
		console.log('setCheckedItemRss: '+idRss);	

		if (idRss != '') {
        	// Save to local storage
        	setCheckedFeed(idRss);
    	}
	};

	
});

///// Inser new feed
module.controller('insertItemRSS', function($scope){	
	$scope.saveItemRss = function() {
		console.log('saveItemRss');	

		var text = $('#Feed').val();
    	if (text != '') {
        	// Save to local storage
        	addFeed(text);
    	}
	};
});

function refresh() {
	Feed.feedUrl = getFeedUrlChecked();

	Feed.watchClick();
	Feed.load();
}

///// Add feed
function addFeed(text) {
	var list = getFeedList();
	var time = new Date().getTime();
	list.push({ id: time, time: time, text: text, checked: ''});
	saveFeedList(list);

    // Clear form
    $('#Feed').val('');
    menu.setMainPage('feedList.html');
}
///// Delete feed
function deleteFeed(idRss) {
	var list = getFeedList();

	for(var i=0; i<list.length; i++){
        if(list[i].id == idRss){
            list.splice(i, 1);  //removes 1 element at position i 
            break;
        }
    }

	saveFeedList(list);

	menu.setMainPage('feedList.html');
}

///// Get Checked feed
function getFeedUrlChecked() {
    var list = getFeedList();
    var checkedUrl = '';

    for(var i=0; i<list.length; i++){
        if(list[i].checked == 'true'){
            checkedUrl = list[i].text;
            break;
        }
    }

    if(checkedUrl == '') {
        checkedUrl = 'Not found...';
    }
    return checkedUrl;
}

///// Set Checked feed
function setCheckedFeed(idRss) {
	var list = getFeedList();

	for(var i=0; i<list.length; i++){
        if(list[i].id == idRss){

        	if(list[i].checked == 'true') {
            	list[i].checked = '';
        	} else {
            	list[i].checked = 'true';
        	}

            break;
        }
    }

	saveFeedList(list);

	menu.setMainPage('feedList.html');
}

///// Return list of feed
function getFeedList() {
    var list = localStorage.getItem('feed_list');
    if (list == null) {
        return new Array();
    } else {
        return JSON.parse(list);
    }
}
///// Save feed
function saveFeedList(list) {
    try {
        localStorage.setItem('feed_list', JSON.stringify(list));
    } catch (e) {
        alert('Error saving to storage.');
        throw e;
    }
}

