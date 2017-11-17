import { Http } from '@angular/http';
import { Injectable } from '@angular/core';
import { SharedService } from './shared.service';
import { DataService } from './data.service';


@Injectable()
export class ProductService extends DataService
{
    constructor(_http:Http, _shared:SharedService){
        _shared.ControllerName='product';
        super(_http,_shared);
    }
}