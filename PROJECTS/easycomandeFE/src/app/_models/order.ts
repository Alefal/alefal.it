export class Order {
  
  public id: number;
  public date: string;
  public client: string;
  public totalorder: number;
  public totalservice: number;
  public state: string;
  public items: any;
  public specials: any;
  public notes: any; 
  /*
  public total_line_items_quantity: number;
  public total_tax: number;
  public total_shipping: number;
  public cart_tax: number;
  public shipping_tax: number;
  public tax_lines: any;
  */

  constructor(
    id: number,
    date: string,
    client: string,
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