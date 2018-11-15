import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { Route, extract } from '@app/core';
import { HymnalComponent } from './hymnal.component';

const routes: Routes = [
  Route.withShell([
    { path: '', redirectTo: '/hymnal', pathMatch: 'full' },
    { path: 'hymnal', component: HymnalComponent, data: { title: extract('Hymnal') } }
  ])
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: []
})
export class HymnalRoutingModule { }
