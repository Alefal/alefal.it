export class Order {
  
  public id: number;
  public date: string;
  public client: string;
  public covered: number;
  public totalorder: number;
  public totalservice: number;
  public state: string;
  public items: any;
  public specials: any;
  public notes: any; 

  constructor(
    id: number,
    date: string,
    client: string,
    covered: number,
    totalorder: number,
    totalservice: number,
    state: string,
    items: any,
    specials: any,
    notes: any
  ) {

    this.id             = id;
    this.date           = date;
    this.client         = client;
    this.covered        = covered;
    this.totalorder     = totalorder;
    this.totalservice   = totalservice;
    this.state          = state;
    this.items          = items;
    this.specials       = specials;
    this.notes          = notes;
  }

  getOrderId(): string {
    return this.id+'';
  }
}