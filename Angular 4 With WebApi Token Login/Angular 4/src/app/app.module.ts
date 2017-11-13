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

import { CategoryService } from './services/category.service';
import { SalesOrderService } from './services/saleOrder.service';
import { DataService } from './services/data.service';
import { SharedService } from './services/shared.service';
import { LoginService } from './services/login.service';
import { AuthGuard } from './security/auth.guard';

import { AppErrorHandler } from './utilites/errorHandling/app-error-handler';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,HttpModule,DashboardModule, WebModule,FormsModule,ReactiveFormsModule,
    RouterModule.forRoot(routes, {useHash: true})
  ],
  providers: [
    CategoryService,
    SalesOrderService,
    DataService,
    SharedService,
    AuthGuard , 
    LoginService ,
    {provide: ErrorHandler, useClass: AppErrorHandler},
    {provide: LocationStrategy, useClass: HashLocationStrategy}],
  bootstrap: [AppComponent]
})
export class AppModule { }
