import { Component } from '@angular/core';
import { Store, select } from '@ngrx/store';
import PostState from './store/state/post.state';
import { Observable, Subscription } from 'rxjs';
import { Post } from './models/post.interface';
import { map } from 'rxjs/operators';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  postState$: Observable<PostState>;
  PostSubscription: Subscription;
  postSelected: Post;
  errorsCollection: Error = null;

  constructor(private store: Store<{ postState: PostState }>) {
    this.postState$ = store.pipe(select('postState'));
    //this.postState$.subscribe(postState => this.postSelected = postState.PostSelected)
  }

  ngOnInit() {
    this.PostSubscription = this.postState$
      .pipe(
        map(x => {
          this.postSelected = x.PostSelected;
          this.errorsCollection = x.PostError;
        })
      )
      .subscribe();
  }

}