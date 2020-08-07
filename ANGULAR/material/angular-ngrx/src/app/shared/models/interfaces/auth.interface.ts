import { User } from "./user.interface";

export interface Auth {
    isAuthenticated: boolean;
    User: User;    
    authenticate: {
        username: string;
        password: string;
        //confirmpassword: string;
        rememberme: boolean;    
    }
}
