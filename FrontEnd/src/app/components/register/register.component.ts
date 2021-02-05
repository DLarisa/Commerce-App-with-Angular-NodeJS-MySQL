import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { MainService } from 'src/app/services/main.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css'],
})
export class RegisterComponent implements OnInit {
  public user: any = {};
  constructor(private mainService: MainService, private router: Router) {}

  ngOnInit(): void {}

  register() {
    console.log(this.user);
    const { name, email, password, confirm_password } = this.user;
    const data = {
      name,
      email,
      passwords: {
        password,
        confirm_password,
      },
    };

    this.mainService.register(data).subscribe((res) => {
      console.log(res);
      if (res && res.doc._id) {
        this.router.navigate(['/login']);
      }
    });
  }

  isValid() {
    const { name, email, password, confirm_password } = this.user;
    return !(name && email && password && confirm_password);
  }

  validateEmail(mail: string) {
    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail)) {
      return true;
    }
    return false;
  }
}
