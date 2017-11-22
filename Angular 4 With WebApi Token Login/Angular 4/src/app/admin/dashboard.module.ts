import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule , Routes } from '@angular/router';
import { FormsModule,ReactiveFormsModule  } from '@angular/forms';

import { AdminMasterComponent } from './admin-master/index';
import { AdminIndexComponent } from './admin-index/index';
import { LoginComponent } from './login/index';
import { dashboardRoutes } from './dashboard.routes';
import { MasterHeaderComponent } from './admin-master/master-header/master-header.component';
import { MasterNavComponent } from './admin-master/master-nav/master-nav.component';
import { MasterFooterComponent } from './admin-master/master-footer/master-footer.component';
import { BlankPageComponent } from './blank-page/blank-page.component';
import { PurchaseChartComponent } from './charts/purchase-chart/purchase-chart.component';
import { SaleChartComponent } from './charts/sale-chart/sale-chart.component';

import { SalesReportComponent } from './reporting/sales-report/sales-report.component';
import { PurchaseReportComponent } from './reporting/purchase-report/purchase-report.component';

import { BusinessModule } from './business/index';
import { LoadingModule } from 'ngx-loading';

@NgModule({
    declarations:[
        AdminIndexComponent, AdminMasterComponent, LoginComponent, 
        MasterHeaderComponent, MasterNavComponent, MasterFooterComponent, BlankPageComponent, 
        PurchaseChartComponent, SaleChartComponent, SalesReportComponent, PurchaseReportComponent
    ],
    providers: [
        
    ],
    imports: [
        CommonModule,FormsModule,ReactiveFormsModule, BusinessModule, LoadingModule, RouterModule.forRoot(dashboardRoutes)
    ],
    exports:[

    ]
})

export class DashboardModule { }

