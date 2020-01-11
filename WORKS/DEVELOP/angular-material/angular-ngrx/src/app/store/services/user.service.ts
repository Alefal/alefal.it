import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable } from 'rxjs';

import { User } from "../../shared/models/interfaces/user.interface";

@Injectable({
    providedIn: "root"
})

export class UserService {
    private ApiURL: string = 'http://5bce1f21a0c99b001337a9e5.mockapi.io/users';
    constructor(public http: HttpClient) { }

    getUsers(): Observable<User[]> {
        return this.http.get<User[]>(this.ApiURL);
    }
    getUserDetail(action): Observable<User> {
        return this.http.get<User>(this.ApiURL + '/' + action.id);
    }
    createUser(action): Observable<User> {
        return this.http.post<User>(this.ApiURL, JSON.stringify(action), {
            headers: { 'Content-Type': 'application/json' }
        });
    }
    editUser(action): Observable<User> {
        return this.http.put<User>(this.ApiURL + '/' + action.id, JSON.stringify(action), {
            headers: { 'Content-Type': 'application/json' }
        });
    }
    deleteUser(action): Observable<User> {
        return this.http.delete<User>(this.ApiURL + '/' + action.id);
    }
}