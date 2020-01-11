import { Component, OnInit, Input } from '@angular/core';

import { Store, select } from '@ngrx/store';
import { Observable, Subscription } from 'rxjs';
import { map, filter } from 'rxjs/operators';

import { Post } from 'src/app/models/post.interface';
import PostState from 'src/app/store/state/post.state';

import * as PostActions from 'src/app/store/actions/post.actions';

import { getPostTitle } from '../../store/selectors/post.selectors';

@Component({
  selector: 'app-post',
  templateUrl: './post.component.html',
  styleUrls: ['./post.component.css']
})
export class PostComponent implements OnInit {

  @Input() section: string;

  postState$: Observable<PostState>;
  postTitle$: Observable<string>;

  PostSubscription: Subscription;
  postsCollection: Post[] = [];
  postSelected: Post;
  postTitle: string;

  errorsCollection: Error = null;

  constructor(private store: Store<{ postState: PostState }>) {
    this.postState$ = this.store.pipe(select('postState'));
    this.postTitle$ = this.store.pipe(select(getPostTitle));
  }

  ngOnInit() {
    this.PostSubscription = this.postState$
      .pipe(
        map(x => {
          this.postsCollection = x.Posts;
          this.postSelected = x.PostSelected;
          this.errorsCollection = x.PostError;
        })
      )
      .subscribe();

      this.loadPosts();

    // SELECTOR example
    this.postTitle$
      .pipe(
        map(el => {
          this.postTitle = el;
        })
      )
      .subscribe();

  }

  ngOnDestroy() {
    if (this.PostSubscription) {
      this.PostSubscription.unsubscribe();
    }
  }

  loadPosts() {
    this.store.dispatch(PostActions.loadPosts());
  }
  postCreationPrepare() {
    let postCreation: Post = Object.assign({});
    postCreation.id = '0';
    postCreation.title = '';
    postCreation.author = '';
    postCreation.avatar = 'https://s3.amazonaws.com/uifaces/faces/twitter/fabbrucci/128.jpg';
    postCreation.description = '';

    this.store.dispatch(PostActions.postCreationPrepare({payload: postCreation}));
  }
  postDetail(post) {
    this.store.dispatch(PostActions.loadPostDetail(post));
  }
  postCreate(post) {
    this.store.dispatch(PostActions.postCreate(post));
  }
  postEdit(post) {
    this.store.dispatch(PostActions.postEdit(post));
  }
  postDelete(post) {
    this.store.dispatch(PostActions.postDelete(post));
  }

}
