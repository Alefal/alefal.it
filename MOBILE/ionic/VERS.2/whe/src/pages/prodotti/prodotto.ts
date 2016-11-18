export class Prodotto {
  public prodId: number;
  public prodTitle: string;
  public prodPrice: number;
  public prodDescription: string;
  public prodManageStock: boolean;
  public prodQuantity: number;
  public prodAddQuantity: number;

  constructor(
      prodId: number, 
      prodTitle: string, 
      prodPrice: number, 
      prodDescription: string, 
      prodManageStock: boolean, 
      prodQuantity: number,
      prodAddQuantity: number) {

    this.prodId = prodId;
    this.prodTitle = prodTitle;
    this.prodPrice = prodPrice;
    this.prodDescription = prodDescription;
    this.prodManageStock = prodManageStock;
    this.prodQuantity = prodQuantity;
    this.prodAddQuantity = prodAddQuantity;  

  }

  public getProdId(): string {
    return this.prodId+'';
  }
}