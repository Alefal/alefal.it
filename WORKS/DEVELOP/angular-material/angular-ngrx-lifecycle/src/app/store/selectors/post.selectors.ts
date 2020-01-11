/**
 * Selectors are pure functions used for obtaining slices of store state.
 */
import { createFeatureSelector, createSelector } from '@ngrx/store';
import PostState from '../state/post.state';

export const getPostTitleState = createFeatureSelector('postState');

export const getPostTitle = createSelector(
    getPostTitleState,
    (state: PostState) => state && state.PostSelected ? state.PostSelected.title : ''
);
