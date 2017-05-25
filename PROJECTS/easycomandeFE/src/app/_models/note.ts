export class Note {
  public id: number;
  public nota: string;
  public customer_note: boolean;    
  
  constructor(
    id: number,
    nota: string,
    customer_note: boolean
  ) {

    this.id                   = id;
    this.nota                 = nota;
    this.customer_note        = customer_note;
  }

  getOrderId(): string {
    return this.id+'';
  }
}