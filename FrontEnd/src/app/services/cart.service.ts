import { Injectable } from '@angular/core';
import { ProductService } from "./product.service";
import { BehaviorSubject } from "rxjs";
import { CartModelPublic, CartModelServer } from "../models/cart.model";
import { ProductModelServer } from "../models/product.model";
import { HttpClient } from "@angular/common/http";
import { environment } from "../../environments/environment";
import { NavigationExtras, Router } from "@angular/router";
import { OrderService } from "./order.service";
import { NgxSpinnerService } from "ngx-spinner";
import { ToastrService } from "ngx-toastr";

@Injectable({
  providedIn: 'root'
})


export class CartService {

  ServerURL = environment.SERVER_URL;

  // creez o var în care să rețin informațiile din coș -> să fie transmise prin localstorage
  private cartDataClient: CartModelPublic = {prodData: [{incart: 0, id: 0}], total: 0};
  // creez var în în care să rețin informațiile din coș -> în server
  private cartDataServer: CartModelServer = {
    data: [{
      product: undefined,
      numInCart: 0
    }],
    total: 0
  };


  // OBSERVABLES -> pt a da comanda
  cartTotal$ = new BehaviorSubject<Number>(0);
  cartDataObs$ = new BehaviorSubject<CartModelServer>(this.cartDataServer);


  constructor(private productService: ProductService,
              private orderService: OrderService,
              private httpClient: HttpClient,
              private router: Router,
              private spinner: NgxSpinnerService,
              private toast: ToastrService) {

    this.cartTotal$.next(this.cartDataServer.total);
    this.cartDataObs$.next(this.cartDataServer);


    // iau info (de tip CMP) din localstorage dacă găsesc
    let info: CartModelPublic = JSON.parse(localStorage.getItem('cart'));
    if (info !== null && info !== undefined && info.prodData[0].incart !== 0)
    {
      // pun fiecare obiect din coș în cartDataServer
      this.cartDataClient = info;

      this.cartDataClient.prodData.forEach(p => {
        this.productService.getSingleProduct(p.id).subscribe((actualProdInfo: ProductModelServer) => {
          if (this.cartDataServer.data[0].numInCart === 0)
          {
            this.cartDataServer.data[0].numInCart = p.incart;
            this.cartDataServer.data[0].product = actualProdInfo;
            this.CalculateTotal();
            this.cartDataClient.total = this.cartDataServer.total;
            localStorage.setItem('cart', JSON.stringify(this.cartDataClient));
          }
          else
            {
            this.cartDataServer.data.push({
              numInCart: p.incart,
              product: actualProdInfo
            });
            this.CalculateTotal();
            this.cartDataClient.total = this.cartDataServer.total;
            localStorage.setItem('cart', JSON.stringify(this.cartDataClient));
          }
          this.cartDataObs$.next({...this.cartDataServer});
        });
      });
    }
  }


  /* Adaug produse în coș */
  AddProductToCart(id: number, quantity?: number)
  {
    this.productService.getSingleProduct(id).subscribe(prod => {
      if(prod.quantity > 0)
      {
        // 1. Coș Gol
        if (this.cartDataServer.data[0].product === undefined) {
          this.cartDataServer.data[0].product = prod;
          this.cartDataServer.data[0].numInCart = quantity !== undefined ? quantity : 1;
          this.CalculateTotal();
          this.cartDataClient.prodData[0].incart = this.cartDataServer.data[0].numInCart;
          this.cartDataClient.prodData[0].id = prod.id;
          this.cartDataClient.total = this.cartDataServer.total;
          localStorage.setItem('cart', JSON.stringify(this.cartDataClient));
          this.cartDataObs$.next({...this.cartDataServer});

          this.toast.success(`${prod.name} added to the cart.`, "Product Added!", {
            timeOut: 3000,
            progressBar: true,
            progressAnimation: 'increasing',
            positionClass: 'toast-top-right',
            closeButton: true,
            newestOnTop: true
          })
        }
        // 2. Coșul are niște produse deja
        else {
          let index = this.cartDataServer.data.findIndex(p => p.product.id === prod.id); /// a. produsul e deja în coș => index e pozitiv

          /// a. produsul e deja în coș => index e pozitiv
          if (index !== -1) {
            if (quantity !== undefined && quantity <= prod.quantity)
              this.cartDataServer.data[index].numInCart = this.cartDataServer.data[index].numInCart < prod.quantity ? quantity : prod.quantity;
            else
              this.cartDataServer.data[index].numInCart < prod.quantity ? this.cartDataServer.data[index].numInCart++ : prod.quantity;


            this.cartDataClient.prodData[index].incart = this.cartDataServer.data[index].numInCart;
            this.toast.info(`${prod.name} quantity updated in the cart.`, "Product Updated!", {
              timeOut: 3000,
              progressBar: true,
              progressAnimation: 'increasing',
              positionClass: 'toast-top-right',
              closeButton: true,
              newestOnTop: true
            })
          }
          /// b. produsul nu e deja în coș
          else {
            this.cartDataServer.data.push({
              product: prod,
              numInCart: 1
            });

            this.cartDataClient.prodData.push({
              incart: 1,
              id: prod.id
            });

            this.toast.success(`${prod.name} added to the cart.`, "Product Added!", {
              timeOut: 3000,
              progressBar: true,
              progressAnimation: 'increasing',
              positionClass: 'toast-top-right',
              closeButton: true,
              newestOnTop: true
            })
          }

          this.CalculateTotal();
          this.cartDataClient.total = this.cartDataServer.total;
          localStorage.setItem('cart', JSON.stringify(this.cartDataClient));
          this.cartDataObs$.next({...this.cartDataServer});
        }
      }
    });
  }


  /* Update -> Produse din Coș */
  UpdateCartData(index, increase: Boolean)
  {
    let data = this.cartDataServer.data[index];
    if (increase)
    {
      data.numInCart < data.product.quantity ? data.numInCart++ : data.product.quantity;
      this.cartDataClient.prodData[index].incart = data.numInCart;
      this.CalculateTotal();
      this.cartDataClient.total = this.cartDataServer.total;
      this.cartDataObs$.next({...this.cartDataServer});
      localStorage.setItem('cart', JSON.stringify(this.cartDataClient));
    }
    else
    {
      data.numInCart--;

      if (data.numInCart < 1)
      {
        this.DeleteProductFromCart(index);
        this.cartDataObs$.next({...this.cartDataServer});
      }
      else
      {
        this.cartDataObs$.next({...this.cartDataServer});
        this.cartDataClient.prodData[index].incart = data.numInCart;
        this.CalculateTotal();
        this.cartDataClient.total = this.cartDataServer.total;
        localStorage.setItem('cart', JSON.stringify(this.cartDataClient));
      }
    }
  }


  /* DELETE -> Produs din Coș */
  DeleteProductFromCart(index)
  {
    // YES
    if (window.confirm('Are you sure you want to delete the item?'))
    {
      this.cartDataServer.data.splice(index, 1);
      this.cartDataClient.prodData.splice(index, 1);
      this.CalculateTotal();
      this.cartDataClient.total = this.cartDataServer.total;

      if (this.cartDataClient.total === 0)
      {
        this.cartDataClient = {prodData: [{incart: 0, id: 0}], total: 0};
        localStorage.setItem('cart', JSON.stringify(this.cartDataClient));
      }
      else localStorage.setItem('cart', JSON.stringify(this.cartDataClient));

      if (this.cartDataServer.total === 0)
      {
        this.cartDataServer = { data: [{ product: undefined, numInCart: 0 }], total: 0 };
        this.cartDataObs$.next({...this.cartDataServer});
      }
      else this.cartDataObs$.next({...this.cartDataServer});
    }
    else return;  // dacă avem cancel
  }

  CheckoutFromCart(userId: number)
  {
    this.httpClient.post(`${this.ServerURL}orders/payment`, null).subscribe((res: { success: Boolean }) => {
      console.clear();

      if (res.success)
      {
        this.resetServerData();
        this.httpClient.post(`${this.ServerURL}orders/new`, {
          userId: userId,
          products: this.cartDataClient.prodData
        }).subscribe((data: OrderConfirmationResponse) => {
          this.orderService.getSingleOrder(data.order_id).then(prods => {
            if (data.success)
            {
              const navigationExtras: NavigationExtras = {
                state: {
                  message: data.message,
                  products: prods,
                  orderId: data.order_id,
                  total: this.cartDataClient.total
                }
              };

              this.spinner.hide();
              this.router.navigate(['/thankyou'], navigationExtras).then(p => {
                this.cartDataClient = {prodData: [{incart: 0, id: 0}], total: 0};
                this.cartTotal$.next(0);
                localStorage.setItem('cart', JSON.stringify(this.cartDataClient));
              });
            }
          });
        })
      }
      else
      {
        this.spinner.hide();
        this.router.navigateByUrl('/checkout').then();
        this.toast.error(`Sorry, failed to finish the order!`, "CheckOut Server!", {
          timeOut: 3000,
          progressBar: true,
          progressAnimation: 'increasing',
          positionClass: 'toast-top-right',
          closeButton: true,
          newestOnTop: true
        });
      }
    });
  }


  /* Calculez total din Coș */
  private CalculateTotal()
  {
    let Total = 0;

    this.cartDataServer.data.forEach(p => {
      const {numInCart} = p;
      const {price} = p.product;

      Total += numInCart * price;
    });

    this.cartDataServer.total = Total;
    this.cartTotal$.next(this.cartDataServer.total);
  }

  private resetServerData()
  {
    this.cartDataServer = { data: [{ product: undefined, numInCart: 0 }], total: 0 };
    this.cartDataObs$.next({...this.cartDataServer});
  }


  CalculateSubTotal(index): number
  {
    let subTotal = 0;
    let p = this.cartDataServer.data[index];
    subTotal = p.product.price * p.numInCart;

    return subTotal;
  }



}

interface OrderConfirmationResponse {
  order_id: number;
  success: Boolean;
  message: String;
  products: [{
    id: String,
    numInCart: String
  }]
}



