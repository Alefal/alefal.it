export class Prodotto {
  public id: number;
  public product_id: number;
  public title: string;
  public price: number;
  public description: string;
  public quantity: number; 
  public meta: string = '';

  constructor(
      id: number, 
      product_id: number,
      title: string, 
      price: number, 
      description: string, 
      quantity: number,
      meta: string) {

    this.id = id;
    this.product_id = product_id;
    this.title = title;
    this.price = price;
    this.description = description;
    this.quantity = quantity;  
    this.meta = meta;
  }

  public getProdId(): string {
    return this.id+'';
  }

  public setMeta(meta) {
    this.meta = meta;
  }
}