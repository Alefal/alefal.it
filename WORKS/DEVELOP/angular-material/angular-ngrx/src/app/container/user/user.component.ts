import { Component, OnInit, Input } from '@angular/core';

import { Store, select } from '@ngrx/store';
import { Observable, Subscription } from 'rxjs';
import { map, filter } from 'rxjs/operators';

import * as UserActions from '../../store/actions/user.actions';
import { getUsername } from '../../store/selectors/user.selectors';
import UserState from '../../store/state/user.state';
import { User } from '../../shared/models/interfaces/user.interface';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})
export class UserComponent implements OnInit {

  @Input() section: string;

  userState$: Observable<UserState>;
  userTitle$: Observable<string>;

  UserSubscription: Subscription;
  usersCollection: User[] = [];
  userSelected: User;
  userTitle: string;

  errorsCollection: Error = null;

  constructor(private store: Store<{ userState: UserState }>) {
    this.userState$ = this.store.pipe(select('userState'));
    this.userTitle$ = this.store.pipe(select(getUsername));
  }

  ngOnInit() {
    this.UserSubscription = this.userState$
      .pipe(
        map(x => {
          this.usersCollection = x.Users;
          this.userSelected = x.UserSelected;
          this.errorsCollection = x.UserError;
        })
      )
      .subscribe();

      this.loadUsers();

    // SELECTOR example
    this.userTitle$
      .pipe(
        map(el => {
          this.userTitle = el;
        })
      )
      .subscribe();

  }

  ngOnDestroy() {
    if (this.UserSubscription) {
      this.UserSubscription.unsubscribe();
    }
  }

  loadUsers() {
    this.store.dispatch(UserActions.loadUsers());
  }
  userCreationPrepare() {
    let userCreation: User = Object.assign({});
    userCreation.id = '0';
    userCreation.firstname = '';
    userCreation.lastname = '';
    userCreation.company = '';
    userCreation.role = '';
    userCreation.enabled = false;
    userCreation.phone = 0;
    this.store.dispatch(UserActions.userCreationPrepare({payload: userCreation}));
  }
  userDetail(user) {
    this.store.dispatch(UserActions.loadUserDetail(user));
  }
  userCreate(user) {
    this.store.dispatch(UserActions.userCreate(user));
  }
  userEdit(user) {
    this.store.dispatch(UserActions.userEdit(user));
  }
  userDelete(user) {
    this.store.dispatch(UserActions.userDelete(user));
  }

}
