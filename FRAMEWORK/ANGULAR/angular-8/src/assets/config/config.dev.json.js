{
    "env": {
        "name": "DEV"
    },
    "settings": {
        "title": "PLC Service",
        "logo": "./assets/images/logo.svg",
        "version": "1.0.4",
        "language": "en",
        "intervalTime": 5000,
        "showDashboard": false,
        "apiServer": {
          "host": "http://localhost:6500",
          "endPoint": ""
        },
        "apiList": {
            "auth": {
                "token": "/token",
                "getConfiguration": "/api/Configuration"
            },
            "user": {
                "changePassword": "/api/User/UpdatePassword",
                "changePasswordAdmin": "/api/User/UpdatePasswordAdmin",
                "getAll": "/api/User",
                "getById": "/api/User",
                "create": "/api/User/Register",
                "update": "/api/User/Update",
                "delete": "/api/User",
                "enable": "/api/User/Enable",
                "disable": "/api/User/Disable",
                "setPrivacy": "/api/User/SetPrivacy",
                "resetPrivacy": "/api/User/ResetPrivacy",
                "setDeleteUserInformationConsent": "/api/User/SetDeleteUserInformationConsent"
            }
        }
    },
    "features": {
        "dashboard": [
            { 
                "state": "dashboard", 
                "name": "Dashboard", 
                "type": "link", 
                "icon": "av_timer", 
                "enabled": true,
                "admin": true,
                "operator": true
            },
            { 
                "state": "users", 
                "name": "Users", 
                "type": "link", 
                "icon": "people", 
                "enabled": true,
                "admin": true,
                "operator": false
            },
            { 
                "state": "documentTypes", 
                "name": "Document Type", 
                "type": "link", 
                "icon": "local_offer", 
                "enabled": true,
                "admin": true,
                "operator": true
            },
            { 
                "state": "documents", 
                "name": "Documents", 
                "type": "link", 
                "icon": "filter_none", 
                "enabled": true,
                "admin": true,
                "operator": true
            }
        ],
        "profile": [
            { "state": "requestDelete", "name": "profile.requestDelete", "type": "link", "icon": "contacts", "enabled": true, "action":"setDeleteUserInformationConsent" },
            { "state": "changePassword", "name": "profile.changePassword", "type": "link", "icon": "lock", "enabled": true, "action":"changePassword" },
            { "state": "signOut", "name": "profile.signOut", "type": "link", "icon": "exit_to_app", "enabled": true, "action":"logout" }
        ],
        "materialComponent": {
            "enabled": true,
            "components": [
                { "state": "button", "type": "link", "name": "Buttons", "icon": "crop_7_5", "enabled": true },
                { "state": "grid", "type": "link", "name": "Grid List", "icon": "view_comfy", "enabled": true },
                { "state": "lists", "type": "link", "name": "Lists", "icon": "view_list", "enabled": true },
                { "state": "menu", "type": "link", "name": "Menu", "icon": "view_headline", "enabled": true },
                { "state": "tabs", "type": "link", "name": "Tabs", "icon": "tab", "enabled": true },
                { "state": "stepper", "type": "link", "name": "Stepper", "icon": "web", "enabled": true },
                { "state": "expansion", "type": "link", "name": "Expansion Panel", "icon": "vertical_align_center", "enabled": true },
                { "state": "chips", "type": "link", "name": "Chips", "icon": "vignette", "enabled": true },
                { "state": "toolbar", "type": "link", "name": "Toolbar", "icon": "voicemail", "enabled": true },
                { "state": "progress-snipper", "type": "link", "name": "Progress snipper", "icon": "border_horizontal", "enabled": true },
                { "state": "progress", "type": "link", "name": "Progress Bar", "icon": "blur_circular", "enabled": true },
                { "state": "dialog", "type": "link", "name": "Dialog", "icon": "assignment_turned_in", "enabled": true },
                { "state": "tooltip", "type": "link", "name": "Tooltip", "icon": "assistant", "enabled": true },
                { "state": "snackbar", "type": "link", "name": "Snackbar", "icon": "adb", "enabled": true },
                { "state": "slider", "type": "link", "name": "Slider", "icon": "developer_mode", "enabled": true },
                { "state": "slide-toggle", "type": "link", "name": "Slide Toggle", "icon": "all_inclusive", "enabled": true }
            ]
        }
    }
}