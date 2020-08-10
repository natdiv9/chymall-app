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
import {PaiementsAllComponent} from './ChymallPages/Paiements/paiements-all/paiements-all.component';
import {PaiementsIdComponent} from './ChymallPages/Paiements/paiements-id/paiements-id.component';
import {PaiementsNewComponent} from './ChymallPages/Paiements/paiements-new/paiements-new.component';
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

const routes: Routes = [
  {
    path: '',
    component: BaseLayoutComponent,
    children: [

      // Dashboads

      {path: '', component: AnalyticsComponent, data: {extraParameter: 'dashboardsMenu'}},

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

      {path: 'utilisateurs/all', component: UtilisateursAllComponent, data: {extraParameter: 'elementsMenu'}},
      {path: 'utilisateurs/:id/utilisateur', component: UtilisateursIdComponent, data: {extraParameter: 'elementsMenu'}},
      {path: 'utilisateurs/new', component: UtilisateursNewComponent, data: {extraParameter: 'elementsMenu'}},
      {path: 'utilisateurs/update', component: UtilisateursUpdateComponent, data: {extraParameter: 'elementsMenu'}},

        // CLIENTS

      {path: 'clients/all', component: ClientsAllComponent, data: {extraParameter: 'elementsMenu'}},
      {path: 'clients/:id/client', component: ClientsIdComponent, data: {extraParameter: 'elementsMenu'}},
      {path: 'clients/new', component: ClientsNewComponent, data: {extraParameter: 'elementsMenu'}},
      {path: 'clients/update', component: ClientsUpdateComponent, data: {extraParameter: 'elementsMenu'}},


      // PAIEMENTS

      {path: 'paiements/all', component: PaiementsAllComponent, data: {extraParameter: 'elementsMenu'}},
      {path: 'paiements/:id/paiement', component: PaiementsIdComponent, data: {extraParameter: 'elementsMenu'}},
      {path: 'paiements/new', component: PaiementsNewComponent, data: {extraParameter: 'elementsMenu'}},


      // PRODUITS

      {path: 'produits/all', component: ProduitsAllComponent, data: {extraParameter: 'elementsMenu'}},
      {path: 'produits/:id/produit', component: ProduitsIdComponent, data: {extraParameter: 'elementsMenu'}},
      {path: 'produits/new', component: ProduitsNewComponent, data: {extraParameter: 'elementsMenu'}},
      {path: 'produits/update', component: ProduitsUpdateComponent, data: {extraParameter: 'elementsMenu'}},

      // PROFILES

      {path: 'profiles/all', component: ProfilesAllComponent, data: {extraParameter: 'elementsMenu'}},
      {path: 'profiles/:id/profile', component: ProfilesIdComponent, data: {extraParameter: 'elementsMenu'}},
      {path: 'profiles/new', component: ProfilesNewComponent, data: {extraParameter: 'elementsMenu'}},
      {path: 'profiles/update', component: ProfilesUpdateComponent, data: {extraParameter: 'elementsMenu'}},


      // RETRAITS

      {path: 'retraits/all', component: RetraitsAllComponent, data: {extraParameter: 'elementsMenu'}},
      {path: 'retraits/:id/retrait', component: RetraitsIdComponent, data: {extraParameter: 'elementsMenu'}},
      {path: 'retraits/new', component: RetraitsNewComponent, data: {extraParameter: 'elementsMenu'}},


      // STOCKAGES

      {path: 'stockages/all', component: StockagesAllComponent, data: {extraParameter: 'elementsMenu'}},
      {path: 'stockages/:id/stockage', component: StockagesIdComponent, data: {extraParameter: 'elementsMenu'}},
      {path: 'stockages/new', component: StockagesNewComponent, data: {extraParameter: 'elementsMenu'}},

      // STOCKAGES

      {path: 'retrait-produits/all', component: RetraitProduitsAllComponent, data: {extraParameter: 'elementsMenu'}},
      {path: 'retrait-produits/id', component: RetraitProduitsIdComponent, data: {extraParameter: 'elementsMenu'}},
      {path: 'retrait-produits/new', component: RetraitProduitsNewComponent, data: {extraParameter: 'elementsMenu'}},

      {path: 'activites', component: ActivitesComponent, data: {extraParameter: 'elementsMenu'}}


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
      anchorScrolling: 'enabled',
    })],
  exports: [RouterModule]
})
export class AppRoutingModule {
}
