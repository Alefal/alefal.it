export class Special {
  public id: number;
  public special: string;
  public price: number;
  public note: string;
  public state_id: number; 
  public statename: string;

  constructor(
      id: number,
      special: string,
      price: number,
      note: string,
      state_id: number,
      statename: string
  ) {

    this.id = id;
    this.special = special;
    this.price = price;
    this.note = note;  
    this.state_id = state_id;
    this.statename = statename;
  }

  public getProdId(): string {
    return this.id+'';
  }
}