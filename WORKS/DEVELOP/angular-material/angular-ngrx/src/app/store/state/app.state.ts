import { IAppConfig } from "../../shared/models/interfaces/app-config.model";
import { User } from "../../shared/models/interfaces/user.interface";

export default class AppState {
    Config: IAppConfig;
    UX: any;
    Authentication: User
}

export const initializeAppState = (): AppState => {
    return { 
        Config: null,
        UX: null,
        Authentication: null
    };
};
