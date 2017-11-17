import { Injectable } from '@angular/core';
import { Http, Headers, RequestOptions, Response } from '@angular/http';
import { Observable } from 'rxjs/Rx';
import { Subject } from 'rxjs/Subject';


@Injectable()
export class SharedService {

     readonly BaseUrl: String = 'http://localhost/';

     // readonly BaseUrl: String = 'http://angular4demoapi.azurewebsites.net/';
     readonly ApiUrl: String = this.BaseUrl +'api/';
   
    ControllerName: String = '';
    
    constructor(private http: Http) { }

    FullUrl() 
    {
        return this.ApiUrl+''+this.ControllerName;
    }
    
    getContentTypeJsonReqOpt(): RequestOptions {
        let headers = new Headers();
        headers.append('Content-Type', 'application/json');
        let options = new RequestOptions({ headers: headers });
        return options;
    }

    getContentTypeJsonPReqOpt(): RequestOptions {
        let headers = new Headers();
        headers.append('Content-Type', 'application/jsonp');
        let options = new RequestOptions({ headers: headers });
        return options;
    }

    getContentTypeUrlReqOpt(): RequestOptions {
        let headers = new Headers();
        headers.append('Content-Type', 'application/x-www-form-urlencoded');
        let options = new RequestOptions({ headers: headers });
        return options;
    }

    getReqOptWithAccessToken() {
        let headers = new Headers();
        headers.append('Accept', 'application/json');
        headers.append('Content-Type', 'application/json');
        headers.append('Authorization', 'Bearer ' + localStorage.getItem('access_token'));
        let options = new RequestOptions({ headers: headers });
        return options;
    }

    
    private encodeParams(params: any): String {  
        
        let body: String = "";  
        // tslint:disable-next-line:forin
        for (let i in params) 
        {  
            if (body.length) {  
                body += "&";  
            }  
            body += i + "=";  
            body += encodeURIComponent(params[i]);  
        }
        return body;  
    } 
    
}