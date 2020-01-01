{
    "env": {
        "name": "PROD"
    },
    "settings": {
        "title": "Market Insights",
        "version": "1.0.2",
        "language": "en",
        "intervalTime": 5000,
        "showDashboard": false,
        "apiServer": {
          "host": "",
          "endPoint": "/_vti_bin/marketInsights/endpoint.svc"
        },
        "apiList": {
            "survey":"/survey",
            "exportSurvey":"/survey/download?parameters=method=EXPORTSURVEYCOLLECTION",
            "watermark":"/watermark",
            "trace": "/trace"
        },
        "logo": {
            "white": "./assets/images/sky/logo.png",
            "dark": "./assets/images/sky/logo.png",
            "favicon": "./assets/images/sky/favicon.png",
            "login": "./assets/images/sky/logo.png"
        },
        "features": {
            "common": {
                "dashboard": true,
                "dmutilweb": true
            },
            "admin": {
                "audit": true,
                "users": true,
                "engine": true,
                "virtualization": true,
                "masking": true,
                "restore": true
            },
            "operator": {
                "virtualization": true,
                "masking": true,
                "restore": true
            }
        }
    }
}
