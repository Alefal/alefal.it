/**
 * Reducers in NgRx are responsible for handling transitions from one state to the next state in your application.
 */

import { Action, createReducer, on } from '@ngrx/store';
import * as PostActions from '../actions/post.actions';
import PostState, { initializeState } from '../state/post.state';
import { Post } from 'src/app/models/post.interface';

export const postFeatureKey = 'post';

const initialState = initializeState();

const _reducer = createReducer(
  initialState,
  ////////// Posts Collection
  on(PostActions.loadPosts, state => state),
  on(PostActions.loadPostsSuccess, (state: PostState, { payload }) => {
    return { 
      ...state, 
      Posts: payload, 
      PostError: null 
    };
  }),
  ////////// Post Detail
  on(PostActions.loadPostDetail, state => state),
  on(PostActions.loadPostDetailSuccess, (state: PostState, { payload }) => {
    return { 
      ...state,
      PostSelected: payload, 
      PostError: null 
    }; 
  }),
  ////////// Post Creation
  on(PostActions.postCreationPrepare, (state: PostState, { payload }) => {
    return { 
      ...state,
      PostSelected: payload, 
      PostError: null 
    }; 
  }),
  ////////// Post Create
  on(PostActions.postCreate, state => state),
  on(PostActions.postCreateSuccess, (state: PostState, { payload }) => {
    return {
      ...state, 
      Posts: [...state.Posts, payload],
      PostError: null ,
      PostSelected: payload
    };
  }),
  ////////// Post Edit
  on(PostActions.postEdit, state => state),
  on(PostActions.postEditSuccess, (state: PostState, { payload }) => {
    var index = state.Posts.findIndex(item => item.id === payload.id);
    return {
      ...state, 
      Posts: state.Posts.map((el) => {
        if (el.id == payload.id) {
          return { ...state.Posts[index] = Object.assign({}, state.Posts[index], payload)};
        } else {
          return el;
        }
      }),
      PostError: null ,
      PostSelected: payload
    };
  }),
  ////////// Post Delete
  on(PostActions.postDelete, state => state),
  on(PostActions.postDeleteSuccess, (state: PostState, { payload }) => {
    return { 
      ...state, 
      Posts: [...state.Posts.filter(item => item.id !== payload.id)], 
      PostError: null,
      PostSelected: null
    };
  }),
);

export function createPostReducer(state: PostState | undefined, action: Action) {
  return _reducer(state, action);
}
