import { IAppConfig } from "../../shared/models/interfaces/app-config.model";
import { User } from "../../shared/models/interfaces/user.interface";
import { Auth } from "../../shared/models/interfaces/auth.interface";

export default class AppState {
    Config: IAppConfig;
    //UX: any;
    //Authentication: Auth
}

export const initializeAppState = (): AppState => {
    return { 
        Config: null,
        // UX: null,
        // Authentication: {
        //     User: null,
        //     isAuthenticated: false,
        //     authenticate: {
        //         username: '',
        //         password: '',
        //         rememberme: false
        //     }
        // }
    };
};
