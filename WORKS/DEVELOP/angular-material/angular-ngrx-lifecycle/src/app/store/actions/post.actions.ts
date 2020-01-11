/**
 * Actions are one of the main building blocks in NgRx. Actions express unique events that happen throughout your application. 
 * From user interaction with the page, external interaction through network requests, and direct interaction with device APIs, 
 * these and more events are described with actions.
 */
import { createAction, props } from '@ngrx/store';
import { Post } from 'src/app/models/post.interface';

export enum PostsActionTypes {
  LOAD_POSTS = "[POSTS] Load Posts",
  LOAD_POSTS_SUCCESS = "[POSTS] Load Posts Success",
  LOAD_POSTS_ERROR = "[POSTS] Load Posts Error",
  LOAD_POST_DETAIL = "[POST] Load Post Detail",
  LOAD_POST_DETAIL_SUCCESS = "[POST] Load Post Detail Success",
  LOAD_POST_DETAIL_ERROR = "[POST] Load Post Detail Error",
  POST_DELETE = "[POST] Post Delete",
  POST_DELETE_SUCCESS = "[POST] Post Delete Success",
  POST_DELETE_ERROR = "[POST] Post Delete Error",
  POST_EDIT = "[POST] Post Edit",
  POST_EDIT_SUCCESS = "[POST] Post Edit Success",
  POST_EDIT_ERROR = "[POST] Post Edit Error",
  POST_CREATION_PREPARE = "[POST] Post Creation Prepare",
  POST_CREATE = "[POST] Post Create",
  POST_CREATE_SUCCESS = "[POST] Post Create Success",
  POST_CREATE_ERROR = "[POST] Post Create Error"
}

////////// Posts Collection
export const loadPosts = createAction(
  PostsActionTypes.LOAD_POSTS
);
export const loadPostsSuccess = createAction(
  PostsActionTypes.LOAD_POSTS_SUCCESS,
  props<{ payload: Post[] }>()
);
export const loadPostsError = createAction(
  PostsActionTypes.LOAD_POSTS_ERROR,
  props<Error>()
);

////////// Post Detail
export const loadPostDetail = createAction(
  PostsActionTypes.LOAD_POST_DETAIL,
  props<{ post: Post }>()
);
export const loadPostDetailSuccess = createAction(
  PostsActionTypes.LOAD_POST_DETAIL_SUCCESS,
  props<{ payload: Post }>()
);
export const loadPostDetailError = createAction(
  PostsActionTypes.LOAD_POST_DETAIL_ERROR,
  props<Error>()
);

////////// Post Creation Prepare
export const postCreationPrepare = createAction(
  PostsActionTypes.POST_CREATION_PREPARE,
  props<{ payload: Post }>()
);
////////// Post Create
export const postCreate = createAction(
  PostsActionTypes.POST_CREATE,
  props<{ post: Post }>()
);
export const postCreateSuccess = createAction(
  PostsActionTypes.POST_CREATE_SUCCESS,
  props<{ payload: Post }>()
);
export const postCreateError = createAction(
  PostsActionTypes.POST_CREATE_ERROR,
  props<Error>()
);

////////// Post Delete
export const postDelete = createAction(
  PostsActionTypes.POST_DELETE,
  props<{ post: Post }>()
);
export const postDeleteSuccess = createAction(
  PostsActionTypes.POST_DELETE_SUCCESS,
  props<{ payload: Post }>()
);
export const postDeleteError = createAction(
  PostsActionTypes.POST_DELETE_ERROR,
  props<Error>()
);

////////// Post Edit
export const postEdit = createAction(
  PostsActionTypes.POST_EDIT,
  props<{ post: Post }>()
);
export const postEditSuccess = createAction(
  PostsActionTypes.POST_EDIT_SUCCESS,
  props<{ payload: Post }>()
);
export const postEditError = createAction(
  PostsActionTypes.POST_EDIT_ERROR,
  props<Error>()
);

export const PostActions = {
  loadPosts,
  loadPostsSuccess,
  loadPostsError,
  loadPostDetail,
  loadPostDetailSuccess,
  loadPostDetailError,
  postDelete,
  postDeleteSuccess,
  postDeleteError,
  postEdit,
  postEditSuccess,
  postEditError,
  postCreationPrepare,
  postCreate,
  postCreateSuccess,
  postCreateError
};