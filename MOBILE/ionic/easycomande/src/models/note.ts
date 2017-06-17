export class Note {
  public id: number;
  public note: string;
  
  constructor(
    id: number,
    note: string
  ) {

    this.id     = id;
    this.note   = note;
  }

  getOrderId(): string {
    return this.id+'';
  }
}