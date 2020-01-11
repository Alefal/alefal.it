{
    "env": {
        "name": "PROD"
    },
    "settings": {
        "title": "Market Insights",
        "version": "1.0.4",
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
            "trace": "/trace",
            "session": "/session"
        }
    }
}
