import { Role } from "./role";

export class User {
    idUser: number = 0;
    username: string = '';
    password: string = '';
    accountNonExpired: boolean = false;
    accountNonLocked: boolean = false;
    credentialsNonExpired: boolean = false;
    enabled: boolean = false;
    name: string = '';
    surname: string = '';
    changePassword: boolean = false;
    lastAccess: string = '';
    email: string = '';
    authorities: Role;
    roles: Role[];

    rememberme: boolean = false;
    api_token: string= '';

    constructor() {
        this.roles = [];
        this.roles[0] = new Role();
        //this.authorities = new Role();
    }
}