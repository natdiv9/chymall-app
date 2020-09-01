import {NgModule} from '@angular/core';
import {Routes, RouterModule} from '@angular/router';

import {BaseLayoutComponent} from './Layout/base-layout/base-layout.component';
import {PagesLayoutComponent} from './Layout/pages-layout/pages-layout.component';

// DEMO PAGES

// Dashboards

import {AnalyticsComponent} from './DemoPages/Dashboards/analytics/analytics.component';

// Pages

import {ForgotPasswordBoxedComponent} from './DemoPages/UserPages/forgot-password-boxed/forgot-password-boxed.component';
import {LoginBoxedComponent} from './DemoPages/UserPages/login-boxed/login-boxed.component';
import {RegisterBoxedComponent} from './DemoPages/UserPages/register-boxed/register-boxed.component';

// Elements

import {StandardComponent} from './DemoPages/Elements/Buttons/standard/standard.component';
import {DropdownsComponent} from './DemoPages/Elements/dropdowns/dropdowns.component';
import {CardsComponent} from './DemoPages/Elements/cards/cards.component';
import {ListGroupsComponent} from './DemoPages/Elements/list-groups/list-groups.component';
import {TimelineComponent} from './DemoPages/Elements/timeline/timeline.component';
import {IconsComponent} from './DemoPages/Elements/icons/icons.component';

// Components

import {AccordionsComponent} from './DemoPages/Components/accordions/accordions.component';
import {TabsComponent} from './DemoPages/Components/tabs/tabs.component';
import {CarouselComponent} from './DemoPages/Components/carousel/carousel.component';
import {ModalsComponent} from './DemoPages/Components/modals/modals.component';
import {ProgressBarComponent} from './DemoPages/Components/progress-bar/progress-bar.component';
import {PaginationComponent} from './DemoPages/Components/pagination/pagination.component';
import {TooltipsPopoversComponent} from './DemoPages/Components/tooltips-popovers/tooltips-popovers.component';

// Tables

import {TablesMainComponent} from './DemoPages/Tables/tables-main/tables-main.component';

// Widgets

import {ChartBoxes3Component} from './DemoPages/Widgets/chart-boxes3/chart-boxes3.component';

// Forms Elements

import {ControlsComponent} from './DemoPages/Forms/Elements/controls/controls.component';
import {LayoutComponent} from './DemoPages/Forms/Elements/layout/layout.component';

// Charts

import {ChartjsComponent} from './DemoPages/Charts/chartjs/chartjs.component';
import {UtilisateursAllComponent} from './ChymallPages/Utilisateurs/utilisateurs-all/utilisateurs-all.component';
import {UtilisateursIdComponent} from './ChymallPages/Utilisateurs/utilisateurs-id/utilisateurs-id.component';
import {UtilisateursNewComponent} from './ChymallPages/Utilisateurs/utilisateurs-new/utilisateurs-new.component';
import {UtilisateursUpdateComponent} from './ChymallPages/Utilisateurs/utilisateurs-update/utilisateurs-update.component';
import {ClientsAllComponent} from './ChymallPages/Clients/clients-all/clients-all.component';
import {ClientsIdComponent} from './ChymallPages/Clients/clients-id/clients-id.component';
import {ClientsNewComponent} from './ChymallPages/Clients/clients-new/clients-new.component';
import {ClientsUpdateComponent} from './ChymallPages/Clients/clients-update/clients-update.component';
import {ProduitsAllComponent} from './ChymallPages/Produits/produits-all/produits-all.component';
import {ProduitsIdComponent} from './ChymallPages/Produits/produits-id/produits-id.component';
import {ProduitsNewComponent} from './ChymallPages/Produits/produits-new/produits-new.component';
import {ProduitsUpdateComponent} from './ChymallPages/Produits/produits-update/produits-update.component';
import {ProfilesAllComponent} from './ChymallPages/Profiles/profiles-all/profiles-all.component';
import {ProfilesIdComponent} from './ChymallPages/Profiles/profiles-id/profiles-id.component';
import {ProfilesNewComponent} from './ChymallPages/Profiles/profiles-new/profiles-new.component';
import {ProfilesUpdateComponent} from './ChymallPages/Profiles/profiles-update/profiles-update.component';
import {RetraitsAllComponent} from './ChymallPages/Retraits/retraits-all/retraits-all.component';
import {RetraitsIdComponent} from './ChymallPages/Retraits/retraits-id/retraits-id.component';
import {RetraitsNewComponent} from './ChymallPages/Retraits/retraits-new/retraits-new.component';
import {StockagesAllComponent} from './ChymallPages/Stockages/stockages-all/stockages-all.component';
import {StockagesIdComponent} from './ChymallPages/Stockages/stockages-id/stockages-id.component';
import {StockagesNewComponent} from './ChymallPages/Stockages/stockages-new/stockages-new.component';
import {ConnexionComponent} from './ChymallPages/connexion/connexion.component';
import {RetraitProduitsAllComponent} from './ChymallPages/RetraitProduits/retrait-produits-all/retrait-produits-all.component';
import {RetraitProduitsIdComponent} from './ChymallPages/RetraitProduits/retrait-produits-id/retrait-produits-id.component';
import {RetraitProduitsNewComponent} from './ChymallPages/RetraitProduits/retrait-produits-new/retrait-produits-new.component';
import {ActivitesComponent} from './ChymallPages/activites/activites.component';
import {AuthGuardService} from './ChymallServices/auth/auth-guard.service';
import {ProfilesByClientComponent} from './ChymallPages/Profiles/profiles-by-client/profiles-by-client.component';
import {AdhesionGuardService} from './ChymallServices/auth/adhesion-guard.service';
import {CheckAdminGuard} from './ChymallServices/auth/check-admin.guard';
import {ComptabiliteGuardService} from './ChymallServices/auth/comptabilite-guard.service';
import {TechniqueGuardService} from './ChymallServices/auth/technique-guard.service';
import {RetraitGuardService} from './ChymallServices/auth/retrait-guard.service';
// tslint:disable-next-line:max-line-length
import {ProfilesCompleterUsernameComponent} from './ChymallPages/Profiles/profiles-completer-username/profiles-completer-username.component';
import {RetraitsDemandeNewComponent} from './ChymallPages/Retraits/retraits-demande-new/retraits-demande-new.component';
import {TranfertGuard} from './ChymallServices/auth/tranfert.guard';
import {TechniqueComponent} from './ChymallPages/Profiles/technique/technique.component';
import {RetraitsAllDemandesComponent} from './ChymallPages/Retraits/retraits-all-demandes/retraits-all-demandes.component';

const routes: Routes = [
  {
    path: '',
    component: BaseLayoutComponent,
    children: [

      // Dashboads

      {path: '', component: AnalyticsComponent, canActivate: [AuthGuardService, CheckAdminGuard], data: {extraParameter: 'dashboardsMenu'}},

      // Elements

      {path: 'elements/buttons-standard', component: StandardComponent, data: {extraParameter: 'elementsMenu'}},
      {path: 'elements/dropdowns', component: DropdownsComponent, data: {extraParameter: 'elementsMenu'}},
      {path: 'elements/icons', component: IconsComponent, data: {extraParameter: 'elementsMenu'}},
      {path: 'elements/cards', component: CardsComponent, data: {extraParameter: 'elementsMenu'}},
      {path: 'elements/list-group', component: ListGroupsComponent, data: {extraParameter: 'elementsMenu'}},
      {path: 'elements/timeline', component: TimelineComponent, data: {extraParameter: 'elementsMenu'}},

      // Components

      {path: 'components/tabs', component: TabsComponent, data: {extraParameter: 'componentsMenu'}},
      {path: 'components/accordions', component: AccordionsComponent, data: {extraParameter: 'componentsMenu'}},
      {path: 'components/modals', component: ModalsComponent, data: {extraParameter: 'componentsMenu'}},
      {path: 'components/progress-bar', component: ProgressBarComponent, data: {extraParameter: 'componentsMenu'}},
      {path: 'components/tooltips-popovers', component: TooltipsPopoversComponent, data: {extraParameter: 'componentsMenu'}},
      {path: 'components/carousel', component: CarouselComponent, data: {extraParameter: 'componentsMenu'}},
      {path: 'components/pagination', component: PaginationComponent, data: {extraParameter: 'componentsMenu'}},

      // Tables

      {path: 'tables/bootstrap', component: TablesMainComponent, data: {extraParameter: 'tablesMenu'}},

      // Widgets

      {path: 'widgets/chart-boxes-3', component: ChartBoxes3Component, data: {extraParameter: 'pagesMenu3'}},

      // Forms Elements

      {path: 'forms/controls', component: ControlsComponent, data: {extraParameter: 'formElementsMenu'}},
      {path: 'forms/layouts', component: LayoutComponent, data: {extraParameter: 'formElementsMenu'}},

      // Charts

      {path: 'charts/chartjs', component: ChartjsComponent, data: {extraParameter: ''}},

      // CHYMALL PAGES

        // UTILISATEURS

      // tslint:disable-next-line:max-line-length
      {path: 'utilisateurs/all', component: UtilisateursAllComponent, canActivate: [AuthGuardService, CheckAdminGuard], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'utilisateurs/:id/details', component: UtilisateursIdComponent, canActivate: [AuthGuardService, CheckAdminGuard], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'utilisateurs/new', component: UtilisateursNewComponent, canActivate: [AuthGuardService, CheckAdminGuard], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'utilisateurs/:id/update', component: UtilisateursUpdateComponent, canActivate: [AuthGuardService, CheckAdminGuard], data: {extraParameter: 'elementsMenu'}},

        // CLIENTS

      // tslint:disable-next-line:max-line-length
      {path: 'clients/all', component: ClientsAllComponent, canActivate: [AuthGuardService, AdhesionGuardService], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'clients/all2', component: ClientsAllComponent, canActivate: [AuthGuardService, ComptabiliteGuardService], data: {extraParameter: 'elementsMenu'}},
      {path: 'clients/:id/details', component: ClientsIdComponent, canActivate: [AuthGuardService], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'clients/new', component: ClientsNewComponent, canActivate: [AuthGuardService, AdhesionGuardService], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'clients/:id/update', component: ClientsUpdateComponent, canActivate: [AuthGuardService, AdhesionGuardService], data: {extraParameter: 'elementsMenu'}},

      // PRODUITS

      // tslint:disable-next-line:max-line-length
      {path: 'produits/all', component: ProduitsAllComponent, canActivate: [AuthGuardService, RetraitGuardService], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'profiles/technique', component: TechniqueComponent, canActivate: [AuthGuardService, TechniqueGuardService], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'produits/:id/details', component: ProduitsIdComponent, canActivate: [AuthGuardService, RetraitGuardService], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'produits/new', component: ProduitsNewComponent, canActivate: [AuthGuardService, RetraitGuardService], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'produits/:id/update', component: ProduitsUpdateComponent, canActivate: [AuthGuardService, RetraitGuardService], data: {extraParameter: 'elementsMenu'}},

      // PROFILES

      // tslint:disable-next-line:max-line-length
      {path: 'profiles/all', component: ProfilesAllComponent, canActivate: [AuthGuardService, ComptabiliteGuardService], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'profiles/:idclient/:username/all', component: ProfilesByClientComponent, canActivate: [AuthGuardService, ComptabiliteGuardService], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'profiles/completer', component: ProfilesCompleterUsernameComponent, canActivate: [AuthGuardService, TechniqueGuardService], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'profiles/:id/details', component: ProfilesIdComponent, canActivate: [AuthGuardService], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'profiles/:id/:username/new', component: ProfilesNewComponent, canActivate: [AuthGuardService, AdhesionGuardService], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'profiles/:id/update', component: ProfilesUpdateComponent, canActivate: [AuthGuardService, AdhesionGuardService], data: {extraParameter: 'elementsMenu'}},


      // RETRAITS

      // tslint:disable-next-line:max-line-length
      {path: 'retraits/all', component: RetraitsAllComponent, canActivate: [AuthGuardService, ComptabiliteGuardService], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'retraits/:id/details', component: RetraitsIdComponent, canActivate: [AuthGuardService], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'retraits/new', component: RetraitsNewComponent, canActivate: [AuthGuardService, ComptabiliteGuardService], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'retraits/demande/new', component: RetraitsDemandeNewComponent, canActivate: [AuthGuardService, TranfertGuard], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'retraits/demande/all', component: RetraitsAllDemandesComponent, canActivate: [AuthGuardService, TranfertGuard], data: {extraParameter: 'elementsMenu'}},

      // STOCKAGES

      // tslint:disable-next-line:max-line-length
      {path: 'stockages/all', component: StockagesAllComponent, canActivate: [AuthGuardService, RetraitGuardService], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'stockages/:id/details', component: StockagesIdComponent, canActivate: [AuthGuardService], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'stockages/:idproduit/new', component: StockagesNewComponent, canActivate: [AuthGuardService], data: {extraParameter: 'elementsMenu'}},

      // STOCKAGES

      // tslint:disable-next-line:max-line-length
      {path: 'retrait-produits/all', component: RetraitProduitsAllComponent, canActivate: [AuthGuardService, RetraitGuardService], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'retrait-produits/:id/details', component: RetraitProduitsIdComponent, canActivate: [AuthGuardService], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'retrait-produits/new', component: RetraitProduitsNewComponent, canActivate: [AuthGuardService, RetraitGuardService], data: {extraParameter: 'elementsMenu'}},

      // tslint:disable-next-line:max-line-length
      {path: 'activites', component: ActivitesComponent, canActivate: [AuthGuardService, CheckAdminGuard], data: {extraParameter: 'elementsMenu'}}


    ]

  },
  {
    path: '',
    component: PagesLayoutComponent,
    children: [

      // User Pages

      {path: 'connexion', component: ConnexionComponent, data: {extraParameter: ''}},
      {path: 'pages/register-boxed', component: RegisterBoxedComponent, data: {extraParameter: ''}},
      {path: 'pages/forgot-password-boxed', component: ForgotPasswordBoxedComponent, data: {extraParameter: ''}},
    ]
  },
  {path: '**', redirectTo: ''}
];

@NgModule({
  imports: [RouterModule.forRoot(routes,
    {
      scrollPositionRestoration: 'enabled',
      anchorScrolling: 'enabled'
    })],
  exports: [RouterModule]
})
export class AppRoutingModule {
}
