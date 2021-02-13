/**
 * Component Presentation: stateless
 */
import { Component, Input, Output, EventEmitter } from '@angular/core';
import { Post } from 'src/app/models/post.interface';

@Component({
  selector: 'app-post-detail',
  templateUrl: './detail.component.html',
  styleUrls: ['./detail.component.css']
})
export class DetailComponent {

  @Input() postSelected: Post;
  @Input() postTitle: string;

  @Output('postEdit') postEditEmitter = new EventEmitter<Post>();
  @Output('postCreate') postCreateEmitter = new EventEmitter<Post>();

  postEdit(post: Post) {
    this.postEditEmitter.emit(post);
  }
  postCreate(post: Post) {
    this.postCreateEmitter.emit(post);
  }

}


// import { Component } from '@angular/core';
// import { Store, select } from '@ngrx/store';
// import PostState from '../../../store/state/post.state';
// import { Observable, Subscription } from 'rxjs';
// import { Post } from '../../../models/post.interface';
// import { map } from 'rxjs/operators';
// import { PostActions } from 'src/app/store/actions/post.actions';

// @Component({
//   selector: 'app-post-detail',
//   templateUrl: './detail.component.html',
//   styleUrls: ['./detail.component.css']
// })
// export class DetailComponent {

//   postState$: Observable<PostState>;
//   PostSubscription: Subscription;
//   postSelected: Post;
//   errorsCollection: Error = null;

//   constructor(private store: Store<{ postState: PostState }>) {
//     this.postState$ = store.pipe(select('postState'));
//   }

//   ngOnInit() {
//     this.PostSubscription = this.postState$
//       .pipe(
//         map(x => {
//           this.postSelected = x.PostSelected;
//           this.errorsCollection = x.PostError;
//         })
//       )
//       .subscribe();
//   }

//   savePost(post) {
//     console.log(post);
//     this.store.dispatch(PostActions.postSave(post));
//   }

// }