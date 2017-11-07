import { Http } from '@angular/http';
import { Injectable } from '@angular/core';
import { SharedService } from './shared.service';
import { DataService } from './data.service';


@Injectable()
export class CategoryService extends DataService
{
    constructor(_http:Http, _shared:SharedService){
        _shared.ControllerName='category';
        super(_http,_shared);
    }
}