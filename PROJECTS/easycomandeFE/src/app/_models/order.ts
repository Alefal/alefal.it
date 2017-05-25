export class Order {

  /*
  public id: number;
  public order_number: number;
  public created_at: string;
  public updated_at: string;
  public completed_at: string;
  public status: string;
  public total: number;
  public total_tax: number;
  public total_line_items_quantity: number;
  public line_items: any;
  public customer: any;
  public note: string;    
  public shipping_lines: any; 
  */
  
  public id: number;
  public order_number: number;
  public created_at: string;
  public updated_at: string;
  public completed_at: string;
  public status: string;
  public total: number;
  public subtotal: number;
  public total_line_items_quantity: number;
  public total_tax: number;
  public total_shipping: number;
  public cart_tax: number;
  public shipping_tax: number;
  public note: string; 
  public line_items: any;
  public shipping_lines: any;
  public tax_lines: any;
  

  constructor(
    id: number,
    order_number: number,
    created_at: string,
    updated_at: string,
    completed_at: string,
    status: string,
    total: number,
    subtotal: number,
    total_line_items_quantity: number,
    total_tax: number,
    total_shipping: number,
    cart_tax: number,
    shipping_tax: number,
    note: string,
    line_items: any,
    shipping_lines: any,
    tax_lines: any
  ) {

    this.id                         = id;
    this.order_number               = order_number;
    this.created_at                 = created_at;
    this.updated_at                 = updated_at;
    this.completed_at               = completed_at;
    this.status                     = status;
    this.total                      = total;
    this.subtotal                   = subtotal;
    this.total_line_items_quantity  = total_line_items_quantity;
    this.total_tax                  = total_tax;
    this.total_shipping             = total_shipping;
    this.cart_tax                   = cart_tax;
    this.shipping_tax               = shipping_tax;
    this.note                       = note; 
    this.line_items                 = line_items;
    this.shipping_lines             = shipping_lines;
    this.tax_lines                  = tax_lines;
  }

  getOrderId(): string {
    return this.id+'';
  }
}