/**
 * Component Presentation: stateless
 */
import { Component, Input, Output, EventEmitter } from '@angular/core';
import { User } from '../../../shared/models/interfaces/user.interface';

@Component({
  selector: 'app-user-detail',
  templateUrl: './detail.component.html',
  styleUrls: ['./detail.component.css']
})
export class DetailComponent {

  @Input() userSelected: User;
  @Input() userTitle: string;

  @Output('userEdit') userEditEmitter = new EventEmitter<User>();
  @Output('userCreate') userCreateEmitter = new EventEmitter<User>();

  userEdit(user: User) {
    this.userEditEmitter.emit(user);
  }
  userCreate(user: User) {
    this.userCreateEmitter.emit(user);
  }

}