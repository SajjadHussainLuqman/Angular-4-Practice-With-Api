import { Routes } from '@angular/router';


import { WebIndexComponent } from './web-index/index';
import { WebMasterComponent } from './web-master/index';
import {  ContactUsComponent } from './contact-us/index';
import { PageNotFoundComponent } from './page-not-found/index';

export const webRoutes:Routes=[
{ path:'', component: WebMasterComponent ,
    children: [
        { path:'', component:WebIndexComponent },
        { path:'ContactUs', component:ContactUsComponent },
    ]},
    { path:'', redirectTo: '/index.html',pathMatch: 'full' },
    { path:'**', component: PageNotFoundComponent }

];
