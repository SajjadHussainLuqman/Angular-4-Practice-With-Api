import { Injectable } from '@angular/core';
import { Router, CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';

@Injectable()
export class AuthGuard implements CanActivate {

    constructor(private router: Router) { }

    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot) {

        if (!localStorage.getItem('access_token') || !localStorage.getItem('expires_in')
        || +(new Date(localStorage.getItem('expires_in'))) <= +(new Date())) {
            this.router.navigate(['/Login'], { queryParams: { returnUrl: state.url }});
            return false;
        }
        else
        {
            return true;
        }
    }
}
