import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule , Routes } from '@angular/router';
import { FormsModule,ReactiveFormsModule  } from '@angular/forms';


import { businessRoutes } from './business.routes';
import { CategoryComponent } from './category/category.component';
import { BrandComponent } from './brand/brand.component';
import { ProductComponent } from './product/product.component';

@NgModule({
    declarations:[
     CategoryComponent, BrandComponent, ProductComponent
    ],
    providers: [

    ],
    imports: [
        CommonModule,FormsModule,ReactiveFormsModule, RouterModule.forRoot(businessRoutes)
    ],
    exports:[

    ]
})

export class BusinessModule { }

