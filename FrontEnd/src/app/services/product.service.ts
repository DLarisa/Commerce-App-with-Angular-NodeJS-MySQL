import { Injectable } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { environment } from '../../environments/environment';
import {ProductModelServer, ServerResponse} from "../models/product.model";
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ProductService {

  private SERVER_URL = environment.SERVER_URL;
  constructor(private http: HttpClient) { }

  /* GET -> Iau toate produsele din backEnd*/
  getAllProducts(numberOfResults = 999999): Observable<ServerResponse>
  {
    return this.http.get<ServerResponse>(this.SERVER_URL + 'products', {
      params: {
        limit: numberOfResults.toString()
      }
    });
  }

  /* GET -> Un singur produs din server */
  getSingleProduct(id: number): Observable<ProductModelServer>
  {
    return this.http.get<ProductModelServer>(this.SERVER_URL + 'products/' + id);
  }

  /* GET -> Produse din Categorie */
  getProductsFromCategory(catName: string): Observable<ProductModelServer[]> {
    return this.http.get<ProductModelServer[]>(this.SERVER_URL + 'products/category/' + catName)
  }


}
