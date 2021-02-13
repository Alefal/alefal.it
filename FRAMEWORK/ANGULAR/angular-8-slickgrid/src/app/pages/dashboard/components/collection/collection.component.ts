import { Component, OnInit, Input, Output, EventEmitter, ViewChild } from '@angular/core';

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
import { TranslateService } from '@ngx-translate/core';
import { BsModalRef, ModalDirective, BsModalService } from 'ngx-bootstrap';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { SharedService } from '../../../../shared/services/shared.service';

const NB_ITEMS = 995;

declare var require: any;
const slickgrid: any = require('../../slickgrid.json');

@Component({
  selector: 'app-cards-collection',
  templateUrl: './collection.component.html',
  styleUrls: ['./collection.component.css']
})
export class CollectionComponent implements OnInit {

  @Input() cardsCollection: any[];
  @Input() errorsCollection: Error;

  // Slick Grid
  columnDefinitions: Column[];
  gridOptions: GridOption;
  dataset: any[];
  angularGrid: AngularGridInstance;
  resizerPaused = false;
  alertWarning: any;
  gridHeight: any;

  constructor(
    private translate: TranslateService, 
    private modalService: BsModalService,
    private sharedService: SharedService
  ) { }

  ngOnInit() {
    this.gridHeight = window.innerHeight - 375;
    this.prepareGrid();
  }

  angularGridReady(angularGrid: AngularGridInstance) {
    this.angularGrid = angularGrid;
  }

  prepareGrid() {
    this.columnDefinitions = [];
    for (let i = 0; i < slickgrid.columns.length; i++) {
      const col = slickgrid.columns[i];
      // ColumnDefinitions
      this.columnDefinitions.push(this.sharedService.configColumn(col));
    }
    // this.columnDefinitions = [
    //   // {
    //   //   id: 'completed', name: 'Completed', field: 'completed', type: FieldType.number, sortable: true, minWidth: 100,
    //   //   formatter: customEnableButtonFormatter,
    //   //   onCellClick: (e, args) => {
    //   //     this.toggleCompletedProperty(args && args.dataContext);
    //   //   }
    //   // },
    //   { 
    //     id: 'title', name: 'CIO', field: 'title', sortable: true,
    //     type: FieldType.string, filterable: true
    //   },
    //   { id: 'start', name: 'Data/Ora', field: 'start', formatter: Formatters.dateIso, sortable: true, filterable: true, type: FieldType.date, minWidth: 90, exportWithFormatter: true },
    //   { id: 'phone', name: 'Responsabile', field: 'phone', sortable: true, type: FieldType.number, minWidth: 100, formatter: Formatters.mask, params: { mask: '(000) 000-0000' } },
    //   { id: 'duration', name: 'Contraente', field: 'duration', sortable: true, filterable: true, exportWithFormatter: true },
    //   //{ id: 'complete', name: '% Complete', field: 'percentComplete', formatter: Formatters.percentCompleteBar, type: FieldType.number, sortable: true, minWidth: 100 },
    //   { id: 'percent2', name: '% Complete', field: 'percentComplete2', formatter: Formatters.progressBar, type: FieldType.number, sortable: true, filterable: true, minWidth: 100 },
    //   { id: 'duration', name: 'Controparte', field: 'duration', sortable: true, filterable: true, exportWithFormatter: true },
    //   { id: 'state', name: 'Stato OPC', field: 'state', sortable: true, exportWithFormatter: true, formatter: stateFormatter, },
    //   { id: 'duration', name: 'Competenza', field: 'duration', sortable: true, filterable: true, exportWithFormatter: true },
    //   { id: 'attachments', name: 'N. Allegati', field: 'attachments', sortable: true, exportWithFormatter: true },
    //   //{ id: 'effort-driven', name: 'Effort Driven', field: 'effortDriven', formatter: myCustomCheckmarkFormatter, type: FieldType.number, sortable: true, minWidth: 100 },
    // ];

    this.gridOptions = {
      enableAutoResize: true,
      autoResize: {
        containerId: 'slickgrid-container',
        sidePadding: 15
      },
      checkboxSelector: {
        // you can toggle these 2 properties to show the "select all" checkbox in different location
        hideInFilterHeaderRow: false,
        hideInColumnTitleRow: true
      },
      enableCellNavigation: true,
      enableFiltering: true,
      enableCheckboxSelector: true,
      enableRowSelection: true,

      enablePagination: true, // you could optionally disable the Pagination
      pagination: {
        pageSizes: [10, 15, 20, 25, 30, 40, 50, 75, 100],
        pageSize: 10,
        totalItems: 0
      },
      presets: {
        // you can also type operator as string, e.g.: operator: 'EQ'
        sorters: [
          // direction can be written as 'asc' (uppercase or lowercase) and/or use the SortDirection type
          { columnId: 'name', direction: 'asc' }
        ],
        pagination: { pageNumber: 1, pageSize: 20 }
      },

      showCustomFooter: true, // display some metrics in the bottom custom footer
      customFooterOptions: {
        // optionally display some text on the left footer container
        leftFooterText: 'custom footer text',
        hideTotalItemCount: true,
        hideLastUpdateTimestamp: true
      },

      // you customize all formatter at once certain options through "formatterOptions" in the Grid Options
      // or independently through the column definition "params", the option names are the same
      /*
      formatterOptions: {
        dateSeparator: '.',
        decimalSeparator: ',',
        displayNegativeNumberWithParentheses: true,
        minDecimal: 0,
        maxDecimal: 2,
        thousandSeparator: '_'
      },
      */

      exportOptions: {
        exportWithFormatter: true
      },

      // when using the ExcelCopyBuffer, you can see what the selection range is
      enableExcelCopyBuffer: true,
      excelCopyBufferOptions: {
        onCopyCells: (e, args: { ranges: SelectedRange[] }) => console.log('onCopyCells', args.ranges),
        onPasteCells: (e, args: { ranges: SelectedRange[] }) => console.log('onPasteCells', args.ranges),
        onCopyCancelled: (e, args: { ranges: SelectedRange[] }) => console.log('onCopyCancelled', args.ranges),
      }
    };

    // mock a dataset
    this.dataset = [];
    for (let i = 0; i < 500; i++) {
      const randomYear = 2000 + Math.floor(Math.random() * 10);
      const randomMonth = Math.floor(Math.random() * 11);
      const randomDay = Math.floor((Math.random() * 29));
      const randomPercent = Math.round(Math.random() * 100);

      this.dataset[i] = {
        id: i,
        title: 'INWIT-2020-' + i,
        phone: this.generateRandomText(),
        duration: this.generateRandomText(),
        state: this.randomState(),
        //duration: (i % 33 === 0) ? null : Math.random() * 100 + '',
        //percentComplete: randomPercent,
        percentComplete2: randomPercent,
        percentCompleteNumber: randomPercent,
        start: new Date(randomYear, randomMonth, randomDay),
        finish: new Date(randomYear, (randomMonth + 1), randomDay),
        effortDriven: (i % 5 === 0),
        attachments: Math.round(Math.random() * 10)
      };
    }
  }

  randomState() {
    const states = ['attribuire','autocc','autocm','autorizzata','bozza','chiusa','chiusanegativo','confermata','daautorizzare','invalutazione','negativo','nonautorizzato','positivo','verificata'];
    const randomState = states[Math.floor(Math.random() * states.length)];
    return randomState;
  }
  generateRandomText() {
    let r = Math.random().toString(36).substring(7);
    return r;
  }
  generatePhoneNumber(): string {
    let phone = '';
    for (let i = 0; i < 10; i++) {
      phone += Math.round(Math.random() * 9) + '';
    }
    return phone;
  }

  togglePauseResizer() {
    this.resizerPaused = !this.resizerPaused;
    this.angularGrid.resizerService.pauseResizer(this.resizerPaused);
  }

  toggleCompletedProperty(item) {
    // toggle property
    if (typeof item === 'object') {
      item.completed = !item.completed;

      // simulate a backend http call and refresh the grid row after delay
      setTimeout(() => {
        this.angularGrid.gridService.updateItemById(item.id, item, { highlightRow: false });
      }, 250);
    }
  }

  mockData(count: number) {
    // mock a dataset
    const mockDataset = [];
    for (let i = 0; i < count; i++) {
      const randomYear = 2000 + Math.floor(Math.random() * 10);
      const randomMonth = Math.floor(Math.random() * 11);
      const randomDay = Math.floor((Math.random() * 29));
      const state = '<span>?</span>';

      mockDataset[i] = {
        id: i,
        cio: 'INWIT-2019-' + i,
        date: `${randomMonth}/${randomDay}/${randomYear}`,
        owner: 'owner ' + i,
        state: state,
        import: Math.round(Math.random() * 100) + '',
        attachments: Math.round(Math.random() * 100)
      };
    }

    return mockDataset;
  }

  modalRefCreate: BsModalRef;
  @ViewChild('templateCreate', { static: false }) templateCreate: ModalDirective;
  config = {
    animated: true,
    backdrop: true,
    ignoreBackdropClick: true,
    keyboard: false,
    class: 'modal-lg'
  };

  openModalCreate() {
    this.modalRefCreate = this.modalService.show(this.templateCreate, this.config);
  }
}
