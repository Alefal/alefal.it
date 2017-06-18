export class Product {
  public id: number;
  public menu_id: number;   
  public quantity: number; 
  public total: number;
  public service: number;
  public note: string;
  public menuname: string;
  public statename: string;
  public price: number;                 
  public existExtra: boolean = false;   //Utile per capire se ad un prodotto è associato un extra
  public isExtra: boolean = false;      //Utile per individuare un prodotto EXTRA che è stato associato ad un altro prodotto
  public hasExtra: boolean = false;     //Utile per capire se ad un prodotto può essere associato un extra (PANINO)
  public order_id: number;   
  public state_id: number;   

  constructor(
      id: number,
      menu_id: number,
      quantity: number,
      total: number,
      service: number,
      note: string,
      menuname: string,
      statename: string,
      price: number,
      existExtra: boolean,
      isExtra: boolean,
      hasExtra: boolean,
      order_id: number,
      state_id: number
    ) {

    this.id         = id;
    this.menu_id    = menu_id;
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
    this.order_id   = order_id;
    this.state_id   = state_id;
  }

  public getProdId(): string {
    return this.id+'';
  }

  public setMeta(note) {
    this.note += note;
  }
  public setExtra(extra) {
    this.note += ' --- con extra \''+extra+'\' --- ';
  }
  public setExtraRif(extra) {
    this.note += ' --- Extra per \''+extra+'\' --- ';
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

  public setPriceServiceTotal(service:number) {
    this.service = service;
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