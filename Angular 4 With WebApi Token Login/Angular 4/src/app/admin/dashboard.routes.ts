
import {  Routes } from '@angular/router';

import { AdminMasterComponent } from './admin-master/index';
import { AdminIndexComponent } from './admin-index/index';
import { BlankPageComponent } from './blank-page/blank-page.component';
import { PurchaseChartComponent } from './charts/purchase-chart/purchase-chart.component';
import { SaleChartComponent } from './charts/sale-chart/sale-chart.component';

import { businessRoutes } from './business/index';

import { LoginComponent } from './login/index';
import { AuthGuard } from '../security/auth.guard';

export const dashboardRoutes: Routes = [
{ path: 'Login', component: LoginComponent },
{ path: 'Admin', component: AdminMasterComponent, canActivate: [AuthGuard],
    children: [
        { path: '', component: AdminIndexComponent },
        { path: 'Blank', component: BlankPageComponent },
        { path: 'PurchaseOrderChart', component: PurchaseChartComponent },
        { path: 'SalesOrderChart', component: SaleChartComponent },
        ...businessRoutes
    ]}
];