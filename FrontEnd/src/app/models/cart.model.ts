import { ProductModelServer } from "./product.model";

// pt AngularApp -> Server
export interface CartModelServer {
  total: number;
  data: [{
    product: ProductModelServer,
    numInCart: number
  }];
}

// referință pt ce trimit clientului
export interface CartModelPublic {
  total: number;
  prodData: [{
    id: number,
    incart: number
  }];
}
