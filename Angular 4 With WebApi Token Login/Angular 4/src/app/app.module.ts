import { BrowserModule } from '@angular/platform-browser';
import { NgModule, ErrorHandler } from '@angular/core';
import { RouterModule,Routes } from '@angular/router';
import { FormsModule,ReactiveFormsModule  } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { HashLocationStrategy, LocationStrategy } from '@angular/common';


import { DashboardModule } from './admin/index';
import { WebModule } from './website/index';

import { AppComponent } from './app.component';

import { routes } from './app.routes';

import { CategoryService,BrandService,ProductService,SalesOrderService, DataService, SharedService, LoginService } from './services/index';


import { AuthGuard } from './security/auth.guard';

import { AppErrorHandler } from './utilites/errorHandling/app-error-handler';

import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,HttpModule,DashboardModule, WebModule,FormsModule,
    ReactiveFormsModule, BrowserAnimationsModule,
    RouterModule.forRoot(routes, {useHash: true})
  ],
  providers: [
    CategoryService,
    SalesOrderService,
    DataService,
    SharedService,
    AuthGuard , 
    LoginService ,
    BrandService,
    ProductService,
    {provide: ErrorHandler, useClass: AppErrorHandler},
    {provide: LocationStrategy, useClass: HashLocationStrategy}],
  bootstrap: [AppComponent]
})
export class AppModule { }
