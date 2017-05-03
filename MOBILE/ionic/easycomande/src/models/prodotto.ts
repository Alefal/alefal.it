export class Prodotto {
  public id: number;
  public title: string;
  public price: number;
  public description: string;
  public quantity: number; 

  constructor(
      id: number, 
      title: string, 
      price: number, 
      description: string, 
      quantity: number) {

    this.id = id;
    this.title = title;
    this.price = price;
    this.description = description;
    this.quantity = quantity;  
  }

  public getProdId(): string {
    return this.id+'';
  }
}