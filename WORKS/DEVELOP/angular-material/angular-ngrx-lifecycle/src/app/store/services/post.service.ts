import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Post } from 'src/app/models/post.interface';
import { Observable } from 'rxjs';

@Injectable({
    providedIn: "root"
})

export class PostService {
    private ApiURL: string = 'http://5bce1f21a0c99b001337a9e5.mockapi.io/posts';
    //private ApiURL: string = 'https://jsonplaceholder.typicode.com/posts';
    constructor(public http: HttpClient) { }

    getPosts(): Observable<Post[]> {
        return this.http.get<Post[]>(this.ApiURL);
    }

    getPostDetail(action): Observable<Post> {
        return this.http.get<Post>(this.ApiURL + '/' + action.id);
    }
    login(action): Observable<any> {
        return this.http.get<Post>(this.ApiURL + '/' + action.id);
    }

    createPost(action): Observable<Post> {
        return this.http.post<Post>(this.ApiURL, JSON.stringify(action), {
            headers: { 'Content-Type': 'application/json' }
        });
    }
    editPost(action): Observable<Post> {
        return this.http.put<Post>(this.ApiURL + '/' + action.id, JSON.stringify(action), {
            headers: { 'Content-Type': 'application/json' }
        });
    }

    deletePost(action): Observable<Post> {
        return this.http.delete<Post>(this.ApiURL + '/' + action.id);
    }
}