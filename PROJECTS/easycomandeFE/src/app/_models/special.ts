export class Special {
  public id: number;
  public special: string;
  public price: number;
  public note: string;

  constructor(
      id: number,
      special: string,
      price: number,
      note: string
  ) {

    this.id = id;
    this.special = special;
    this.price = price;
    this.note = note;  
  }

  public getProdId(): string {
    return this.id+'';
  }
}