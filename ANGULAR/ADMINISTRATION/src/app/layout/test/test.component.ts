import { Component, OnInit, ViewChild, ViewEncapsulation, Input } from '@angular/core';
import { routerTransition } from '../../router.animations';
import { ToastrService } from 'ngx-toastr';

import { AppConfigService } from 'src/app/shared/services/appconfig.service';
import { HttpService } from 'src/app/shared/services/http.service';

import { GridOptions } from 'ag-grid-community';
import { TranslateService } from '@ngx-translate/core';

import * as $ from 'jquery';
import * as moment from 'moment';
declare var window: any;

import { 
  AngularGridInstance, Column, FieldType, Formatter, Formatters, GridOption, SelectedRange, 
  AutocompleteOption,
  Editors,
  EditorArgs,
  EditorValidator,
  Filters,
  FlatpickrOption,
  OnEventArgs,
  OperatorType,
  Sorters,
  GridStateChange,
  JQueryUiSliderOption,
  Metrics,
  MultipleSelectOption,
  GridOdataService,
  OdataOption
} from 'angular-slickgrid';

import { Subject } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { CustomInputEditor } from 'src/app/shared/modules/angular-slickgrid/custom-inputEditor';
import { CustomInputFilter } from 'src/app/shared/modules/angular-slickgrid/custom-inputFilter';
import { SwtCommonGridComponent } from 'src/app/shared/modules/angular-slickgrid/swt-common-grid.component';
import { SharedService } from 'src/app/shared/services/shared.service';

// using external non-typed js libraries
declare var Slick: any;

const URL_SAMPLE_COLLECTION_DATA = 'assets/data/collection_100_numbers.json';
const URL_COUNTRIES_COLLECTION = 'assets/data/countries.json';
const URL_COUNTRY_NAMES = 'assets/data/country_names.json';

// you can create custom validator to pass to an inline editor
const myCustomTitleValidator: EditorValidator = (value: any, args: EditorArgs) => {
  // you can get the Editor Args which can be helpful, e.g. we can get the Translate Service from it
  const grid = args && args.grid;
  const gridOptions = (grid && grid.getOptions) ? grid.getOptions() : {};
  const translate = gridOptions.i18n;

  // to get the editor object, you'll need to use "internalColumnEditor"
  // don't use "editor" property since that one is what SlickGrid uses internally by it's editor factory
  const columnEditor = args && args.column && args.column.internalColumnEditor;

  if (value == null || value === undefined || !value.length) {
    return { valid: false, msg: 'This is a required field' };
  } else if (!/^Task\s\d+$/.test(value)) {
    return { valid: false, msg: 'Your title is invalid, it must start with "Task" followed by a number' };
    // OR use the Translate Service with your custom message
    // return { valid: false, msg: translate.instant('YOUR_ERROR', { x: value }) };
  } else {
    return { valid: true, msg: '' };
  }
};

// create a custom Formatter to show the Task + value
const taskFormatter = (row, cell, value, columnDef, dataContext) => {
  if (value && Array.isArray(value)) {
    const taskValues = value.map((val) => `Task ${val}`);
    const values = taskValues.join(', ');
    return `<span title="${values}">${values}</span>`;
  }
  return '';
};

// create my custom Formatter with the Formatter type
const myCustomCheckmarkFormatter: Formatter = (row, cell, value, columnDef, dataContext) => {
  // you can return a string of a object (of type FormatterResultObject), the 2 types are shown below
  return value ? `<i class="fa fa-fire red" aria-hidden="true"></i>` : { text: '<i class="fa fa-snowflake-o" aria-hidden="true"></i>', addClasses: 'lightblue', toolTip: 'Freezing' };
};
const customEnableButtonFormatter: Formatter = (row: number, cell: number, value: any, columnDef: Column, dataContext: any, grid: any) => {
  return `<span style="margin-left: 5px">
     <button class="btn btn-xs btn-default">
       <i class="fa ${value ? 'fa-check-circle' : 'fa-circle-thin'} fa-lg" style="color: ${value ? 'black' : 'lavender'}"></i>
     </button>
   </span>`;
};

const NB_ITEMS = 1500;

function randomBetween(min: number, max: number): number {
  return Math.floor(Math.random() * (max - min + 1) + min);
}

// create a custom translate Formatter (typically you would move that a separate file, for separation of concerns)
const taskTranslateFormatter: Formatter = (row: number, cell: number, value: any, columnDef: any, dataContext: any, grid: any) => {
  const gridOptions = (grid && typeof grid.getOptions === 'function') ? grid.getOptions() : {};
  const translate = gridOptions.i18n;

  return translate.instant('TASK_X', { x: value });
};

@Component({
  selector: 'app-test',
  templateUrl: './test.component.html',
  styleUrls: ['./test.component.scss'],
  encapsulation : ViewEncapsulation.None,
  animations: [routerTransition()]
})
export class TestComponent implements OnInit {

  activityCollectionOnline: any = [];
  title = 'SlickGrid';
  subTitle = `
  Grid with SlickGrid
  `;

  private _commandQueue = [];
  angularGrid: AngularGridInstance;
  columnDefinitions: Column[];
  gridOptions: GridOption;
  dataset: any[];
  gridObj: any;
  isAutoEdit = true;
  alertWarning: any;
  updatedObject: any;
  selectedLanguage = 'en';
  duplicateTitleHeaderCount = 1;
  frozenColumnCount = 2;
  frozenRowCount = 3;
  isFrozenBottom = false;
  metrics: Metrics;

  constructor(
    private http: HttpClient,
    private toastr: ToastrService,
    public sharedService: SharedService,
    private httpService: HttpService,
    private translate: TranslateService
  ) { 
    const defaultLang = 'en';
    this.translate.use(defaultLang);
    this.selectedLanguage = defaultLang;
  }

  ngOnInit() {
    this.prepareGrid();
  }

  angularGridReady(angularGrid: AngularGridInstance) {
    this.angularGrid = angularGrid;
    this.gridObj = angularGrid.slickGrid;
  }

  prepareGrid() {
    this.columnDefinitions = [
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
          console.log(args);
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
        // use onCellClick OR grid.onClick.subscribe which you can see down below
        /*
        onCellClick: (e: Event, args: OnEventArgs) => {
          console.log(args);
          this.alertWarning = `Deleting: ${args.dataContext.title}`;
        }
        */
      }, {
        id: 'title', 
        name: 'Title', 
        field: 'id', 
        headerKey: 'TITLE', 
        minWidth: 100,
        formatter: taskTranslateFormatter,
        filterable: true,
        sortable: true,
        type: FieldType.string,
        editor: {
          model: Editors.longText,
          required: true,
          validator: myCustomTitleValidator, // use a custom validator
        },
        onCellChange: (e: Event, args: OnEventArgs) => {
          console.log(args);
          this.alertWarning = `Updated Title: ${args.dataContext.title}`;
        },
        params: { useFormatterOuputToFilter: true }
      }, {
        id: 'title2',
        name: 'Title, Custom Editor',
        field: 'title',
        minWidth: 70,
        filterable: true,
        sortable: true,
        type: FieldType.string,
        editor: {
          model: CustomInputEditor,
          placeholder: 'custom',
          validator: myCustomTitleValidator, // use a custom validator
        },
        filter: {
          model: CustomInputFilter,
          placeholder: '&#128269; custom',
        },
      }, {
        id: 'duration',
        name: 'Duration (days)',
        field: 'duration',
        minWidth: 100,
        filterable: true,
        sortable: true,
        formatter: Formatters.complexObject,
        type: FieldType.number,
        exportWithFormatter: true,
        filter: { model: Filters.slider, params: { hideSliderNumber: false } },
        editor: {
          model: Editors.slider,
          minValue: 0,
          maxValue: 100,
          // params: { hideSliderNumber: true },
        },
        /*
        editor: {
          // default is 0 decimals, if no decimals is passed it will accept 0 or more decimals
          // however if you pass the "decimalPlaces", it will validate with that maximum
          alwaysSaveOnEnterKey: true, // defaults to False, when set to true and user presses ENTER it will always call a Save even if value is empty
          model: Editors.float,
          placeholder: 'enter number',
          title: 'Your number must be bigger than 5', // add a custom title, to see it as a real tooltip you'll need to implement something like tipsy jquery lib
          minValue: 5,
          maxValue: 365,
          // the default validation error message is in English but you can override it by using "errorMessage"
          // errorMessage: this.i18n.tr('INVALID_FLOAT', { maxDecimal: 2 }),
          params: { decimalPlaces: 2 },
        },
        */
      }, 
      {
        id: 'complete', name: '% Complete', field: 'percentComplete', headerKey: 'PERCENT_COMPLETE', minWidth: 120,
        sortable: true,
        formatter: Formatters.progressBar,
        type: FieldType.number,
        filterable: true,
        filter: {
          model: Filters.sliderRange,
          maxValue: 100, // or you can use the filterOptions as well
          operator: OperatorType.rangeInclusive, // defaults to exclusive
          params: { hideSliderNumbers: false }, // you can hide/show the slider numbers on both side
          filterOptions: { min: 0, step: 5 } as JQueryUiSliderOption // you can also optionally pass any option of the jQuery UI Slider
        }
      },
      /*{
        id: 'complete',
        name: '% Complete',
        field: 'percentComplete',
        minWidth: 100,
        filterable: true,
        formatter: Formatters.multiple,
        type: FieldType.number,
        editor: {
          model: Editors.singleSelect,

          // We can also add HTML text to be rendered (any bad script will be sanitized) but we have to opt-in, else it will be sanitized
          enableRenderHtml: true,
          collection: Array.from(Array(101).keys()).map(k => ({ value: k, label: k, symbol: '<i class="fa fa-percent" style="color:cadetblue"></i>' })),
          customStructure: {
            value: 'value',
            label: 'label',
            labelSuffix: 'symbol'
          },

          // collection: Array.from(Array(101).keys()).map(k => ({ value: k, label: k, labelSuffix: '%' })),
          collectionSortBy: {
            property: 'label',
            sortDesc: true
          },
          collectionFilterBy: {
            property: 'value',
            value: 0,
            operator: OperatorType.notEqual
          },
          editorOptions: {
            maxHeight: 400
          }
        },
        params: {
          formatters: [Formatters.collectionEditor, Formatters.percentCompleteBar],
        }
      },*/ {
        id: 'start',
        name: 'Start',
        field: 'start',
        minWidth: 100,
        filterable: true,
        filter: { model: Filters.compoundDate },
        formatter: Formatters.multiple,
        params: {
          formatters: [Formatters.complexObject, Formatters.dateIso]
        },
        exportWithFormatter: true,
        sortable: true,
        type: FieldType.date,
        editor: {
          model: Editors.date
        },
      }, {
        id: 'finish',
        name: 'Finish',
        field: 'finish',
        minWidth: 100,
        filterable: true,
        sortable: true,
        filter: { model: Filters.compoundDate },
        formatter: Formatters.dateIso,
        exportWithFormatter: true,
        type: FieldType.date,
        editor: {
          model: Editors.date,
          // override any of the Flatpickr options through "editorOptions"
          // please note that there's no TSlint on this property since it's generic for any filter, so make sure you entered the correct filter option(s)
          editorOptions: { minDate: 'today' } as FlatpickrOption
        },
      }, {
        id: 'cityOfOrigin', name: 'City of Origin', field: 'cityOfOrigin',
        filterable: true,
        minWidth: 100,
        editor: {
          model: Editors.autoComplete,
          placeholder: '&#128269; search city',

          // We can use the autocomplete through 3 ways "collection", "collectionAsync" or with your own autocomplete options
          // use your own autocomplete options, instead of $.ajax, use http
          // here we use $.ajax just because I'm not sure how to configure http with JSONP and CORS
          editorOptions: {
            forceUserInput: true,
            minLength: 3,
            source: (request, response) => {
              $.ajax({
                url: 'http://gd.geobytes.com/AutoCompleteCity',
                dataType: 'jsonp',
                data: {
                  q: request.term
                },
                success: (data) => response(data)
              });
            }
          } as AutocompleteOption,
        },
        filter: {
          model: Filters.autoComplete,
          // placeholder: '&#128269; search city',

          // We can use the autocomplete through 3 ways "collection", "collectionAsync" or with your own autocomplete options
          // collectionAsync: this.http.get(URL_COUNTRIES_COLLECTION),

          // OR use your own autocomplete options, instead of $.ajax, use http
          // here we use $.ajax just because I'm not sure how to configure http with JSONP and CORS
          filterOptions: {
            minLength: 3,
            source: (request, response) => {
              $.ajax({
                url: 'http://gd.geobytes.com/AutoCompleteCity',
                dataType: 'jsonp',
                data: {
                  q: request.term
                },
                success: (data) => response(data)
              });
            }
          } as AutocompleteOption,
        }
      }, {
        id: 'countryOfOrigin', name: 'Country of Origin', field: 'countryOfOrigin',
        formatter: Formatters.complexObject,
        exportWithFormatter: true,
        dataKey: 'code',
        labelKey: 'name',
        type: FieldType.object,
        sorter: Sorters.objectString, // this sorter requires the dataKey and assume that obj1[dataKey] will be a string so it can sort it that way
        filterable: true,
        sortable: true,
        minWidth: 100,
        editor: {
          model: Editors.autoComplete,
          customStructure: { label: 'name', value: 'code' },
          collectionAsync: this.http.get(URL_COUNTRIES_COLLECTION),
        },
        filter: {
          model: Filters.autoComplete,
          customStructure: { label: 'name', value: 'code' },
          collectionAsync: this.http.get(URL_COUNTRIES_COLLECTION),
        }
      }, {
        id: 'countryOfOriginName', name: 'Country of Origin Name', field: 'countryOfOriginName',
        filterable: true,
        sortable: true,
        minWidth: 100,
        editor: {
          model: Editors.autoComplete,
          collectionAsync: this.http.get(URL_COUNTRY_NAMES),
        },
        filter: {
          model: Filters.autoComplete,
          collectionAsync: this.http.get(URL_COUNTRY_NAMES),
        }
      }, {
        id: 'effort-driven',
        name: 'Effort Driven',
        field: 'effortDriven',
        minWidth: 70,
        filterable: true,
        type: FieldType.boolean,
        filter: {
          model: Filters.singleSelect,
          collection: [{ value: '', label: '' }, { value: true, label: 'True' }, { value: false, label: 'False' }],
        },
        formatter: Formatters.checkmark,
        editor: {
          model: Editors.checkbox,
        },
      }, {
        id: 'prerequisites',
        name: 'Prerequisites',
        field: 'prerequisites',
        minWidth: 100,
        filterable: true,
        formatter: taskFormatter,
        sortable: true,
        type: FieldType.string,
        editor: {
          placeholder: 'choose option',
          collectionAsync: this.http.get<{ value: string; label: string; }[]>(URL_SAMPLE_COLLECTION_DATA),
          // OR a regular collection load
          // collection: Array.from(Array(100).keys()).map(k => ({ value: k, prefix: 'Task', label: k })),
          collectionSortBy: {
            property: 'label',
            sortDesc: true
          },
          customStructure: {
            label: 'label',
            value: 'value',
            labelPrefix: 'prefix',
          },
          collectionOptions: {
            separatorBetweenTextLabels: ' '
          },
          model: Editors.multipleSelect,
          required: true
        },
        filter: {
          collectionAsync: this.http.get<{ value: string; label: string; }[]>(URL_SAMPLE_COLLECTION_DATA),
          // OR a regular collection load
          // collection: Array.from(Array(100).keys()).map(k => ({ value: k, prefix: 'Task', label: k })),
          collectionSortBy: {
            property: 'label',
            sortDesc: true
          },
          customStructure: {
            label: 'label',
            value: 'value',
            labelPrefix: 'prefix',
          },
          collectionOptions: {
            separatorBetweenTextLabels: ' '
          },
          model: Filters.multipleSelect,
          operator: OperatorType.inContains,
        }
      }
    ];

    const presetLowestDay = moment().add(-2, 'days').format('YYYY-MM-DD');
    const presetHighestDay = moment().add(20, 'days').format('YYYY-MM-DD');

    this.gridOptions = {
      asyncEditorLoading: false,
      autoEdit: this.isAutoEdit,
      autoCommitEdit: false,
      autoResize: {
        containerId: 'demo-container',
        sidePadding: 15
      },
      alwaysShowVerticalScroll: false, // disable scroll since we don't want it to show on the left pinned columns
      editable: true,
      enableCellNavigation: true,
      enableColumnPicker: true,
      enableExcelCopyBuffer: true,
      enableFiltering: true,
      frozenColumn: this.frozenColumnCount,
      frozenRow: this.frozenRowCount,
      editCommandHandler: (item, column, editCommand) => {
        this._commandQueue.push(editCommand);
        editCommand.execute();
      },
      enableTranslate: true,
      i18n: this.translate,

      // use columnDef searchTerms OR use presets as shown below
      presets: {
        filters: [
          //  you can use the 2 dots separator on all Filters which support ranges
          { columnId: 'duration', searchTerms: ['4..88'] },
          // { columnId: 'complete', searchTerms: ['5..80'] }, // without operator will default to 'RangeExclusive'
          // { columnId: 'finish', operator: 'RangeInclusive', searchTerms: [`${presetLowestDay}..${presetHighestDay}`] },

          // or you could also use 2 searchTerms values, instead of using the 2 dots (only works with SliderRange & DateRange Filters)
          // BUT make sure to provide the operator, else the filter service won't know that this is really a range
          { columnId: 'complete', operator: 'RangeInclusive', searchTerms: [5, 80] }, // same result with searchTerms: ['5..80']
          { columnId: 'finish', operator: 'RangeInclusive', searchTerms: [presetLowestDay, presetHighestDay] },
        ],
        sorters: [
          { columnId: 'complete', direction: 'DESC' },
          { columnId: 'duration', direction: 'ASC' },
        ],
      }
    };

    this.dataset = this.mockData(NB_ITEMS);
  }

  /** Add a new row to the grid and refresh the Filter collection.
   * Note that because Filter elements are always displayed on the screen, we need to tell the Filter,
   * we do this via a Subject .next(), that it's collection got changed
   * as for the Editor, there's nothing to do since the element is not shown and it will have latest collection next time it shows up
   */
  addItem() {
    const lastRowIndex = this.dataset.length;
    const newRows = this.mockData(1, lastRowIndex);

    // wrap into a timer to simulate a backend async call
    setTimeout(() => {
      const requisiteColumnDef = this.columnDefinitions.find((column: Column) => column.id === 'prerequisites');
      if (requisiteColumnDef) {
        const filterCollectionAsync = requisiteColumnDef.filter.collectionAsync;
        const editorCollection = requisiteColumnDef.editor.collection;

        if (Array.isArray(editorCollection)) {
          // add the new row to the grid
          this.angularGrid.gridService.addItemToDatagrid(newRows[0]);

          // then refresh the Editor "collection", we have 2 ways of doing it

          // Push to the Editor "collection"
          editorCollection.push({ value: lastRowIndex, label: lastRowIndex, prefix: 'Task' });

          // or replace entire "collection"
          // durationColumnDef.editor.collection = [...collection, ...[{ value: lastRowIndex, label: lastRowIndex }]];

          // for the Filter only, we have a trigger an RxJS/Subject change with the new collection
          // we do this because Filter(s) are shown at all time, while on Editor it's unnecessary since they are only shown when opening them
          if (filterCollectionAsync instanceof Subject) {
            filterCollectionAsync.next(editorCollection);
          }
        }
      }
    }, 250);
  }

  /**
   * Delete last inserted row.
   * Note that because Filter elements are always displayed on the screen, we need to tell the Filter,
   * we do this via a Subject .next(), that it's collection got changed
   * as for the Editor, there's nothing to do since the element is not shown and it will have latest collection next time it shows up
   */
  deleteItem() {
    const requisiteColumnDef = this.columnDefinitions.find((column: Column) => column.id === 'prerequisites');
    if (requisiteColumnDef) {
      const filterCollectionAsync = requisiteColumnDef.filter.collectionAsync;
      const filterCollection = requisiteColumnDef.filter.collection;

      if (Array.isArray(filterCollection)) {
        // sort collection in descending order and take out last collection option
        const selectCollectionObj = this.sortCollectionDescending(filterCollection).pop();

        // then we will delete that item from the grid
        this.angularGrid.gridService.deleteDataGridItemById(selectCollectionObj.value);

        // for the Filter only, we have a trigger an RxJS/Subject change with the new collection
        // we do this because Filter(s) are shown at all time, while on Editor it's unnecessary since they are only shown when opening them
        if (filterCollectionAsync instanceof Subject) {
          filterCollectionAsync.next(filterCollection);
        }
      }
    }
  }

  sortCollectionDescending(collection) {
    return collection.sort((item1, item2) => item1.value - item2.value);
  }

  mockData(itemCount, startingIndex = 0) {
    // mock a dataset
    const tempDataset = [];
    for (let i = startingIndex; i < (startingIndex + itemCount); i++) {
      const randomYear = 2000 + Math.floor(Math.random() * 10);
      const randomFinishYear = (new Date().getFullYear() - 3) + Math.floor(Math.random() * 10); // use only years not lower than 3 years ago
      const randomMonth = Math.floor(Math.random() * 11);
      const randomDay = Math.floor((Math.random() * 29));
      const randomPercent = Math.round(Math.random() * 100);
      const randomFinish = new Date(randomFinishYear, (randomMonth + 1), randomDay);

      tempDataset.push({
        id: i,
        title: 'Task ' + i,
        duration: (i % 33 === 0) ? null : Math.round(Math.random() * 100) + '',
        start: new Date(randomYear, randomMonth, randomDay),
        percentComplete: randomPercent,
        percentCompleteNumber: randomPercent,
        finish: randomFinish < new Date() ? '' : randomFinish, // make sure the random date is earlier than today
        effortDriven: (i % 5 === 0),
        prerequisites: (i % 2 === 0) && i !== 0 && i < 12 ? [i, i - 1] : [],
        countryOfOrigin: (i % 2) ? { code: 'CA', name: 'Canada' } : { code: 'US', name: 'United States' },
        countryOfOriginName: (i % 2) ? 'Canada' : 'United States',
        cityOfOrigin: (i % 2) ? 'Vancouver, BC, Canada' : 'Boston, MA, United States',
      });
    }
    return tempDataset;
  }

  onCellChanged(e, args) {
    this.updatedObject = args.item;
  }

  onCellClicked(e, args) {
    const metadata = this.angularGrid.gridService.getColumnFromEventArguments(args);
    console.log(metadata);

    if (metadata.columnDef.id === 'edit') {
      this.alertWarning = `open a modal window to edit: ${metadata.dataContext.title}`;

      // highlight the row, to customize the color, you can change the SASS variable $row-highlight-background-color
      this.angularGrid.gridService.highlightRow(args.row, 1500);

      // you could also select the row, when using "enableCellNavigation: true", it automatically selects the row
      // this.angularGrid.gridService.setSelectedRow(args.row);
    } else if (metadata.columnDef.id === 'delete') {
      if (confirm('Are you sure?')) {
        this.angularGrid.gridService.deleteDataGridItemById(metadata.dataContext.id);
      }
    }
  }

  onCellValidation(e, args) {
    alert(args.validationResults.msg);
  }

  changeAutoCommit() {
    this.gridOptions.autoCommitEdit = !this.gridOptions.autoCommitEdit;
    this.gridObj.setOptions({
      autoCommitEdit: this.gridOptions.autoCommitEdit
    });
    return true;
  }

  dynamicallyAddTitleHeader() {
    const newCol = {
      id: `title${this.duplicateTitleHeaderCount++}`,
      name: 'Title',
      field: 'title',
      editor: {
        model: Editors.text,
        required: true,
        validator: myCustomTitleValidator, // use a custom validator
      },
      sortable: true, minWidth: 100, filterable: true, params: { useFormatterOuputToFilter: true }
    };
    this.columnDefinitions.push(newCol);
    this.columnDefinitions = this.columnDefinitions.slice();
  }

  setAutoEdit(isAutoEdit) {
    this.isAutoEdit = isAutoEdit;
    this.gridObj.setOptions({ autoEdit: isAutoEdit }); // change the grid option dynamically
    return true;
  }

  undo() {
    const command = this._commandQueue.pop();
    if (command && Slick.GlobalEditorLock.cancelCurrentEdit()) {
      command.undo();
      this.gridObj.gotoCell(command.row, command.cell, false);
    }
  }

  /** change dynamically, through slickgrid "setOptions()" the number of pinned columns */
  changeFrozenColumnCount() {
    if (this.gridObj && this.gridObj.setOptions) {
      this.gridObj.setOptions({
        frozenColumn: this.frozenColumnCount
      });
    }
  }

  /** change dynamically, through slickgrid "setOptions()" the number of pinned rows */
  changeFrozenRowCount() {
    if (this.gridObj && this.gridObj.setOptions) {
      this.gridObj.setOptions({
        frozenRow: this.frozenRowCount
      });
    }
  }

  /** toggle dynamically, through slickgrid "setOptions()" the top/bottom pinned location */
  toggleFrozenBottomRows() {
    if (this.gridObj && this.gridObj.setOptions) {
      this.gridObj.setOptions({
        frozenBottom: !this.isFrozenBottom
      });
      this.isFrozenBottom = !this.isFrozenBottom; // toggle the variable
    }
  }

  /** Dispatched event of a Grid State Changed event */
  gridStateChanged(gridState: GridStateChange) {
    console.log('Client sample, Grid State changed:: ', gridState);
  }

  /** Save current Filters, Sorters in LocaleStorage or DB */
  saveCurrentGridState(grid) {
    console.log('Client sample, last Grid State:: ', this.angularGrid.gridStateService.getCurrentGridState());
  }

  refreshMetrics(e, args) {
    if (args && args.current >= 0) {
      setTimeout(() => {
        this.metrics = {
          startTime: new Date(),
          itemCount: args && args.current || 0,
          totalItemCount: this.dataset.length || 0
        };
      });
    }
  }

  setFiltersDynamically() {
    const presetLowestDay = moment().add(-5, 'days').format('YYYY-MM-DD');
    const presetHighestDay = moment().add(25, 'days').format('YYYY-MM-DD');

    // we can Set Filters Dynamically (or different filters) afterward through the FilterService
    this.angularGrid.filterService.updateFilters([
      { columnId: 'duration', searchTerms: ['14..78'], operator: 'RangeInclusive' },
      { columnId: 'complete', operator: 'RangeExclusive', searchTerms: [12, 82] },
      { columnId: 'finish', operator: 'RangeInclusive', searchTerms: [presetLowestDay, presetHighestDay] },
    ]);
  }

  setSortingDynamically() {
    this.angularGrid.sortService.updateSorting([
      // orders matter, whichever is first in array will be the first sorted column
      { columnId: 'start', direction: 'DESC' },
      { columnId: 'complete', direction: 'ASC' },
    ]);
  }

  switchLanguage() {
    const nextLocale = (this.selectedLanguage === 'en') ? 'it' : 'en';
    this.translate.use(nextLocale).subscribe(() => this.selectedLanguage = nextLocale);
  }

  activities() {
    this.httpService.getCallHttp(this.sharedService.config.settings.apiServer.endPoint + '' + this.sharedService.config.settings.apiList.trace)
      .subscribe((res: any) => {
        if (res && res.hasOwnProperty("Value") && res.Value) {
          this.activityCollectionOnline = res;
          console.log('res', res);
        }
      }, err => {
        this.toastr.error('Error', 'Error');
      });
  }
}