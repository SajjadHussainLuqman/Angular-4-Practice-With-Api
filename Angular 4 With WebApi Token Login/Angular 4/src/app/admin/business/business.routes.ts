
import {  Routes } from '@angular/router';

import { CategoryComponent } from './category/category.component';
import { BrandComponent } from './brand/brand.component';
import { ProductComponent } from './product/product.component';
import { SalesOrderComponent } from './sales-order/sales-order.component';

export const businessRoutes: Routes = [

{ path: 'Category', component: CategoryComponent },
{ path: 'Brand', component: BrandComponent },
{ path: 'Product', component: ProductComponent },
{ path: 'SalesOrder', component: SalesOrderComponent },

];