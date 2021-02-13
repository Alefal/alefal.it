/**
 * Component Presentation: stateless
 */
import { Component, Input, Output, EventEmitter } from '@angular/core';
import { User } from '../../../../shared/models/interfaces/user.interface';

import {
  AngularGridInstance,
  Column,
  FieldType,
  Filters,
  Formatter,
  Formatters,
  GridOption,
  SelectedRange,
  OnEventArgs
} from 'angular-slickgrid';

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

  // Slick Grid
  columnDefinitions: Column[];
  gridOptions: GridOption;
  dataset: any[];
  angularGrid: AngularGridInstance;
  resizerPaused = false;
  alertWarning: any;

  constructor() { }

  ngOnInit() {
    this.prepareGrid();
  }
  angularGridReady(angularGrid: AngularGridInstance) {
    this.angularGrid = angularGrid;
  }

  imageFormatter(row, cell, value, columnDef, dataContext) {
    // console.log('row', row);
    // console.log('cell', cell);
    // console.log('value', value);
    // console.log('columnDef', columnDef);
    // console.log('dataContext', dataContext);

    return '<img class="w-100 img-thumbnail" src="' + value + '" />';
  }

  // create a custom Formatter with the Formatter type
  myCustomFormatter: Formatter = (row: number, cell: number, value: any, columnDef: Column, dataContext: any, grid?: any) =>
    value ? `<i class="fa fa-fire" aria-hidden="true"></i>` : '<i class="fa fa-snowflake-o" aria-hidden="true" onClick="sayHi()"></i>';

  prepareGrid() {
    this.columnDefinitions = [
      // { id: 'id', name: '#', field: 'id', sortable: true },
      
      { id: 'enabled', name: '#', field: 'enabled', sortable: true, type: FieldType.boolean, formatter: Formatters.checkmark },
      {
        id: 'lastname',
        name: 'Lastname',
        field: 'lastname',
        sortable: true,
        type: FieldType.string,
        filterable: true,
        filter: { model: Filters.compoundInputText }
      },
      {
        id: 'firstname',
        name: 'Name',
        field: 'firstname',
        sortable: true,
        filterable: true
      },
      { id: "avatar", name: "Avatar", field: "avatar", sortable: false, width: 80, minWidth: 20, maxWidth: 80, formatter: this.imageFormatter },
      // tslint:disable-next-line: max-line-length
      { id: 'phone', name: 'Phone Number using mask', field: 'phone', sortable: true, type: FieldType.number, minWidth: 100, formatter: Formatters.mask, params: { mask: '(000) 000-0000' } },
      // tslint:disable-next-line: max-line-length
      { id: 'complete', name: '% Complete', field: 'percentComplete', formatter: Formatters.percentCompleteBar, type: FieldType.number, sortable: true },
      { id: 'company', name: 'Company', field: 'company', sortable: true },
      // tslint:disable-next-line: max-line-length
      {
        id: 'other',
        name: 'Other',
        field: 'other',
        formatter: this.myCustomFormatter
      },
      { id: 'createdAt', name: 'Created', field: 'createdAt', formatter: Formatters.dateIso, sortable: true, type: FieldType.date, minWidth: 90, exportWithFormatter: true },
      { id: 'role', name: 'Role', field: 'role' },
      { id: 'price', name: 'Price', field: 'price' },
      {
        id: 'edit',
        field: 'id',
        excludeFromColumnPicker: true,
        excludeFromGridMenu: true,
        excludeFromHeaderMenu: true,
        formatter: Formatters.editIcon,
        minWidth: 30,
        maxWidth: 30,
        // use onCellClick OR grid.onClick.subscribe which you can see down below
        onCellClick: (e: Event, args: OnEventArgs) => {
          this.userDetail(args.dataContext);
          this.alertWarning = `Editing: ${args.dataContext.title}`;
          this.angularGrid.gridService.highlightRow(args.row, 1500);
          this.angularGrid.gridService.setSelectedRow(args.row);
        }
      }, {
        id: 'delete',
        field: 'id',
        excludeFromColumnPicker: true,
        excludeFromGridMenu: true,
        excludeFromHeaderMenu: true,
        formatter: Formatters.deleteIcon,
        minWidth: 30,
        maxWidth: 30,
        onCellClick: (e: Event, args: OnEventArgs) => {
          this.userDelete(args.dataContext);
        }
      }
    ];
    this.gridOptions = {
      autoResize: {
        containerId: 'slickgrid-container',
        sidePadding: 15
      },
      enableExcelExport: true,
      enableExcelCopyBuffer: true,
      enableFiltering: true,
      enableAsyncPostRender: true,
      // enableFilterTrimWhiteSpace: true,
      // i18n: this.translate,

      // use columnDef searchTerms OR use presets as shown below
      presets: {
        filters: [
          { columnId: 'duration', searchTerms: [10, 98] },
          // { columnId: 'complete', searchTerms: ['5'], operator: '>' },
          { columnId: 'usDateShort', operator: '<', searchTerms: ['4/20/25'] },
          // { columnId: 'effort-driven', searchTerms: [true] },
        ],
        sorters: [
          { columnId: 'duration', direction: 'DESC' },
          { columnId: 'complete', direction: 'ASC' }
        ],
      }
    };
    // fill the dataset with your data
    this.dataset = [ /** ...your data... **/];
    this.dataset = this.usersCollection;
  }

  togglePauseResizer() {
    this.resizerPaused = !this.resizerPaused;
    this.angularGrid.resizerService.pauseResizer(this.resizerPaused);
  }

  userDetail(user: User) {
    console.log(user);
    
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
