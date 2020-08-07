{
    "env": {
        "name": "PROD"
    },
    "settings": {
        "title": "TIM",
        "logo": "./assets/images/logo.svg",
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
    },
    "features": {
        "dashboard": [
            { "state": "user", "name": "Users", "type": "link", "icon": "people", "enabled": true },
            { "state": "dashboard", "name": "Dashboard", "type": "link", "icon": "av_timer", "enabled": true },
            { "state": "button", "type": "link", "name": "Buttons", "icon": "crop_7_5", "enabled": false },
            { "state": "grid", "type": "link", "name": "Grid List", "icon": "view_comfy", "enabled": false },
            { "state": "lists", "type": "link", "name": "Lists", "icon": "view_list", "enabled": false },
            { "state": "menu", "type": "link", "name": "Menu", "icon": "view_headline", "enabled": false },
            { "state": "tabs", "type": "link", "name": "Tabs", "icon": "tab", "enabled": false },
            { "state": "stepper", "type": "link", "name": "Stepper", "icon": "web", "enabled": false },
            { "state": "expansion", "type": "link", "name": "Expansion Panel", "icon": "vertical_align_center", "enabled": false },
            { "state": "chips", "type": "link", "name": "Chips", "icon": "vignette", "enabled": false },
            { "state": "toolbar", "type": "link", "name": "Toolbar", "icon": "voicemail", "enabled": false },
            { "state": "progress-snipper", "type": "link", "name": "Progress snipper", "icon": "border_horizontal", "enabled": false },
            { "state": "progress", "type": "link", "name": "Progress Bar", "icon": "blur_circular", "enabled": false },
            { "state": "dialog", "type": "link", "name": "Dialog", "icon": "assignment_turned_in", "enabled": false },
            { "state": "tooltip", "type": "link", "name": "Tooltip", "icon": "assistant", "enabled": false },
            { "state": "snackbar", "type": "link", "name": "Snackbar", "icon": "adb", "enabled": false },
            { "state": "slider", "type": "link", "name": "Slider", "icon": "developer_mode", "enabled": false },
            { "state": "slide-toggle", "type": "link", "name": "Slide Toggle", "icon": "all_inclusive", "enabled": false }
        ],
        "profile": [
            { "state": "user", "name": "Users", "type": "link", "icon": "people", "enabled": true }
        ]
    }
}
