import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { LoginService } from '../../services/login.service';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})

export class LoginComponent implements OnInit {

  invalidLogin: boolean;
  returnUrl: string;

  Message: string;
  loading: Boolean;
  CanLogin: Boolean;
  

  constructor(private _router: Router
    , private _activatedRoute: ActivatedRoute
    , private _loginService: LoginService) {
  }


  ngOnInit() {
    this.logout();
    this.returnUrl = this._activatedRoute.snapshot.queryParams['returnUrl'] || 'Admin';
  }


  signIn(anyValue: any) {
    this.Message = "";
    this.loading = true;
    this._loginService.Login(this.getLoginBody(anyValue.email, anyValue.password).toString()).subscribe(
      response => {

        localStorage.setItem('access_token', response.access_token);
        localStorage.setItem('expires_in', response.expires_in);
        localStorage.setItem('token_type', response.token_type);
        localStorage.setItem('userName', response.userName);

        this.Message = "";
        this._router.navigate(['Admin']);
        this.loading = false;
      },
      error => {

        this.Message = 'Username or password is incorrect';
        this.loading = false;
        console.log(error);
      }
    );

  }

  logout() {
    localStorage.clear();
  }

  isAuthUser() {
    if (!localStorage.getItem('access_token') || !localStorage.getItem('expires')
      || +(new Date(localStorage.getItem('expires'))) <= +(new Date())) {
      return false;
    } else {
      return true;
    }
  }

  getLoginBody(userName: string, password: string): string {
    let loginBody: string = "username=" + userName + "&password=" + password + "&grant_type=password";
    return loginBody;
  }

}
