/**
 * Component Presentation: stateless
 */
import { Component, Input, Output, EventEmitter } from '@angular/core';
import { Post } from 'src/app/models/post.interface';

@Component({
  selector: 'app-post-collection',
  templateUrl: './collection.component.html',
  styleUrls: ['./collection.component.css']
})
export class CollectionComponent {

  @Input() postsCollection: Post[];
  @Input() errorsCollection: Error;

  @Output('postDetail') postDetailEmitter = new EventEmitter<Post>();
  @Output('postDelete') postDeleteEmitter = new EventEmitter<Post>();
  @Output('postCreationPrepare') postCreationPrepareEmitter = new EventEmitter<Post>();
  @Output('refreshPostsPrepare') refreshPostsPrepareEmitter = new EventEmitter<Post>();

  postDetail(post: Post) {
    this.postDetailEmitter.emit(post);
  }
  postDelete(post: Post) {
    this.postDeleteEmitter.emit(post);
  }
  postCreationPrepare() {
    this.postCreationPrepareEmitter.emit();
  }
  refreshPosts() {
    this.refreshPostsPrepareEmitter.emit();
  }

}
