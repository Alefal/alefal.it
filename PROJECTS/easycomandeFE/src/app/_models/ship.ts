export class Ship {
  public id: number;
  public method_id: string;
  public method_title: string;
  public total: number;

  constructor(
      id: number, 
      method_id: string,
      method_title: string, 
      total: number) {

    this.id = id;
    this.method_id = method_id;
    this.method_title = method_title;
    this.total = total;  
  }

  public getProdId(): string {
    return this.id+'';
  }
}