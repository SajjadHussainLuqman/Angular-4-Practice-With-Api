import { Http, Response, Headers,RequestOptions } from '@angular/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/catch';
import 'rxjs/add/Observable/throw';

import { SharedService } from './shared.service';
import { AppError } from '../utilites/errorHandling/app-error';
import { NotFoundError } from '../utilites/errorHandling/not-found-error';
import { BadInput } from '../utilites/errorHandling/bad-input';

@Injectable()
export class LoginService
{
    

    constructor(private _http:Http,private _shared:SharedService){}

    Login(body: any)
    {
        return this._http.post(this._shared.domainUrl+'Token', body) 
                    .map(this.extractData)
                    .catch(this.handleError);
    }

    RegisterUser(_Id:Number)
    {
        return this._http.get(this._shared.ApiUrl.toString()+'/'+_Id)
                            .map(this.extractData)
                            .catch(this.handleError);
    }

    PasswordRecover(_resource: any) {
        return this._http.post(this._shared.ApiUrl.toString(), _resource, this._shared.getContentTypeJsonReqOpt())
                   .map(this.extractData)
                   .catch(this.handleError);
    }

    UpdateUser(_resource: any) {
        
        return this._http.put(this._shared.ApiUrl.toString(), _resource, this._shared.getContentTypeJsonReqOpt())
                    .map(this.extractData)
                    .catch(this.handleError);
    }

    DeleteUser(_Id: Number) {
  
        return this._http.delete(this._shared.ApiUrl.toString() + '/'+_Id)
                    .map(this.extractData)
                    .catch(this.handleError);
    }

    private extractData(res: Response) 
    {
        let body = res.json();
        return body || {};
    }
 
    handleError(error: Response | any) 
    {
        if(error.status===404)
        {
            return Observable.throw(new NotFoundError());  
        }
        if(error.status===400)
        {
            return Observable.throw(new BadInput(error.json())); 
        }
        return Observable.throw(new AppError(error));
    }
}