import { User } from "../../shared/models/interfaces/user.interface";

export default class UserState {
    Users: Array<User>;
    UserSelected: User;
    UserError: Error;
}

export const initializeUserState = (): UserState => {
    return { 
        Users: Array<User>(), 
        UserSelected: null,
        UserError: null
    };
};
