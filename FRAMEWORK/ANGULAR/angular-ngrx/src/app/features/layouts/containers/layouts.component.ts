import {
  ChangeDetectorRef,
  Component,
  OnDestroy,
  AfterViewInit,
  OnInit,
  ViewChild
} from '@angular/core';
import { MediaMatcher } from '@angular/cdk/layout';
import { ToastrService } from 'ngx-toastr';

import { Observable } from 'rxjs';
import { Router } from '@angular/router';
import { TranslateService } from '@ngx-translate/core';
import { BsModalService, BsModalRef, ModalDirective } from 'ngx-bootstrap';

import { Store, select } from '@ngrx/store';
import LayoutsState from '../store/state/layouts.state';
import AppState from '../../../store/state/app.state';
import AuthState from '../../../auth/store/state/auth.state';

import { getAppConfig } from '../../../store/selectors/app.selectors';
import { getUserAuthStatus, getUserLogged } from '../../../auth/store/selectors/auth.selectors';

import * as LayoutsAction from '../store/actions/layouts.actions';
import { FormGroup, FormBuilder, Validators, FormControl, FormGroupDirective, NgForm } from '@angular/forms';
import { ErrorStateMatcher } from '@angular/material';

/** @title Responsive sidenav */
@Component({
  selector: 'app-layouts',
  templateUrl: 'layouts.component.html',
  styleUrls: []
})
export class LayoutsComponent implements OnDestroy, OnInit {
  mobileQuery: MediaQueryList;
  private _mobileQueryListener: () => void;

  appConfig$: Observable<any>;
  appIsAuthenticated$: Observable<any>;
  userLogged$: Observable<any>;

  modalRefChangePassword: BsModalRef;
  @ViewChild('templateChangePassword', { static: false }) templateChangePassword: ModalDirective;

  changePswForm: FormGroup;
  submitted = false;
  matcher = new MyErrorStateMatcher();

  constructor(
    private store: Store<{ layoutsState: LayoutsState }>,
    private storeApp: Store<{ appState: AppState }>,
    private storeAuth: Store<{ authState: AuthState }>,
    changeDetectorRef: ChangeDetectorRef,
    private toastr: ToastrService,
    private router: Router,
    media: MediaMatcher,
    private modalService: BsModalService,
    private translate: TranslateService,
    private formBuilder: FormBuilder
  ) {
    this.mobileQuery = media.matchMedia('(min-width: 768px)');
    this._mobileQueryListener = () => changeDetectorRef.detectChanges();
    this.mobileQuery.addListener(this._mobileQueryListener);
  }
  ngOnInit(): void {
    // Load Config
    this.appConfig$ = this.storeApp.pipe(select(getAppConfig));
    this.appIsAuthenticated$ = this.storeAuth.pipe(select(getUserAuthStatus));
    this.userLogged$ = this.storeAuth.pipe(select(getUserLogged));

    this.changePswForm = this.formBuilder.group(
      {
        oldPsw: ['', [Validators.required, Validators.minLength(6)]],
        newPsw: ['', [Validators.required, Validators.minLength(6)]],
        repeatPsw: ['', [Validators.required, Validators.minLength(6)]]
      }, 
      { 
        validator: this.checkPasswords 
      });
  }

  ngOnDestroy(): void {
    this.mobileQuery.removeListener(this._mobileQueryListener);
  }

  callFunction(func) {
    switch (func) {
      case "hi":
        this.hi()
        break;
      case "changePassword":
        this.openModalChangePassword()
        break;
      case "logout":
        this.store.dispatch(LayoutsAction.logout());
        this.router.navigate(['/login']);
        break;
      default:
        this.toastr.error('Function undefined', 'Error');
    }
  }

  hi() {
    console.log('hiiiiiiiiiiiiii');
  }

  openModalChangePassword() {
    this.modalRefChangePassword = this.modalService.show(this.templateChangePassword);
  }

  changePassword() {
    this.submitted = true;

    // stop here if form is invalid
    if (this.changePswForm.invalid) {
      return;
    } else {
      let payload = '{' +
        '   \"userName":\"USERNAME",' +
        '   \"password":\"' + this.changePswForm.value.newPsw + '\",' +
        '   \"confirmPassword":\"' + this.changePswForm.value.repeatPsw + '\"' +
        ' }';

      this.modalRefChangePassword.hide();
      this.submitted = false;
      this.changePswForm.reset();

      // this.httpService.postCallHttp('/rest/profile/changePassword',rawData)
      //     .subscribe((data: any) => {
      //         this.spinner.hide();
      //         if(data && data.responseCode == 200) {
      //             this.toastr.success(data.responseMessage, 'Password');
      //         } else {
      //             this.httpService.showErrorMessage(data,'Error');
      //         }
      //     });
    }
  }
  checkPasswords(group: FormGroup) { // here we have the 'passwords' group
    let newPsw = group.controls.newPsw.value;
    let repeatPsw = group.controls.repeatPsw.value;
    return newPsw === repeatPsw ? null : { notSame: true }
  }

  // convenience getter for easy access to form fields
  get f() {
    return this.changePswForm.controls;
  }
}

export class MyErrorStateMatcher implements ErrorStateMatcher {
  isErrorState(control: FormControl | null, form: FormGroupDirective | NgForm | null): boolean {
    //const invalidStatus = !!(control && control.status == 'INVALID');
    const invalidCtrl = !!(control && control.invalid && control.parent.dirty);
    const invalidParent = !!(control && control.parent && control.parent.invalid && control.parent.dirty);

    return (/*invalidStatus || */invalidCtrl || invalidParent);
  }
}