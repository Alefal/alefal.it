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
            survey: string;
            exportSurvey: string;
            watermark: string;
            trace: string;
        };
        logo: {
            white: string;
            dark: string;
            favicon: string;
            login: string;
        };
        features: {
            common: {
                dashboard: boolean;
                filelayout: boolean;
                monitoring: boolean;
                dmutilweb: boolean;
            };
            admin: {
                users: boolean;
                ftp: boolean;
                engine: boolean;
                mapping: boolean;
                virtualization: boolean;
                masking: boolean;
                restore: boolean;
                //wiki: boolean;
            };
            operator: {
                lot: boolean;
                virtualization: boolean;
                masking: boolean;
                restore: boolean;
            };
        }
    };
}
