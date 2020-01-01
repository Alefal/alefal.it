import { Component, OnInit, ChangeDetectorRef, TemplateRef, ViewChild } from '@angular/core';
import { routerTransition } from '../../router.animations';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { HttpClient } from '@angular/common/http';

import { NgbModal, ModalDismissReasons, NgbModalRef } from '@ng-bootstrap/ng-bootstrap';

import { ToastrService } from 'ngx-toastr';
import { SpinnerService } from '../../shared/services/spinner.service';
import { HttpService } from '../../shared/services/http.service';
import { User } from '../../shared/models/classes/user';
import { Role } from '../../shared/models/classes/role';
import { SharedService } from '../../shared/services/shared.service';

import * as $ from 'jquery';
import 'datatables.net';
import 'datatables.net-bs4';

@Component({
    selector: 'app-users',
    templateUrl: './users.component.html',
    styleUrls: ['./users.component.scss'],
    animations: [routerTransition()]
})
export class UsersComponent implements OnInit {
    dtOptions: DataTables.Settings = {};

    users: any[];
    roles: any[];
    ftps: any[];
    engines: any[];

    dataTableUser: any;
    dataTableUserFtp: any;
    dataTableUserEngine: any;
    submitted = false;
    user: User;

    languageInUse: string = '';

    modalTitle: string;
    showAddEditUser: boolean = false;
    showEditUser: boolean = false;
    showChangePsw: boolean = false;

    newPswRequired: boolean = false;
    newPswMinlength: boolean = false;

    private modalRef: NgbModalRef;

    @ViewChild('content',{static: false}) private modalContentTempRef : TemplateRef<any>;

    constructor(
        private http: HttpClient,
        private chRef: ChangeDetectorRef,
        private modalService: NgbModal,
        private spinner: SpinnerService,
        private httpService: HttpService,
        private sharedService: SharedService,
        private formBuilder: FormBuilder,
        private toastr: ToastrService
    ) { 
        this.sharedService.showPassword = false;
    }

    ngOnInit() {
        this.user = new User();
        this.loadUsersData();
        // this.loadRolesData();

        this.dtOptions = {
            pagingType: 'full_numbers'
        };

        this.languageInUse = localStorage.getItem('languageInUse');
    }

    loadUsersData() {
        this.spinner.show();

        this.http.get('https://5bce1f21a0c99b001337a9e5.mockapi.io/users')
        // this.httpService.getCallHttp('/rest/admin/users')
            .subscribe((data: any) => {
                this.users = data;

                // You'll have to wait that changeDetection occurs and projects data into 
                // the HTML template, you can ask Angular to that for you ;-)
                this.chRef.detectChanges();

                // Now you can use jQuery DataTables
                //const table: any = $('#usersTable');
                //this.dataTable = table.DataTable();

                setTimeout(() => this.initDatatable(),0);
                this.spinner.hide();
            });
    }
    private initDatatable(): void {
        const table: any = $('#usersTable');
        this.dataTableUser = table.DataTable({
            language: {
                url: './assets/i18n/datatable/' + this.languageInUse + '.json'
            },
            "order": [[ 1, "asc" ]],
            "columnDefs": [
                { "targets": 0, "orderable": false },
                { "targets": 5, "orderable": false }
            ],
            stateSave: true,
            stateSaveCallback: function(settings,data) {
                localStorage.setItem( 'DataTables_' + settings.sInstance, JSON.stringify(data) );
            },
            stateLoadCallback: function(settings) {
                return JSON.parse( localStorage.getItem( 'DataTables_' + settings.sInstance ) );
            }
        });
    }
    private reInitDatatable(): void {
        if (this.dataTableUser) {
          this.dataTableUser.destroy();
          this.dataTableUser = null;
        }
    }
    setRole(role:Role/*idRole: number*/): void {
        //let role: Role = this.roles.filter(function(r) {
        //    return r.idRole === idRole;
        //})[0];
        this.user.roles[0] = role;
    }
    saveUser(userForm) {
        this.submitted = true;
        if(!userForm.form.valid) {
            return false;
        }
        this.spinner.show();

        let rawData = '{'+
            '   \"idUser":\"'+this.user.idUser+'\",'+
            '   \"username":\"'+this.user.username+'\",'+
            '   \"password":\"'+this.user.password+'\",'+
            '   \"name":\"'+this.user.name+'\",'+
            '   \"surname":\"'+this.user.surname+'\",'+
            '   \"email":\"'+this.user.email+'\",'+
            '   \"enabled":true,'+
            '   \"changePassword":false,'+
            '   \"roles":[  '+
            '      {  '+
            '          \"idRole\":'+this.user.roles[0].idRole+','+
            '          \"roleName\":\"'+this.user.roles[0].roleName+'\",'+
            '          \"roleStringKey\":\"'+this.user.roles[0].roleStringKey+'\"'+
            '       }'+
            '    ]'+
            ' }';

        this.httpService.postCallHttp('/rest/admin/users',rawData)
            .subscribe((data: any) => {
                this.spinner.hide();
                if(data && data.responseCode == '200') {
                    //Reset FORM
                this.submitted = false;
                userForm.resetForm();
                this.modalRef.close();

                this.reInitDatatable();
                this.loadUsersData();
                } else {
                    this.httpService.showErrorMessage(data,'Error');
                }
            });
    }

    delete(id) {
        this.sharedService.setConfirmVariables();

        this.httpService.deleteCallHttp('/rest/admin/users/',id)
        .subscribe((data: any) => {
            this.spinner.hide();
            if(data) {
                this.toastr.success(this.sharedService.deleteConfirm, this.sharedService.deleteTitle);
                this.reInitDatatable();
                this.loadUsersData();
            } else {
                this.toastr.error(this.sharedService.deleteErrorMessage, this.sharedService.deleteErrorTitle);
            }
        });
    }

    enableUser(user,enabled) {
        this.reInitDatatable();
        this.loadUsersData();

        // let title = '';
        // let message = '';
        // if(enabled == 'enable') {
        //     title = 'Abilita Utente';
        //     message = 'Sei sicuro di voler abilitare l\'utente?';
        // } else {
        //     title = 'Disabilita Utente';
        //     message = 'Sei sicuro di voler disabilitare l\'utente?';
        // }
        // this.httpService.getCallHttp('/rest/admin/users/enableDisable/'+user.idUser)
        //     .subscribe((data: any) => {
        //         this.reInitDatatable();
        //         this.loadUsersData();
        //     });
    }

    changePassword() {
        this.newPswRequired = false;
        this.newPswMinlength = false;

        if (this.user.password == '') {
            this.newPswRequired = true;
            return;
        } else if (this.user.password.length < 8) {
            this.newPswMinlength = true;
            return;
        } else {
            this.modalRef.close();
            this.spinner.show();

            let rawData = '{'+
                '   \"idUser":\"'+this.user.idUser+'\",'+
                '   \"username":\"'+this.user.username+'\",'+
                '   \"password":\"'+this.user.password+'\",'+
                '   \"name":\"'+this.user.name+'\",'+
                '   \"surname":\"'+this.user.surname+'\",'+
                '   \"email":\"'+this.user.email+'\",'+
                '   \"enabled":true,'+
                '   \"changePassword":false,'+
                '   \"roles":[  '+
                '      {  '+
                '          \"idRole\":'+this.user.roles[0].idRole+','+
                '          \"roleName\":\"'+this.user.roles[0].roleName+'\",'+
                '          \"roleStringKey\":\"'+this.user.roles[0].roleStringKey+'\"'+
                '       }'+
                '    ]'+
                ' }';

            this.httpService.postCallHttp('/rest/admin/users',rawData)
                .subscribe((data: any) => {
                    this.spinner.hide();
                    if(data && data.responseCode == '200') {
                        //Reset FORM
                        this.modalRef.close();
                        this.reInitDatatable();
                        this.loadUsersData();
                    } else {
                        this.httpService.showErrorMessage(data,'Error');
                    }
                });
        }
    }

    open(section,content,user) {
        this.user = user;
        this.showAddEditUser = false;
        this.showEditUser = false;
        this.showChangePsw = false;

        if(section == 'addUser' || section == 'editUser') {
            this.modalTitle = 'Add/Edit User';
            this.showAddEditUser = true;
            if(section == 'editUser') {
                this.showEditUser = true;
            }
        } else if(section == 'changePsw') {
            this.sharedService.showPassword = false;
            this.modalTitle = 'Password';
            this.showChangePsw = true;
        }
        this.modalRef = this.modalService.open(content, { size: 'lg', windowClass: 'modal-xlg' });
        this.modalRef.result.then((result) => {
            console.log(`Closed with: ${result}`);
        }, (reason) => {
            console.log(`Dismissed ${this.getDismissReason(reason)}`);
        });
    }

    private getDismissReason(reason: any) {
        if (reason === ModalDismissReasons.ESC) {
            console.log('by pressing ESC');
        } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
            console.log('by clicking on a backdrop');
        } else {
            console.log(`with: ${reason}`);
        }
    }
}
