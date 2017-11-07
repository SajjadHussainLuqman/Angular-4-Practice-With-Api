import { Routes } from '@angular/router';

import { dashboardRoutes } from './admin/index';
import { webRoutes } from './website/index';

export const routes: Routes = [
...dashboardRoutes,
...webRoutes
];