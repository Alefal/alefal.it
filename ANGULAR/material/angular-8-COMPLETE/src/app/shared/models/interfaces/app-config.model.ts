export interface IAppConfig {
    env: {
        name: string;
    };
    settings: {
        title: string,
        version: string,
        language: string,
        intervalTime: number,
        showDashboard: boolean,
        apiServer: {
            host: string;
            endPoint: string;
        };
        apiList: {
            auth: {
                token: string;
                getConfiguration: string;
            },
            user: {
                changePassword: string;
                changePasswordAdmin: string;
                getAll: string;
                getById: string;
                create: string;
                update: string;
                delete: string;
                enable: string;
                disable: string;
                setPrivacy: string;
                resetPrivacy: string;
                setDeleteUserInformationConsent: string;
            }
        };
    };
    features: {
        dashboard: [
            {
                state: string, 
                name: string, 
                type: string, 
                icon: string, 
                enabled: boolean
            }
        ];
        profile: [
            {
                state: string, 
                name: string, 
                type: string, 
                icon: string, 
                enabled: boolean,
                function: string
            }
        ];
        materialComponent: {
            enabled: boolean;
            components: [
                {
                    state: string, 
                    name: string, 
                    type: string, 
                    icon: string, 
                    enabled: boolean 
                }
            ]
        };
    }
}
