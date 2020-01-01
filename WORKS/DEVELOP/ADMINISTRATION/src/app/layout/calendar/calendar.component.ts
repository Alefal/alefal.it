import { Component, ViewChild, OnInit, TemplateRef } from '@angular/core';
import { FullCalendarComponent } from '@fullcalendar/angular';
import { EventInput, OptionsInput } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGrigPlugin from '@fullcalendar/timegrid';
import interactionPlugin from '@fullcalendar/interaction'; // for dateClick
import { TooltipModule, BsModalRef, BsModalService } from 'ngx-bootstrap';

import * as $ from 'jquery';
import { ToastrService } from 'ngx-toastr';
declare var window: any;

@Component({
  selector: 'app-calendar',
  templateUrl: './calendar.component.html',
  styleUrls: ['./calendar.component.scss']
})
export class CalendarComponent implements OnInit {
  // calendarPlugins = [dayGridPlugin]; // important!

  options: OptionsInput;
  eventSources: EventInput[] = [
    {
      events: [ // put the array in the `events` property
        {
          title  : 'event1',
          start  : '2019-12-01'
        },
        {
          title  : 'event2',
          start  : '2019-12-05',
          end    : '2019-12-07'
        },
        {
          title  : 'event3',
          start  : '2019-12-09T12:30:00',
        }
      ],
      color: 'black',     // an option!
      textColor: 'yellow' // an option!
    }
  ]

  eventsModel: EventInput[] = [
    {
      title: 'All Day Event',
      description: 'description for All Day Event',
      start: '2019-12-01'
    },
    {
      title: 'Long Event',
      description: 'description for Long Event',
      start: '2019-12-07',
      end: '2019-12-10'
    },
    {
      groupId: '999',
      title: 'Repeating Event',
      description: 'description for Repeating Event',
      start: '2019-12-09T16:00:00'
    },
    {
      groupId: '999',
      title: 'Repeating Event',
      description: 'description for Repeating Event',
      start: '2019-12-16T16:00:00'
    },
    {
      title: 'Conference',
      description: 'description for Conference',
      start: '2019-12-11',
      end: '2019-12-13'
    },
    {
      title: 'Meeting',
      description: 'description for Meeting',
      start: '2019-12-12T10:30:00',
      end: '2019-12-12T12:30:00'
    },
    {
      title: 'Lunch',
      description: 'description for Lunch',
      start: '2019-12-12T12:00:00'
    },
    {
      title: 'Meeting',
      description: 'description for Meeting',
      start: '2019-12-12T14:30:00'
    },
    {
      title: 'Birthday Party',
      description: 'description for Birthday Party',
      start: '2019-12-13T07:00:00'
    },
    {
      title: 'Click for Google',
      description: 'description for Click for Google',
      url: 'http://google.com/',
      start: '2019-12-28'
    }
  ];
  @ViewChild('fullcalendar', {static: false}) fullcalendar: FullCalendarComponent;
  @ViewChild('pop', {static: false}) pop: any;
  @ViewChild('template', {static: false}) template: TemplateRef<any>;

  modalRef: BsModalRef;
  constructor(private modalService: BsModalService, private toastr: ToastrService) {}

  ngOnInit() {
    this.options = {
      editable: true,
      customButtons: {
        myCustomButton: {
          text: 'custom!',
          click: function () {
            alert('clicked the custom button!');
          }
        }
      },
      header: {
        left: 'prev,next today myCustomButton',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
      },
      plugins: [dayGridPlugin, timeGrigPlugin, interactionPlugin]
    };
  }
  eventClick(element) {
    let mySelf = this;
    // One Click
    mySelf.toastr.success(element.event._def.title + '\n' + element.event._def.extendedProps.description, 'Event');
    // Double Click
    mySelf.openModal(this.template,element);
  }
  openModal(template: TemplateRef<any>,model) {
    this.modalRef = this.modalService.show(template);
    console.log(model);
  }
  eventRender(element) {
    console.log(element.event.extendedProps);
    $(element.el).attr('title',element.event.extendedProps.description);

    // var tooltip = new Tooltip(info.el, {
    //   title: info.event.extendedProps.description,
    //   placement: 'top',
    //   trigger: 'hover',
    //   container: 'body'
    // });
  }
  eventDragStop(element) {
    console.log(element);
  }
  dateClick(element) {
    this.openModal(this.template,element);
  }

  eventDoubleClick(element) {
    console.log(element);
  }

  updateHeader() {
    this.options.header = {
      left: 'prev,next myCustomButton',
      center: 'title',
      right: ''
    };
  }
  updateEvents() {
    this.eventsModel = [{
      title: 'Updaten Event',
      start: this.yearMonth + '-08',
      end: this.yearMonth + '-10'
    }];
  }
  get yearMonth(): string {
    const dateObj = new Date();
    return dateObj.getUTCFullYear() + '-' + (dateObj.getUTCMonth() + 1);
  }













  @ViewChild('calendarAngular', {static: false}) calendarComponent: FullCalendarComponent; // the #calendar in the template

  calendarVisible = true;
  calendarPlugins = [dayGridPlugin, timeGrigPlugin, interactionPlugin];
  calendarWeekends = true;
  calendarEvents: EventInput[] = [
    { 
      title: 'Event Now', 
      start: new Date(),
      editable: true,
      peluche: 'Mimmo'
    }
  ];

  // customButtons: {
  //   filter: {
  //     text: 'Add Event'
  //   }
  // }

    customButtons: {
      myCustomButton: {
        text: 'custom!',
      }
    }

  toggleVisible() {
    this.calendarVisible = !this.calendarVisible;
  }

  toggleWeekends() {
    this.calendarWeekends = !this.calendarWeekends;
  }

  gotoPast() {
    let calendarApi = this.calendarComponent.getApi();
    calendarApi.gotoDate('2000-01-01'); // call a method on the Calendar object
  }

  handleDateClick(arg) {
    if (confirm('Would you like to add an event to ' + arg.dateStr + ' ?')) {
      this.calendarEvents = this.calendarEvents.concat({ // add new event data. must create new array
        title: 'New Event',
        start: arg.date,
        allDay: arg.allDay
      })
    }
  }

  addEvent(arg) {
    if (confirm('Would you like to add an event to ' + arg.dateStr + ' ?')) {
      this.calendarEvents = this.calendarEvents.concat({ // add new event data. must create new array
        title: 'New Event',
        start: arg.date,
        allDay: arg.allDay
      })
    }
  }

}
