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
            session: string;
        };
    };
}
