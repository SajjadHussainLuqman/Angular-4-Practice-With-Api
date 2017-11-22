import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule , Routes } from '@angular/router';
import { FormsModule,ReactiveFormsModule  } from '@angular/forms';


import { businessRoutes } from './business.routes';
import { CategoryComponent } from './category/category.component';
import { BrandComponent } from './brand/brand.component';
import { ProductComponent } from './product/product.component';
import { SalesOrderComponent } from './sales-order/sales-order.component';

import { MaterialModule } from '../../modules/material/material.module';
import { LoadingModule } from 'ngx-loading';

@NgModule({
    declarations:[
     CategoryComponent, BrandComponent, ProductComponent, SalesOrderComponent
    ],
    providers: [

    ],
    imports: [
        MaterialModule, CommonModule,FormsModule,ReactiveFormsModule, LoadingModule, RouterModule.forRoot(businessRoutes)
    ],
    exports:[

    ]
})

export class BusinessModule { }

