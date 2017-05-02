export class Ordine {
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
  public note: any;    
  
  constructor(
    id: number,
    order_number: number,
    created_at: string,
    updated_at: string,
    completed_at: string,
    status: string,
    total: number,
    total_tax: number,
    total_line_items_quantity: number,
    line_items: any,
    customer: any,
    note: any
  ) {

    this.id                         = id;
    this.order_number               = order_number;
    this.created_at                 = created_at;
    this.updated_at                 = updated_at;
    this.completed_at               = completed_at;
    this.status                     = status;
    this.total                      = total;
    this.total_tax                  = total_tax;
    this.total_line_items_quantity  = total_line_items_quantity;
    this.line_items                 = line_items;
    this.customer                   = customer;
    this.note                       = note;
  }

  getOrderId(): string {
    return this.id+'';
  }
}