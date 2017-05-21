export class Prodotto {
  public id: number;
  public product_id: number;
  public title: string;
  public price: number;
  public existExtra: boolean = false;
  public isExtra: boolean = false;
  public priceTotal: number;
  public description: string;
  public quantity: number; 
  public meta: string = '';

  constructor(
      id: number, 
      product_id: number,
      title: string, 
      price: number, 
      existExtra: boolean, 
      isExtra: boolean, 
      priceTotal: number, 
      description: string, 
      quantity: number,
      meta: string) {

    this.id = id;
    this.product_id = product_id;
    this.title = title;
    this.price = price;
    this.existExtra = existExtra;
    this.isExtra = isExtra;
    this.priceTotal = priceTotal;    
    this.description = description;
    this.quantity = quantity;
    this.meta = meta;
  }

  public getProdId(): string {
    return this.id+'';
  }

  public setMeta(meta) {
    this.meta += meta;
  }
  public setExtra(extra) {
    this.meta += ' - Extra: '+extra+' - ';
  }

  public removeMeta(meta) {
    this.meta = meta;
  }

  public setQuantity(quantity:number) {
    this.quantity = quantity;
  }

  public setPriceTotal(priceTotal:number) {
    this.priceTotal = priceTotal;
  }

  public setExistExtra(existExtra:boolean) {
    this.existExtra = existExtra;
  }

  public setIsExtra(isExtra:boolean) {
    this.isExtra = isExtra;
  }
}