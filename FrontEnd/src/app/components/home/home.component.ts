import { Component, OnInit } from '@angular/core';
import { ProductService } from 'src/app/services/product.service';
import { Router } from "@angular/router";
import { ProductModelServer, ServerResponse } from 'src/app/models/product.model';
import { CartService } from "../../services/cart.service";

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  products: ProductModelServer[] = [];

  constructor(private productService: ProductService,
              private router: Router,
              private cartService: CartService) { }

  ngOnInit(): void {
    this.productService.getAllProducts().subscribe((prods: ServerResponse) => {
      console.log(prods);
      this.products = prods.products;
    });
  }

  selectProduct(id: Number) {
    this.router.navigate(['product', id]).then();
  }

  AddToCart(id: number)
  {
    this.cartService.AddProductToCart(id);
  }

}
