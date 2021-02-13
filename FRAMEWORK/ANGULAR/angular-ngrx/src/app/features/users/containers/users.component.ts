import { Component, OnInit, Input, TemplateRef, ViewChild } from '@angular/core';

import { Store, select } from '@ngrx/store';
import { Observable, Subscription } from 'rxjs';
import { map, filter } from 'rxjs/operators';

import * as UserActions from '../store/actions/user.actions';
import { getUsername } from '../store/selectors/user.selectors';
import UserState from '../store/state/user.state';
import { User } from '../../../shared/models/interfaces/user.interface';

import { BsModalRef, BsModalService, ModalDirective } from 'ngx-bootstrap/modal';

@Component({
  selector: 'app-users',
  templateUrl: './users.component.html',
  styleUrls: ['./users.component.css']
})
export class UsersComponent implements OnInit {

  @Input() section: string;

  userState$: Observable<UserState>;
  userTitle$: Observable<string>;

  UserSubscription: Subscription;
  usersCollection: User[] = [];
  userSelected: User;
  userTitle: string;

  errorsCollection: Error = null;

  modalRefUserDetail: BsModalRef;
  @ViewChild('templateUserDetail', { static: false }) templateUserDetail: ModalDirective;

  constructor(
    private store: Store<{ userState: UserState }>,
    private modalService: BsModalService
  ) {
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
    this.modalRefUserDetail = this.modalService.show(this.templateUserDetail);
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
