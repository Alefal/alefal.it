export class Notification {
  public id: number;
  public client: string;
  public message: string;
  public state: string;
  public read: boolean = false;
  public order_id: number;
  
  constructor(
    id: number,
    client: string,
    message: string,
    state: string,
    read: boolean,
    order_id: number
  ) {

    this.id       = id;
    this.client   = client;
    this.message  = message;
    this.state    = state;
    this.read     = read;
    this.order_id = order_id;
  }
  
}