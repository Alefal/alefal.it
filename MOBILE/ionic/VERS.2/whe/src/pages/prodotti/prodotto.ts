export class Prodotto {
  public prodId: number;
  public prodTitle: string;
  public prodPrice: number;
  public prodDescription: string;
  public prodManageStock: boolean;
  public prodQuantity: number;
  public prodAddQuantity: number;
  public prodCatId: number;
  public prodCatName: string;  

  constructor(
      prodId: number, 
      prodTitle: string, 
      prodPrice: number, 
      prodDescription: string, 
      prodManageStock: boolean, 
      prodQuantity: number,
      prodAddQuantity: number,
      prodCatId: number,
      prodCatName: string) {

    this.prodId = prodId;
    this.prodTitle = prodTitle;
    this.prodPrice = prodPrice;
    this.prodDescription = prodDescription;
    this.prodManageStock = prodManageStock;
    this.prodQuantity = prodQuantity;
    this.prodAddQuantity = prodAddQuantity;
    this.prodCatId = prodCatId;  
    this.prodCatName = prodCatName;  
  }

  public getProdId(): string {
    return this.prodId+'';
  }
}