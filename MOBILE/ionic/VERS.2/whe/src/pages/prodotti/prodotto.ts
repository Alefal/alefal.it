export class Prodotto {
  protected prodId: number;
  protected prodTitle: string;
  protected prodPrice: number;
  protected prodDescription: string;
  protected prodManageStock: boolean;
  protected prodQuantity: number;
  protected prodAddQuantity: number;

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

  getProdId(): string {
    return this.prodId+'';
  }
}