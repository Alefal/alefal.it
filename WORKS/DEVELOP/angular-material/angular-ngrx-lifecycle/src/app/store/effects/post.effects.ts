/**
 * Effects are an RxJS powered side effect model for Store. 
 * Effects use streams to provide new sources of actions to reduce state based on external interactions such as network requests, 
 * web socket messages and time-based events.
 */
import { Injectable } from '@angular/core';
import { Actions, createEffect, ofType } from '@ngrx/effects';

import { catchError, map, mergeMap } from 'rxjs/operators'
import { EMPTY, of } from 'rxjs';

import * as PostActions from '../actions/post.actions';
import { PostService } from '../services/post.service';
import { Post } from 'src/app/models/post.interface';


@Injectable()
export class PostEffects {

  ////////// Posts Collection
  loadPosts$ = createEffect(() => {
    return this.actions$.pipe(
      ofType(PostActions.loadPosts),
      mergeMap(action =>
        this.postService.getPosts().pipe(
          map((data: Post[]) => {
            return PostActions.loadPostsSuccess({ payload: data });
          }),
          catchError((error: Error) => {
            return of(PostActions.loadPostsError(error));
          })
        )
      )
    );
  });

  ////////// Post Detail
  loadPostDetail$ = createEffect(() => {
    return this.actions$.pipe(
      ofType(PostActions.loadPostDetail),
      mergeMap(action =>
        this.postService.getPostDetail(action).pipe(
          map((data: Post) => {
            console.log('data',data);
            return PostActions.loadPostDetailSuccess({ payload: data });
          }),
          catchError((error: Error) => {
            return of(PostActions.loadPostDetailError(error));
          })
        )
      )
    );
  });

  ////////// Post Edit
  postEdit$ = createEffect(() => {
    return this.actions$.pipe(
      ofType(PostActions.postEdit),
      mergeMap(action =>
        this.postService.editPost(action).pipe(
          map((data: Post) => {
            return PostActions.postEditSuccess({ payload: data });
          }),
          catchError((error: Error) => {
            return of(PostActions.postEditError(error));
          })
        )
      )
    );
  });

  ////////// Post Create
  postCreate$ = createEffect(() => {
    return this.actions$.pipe(
      ofType(PostActions.postCreate),
      mergeMap(action =>
        this.postService.createPost(action).pipe(
          map((data: Post) => {
            return PostActions.postCreateSuccess({ payload: data });
          }),
          catchError((error: Error) => {
            return of(PostActions.postCreateError(error));
          })
        )
      )
    );
  });

  ////////// Post Delete
  postDelete$ = createEffect(() => {
    return this.actions$.pipe(
      ofType(PostActions.postDelete),
      mergeMap(action =>
        this.postService.deletePost(action).pipe(
          map((data: Post) => {
            return PostActions.postDeleteSuccess({ payload: data });
          }),
          catchError((error: Error) => {
            return of(PostActions.postDeleteError(error));
          })
        )
      )
    );
  });

  constructor(
    private postService: PostService, 
    private actions$: Actions
  ) { }
}
