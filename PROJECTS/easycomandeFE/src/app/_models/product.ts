export class Product {
  public id: number;
  public quantity: number; 
  public total: number;
  public service: number;
  public note: string;
  public menuname: string;
  public statename: string;
  public price: number;                 //TODO
  public existExtra: boolean = false;   //Utile per capire se ad un prodotto è associato un extra
  public isExtra: boolean = false;      //Utile per individuare un prodotto EXTRA che è stato associato ad un altro prodotto
  public hasExtra: boolean = false;     //Utile per capire se ad un prodotto può essere associato un extra (PANINO)

  constructor(
      id: number,
      quantity: number,
      total: number,
      service: number,
      note: string,
      menuname: string,
      statename: string,
      price: number,
      existExtra: boolean,
      isExtra: boolean,
      hasExtra: boolean
    ) {

    this.id         = id;
    this.quantity   = quantity;
    this.total      = total;
    this.service    = service;
    this.note       = note;
    this.menuname   = menuname;
    this.statename  = statename;
    this.price      = price;
    this.existExtra = existExtra;
    this.isExtra    = isExtra;
    this.hasExtra   = hasExtra;
  }

  public getProdId(): string {
    return this.id+'';
  }

  public setMeta(note) {
    this.note = note;
  }
  public setExtra(extra) {
    this.note += ' - Extra: '+extra+' - ';
  }

  public removeMeta(note) {
    this.note = note;
  }

  public setQuantity(quantity:number) {
    this.quantity = quantity;
  }

  public setPriceTotal(total:number) {
    this.total = total;
  }

  public setExistExtra(existExtra:boolean) {
    this.existExtra = existExtra;
  }
  public setIsExtra(isExtra:boolean) {
    this.isExtra = isExtra;
  }
  public setHasExtra(hasExtra:boolean) {
    this.hasExtra = hasExtra;
  }
}