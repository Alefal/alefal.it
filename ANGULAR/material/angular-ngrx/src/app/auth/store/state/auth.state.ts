import { Auth } from "../../../shared/models/interfaces/auth.interface";

export default class AuthState {
    Authentication: Auth
}

export const initializeAuthState = (): AuthState => {
    return { 
        Authentication: {
            User: null,
            isAuthenticated: false,
            authenticate: {
                username: '',
                password: '',
                rememberme: false
            }
        }
    };
};
