angular.module("underscore", []).factory("_", function() {
    return window._
}), angular.module("your_app_name", ["ionic", "your_app_name.directives", "your_app_name.controllers", "templates", "your_app_name.services", "your_app_name.config", "ngMap", "your_app_name.filters", "angularMoment", "underscore", "your_app_name.factories", "ngCordova"]).run(["$ionicPlatform", "AuthService", "$rootScope", "$state", "PushNotificationsService", function(e, n, t, o, s) {
    e.on("deviceready", function() {
        n.userIsLoggedIn().then(function(e) {
            e === !0 ? (n.updateUserAvatar(), o.go("app.home")) : o.go("walkthrough")
        }), window.cordova && window.cordova.plugins.Keyboard && cordova.plugins.Keyboard.hideKeyboardAccessoryBar(!0), window.StatusBar && StatusBar.styleDefault(), s.register()
    }), e.on("resume", function() {
        n.userIsLoggedIn().then(function(e) {
            e === !1 ? o.go("walkthrough") : n.updateUserAvatar()
        }), s.register()
    }), t.$on("$stateChangeStart", function(e, t) {
        t.data.authenticate && n.userIsLoggedIn().then(function(n) {
            n === !1 && (e.preventDefault(), o.go("walkthrough"))
        })
    })
}]).config(["$stateProvider", "$urlRouterProvider", function(e, n) {
    e.state("walkthrough", {
        url: "/",
        templateUrl: "walkthrough.html",
        controller: "WalkthroughCtrl",
        data: {
            authenticate: !1
        }
    }).state("register", {
        url: "/register",
        templateUrl: "register.html",
        controller: "RegisterCtrl",
        data: {
            authenticate: !1
        }
    }).state("login", {
        url: "/login",
        templateUrl: "login.html",
        controller: "LoginCtrl",
        data: {
            authenticate: !1
        }
    }).state("forgot_password", {
        url: "/forgot_password",
        templateUrl: "forgot-password.html",
        controller: "ForgotPasswordCtrl",
        data: {
            authenticate: !1
        }
    }).state("app", {
        url: "/app",
        "abstract": !0,
        templateUrl: "side-menu.html",
        controller: "AppCtrl"
    }).state("app.home", {
        url: "/home",
        views: {
            menuContent: {
                templateUrl: "home.html",
                controller: "HomeCtrl"
            }
        },
        data: {
            authenticate: !0
        }
    }).state("app.bookmarks", {
        url: "/bookmarks",
        views: {
            menuContent: {
                templateUrl: "bookmarks.html",
                controller: "BookMarksCtrl"
            }
        },
        data: {
            authenticate: !0
        }
    }).state("app.contact", {
        url: "/contact",
        views: {
            menuContent: {
                templateUrl: "contact.html",
                controller: "ContactCtrl"
            }
        },
        data: {
            authenticate: !0
        }
    }).state("app.post", {
        url: "/post/:postId",
        views: {
            menuContent: {
                templateUrl: "post.html",
                controller: "PostCtrl"
            }
        },
        data: {
            authenticate: !0
        }
    }).state("app.settings", {
        url: "/settings",
        views: {
            menuContent: {
                templateUrl: "settings.html",
                controller: "SettingCtrl"
            }
        },
        data: {
            authenticate: !0
        }
    }).state("app.category", {
        url: "/category/:categoryTitle/:categoryId",
        views: {
            menuContent: {
                templateUrl: "category.html",
                controller: "PostCategoryCtrl"
            }
        },
        data: {
            authenticate: !0
        }
    }), n.otherwise("/app/home")
}]), angular.module("your_app_name.directives", []).directive("recursiveMenu", ["$compile", function(e) {
    return {
        restrict: "EACM",
        priority: 1e5,
        compile: function(n) {
            var t, o;
            return o = n.contents().remove(), t = null,
                function(n, s) {
                    t || (t = e(o)), t(n, function(e) {
                        return s.append(e)
                    })
                }
        }
    }
}]).directive("pushMenu", function() {
    return {
        scope: {
            menu: "=",
            level: "="
        },
        controller: ["$scope", "$element", "$attrs", function(e) {
            this.getMenu = function() {
                return e.menu
            }
        }],
        templateUrl: "partials/main-menu.html",
        restrict: "E",
        replace: !0,
        transclude: !0
    }
}).directive("menuLevel", ["_", function(e) {
    return {
        scope: {
            menu: "=",
            level: "="
        },
        link: function(n, t, o, s) {
            n.original_menu = s.getMenu(), n.childrenLevel = n.level + 1, n.openSubMenu = function(n, t, o) {
                if (!e.isUndefined(n) && !e.isUndefined(n.items) && n.items.length > 0) {
                    o.preventDefault();
                    var s = document.querySelector(".mp-level.level-id-" + n.id);
                    this.$parent._openMenu(s)
                }
            }, n.backToPreviousMenu = function(e, n) {
                n.preventDefault(), n.stopPropagation();
                var t = document.querySelector(".mp-level.level-id-" + e.id);
                this.$parent._closeMenu(t)
            }, n._setTransform = function(e, n) {
                n.style.WebkitTransform = e, n.style.MozTransform = e, n.style.transform = e
            }, n._openMenu = function(e) {
                this._setTransform("translate3d(0,0,0)", e)
            }, n._closeMenu = function(e) {
                this._setTransform("translate3d(100%,0,0)", e)
            }
        },
        templateUrl: "partials/menu-level.html",
        require: "^pushMenu",
        restrict: "EA",
        replace: !0,
        transclude: !0
    }
}]).directive("wpSearch", ["_", "SearchService", "$q", function(e, n) {
    return {
        scope: {},
        controller: ["$scope", function(t) {
            var o = this;
            t.close_shown = !1, this.showClose = function() {
                t.$apply(function() {
                    t.close_shown = !0
                })
            }, this.hideClose = function() {
                t.close_shown = !1
            }, this.showResultsPanel = function(s) {
                o.showClose();
                var i = null;
                e.isUndefined(s) || (i = n.search(s)), t.$broadcast("show-results-panel", i)
            }, this.cleanResultsPanel = function() {
                t.$broadcast("clean-results-panel")
            }, this.hideResultsPanel = function() {
                o.hideClose(), t.$broadcast("hide-results-panel", 1)
            }, t.closeSearch = function(e) {
                e.stopPropagation(), e.preventDefault(), o.hideResultsPanel()
            }
        }],
        templateUrl: "partials/wp-search.html",
        restrict: "E",
        replace: !0,
        transclude: !0
    }
}]).directive("searchInput", ["$timeout", "SearchService", "$ionicLoading", function(e, n, t) {
    return {
        require: "^wpSearch",
        link: function(n, o, s, i) {
            var a = null;
            n.$on("hide-results-panel", function() {
                e.cancel(a), o[0].value = ""
            }), o.on("focus", function() {
                i.showResultsPanel()
            }), o.on("keyup", function(n) {
                n.preventDefault(), n.stopPropagation();
                var o = this;
                null !== a && e.cancel(a);
                var s = o.value;
                a = e(function() {
                    s.trim().length > 0 ? (t.show({
                        template: "Searching..."
                    }), i.showResultsPanel(s)) : i.cleanResultsPanel()
                }, 800)
            })
        },
        restrict: "A"
    }
}]).directive("searchResults", ["_", "$ionicLoading", function(e, n) {
    return {
        require: "^wpSearch",
        link: function(e, t) {
            var o = function(e, n) {
                n.style.WebkitTransform = e, n.style.MozTransform = e, n.style.transform = e
            };
            e.$on("show-results-panel", function(s, i) {
                o("translate3d(0,0,0)", t[0]), i && i.then(function(t) {
                    n.hide(), e.loadSearchResults(t)
                }, function() {})
            }), e.$on("clean-results-panel", function() {
                e.cleanSearchResults()
            }), e.$on("hide-results-panel", function() {
                o("translate3d(0,100%,0)", t[0])
            })
        },
        controller: ["$scope", function(n) {
            var t = n.tabs = [];
            n.query = "", n.select = function(e) {
                angular.forEach(t, function(e) {
                    e.selected = !1
                }), e.selected = !0
            }, n.loadSearchResults = function(n) {
                e.each(t, function(t) {
                    var o = e.findWhere(n, {
                        _id: t.tabid
                    });
                    t.results = o.results
                })
            }, n.cleanSearchResults = function() {
                e.each(t, function(e) {
                    e.results = []
                })
            }, this.addTab = function(e) {
                0 === t.length && n.select(e), t.push(e)
            }
        }],
        templateUrl: "partials/search-results.html",
        restrict: "E",
        replace: !0,
        transclude: !0
    }
}]).directive("myTab", ["$state", "$ionicHistory", function(e, n) {
    return {
        require: "^searchResults",
        restrict: "E",
        transclude: !0,
        scope: {
            title: "@",
            tabid: "@",
            query: "@query"
        },
        link: function(t, o, s, i) {
            t.results = [], i.addTab(t), t.goToPost = function(t) {
                n.nextViewOptions({
                    disableAnimate: !0
                }), e.go("app.post", {
                    postId: t.id
                })
            }
        },
        templateUrl: "partials/my-tab.html"
    }
}]).directive("postCard", function() {
    return {
        templateUrl: "partials/post-card.html"
    }
}).directive("showHideContainer", function() {
    return {
        scope: {},
        controller: ["$scope", "$element", "$attrs", function(e) {
            e.show = !1, e.toggleType = function(n) {
                n.stopPropagation(), n.preventDefault(), e.show = !e.show, e.$broadcast("toggle-type", e.show)
            }
        }],
        templateUrl: "partials/show-hide-password.html",
        restrict: "A",
        replace: !1,
        transclude: !0
    }
}).directive("showHideInput", function() {
    return {
        scope: {},
        link: function(e, n) {
            e.$on("toggle-type", function(e, t) {
                {
                    var o = n[0];
                    o.getAttribute("type")
                }
                t || o.setAttribute("type", "password"), t && o.setAttribute("type", "text")
            })
        },
        require: "^showHideContainer",
        restrict: "A",
        replace: !1,
        transclude: !1
    }
}), angular.module("your_app_name.controllers", []).controller("AppCtrl", ["$scope", "AuthService", function(e, n) {
    e.$on("$ionicView.enter", function() {
        e.user = n.getUser()
    })
}]).controller("PushMenuCtrl", ["$scope", "CategoryService", function(e, n) {
    var t = function(e, n) {
        return e.length > 0 && _.each(e, function(e) {
            e.name = e.title, e.link = e.slug;
            var o = _.filter(n, function(n) {
                return n.parent === e.id
            });
            o.length > 0 && (e.menu = {
                title: e.title,
                id: e.id,
                items: o
            }, t(e.menu.items, n))
        }), e
    };
    n.getCategories().then(function(n) {
        var o = _.sortBy(n.categories, function(e) {
                return e.title
            }),
            s = _.filter(o, function(e) {
                return 0 === e.parent
            }),
            i = t(s, o);
        e.menu = {
            title: "All Categories",
            id: "0",
            items: i
        }
    })
}]).controller("BookMarksCtrl", ["$scope", "$rootScope", "BookMarkService", function(e, n, t) {
    e.bookmarks = t.getBookmarks(), n.$on("new-bookmark", function() {
        e.bookmarks = t.getBookmarks()
    })
}]).controller("ContactCtrl", ["$scope", function(e) {
    e.position = {
        lat: 43.07493,
        lng: -89.381388
    }, e.$on("mapInitialized", function(n, t) {
        e.map = t
    })
}]).controller("SettingCtrl", ["$scope", "$ionicActionSheet", "$ionicModal", "$state", "AuthService", function(e, n, t, o, s) {
    e.notifications = !0, e.sendLocation = !1, t.fromTemplateUrl("partials/terms.html", {
        scope: e,
        animation: "slide-in-up"
    }).then(function(n) {
        e.terms_modal = n
    }), t.fromTemplateUrl("partials/faqs.html", {
        scope: e,
        animation: "slide-in-up"
    }).then(function(n) {
        e.faqs_modal = n
    }), t.fromTemplateUrl("partials/credits.html", {
        scope: e,
        animation: "slide-in-up"
    }).then(function(n) {
        e.credits_modal = n
    }), e.showTerms = function() {
        e.terms_modal.show()
    }, e.showFAQS = function() {
        e.faqs_modal.show()
    }, e.showCredits = function() {
        e.credits_modal.show()
    }, e.showLogOutMenu = function() {
        n.show({
            destructiveText: "Logout",
            titleText: "Are you sure you want to logout? This app is awsome so I recommend you to stay.",
            cancelText: "Cancel",
            cancel: function() {},
            buttonClicked: function() {
                return !0
            },
            destructiveButtonClicked: function() {
                s.logOut(), o.go("login")
            }
        })
    }
}]).controller("EmailSenderCtrl", ["$scope", function(e) {
    e.sendFeedback = function() {
        cordova.plugins.email.isAvailable(function() {
            cordova.plugins.email.open({
                to: "john@doe.com",
                cc: "jane@doe.com",
                subject: "Feedback",
                body: "This app is awesome"
            })
        })
    }, e.sendContactMail = function() {
        cordova.plugins.email.isAvailable(function() {
            cordova.plugins.email.open({
                to: "john@doe.com",
                cc: "jane@doe.com",
                subject: "Contact",
                body: "Contact from ionWordpress app"
            })
        })
    }
}]).controller("RateAppCtrl", ["$scope", function(e) {
    e.rateApp = function() {
        ionic.Platform.isIOS() ? (AppRate.preferences.storeAppURL.ios = "<my_app_id>", AppRate.promptForRating(!0)) : ionic.Platform.isAndroid() && (AppRate.preferences.storeAppURL.android = "market://details?id=<package_name>", AppRate.promptForRating(!0))
    }
}]).controller("AdmobCtrl", ["$scope", "$ionicActionSheet", "AdMob", function(e, n, t) {
    e.manageAdMob = function() {
        n.show({
            buttons: [{
                text: "Show AdMob Banner"
            }, {
                text: "Show AdMob Interstitial"
            }],
            destructiveText: "Remove Ads",
            titleText: "Choose the ad to show",
            cancelText: "Cancel",
            cancel: function() {},
            destructiveButtonClicked: function() {
                return t.removeAds(), !0
            },
            buttonClicked: function(e, n) {
                return "Show AdMob Banner" == n.text && t.showBanner(), "Show AdMob Interstitial" == n.text && t.showInterstitial(), !0
            }
        })
    }
}]).controller("iAdCtrl", ["$scope", "$ionicActionSheet", "iAd", function(e, n, t) {
    e.manageiAd = function() {
        n.show({
            buttons: [{
                text: "Show iAd Banner"
            }, {
                text: "Show iAd Interstitial"
            }],
            destructiveText: "Remove Ads",
            titleText: "Choose the ad to show - Interstitial only works in iPad",
            cancelText: "Cancel",
            cancel: function() {},
            destructiveButtonClicked: function() {
                return t.removeAds(), !0
            },
            buttonClicked: function(e, n) {
                return "Show iAd Banner" == n.text && t.showBanner(), "Show iAd Interstitial" == n.text && t.showInterstitial(), !0
            }
        })
    }
}]).controller("WalkthroughCtrl", ["$scope", "$state", "$ionicSlideBoxDelegate", function(e, n, t) {
    e.$on("$ionicView.enter", function() {
        t.$getByHandle("walkthrough-slider").update()
    })
}]).controller("LoginCtrl", ["$scope", "$state", "$ionicLoading", "AuthService", "PushNotificationsService", function(e, n, t, o) {
    e.user = {}, e.doLogin = function() {
        t.show({
            template: "Loging in..."
        });
        var s = {
            userName: e.user.userName,
            password: e.user.password
        };
        o.doLogin(s).then(function() {
            n.go("app.home"), t.hide()
        }, function(n) {
            e.error = n, t.hide()
        })
    }
}]).controller("ForgotPasswordCtrl", ["$scope", "$state", "$ionicLoading", "AuthService", function(e, n, t, o) {
    e.user = {}, e.recoverPassword = function() {
        t.show({
            template: "Recovering password..."
        }), o.forgotPassword(e.user.userName).then(function(n) {
            "error" == n.status ? e.error = n.error : e.message = "Link for password reset has been emailed to you. Please check your email.", t.hide()
        })
    }
}]).controller("RegisterCtrl", ["$scope", "$state", "$ionicLoading", "AuthService", "PushNotificationsService", function(e, n, t, o) {
    e.user = {}, e.doRegister = function() {
        t.show({
            template: "Registering user..."
        });
        var s = {
            userName: e.user.userName,
            password: e.user.password,
            email: e.user.email,
            displayName: e.user.displayName
        };
        o.doRegister(s).then(function() {
            n.go("app.home"), t.hide()
        }, function(n) {
            e.error = n, t.hide()
        })
    }
}]).controller("HomeCtrl", ["$scope", "$rootScope", "$state", "$ionicLoading", "PostService", function(e, n, t, o, s) {
    e.posts = [], e.page = 1, e.totalPages = 1, e.doRefresh = function() {
        o.show({
            template: "Loading posts..."
        }), s.getRecentPosts(1).then(function(n) {
            e.totalPages = n.pages, e.posts = s.shortenPosts(n.posts), o.hide(), e.$broadcast("scroll.refreshComplete")
        })
    }, e.loadMoreData = function() {
        e.page += 1, s.getRecentPosts(e.page).then(function(n) {
            e.totalPages = n.pages;
            var t = s.shortenPosts(n.posts);
            e.posts = e.posts.concat(t), e.$broadcast("scroll.infiniteScrollComplete")
        })
    }, e.moreDataCanBeLoaded = function() {
        return e.totalPages > e.page
    }, e.sharePost = function(e) {
        s.sharePost(e)
    }, e.bookmarkPost = function(e) {
        o.show({
            template: "Post Saved!",
            noBackdrop: !0,
            duration: 1e3
        }), s.bookmarkPost(e)
    }, e.doRefresh()
}]).controller("PostCtrl", ["$scope", "$state", "$ionicLoading", "PostService", "$stateParams", "AuthService", "$ionicScrollDelegate", function(e, n, t, o, s, i, a) {
    t.show({
        template: "Loading post..."
    });
    var r = s.postId;
    o.getPost(r).then(function(n) {
        e.post = n.post, e.comments = _.map(n.post.comments, function(e) {
            return e.author ? (o.getUserGravatar(e.author.id).then(function(n) {
                e.user_gravatar = n.avatar
            }), e) : e
        }), t.hide()
    }), e.sharePost = function(e) {
        window.plugins.socialsharing.share("Check this post here: ", null, null, e)
    }, e.addComment = function() {
        t.show({
            template: "Submiting comment..."
        }), o.submitComment(e.post.id, e.new_comment).then(function(n) {
            if ("ok" == n.status) {
                var o = i.getUser(),
                    s = {
                        author: {
                            name: o.data.username
                        },
                        content: e.new_comment,
                        date: Date.now(),
                        user_gravatar: o.data.avatar,
                        id: n.comment_id
                    };
                e.comments.push(s), e.new_comment = "", e.new_comment_id = n.comment_id, t.hide(), a.scrollBottom(!0)
            }
        })
    }
}]).controller("PostCategoryCtrl", ["$scope", "$rootScope", "$state", "$ionicLoading", "$stateParams", "PostService", function(e, n, t, o, s, i) {
    e.category = {}, e.category.id = s.categoryId, e.category.title = s.categoryTitle, e.posts = [], e.page = 1, e.totalPages = 1, e.doRefresh = function() {
        o.show({
            template: "Loading posts..."
        }), i.getPostsFromCategory(e.category.id, 1).then(function(n) {
            e.totalPages = n.pages, e.posts = i.shortenPosts(n.posts), o.hide(), e.$broadcast("scroll.refreshComplete")
        })
    }, e.loadMoreData = function() {
        e.page += 1, i.getRecentPosts(e.category.id, e.page).then(function(n) {
            e.totalPages = n.pages;
            var t = i.shortenPosts(n.posts);
            e.posts = e.posts.concat(t), e.$broadcast("scroll.infiniteScrollComplete")
        })
    }, e.moreDataCanBeLoaded = function() {
        return e.totalPages > e.page
    }, e.sharePost = function(e) {
        i.sharePost(e)
    }, e.bookmarkPost = function(e) {
        o.show({
            template: "Post Saved!",
            noBackdrop: !0,
            duration: 1e3
        }), i.bookmarkPost(e)
    }, e.doRefresh()
}]), angular.module("templates", []).run(["$templateCache", function(e) {
    e.put("bookmarks.html", '<ion-view class="bookmarks-view">\n  <ion-nav-title>\n    <span>Bookmarks</span>\n  </ion-nav-title>\n  <ion-content>\n    <div class="row bookmarks-container">\n      <div ng-if="bookmarks.length == 0" class="col col-center">\n        <div class="empty-results">\n          <i class="icon ion-bookmark"></i>\n          <h3 class="no-bookmarks">There\'s nothing here yet. Start exploring!</h3>\n        </div>\n      </div>\n      <div ng-if="bookmarks.length > 0" class="col">\n        <ul class="bookmarks-list">\n          <li class="bookmark-item" ng-repeat="bookmark in bookmarks">\n            <a ui-sref="app.post({postId : bookmark.id})">\n              <h2 class="post-title" ng-bind-html="bookmark.title | rawHtml"></h2>\n              <p class="post-date">Posted <span class="post-time" am-time-ago="bookmark.date"></span></p>\n            </a>\n          </li>\n        </ul>\n      </div>\n    </div>\n  </ion-content>\n</ion-view>\n'), e.put("category.html", '<ion-view class="category-view">\n  <ion-nav-title>\n    <span>{{category.title}}</span>\n  </ion-nav-title>\n  <ion-content>\n\n    <!-- Refresh to get the new posts -->\n    <ion-refresher pulling-text="Pull to refresh..." on-refresh="doRefresh()">\n    </ion-refresher>\n\n    <div class="posts">\n      <div post-card ng-repeat="post in posts" class="post-card"></div>\n    </div>\n\n    <!-- Infinit scroll -->\n    <ion-infinite-scroll ng-if="moreDataCanBeLoaded()" on-infinite="loadMoreData()" distance="1%" icon="ion-loading-c">\n    </ion-infinite-scroll>\n  </ion-content>\n</ion-view>\n'), e.put("contact.html", '<ion-view class="contact-view">\n  <ion-nav-title>\n    <span>Contact</span>\n  </ion-nav-title>\n  <ion-content>\n    <div>\n      <map data-tap-disabled="true" center="{{position.lat}},{{position.lng}}" zoom="15" disable-default-u-i="true">\n        <marker\n          position="{{position.lat}},{{position.lng}}"\n          title="Hello Marker"\n          visible="true">\n        </marker>\n      </map>\n    </div>\n    <div class="contact-content">\n      <div class="">\n        <p>\n          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna\n          aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n          Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n          Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n        </p>\n        <p>\n          Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,\n          totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto\n          beatae vitae dicta sunt explicabo.\n        </p>\n      </div>\n      <div class="contact-details-item">\n        <h4>Address</h4>\n        <div class="featured">Our Inc.</div>\n        <div>2283 Monroe Drive</div>\n        <div>Rochester, NY 14606</div>\n      </div>\n      <div class="contact-details-item">\n        <h4>Social Networks</h4>\n        <div class="row social-networks">\n          <div class="col"><a href=""><i class="icon ion-social-twitter" style="color: #37b9e1;"></i></a></div>\n          <div class="col"><a href=""><i class="icon ion-social-facebook" style="color: #3e649e;"></i></a></div>\n          <div class="col"><a href=""><i class="icon ion-social-dribbble" style="color: #e36a96;"></i></a></div>\n          <div class="col"><a href=""><i class="icon ion-social-rss" style="color: #f18334;"></i></a></div>\n          <div class="col"><a href=""><i class="icon ion-social-pinterest" style="color: #c6484a;"></i></a></div>\n        </ul>\n      </div>\n      <div class="send-email">\n        <button class="button button-outline button-block featured" ng-controller="EmailSenderCtrl" ng-click="sendContactMail()">\n          Send us an email\n        </button>\n      </div>\n\n    </div>\n  </ion-content>\n</ion-view>\n'), e.put("forgot-password.html", '<ion-view class="forgot-password-view">\n  <ion-nav-bar class="view-navigation">\n    <ion-nav-back-button>\n    </ion-nav-back-button>\n  </ion-nav-bar>\n  <ion-content class="padding">\n    <div class="row form-heading">\n      <div class="col col-center">\n        <h1 class="form-title">Recover your password</h1>\n      </div>\n    </div>\n    <div class="row form-wrapper">\n      <div class="col">\n        <form name="forgot_password_form" class="" novalidate>\n          <div class="list input-fields">\n            <label class="item item-input">\n              <span class="input-label">Username</span>\n              <input type="text" name="user_name" ng-model="user.userName" required>\n            </label>\n            <button type="submit" class="recover button button-positive button-block" ng-click="recoverPassword()" ng-disabled="forgot_password_form.$invalid">\n              Recover it\n            </button>\n            <p ng-show="error" class="message error">{{error}}</p>\n            <p ng-show="message" class="message">{{message}}</p>\n          </div>\n        </form>\n        <div class="alternative-actions">\n          <a class="log-in button button-small button-clear" ui-sref="login">\n            Log In\n          </a>\n          <a class="sign-up button button-small button-clear" ui-sref="register">\n            Sign Up\n          </a>\n        </div>\n      </div>\n    </div>\n  </ion-content>\n</ion-view>\n'), e.put("home.html", '<ion-view class="home-view">\n  <ion-nav-title>\n    <span>Recent posts</span>\n  </ion-nav-title>\n  <ion-content>\n\n    <!-- Refresh to get the new posts -->\n    <ion-refresher pulling-text="Pull to refresh..." on-refresh="doRefresh()">\n    </ion-refresher>\n\n    <div class="posts">\n      <div post-card ng-repeat="post in posts" class="post-card"></div>\n    </div>\n\n    <!-- Infinit scroll -->\n    <ion-infinite-scroll ng-if="moreDataCanBeLoaded()" on-infinite="loadMoreData()" distance="1%" icon="ion-loading-c">\n    </ion-infinite-scroll>\n  </ion-content>\n</ion-view>\n'), e.put("login.html", '<ion-view class="login-view">\n  <ion-nav-bar class="view-navigation">\n    <ion-nav-back-button>\n    </ion-nav-back-button>\n  </ion-nav-bar>\n  <ion-content class="padding">\n    <div class="row form-heading">\n      <div class="col col-center">\n        <h1 class="form-title">Welcome back</h1>\n      </div>\n    </div>\n    <div class="row form-wrapper">\n      <div class="col">\n        <form name="login_form" class="" novalidate>\n          <div class="list input-fields">\n            <label class="item item-input">\n              <span class="input-label">Username</span>\n              <input type="text" name="user_name" ng-model="user.userName" required>\n            </label>\n            <label class="item item-input" show-hide-container>\n              <span class="input-label">Password</span>\n              <input type="password" name="password" ng-model="user.password" required show-hide-input>\n            </label>\n            <button type="submit" class="login button button-block" ng-click="doLogin()" ng-disabled="login_form.$invalid">\n              Log in\n            </button>\n            <p ng-show="error" class="message error">{{error}}</p>\n          </div>\n        </form>\n        <div class="alternative-actions">\n          <a class="forgot-password button button-small button-clear" ui-sref="forgot_password">\n            Forgot Password?\n          </a>\n          <a class="sign-up button button-small button-clear" ui-sref="register">\n            Sign Up\n          </a>\n        </div>\n      </div>\n    </div>\n  </ion-content>\n</ion-view>\n'), e.put("post.html", '<ion-view class="post-view">\n  <ion-nav-title>\n    <span ng-bind-html="post.title | rawHtml"></span>\n  </ion-nav-title>\n  <ion-content>\n    <div class="post">\n      <div class="card-header">\n        <h1 ng-bind-html="post.title | rawHtml"></h1>\n        <h2>Posted <span am-time-ago="post.date"></span> by <span class="author" ng-bind-html="post.author.name | rawHtml"></span></h2>\n      </div>\n      <div class="card-content" ng-bind-html="post.content | rawHtml"></div>\n    </div>\n    <div class="post-actions">\n      <a class="card-button primary" ng-click="sharePost(post.url)">SHARE</a>\n      <a ng-show="post.comment_count > 0" class="card-button comment-count">\n        <i class="icon ion-chatbox"></i>{{post.comment_count}}\n      </a>\n    </div>\n    <div class="comments">\n      <div class="list">\n        <a class="item item-avatar" ng-repeat="comment in comments" href="#" ng-class="{highlighted: comment.id === new_comment_id}">\n          <img ng-src="{{comment.user_gravatar}}">\n          <h2  ng-bind-html="comment.author.name | rawHtml"><span class="comment-date" am-time-ago="comment.date"></span></h2>\n          <p class="message-content" ng-bind-html="comment.content | rawHtml"></p>\n        </a>\n      </div>\n    </div>\n  </ion-content>\n  <ion-footer-bar class="new-comment post-footer bar bar-footer">\n    <form name="comment_form" class="row" novalidate>\n      <div class="col col-80 content col-center">\n        <input class="new-comment-message" type="text" placeholder="Leave a comment..." ng-model="new_comment" required></input>\n      </div>\n      <div class="col col-20 button-container col-center">\n        <button class="button button-clear send" type="submit" ng-click="addComment()" ng-disabled="comment_form.$invalid">\n          Send\n        </button>\n      </div>\n    </form>\n  </ion-footer-bar>\n</ion-view>\n'), e.put("register.html", '<ion-view class="register-view">\n  <ion-nav-bar class="view-navigation">\n    <ion-nav-back-button>\n    </ion-nav-back-button>\n  </ion-nav-bar>\n  <ion-content class="padding">\n    <div class="row form-heading">\n      <div class="col col-center">\n        <h1 class="form-title">Create your account</h1>\n      </div>\n    </div>\n    <div class="row form-wrapper">\n      <div class="col">\n        <form name="signup_form" class="" novalidate>\n          <div class="list input-fields">\n            <label class="item item-input">\n              <span class="input-label">Username</span>\n              <input type="text" name="user_name" ng-model="user.userName" required>\n            </label>\n            <label class="item item-input">\n              <span class="input-label">Name</span>\n              <input type="text" name="display_name" ng-model="user.displayName" required>\n            </label>\n            <label class="item item-input">\n              <span class="input-label">Email</span>\n              <input type="email" name="email" ng-model="user.email" required>\n            </label>\n            <label class="item item-input" show-hide-container>\n              <span class="input-label">Password</span>\n              <input type="password" name="password" ng-model="user.password" required show-hide-input>\n            </label>\n            <button type="submit" class="register button button-block" ng-click="doRegister()" ng-disabled="signup_form.$invalid">\n              Register\n            </button>\n            <p ng-show="error" class="message error">{{error}}</p>\n          </form>\n        </div>\n      </div>\n    </div>\n  </ion-content>\n</ion-view>\n'), e.put("settings.html", '<ion-view class="settings-view">\n  <ion-nav-buttons side="left">\n    <button menu-toggle="left" class="button button-icon icon ion-navicon"></button>\n  </ion-nav-buttons>\n  <ion-nav-title>\n    <span>Settings</span>\n  </ion-nav-title>\n  <ion-content>\n    <ul class="list">\n\n      <ion-toggle ng-model="notifications" toggle-class="toggle-dark">Push Notifications</ion-toggle>\n      <ion-toggle ng-model="sendLocation" toggle-class="toggle-dark">Send Location</ion-toggle>\n\n      <div class="item item-divider">OPTIONS</div>\n      <a class="item option" ng-controller="EmailSenderCtrl" ng-click="sendFeedback()">\n        <i class="icon ion-chatbox dark"></i>\n        <span class="title">Send feedback</span>\n      </a>\n      <a class="item option" ng-controller="RateAppCtrl" ng-click="rateApp()">\n        <i class="icon ion-heart assertive"></i>\n        <span class="title">Rate this app</span>\n      </a>\n      <a class="item option" ng-controller="AdmobCtrl" ng-click="manageAdMob()">\n        <i class="icon ion-social-usd"></i>\n        <span class="title">AdMob</span>\n      </a>\n      <a class="item option" ng-controller="iAdCtrl" ng-click="manageiAd()">\n        <i class="icon ion-social-usd"></i>\n        <span class="title">iAd</span>\n      </a>\n\n      <div class="item item-divider">LEGAL</div>\n\n      <a class="item" href="" ng-click="showTerms()">Terms of Service</a>\n      <a class="item" href="" ng-click="showFAQS()">FAQS</a>\n      <a class="item" href="" ng-click="showCredits()">Credits</a>\n\n      <div class="item item-divider">ACCOUNT</div>\n      <a class="item option" ng-click="showLogOutMenu()">\n        <i class="icon ion-power"></i>\n        <span class="title">Log out</span>\n      </a>\n\n    </ul>\n  </ion-content>\n</ion-view>\n'), e.put("side-menu.html", '<ion-side-menus enable-menu-with-back-views="false">\n  <ion-side-menu-content class="post-size-14px">\n    <ion-nav-bar class="bar app-top-bar">\n      <ion-nav-back-button>\n      </ion-nav-back-button>\n      <ion-nav-buttons side="left">\n        <button class="button button-icon button-clear ion-navicon" menu-toggle="left">\n        </button>\n      </ion-nav-buttons>\n      <ion-nav-buttons side="right">\n        <button class="button button-icon button-clear ion-search" menu-toggle="right">\n        </button>\n      </ion-nav-buttons>\n    </ion-nav-bar>\n    <ion-nav-view name="menuContent"></ion-nav-view>\n  </ion-side-menu-content>\n\n  <ion-side-menu class="main-menu" side="left" width="230">\n    <ion-content>\n      <ion-list>\n        <ion-item class="heading-item item" nav-clear menu-close ui-sref="app.settings">\n          <img ng-src="{{user.avatar}}">\n          <div class="heading-bg">\n          </div>\n          <div class="heading-action item-icon-left">\n            <i class="icon ion-gear-a"></i>\n            <h2 class="greeting">My settings</h2>\n          </div>\n        </ion-item>\n        <ion-item class="item item-icon-left" nav-clear menu-close ui-sref="app.home">\n          <!-- <i class="icon ion-home"></i> -->\n          <i class="icon ion-quote"></i>\n          <h2 class="menu-text">Recent posts</h2>\n        </ion-item>\n        <ion-item class="item item-icon-left" nav-clear menu-close ui-sref="app.bookmarks">\n          <i class="icon ion-bookmark"></i>\n          <h2 class="menu-text">Saved for later</h2>\n        </ion-item>\n        <ion-item class="item item-icon-left" nav-clear menu-close ui-sref="app.contact">\n          <i class="icon ion-location"></i>\n          <h2 class="menu-text">Contact</h2>\n        </ion-item>\n      </ion-list>\n    </ion-content>\n  </ion-side-menu>\n\n  <ion-side-menu class="multi-level-push-menu" side="right" ng-controller="PushMenuCtrl">\n    <ion-content has-bouncing="false" scroll="false">\n      <wp-search>\n      </wp-search>\n      <push-menu menu="menu"></push-menu>\n    </ion-content>\n  </ion-side-menu>\n</ion-side-menus>\n'), e.put("walkthrough.html", '<ion-view class="walkthrough-view" cache-view="false">\n  <ion-content scroll="false">\n    <div class="top-content row">\n      <ion-slide-box delegate-handle="walkthrough-slider" show-pager="true">\n        <ion-slide>\n          <div class="row slide-content">\n            <div class="col">\n              <h3 class="slide-h">A FULL WordPress integration app</h3>\n              <img class="slide-image" ng-src="img/ionWP1.png"/>\n              <p class="slide-p">\n                Super easy to configure, try it now!\n              </p>\n            </div>\n          </div>\n        </ion-slide>\n        <ion-slide>\n          <div class="row slide-content">\n            <div class="col">\n              <h3 class="slide-h">All under a beautyfull design</h3>\n              <img class="slide-image" ng-src="img/ionWP2.png"/>\n            </div>\n          </div>\n        </ion-slide>\n      </ion-slide-box>\n    </div>\n    <div class="bottom-content row">\n      <div class="col col-center">\n        <a class="login button button-block" ui-sref="login">\n          Log In\n        </a>\n      </div>\n      <div class="col col-center">\n        <a class="sign-up button button-block" ui-sref="register">\n          Register\n        </a>\n      </div>\n    </div>\n  </ion-content>\n</ion-view>\n'), e.put("partials/credits.html", '<ion-modal-view>\n	<ion-header-bar>\n		<h1 class="title">Credits</h1>\n		<div class="button button-clear" ng-click="credits_modal.hide()"><span class="icon ion-close"></span></div>\n	</ion-header-bar>\n	<ion-content>\n		<div class="credits">\n\n\n			<p>Thanks for using our products and services (“Services”). Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n			\n		</div>\n	</ion-content>\n</ion-modal-view>\n'), e.put("partials/faqs.html", '<ion-modal-view>\n	<ion-header-bar>\n		<h1 class="title">FAQS</h1>\n		<div class="button button-clear" ng-click="faqs_modal.hide()"><span class="icon ion-close"></span></div>\n	</ion-header-bar>\n	<ion-content>\n		<div class="faqs">\n			<ul class="list">\n				<li class="faq-item">\n					<h5>What is Lorem Ipsum?</h5>\n					<p>\n						Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n				</li>\n				<li class="faq-item">\n					<h5>Where does it come from?</h5>\n					<p>\n						Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.</p>\n				</li>\n				<li class="faq-item">\n					<h5>Why do we use it?</h5>\n					<p>\n						It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. </p><p>Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\n				</li>\n			</ul>\n		</div>\n	</ion-content>\n</ion-modal-view>\n'), e.put("partials/main-menu.html", '<div class="menu-wrapper">\n	<nav class="mp-menu">\n		<menu-level menu="menu" level="0"></menu-level>\n	</nav>\n</div>\n'), e.put("partials/menu-level.html", '<div class="mp-level" ng-class="{\'mp-level-overlay\': menu.overlay, \'level-id-{{menu.id}}\':true}">\n	<div class="menu-heading" ng-class="{\'has-previous\': level > 0}">\n		<a class="menu-title" ng-if="level > 0" menu-close ui-sref="app.category({categoryTitle: menu.title, categoryId: menu.id})">\n			<h2 class="title-text">{{menu.title}}</h2>\n			<span class="title-aux">see all</span>\n		</a>\n		<a class="menu-title" ng-if="level == 0" href="">\n			<h2 class="title-text">{{menu.title}}</h2>\n		</a>\n		<a ng-if="level > 0" class="menu-back icon ion-chevron-left" ng-click="backToPreviousMenu(menu, $event)" href="#">back</a>\n	</div>\n	<ul class="categories-list">\n		<li ng-repeat="item in menu.items" class="category-item-container icon" ng-class="{\'ion-chevron-right\': item.menu}">\n			<div class="category-item" ng-if="item.menu">\n				<a class="category-details" ng-click="openSubMenu(item.menu, menu, $event)" href="">\n					<span class="category-title">{{ item.name }}</span>\n					<p class="category-description">\n						{{item.description}}\n					</p>\n				</a>\n				<recursive-menu>\n					<menu-level menu="item.menu" level="childrenLevel"></menu-level>\n				</recursive-menu>\n			</div>\n			<div class="category-item" ng-if="!item.menu">\n				<a menu-close class="category-details" ui-sref="app.category({categoryTitle: item.name, categoryId: item.id})">\n					<span class="category-title">{{ item.name }}</span>\n					<p class="category-description">\n						{{item.description}}\n					</p>\n				</a>\n			</div>\n		</li>\n	</ul>\n</div>\n'), e.put("partials/my-tab.html", '<div class="tab-content" ng-show="selected">\n	<ng-transclude></ng-transclude>\n	<div class="search-resume">\n		<div ng-show="!query">\n			<h2 class="no-query">There\'s no query to search</h2>\n		</div>\n		<div ng-show="query">\n			<h2 class="search-query">Searching for: <span class="query-text">{{ query }}</span></h2>\n		</div>\n	</div>\n	<div class="search-results-container">\n		<div ng-show="results.length == 0 && query">\n			<h2 class="no-results">No results</h2>\n		</div>\n		<ul class="search-results-list" ng-if="results.length > 0">\n			<li class="search-result-item" ng-repeat="result in results">\n				<a menu-close ng-click="goToPost(result)">\n					<h2 class="post-title" ng-bind-html="result.title | rawHtml"></h2>\n					<p class="post-date">Posted <span class="post-time" am-time-ago="result.date"></span></p>\n				</a>\n			</li>\n		</ul>\n	</div>\n</div>\n'), e.put("partials/post-card.html", '<div class="card-header">\n  <h1 ng-bind-html="post.title | rawHtml"></h1>\n  <h2>Posted <span am-time-ago="post.date"></span> by <span class="author" ng-bind-html="post.author.name | rawHtml"></span></h2>\n</div>\n<div class="card-content" ng-bind-html="post.content | rawHtml"></div>\n<div class="card-footer">\n  <a class="card-button secondary" ng-click="sharePost(post.url)">SHARE</a>\n  <a class="card-button primary" ui-sref="app.post({postId :post.id})">READ MORE</a>\n  <a ng-show="post.comment_count > 0" class="card-button comments" ui-sref="app.post({postId :post.id})">\n    <i class="icon ion-chatbox"></i>{{post.comment_count}}\n  </a>\n  <a class="card-button secondary bookmark" ng-click="bookmarkPost(post)">\n    <i class="icon ion-bookmark"></i>\n  </a>\n</div>\n'), e.put("partials/search-results.html", '<div class="search-results-wrapper">\n	<div class="item item-divider results-heading">\n		<div class="tabs-striped tabs-background-dark tabs-color-stable">\n			<div class="tabs">\n				<a ng-repeat="tab in tabs" ng-click="select(tab)" ng-class="{ active: tab.selected }" class="tab-item">{{tab.title}}</a>\n			</div>\n		</div>\n	</div>\n	<div class="item item-body results-body">\n		<div class="tabs-content" ng-transclude></div>\n	</div>\n</div>\n'), e.put("partials/show-hide-password.html", '<div class="show-hide-input" ng-transclude>\n</div>\n<a class="toggle-view-anchor" on-touch="toggleType($event)">\n	<span ng-show="show">HIDE</span>\n	<span ng-show="!show">SHOW</span>\n</a>\n'), e.put("partials/terms.html", '<ion-modal-view>\n	<ion-header-bar>\n		<h1 class="title">Terms of Service</h1>\n		<div class="button button-clear" ng-click="terms_modal.hide()"><span class="icon ion-close"></span></div>\n	</ion-header-bar>\n	<ion-content>\n		<div class="terms-of-service">\n			<p>Last modified: April 14, 2014</p>\n			<h4 class="title">Welcome to ionWordpress!</h4>\n			<p>Thanks for using our products and services (“Services”). Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n			<h4 class="title">Using our Services</h4>\n			<p>You must follow any policies made available to you within the Services.</p>\n			<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\n			<h4 class="title">About these Terms</h4>\n			<p>We may modify these terms or any additional terms that apply to a Service to, for example, reflect changes to the law or changes to our Services. You should look at the terms regularly. We’ll post notice of modifications to these terms on this page. We’ll post notice of modified additional terms in the applicable Service. Changes will not apply retroactively and will become effective no sooner than fourteen days after they are posted. However, changes addressing new functions for a Service or changes made for legal reasons will be effective immediately. If you do not agree to the modified terms for a Service, you should discontinue your use of that Service.</p>\n		</div>\n	</ion-content>\n</ion-modal-view>\n'), e.put("partials/wp-search.html", '<div class="wp-search">\n	<div class="search-box-wrapper">\n		<div class="bar bar-header item-input-inset">\n			<label class="item-input-wrapper">\n				<i class="icon ion-search placeholder-icon"></i>\n				<input type="search" ng-model="query" placeholder="Search posts" search-input>\n			</label>\n			<button ng-click="closeSearch($event)" class="button button-clear button-icon icon ion-close-circled"></button>\n		</div>\n	</div>\n	<search-results>\n		<my-tab title="Posts" tabid="posts" query="{{query}}">\n		</my-tab>\n		<my-tab title="Tags" tabid="tags" query="{{query}}">\n		</my-tab>\n		<my-tab title="Authors" tabid="authors" query="{{query}}">\n		</my-tab>\n	</search-results>\n</div>\n')
}]), angular.module("your_app_name.services", []).service("PostService", ["$rootScope", "$http", "$q", "WORDPRESS_API_URL", "AuthService", "BookMarkService", function(e, n, t, o, s, i) {
    this.getRecentPosts = function(e) {
        var s = t.defer();
        return n.jsonp(o + "get_recent_posts/?page=" + e + "&callback=JSON_CALLBACK").success(function(e) {
            s.resolve(e)
        }).error(function(e) {
            s.reject(e)
        }), s.promise
    }, this.getUserGravatar = function(e) {
        var s = t.defer();
        return n.jsonp(o + "user/get_avatar/?user_id=" + e + "&type=full&callback=JSON_CALLBACK").success(function(e) {
            s.resolve(e)
        }).error(function(e) {
            s.reject(e)
        }), s.promise
    }, this.getPost = function(e) {
        var s = t.defer();
        return n.jsonp(o + "get_post/?post_id=" + e + "&callback=JSON_CALLBACK").success(function(e) {
            s.resolve(e)
        }).error(function(e) {
            s.reject(e)
        }), s.promise
    }, this.submitComment = function(e, i) {
        var a = t.defer(),
            r = s.getUser();
        return n.jsonp(o + "user/post_comment/?post_id=" + e + "&cookie=" + r.cookie + "&comment_status=1&content=" + i + "&callback=JSON_CALLBACK").success(function(e) {
            a.resolve(e)
        }).error(function(e) {
            a.reject(e)
        }), a.promise
    }, this.getPostsFromCategory = function(e, s) {
        var i = t.defer();
        return n.jsonp(o + "get_category_posts/?id=" + e + "&page=" + s + "&callback=JSON_CALLBACK").success(function(e) {
            i.resolve(e)
        }).error(function(e) {
            i.reject(e)
        }), i.promise
    }, this.shortenPosts = function(e) {
        var n = 600;
        return _.map(e, function(e) {
            if (e.content.length > n) {
                var t = e.content.substr(0, n);
                t = t.substr(0, Math.min(t.length, t.lastIndexOf("</p>"))), e.content = t
            }
            return e
        })
    }, this.sharePost = function(e) {
        window.plugins.socialsharing.share("Check this post here: ", null, null, e)
    }, this.bookmarkPost = function(n) {
        i.bookmarkPost(n), e.$broadcast("new-bookmark", n)
    }
}]).service("SearchService", ["$rootScope", "$http", "$q", "WORDPRESS_API_URL", function(e, n, t, o) {
    this.search = function(e) {
        var n = [],
            o = t.defer(),
            s = [this.searchPosts(e), this.searchTags(e), this.searchAuthors(e)];
        return t.all(s).then(function(e) {
            _.map(e, function(e) {
                n.push({
                    _id: e.id,
                    results: _.map(e.posts, function(e) {
                        return {
                            title: e.title,
                            id: e.id,
                            date: e.date,
                            excerpt: e.excerpt
                        }
                    })
                })
            }), o.resolve(n)
        }), o.promise
    }, this.searchPosts = function(e) {
        var s = t.defer();
        return n.jsonp(o + "get_search_results/?search=" + e + "&callback=JSON_CALLBACK").success(function(e) {
            var n = {
                id: "posts",
                posts: e.posts
            };
            s.resolve(n)
        }).error(function(e) {
            s.reject(e)
        }), s.promise
    }, this.searchTags = function(e) {
        var s = t.defer(),
            i = t.defer();
        return n.jsonp(o + "get_tag_index/?callback=JSON_CALLBACK").success(function(n) {
            var t = _.filter(n.tags, function(n) {
                return n.title.indexOf(e) > -1
            });
            s.resolve(t)
        }).error(function(e) {
            s.reject(e)
        }), s.promise.then(function(e) {
            var s = _.map(e, function(e) {
                return n.jsonp(o + "get_tag_posts/?id=" + e.id + "&callback=JSON_CALLBACK")
            });
            t.all(s).then(function(e) {
                var n = [];
                _.map(e, function(e) {
                    _.each(e.data.posts, function(e) {
                        n.push(e)
                    })
                });
                var t = {
                    id: "tags",
                    posts: n
                };
                i.resolve(t)
            })
        }), i.promise
    }, this.searchAuthors = function(e) {
        var s = t.defer(),
            i = t.defer();
        return n.jsonp(o + "get_author_index/?callback=JSON_CALLBACK").success(function(n) {
            var t = _.filter(n.authors, function(n) {
                return n.name.indexOf(e) > -1 || n.nickname.indexOf(e) > -1 || n.first_name.indexOf(e) > -1
            });
            s.resolve(t)
        }).error(function(e) {
            s.reject(e)
        }), s.promise.then(function(e) {
            var s = _.map(e, function(e) {
                return n.jsonp(o + "get_author_posts/?id=" + e.id + "&callback=JSON_CALLBACK")
            });
            t.all(s).then(function(e) {
                var n = [];
                _.map(e, function(e) {
                    _.each(e.data.posts, function(e) {
                        n.push(e)
                    })
                });
                var t = {
                    id: "authors",
                    posts: n
                };
                i.resolve(t)
            })
        }), i.promise
    }
}]).service("CategoryService", ["$rootScope", "$http", "$q", "WORDPRESS_API_URL", function(e, n, t, o) {
    this.getCategories = function() {
        var e = t.defer();
        return n.jsonp(o + "get_category_index/?callback=JSON_CALLBACK").success(function(n) {
            e.resolve(n)
        }).error(function(n) {
            e.reject(n)
        }), e.promise
    }
}]).service("BookMarkService", ["_", function(e) {
    this.bookmarkPost = function(n) {
        var t = e.isUndefined(window.localStorage.ionWordpress_bookmarks) ? [] : JSON.parse(window.localStorage.ionWordpress_bookmarks),
            o = e.find(t, function(e) {
                return e.id == n.id
            });
        o || t.push({
            id: n.id,
            title: n.title,
            date: n.date,
            excerpt: n.excerpt
        }), window.localStorage.ionWordpress_bookmarks = JSON.stringify(t)
    }, this.getBookmarks = function() {
        return JSON.parse(window.localStorage.ionWordpress_bookmarks || "[]")
    }
}]).service("PushNotificationsService", ["$rootScope", "$state", "$cordovaPush", "WpPushServer", "GCM_SENDER_ID", "$ionicHistory", function(e, n, t, o, s, i) {
    this.register = function() {
        if (ionic.Platform.isIOS()) {
            var a = {
                badge: !0,
                sound: !0,
                alert: !0
            };
            t.register(a).then(function(e) {
                o.storeDeviceToken("ios", e)
            }, function(e) {}), e.$on("$cordovaPush:notificationReceived", function(e, t) {
                t.relatedvalue && (i.nextViewOptions({
                    disableAnimate: !0
                }), n.go("app.post", {
                    postId: t.relatedvalue
                }))
            })
        } else if (ionic.Platform.isAndroid()) {
            var r = {
                senderID: s
            };
            t.register(r).then(function(e) {}, function(e) {}), e.$on("$cordovaPush:notificationReceived", function(e, t) {
                switch (t.event) {
                    case "registered":
                        t.regid.length > 0 && o.storeDeviceToken("android", t.regid);
                        break;
                    case "message":
                        t.payload.relatedvalue && (i.nextViewOptions({
                            disableAnimate: !0
                        }), n.go("app.post", {
                            postId: t.payload.relatedvalue
                        }));
                        break;
                    case "error":
                }
            })
        }
    }
}]).service("AuthService", ["$rootScope", "$http", "$q", "WORDPRESS_API_URL", function(e, n, t, o) {
    this.validateAuth = function(e) {
        var s = t.defer();
        return n.jsonp(o + "user/validate_auth_cookie/?cookie=" + e.cookie + "&callback=JSON_CALLBACK").success(function(e) {
            s.resolve(e)
        }).error(function(e) {
            s.reject(e)
        }), s.promise
    }, this.doLogin = function(e) {
        var n = t.defer(),
            o = t.defer(),
            s = this;
        return s.requestNonce("user", "generate_auth_cookie").then(function(e) {
            o.resolve(e)
        }), o.promise.then(function(t) {
            s.generateAuthCookie(e.userName, e.password, t).then(function(e) {
                if ("error" == e.status) n.reject(e.error);
                else {
                    var t = {
                        cookie: e.cookie,
                        data: e.user,
                        user_id: e.user.id
                    };
                    s.saveUser(t), s.updateUserAvatar().then(function() {
                        n.resolve(t)
                    })
                }
            })
        }), n.promise
    }, this.doRegister = function(e) {
        var n = t.defer(),
            o = t.defer(),
            s = this;
        return s.requestNonce("user", "register").then(function(e) {
            o.resolve(e)
        }), o.promise.then(function(t) {
            s.registerUser(e.userName, e.email, e.displayName, e.password, t).then(function(t) {
                "error" == t.status ? n.reject(t.error) : s.doLogin(e).then(function() {
                    n.resolve(e)
                })
            })
        }), n.promise
    }, this.requestNonce = function(e, s) {
        var i = t.defer();
        return n.jsonp(o + "get_nonce/?controller=" + e + "&method=" + s + "&callback=JSON_CALLBACK").success(function(e) {
            i.resolve(e.nonce)
        }).error(function(e) {
            i.reject(e.nonce)
        }), i.promise
    }, this.doForgotPassword = function(e) {
        var s = t.defer();
        return n.jsonp(o + "user/retrieve_password/?user_login=" + e + "&callback=JSON_CALLBACK").success(function(e) {
            s.resolve(e)
        }).error(function(e) {
            s.reject(e)
        }), s.promise
    }, this.generateAuthCookie = function(e, s, i) {
        var a = t.defer();
        return n.jsonp(o + "user/generate_auth_cookie/?username=" + e + "&password=" + s + "&nonce=" + i + "&callback=JSON_CALLBACK").success(function(e) {
            a.resolve(e)
        }).error(function(e) {
            a.reject(e)
        }), a.promise
    }, this.saveUser = function(e) {
        window.localStorage.ionWordpress_user = JSON.stringify(e)
    }, this.getUser = function() {
        return {
            avatar: JSON.parse(window.localStorage.ionWordpress_user_avatar || null),
            data: JSON.parse(window.localStorage.ionWordpress_user || null).data,
            cookie: JSON.parse(window.localStorage.ionWordpress_user || null).cookie
        }
    }, this.registerUser = function(e, s, i, a, r) {
        var l = t.defer();
        return n.jsonp(o + "user/register/?username=" + e + "&email=" + s + "&display_name=" + i + "&user_pass=" + a + "&nonce=" + r + "&callback=JSON_CALLBACK").success(function(e) {
            l.resolve(e)
        }).error(function(e) {
            l.reject(e)
        }), l.promise
    }, this.userIsLoggedIn = function() {
        var e = t.defer(),
            n = JSON.parse(window.localStorage.ionWordpress_user || null);
        return null !== n && null !== n.cookie ? this.validateAuth(n).then(function(n) {
            e.resolve(n.valid)
        }) : e.resolve(!1), e.promise
    }, this.logOut = function() {
        window.localStorage.ionWordpress_user = null, window.localStorage.ionWordpress_user_avatar = null
    }, this.updateUserAvatar = function() {
        var e = t.defer(),
            s = JSON.parse(window.localStorage.ionWordpress_user || null);
        return n.jsonp(o + "user/get_avatar/?user_id=" + s.user_id + "&type=full&callback=JSON_CALLBACK").success(function(n) {
            window.localStorage.ionWordpress_user_avatar = JSON.stringify(n.avatar), e.resolve(n.avatar)
        }).error(function(n) {
            e.reject(n)
        }), e.promise
    }
}]), angular.module("your_app_name.config", []).constant("WORDPRESS_API_URL", "http://wordpress.startapplabs.com/blog/api/").constant("WORDPRESS_PUSH_URL", "http://wordpress.startapplabs.com/blog/push/").constant("GCM_SENDER_ID", "574597432927"), angular.module("your_app_name.filters", []).filter("rawHtml", ["$sce", function(e) {
    return function(n) {
        return e.trustAsHtml(n)
    }
}]), angular.module("your_app_name.factories", []).factory("WpPushServer", ["$http", "WORDPRESS_PUSH_URL", function(e, n) {
    return {
        storeDeviceToken: function(t, o) {
            e.post(n + "savetoken/?device_token=" + o + "&device_type=" + t).success(function() {}).error(function(e, n) {})
        }
    }
}]).factory("AdMob", ["$window", function(e) {
    var n = e.AdMob;
    if (n) {
        document.addEventListener("onAdFailLoad", function(e) {}), document.addEventListener("onAdLoaded", function(e) {}), document.addEventListener("onAdPresent", function(e) {}), document.addEventListener("onAdLeaveApp", function(e) {}), document.addEventListener("onAdDismiss", function(e) {});
        var t = {
                position: n.AD_POSITION.BOTTOM_CENTER,
                bgColor: "black",
                isTesting: !0
            },
            o = {};
        ionic.Platform.isAndroid() && (o = {
            banner: "ca-app-pub-6869992474017983/9375997553",
            interstitial: "ca-app-pub-6869992474017983/1657046752"
        }), ionic.Platform.isIOS() && (o = {
            banner: "ca-app-pub-6869992474017983/4806197152",
            interstitial: "ca-app-pub-6869992474017983/7563979554"
        }), n.setOptions(t), n.prepareInterstitial({
            adId: o.interstitial,
            autoShow: !1,
            success: function() {},
            error: function() {}
        })
    }
    return {
        showBanner: function() {
            n && n.createBanner({
                adId: o.banner,
                position: n.AD_POSITION.BOTTOM_CENTER,
                autoShow: !0,
                success: function() {},
                error: function() {}
            })
        },
        showInterstitial: function() {
            n && n.showInterstitial()
        },
        removeAds: function() {
            n && n.removeBanner()
        }
    }
}]).factory("iAd", ["$window", function(e) {
    var n = e.iAd;
    return n && n.prepareInterstitial({
        autoShow: !1
    }), {
        showBanner: function() {
            n && n.createBanner({
                position: n.AD_POSITION.BOTTOM_CENTER,
                autoShow: !0
            })
        },
        showInterstitial: function() {
            n && n.showInterstitial()
        },
        removeAds: function() {
            n && n.removeBanner()
        }
    }
}]);