import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule  } from '@angular/router';
import { FormsModule,ReactiveFormsModule  } from '@angular/forms';

import { WebIndexComponent } from './web-index/index';
import { WebMasterComponent } from './web-master/index';
import {  ContactUsComponent } from './contact-us/index';

import { webRoutes } from './web.routes';
import { PageNotFoundComponent } from './page-not-found/index';

@NgModule({
    declarations:[
        WebMasterComponent ,  WebIndexComponent, ContactUsComponent, PageNotFoundComponent
    ],
    imports:[
        CommonModule,FormsModule,ReactiveFormsModule ,RouterModule.forRoot(webRoutes)
    ],
    providers: [

    ]
})

export class WebModule {

}