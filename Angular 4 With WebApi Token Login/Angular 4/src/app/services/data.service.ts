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
export class DataService
{
    FullUrl: String = '';

    constructor(private _http:Http,private _shared:SharedService){ 
        this.FullUrl=_shared.FullUrl();
    }

    Get()
    {
        return this._http.get(this.FullUrl.toString())
                            .map(this.extractData)
                            .catch(this.handleError);
    }

    GetById(_Id:Number)
    {
        return this._http.get(this.FullUrl.toString()+'/'+_Id)
                            .map(this.extractData)
                            .catch(this.handleError);
    }

    Add(_resource: any) {
        debugger;
        return this._http.post(this.FullUrl.toString(), _resource, this._shared.getContentTypeJsonReqOpt())
                   .map(this.extractData)
                   .catch(this.handleError);
    }

    Update(_resource: any) {
        
        return this._http.put(this.FullUrl.toString(), _resource, this._shared.getContentTypeJsonReqOpt())
                    .map(this.extractData)
                    .catch(this.handleError);
    }

    Delete(_Id: Number) {
  
        return this._http.delete(this.FullUrl.toString() + '/'+_Id)
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
            return Observable.throw(new NotFoundError());  // Not unexpected Error so no need to save in server side
        }
        if(error.status===400)
        {
            return Observable.throw(new BadInput(error.json()));  // Not unexpected Error so no need to save in server side
        }
        return Observable.throw(new AppError(error));
    }
}