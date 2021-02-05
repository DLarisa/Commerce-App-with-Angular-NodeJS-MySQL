import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { BehaviorSubject, from, Observable, of } from 'rxjs';
import { environment } from 'src/environments/environment';
import { tap, catchError } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class MainService {
  private url: string = environment.url;

  constructor(private http: HttpClient) { }
  
  
  getHeaders() {
    return {
      headers: new HttpHeaders({
        'content-type': 'application/json',
      }),
      withCredentials: false,
    };
  }

  getPrivateHeaders() {
    return {
      headers: new HttpHeaders({
        'content-type': 'application/json',
        Authorization: 'Bearer ' + localStorage.getItem('token'),
      }),
      withCredentials: false,
    };
  }
  
  
  login(data: any): Observable<any> {
    return this.http
      .post(this.url + 'user/login', data, this.getHeaders())
      .pipe(
        tap((response) => {
          localStorage.setItem('token', response.token);
        })
      );
  }
  
  register(data: any): Observable<any> {
    return this.http
      .post(this.url + 'user/register', data, this.getHeaders())
      .pipe(
        tap((response) => console.log(response)),
        catchError(this.handleError('register'))
      );
  }
  
  private handleError<T>(result?: T) {
    return (error: any): Observable<T> => {
      if (error.status == 401) {
        console.log('NU MAI AI ACCES!');
      }
      return of(result as T);
    };
  }
  
  
}
