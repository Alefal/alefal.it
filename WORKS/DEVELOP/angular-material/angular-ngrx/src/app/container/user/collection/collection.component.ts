/**
 * Component Presentation: stateless
 */
import { Component, Input, Output, EventEmitter } from '@angular/core';
import { User } from '../../../shared/models/interfaces/user.interface';

@Component({
  selector: 'app-user-collection',
  templateUrl: './collection.component.html',
  styleUrls: ['./collection.component.css']
})
export class CollectionComponent {

  @Input() usersCollection: User[];
  @Input() errorsCollection: Error;

  @Output('userDetail') userDetailEmitter = new EventEmitter<User>();
  @Output('userDelete') userDeleteEmitter = new EventEmitter<User>();
  @Output('userCreationPrepare') userCreationPrepareEmitter = new EventEmitter<User>();
  @Output('refreshUsersPrepare') refreshUsersPrepareEmitter = new EventEmitter<User>();

  userDetail(user: User) {
    this.userDetailEmitter.emit(user);
  }
  userDelete(user: User) {
    this.userDeleteEmitter.emit(user);
  }
  userCreationPrepare() {
    this.userCreationPrepareEmitter.emit();
  }
  refreshUsers() {
    this.refreshUsersPrepareEmitter.emit();
  }

}
