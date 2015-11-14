var module = angular.module('app', ['onsen']);

module.factory('servicePassVar', function(){
    return {
        data: {
            feedId: '',
            feedTitle: '',
            feedUrl: '',
            feedOperation: ''
        }
    // Other methods or objects can go here
    };
});

///// List RSS home
module.controller('listsNews', function($scope){	
	refresh();

	$scope.refreshFeed = function() {
		console.log('refreshFeed');
		refresh();		
	};
});

///// List feed saved
module.controller('listsRSS', function($scope,servicePassVar){
	var list = localStorage.getItem('feed_list');
    if (list == null) {
        $scope.listsRSS = new Array();
    } else {
        $scope.listsRSS = JSON.parse(list);
    }



    $scope.goPageItemRss = function() {
        console.log('pageItemRss'); 

        servicePassVar.data.feedId = '';
        servicePassVar.data.feedTitle = '';
        servicePassVar.data.feedUrl = '';
        servicePassVar.data.feedOperation = '';

        $scope.feedId = '';
        $scope.feedTitle = '';
        $scope.feedUrl = '';

        menu.setMainPage('feedInsert.html');
    };

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

    $scope.editItemRss = function(idRss) {
        console.log('editItemRss: '+idRss);   

        var list = getFeedList();
        var feedId = '';
        var feedTitle = '';
        var feedUrl = '';

        for(var i=0; i<list.length; i++){
            if(list[i].id == idRss){
                feedId = list[i].id; 
                feedTitle = list[i].title; 
                feedUrl = list[i].text; 
                break;
            }
        }

        servicePassVar.data.feedId = feedId;
        servicePassVar.data.feedTitle = feedTitle;
        servicePassVar.data.feedUrl = feedUrl;
        servicePassVar.data.feedOperation = 'update';

        menu.setMainPage('feedInsert.html');

    };

	
});

///// Inser new feed
module.controller('insertItemRSS', function($scope,servicePassVar){	
    console.log('feedId: '+servicePassVar.data.feedId); 
    console.log('feedTitle: '+servicePassVar.data.feedTitle); 
    console.log('feedUrl: '+servicePassVar.data.feedUrl); 

    $scope.feedId = servicePassVar.data.feedId;
    $scope.feedTitle = servicePassVar.data.feedTitle;
    $scope.feedUrl = servicePassVar.data.feedUrl;

    if(servicePassVar.data.feedOperation == 'update') {
        $scope.feedOperationText = 'Update';
    } else {
        $scope.feedOperationText = 'Insert';
    }

	$scope.saveItemRss = function() {
        var FeedId = $scope.feedId;
        console.log('saveItemRss: '+FeedId); 

        var TitleFeed = $('#TitleFeed').val();
		var UrlFeed   = $('#UrlFeed').val();
        
        if(FeedId != '') {
            //update
        	updateFeed(FeedId,TitleFeed,UrlFeed);
        } else {
            //insert
            addFeed(TitleFeed,UrlFeed);
        }
	};
});

function refresh() {
    Feed.feedUrl = getFeedUrlChecked();
	//Feed.feedUrl = 'rss.xml';

	Feed.watchClick();
	Feed.load();
}

///// Add feed
function addFeed(TitleFeed,UrlFeed) {
	var list = getFeedList();
	var time = new Date().getTime();
	list.push({ id: time, time: time, title: TitleFeed, text: UrlFeed, checked: ''});
	saveFeedList(list);

    // Clear form
    $('#Feed').val('');
    menu.setMainPage('feedList.html');
}
///// Update feed
function updateFeed(FeedId,TitleFeed,UrlFeed) {
    var list = getFeedList();

    for(var i=0; i<list.length; i++){
        if(list[i].id == FeedId){
            list[i].title = TitleFeed; 
            list[i].text = UrlFeed;
            break;
        }
    }

    saveFeedList(list);

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

