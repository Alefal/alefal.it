export class Ordine {
  protected orderId: number;
  protected orderNumber: number;
  protected orderTotal: number;
  protected orderCustomer: string;  
  protected orderStatus: string;    
  
  constructor(
      orderId: number, 
      orderNumber: number, 
      orderTotal: number,
      orderCustomer: string,
      orderStatus: string) {

    this.orderId = orderId;
    this.orderNumber = orderNumber;
    this.orderTotal = orderTotal;  
    this.orderCustomer = orderCustomer;  
    this.orderStatus = orderStatus; 
  }

  getOrderId(): string {
    return this.orderId+'';
  }
}