import {NgModule} from '@angular/core';
import {Routes, RouterModule} from '@angular/router';

import {BaseLayoutComponent} from './Layout/base-layout/base-layout.component';
import {PagesLayoutComponent} from './Layout/pages-layout/pages-layout.component';

// DEMO PAGES

// Dashboards

import {AnalyticsComponent} from './DemoPages/Dashboards/analytics/analytics.component';

// Pages

// Elements


// Components


// Tables


// Widgets


// Forms Elements

// Charts

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
import {PactsAllComponent} from './ChymallPages/pacts-all/pacts-all.component';
import {ProfilesEnligneComponent} from './ChymallPages/Profiles/profiles-enligne/profiles-enligne.component';
import {FactureRetraitArgentComponent} from './ChymallPages/Imprissions/facture-retrait-argent/facture-retrait-argent.component';
import {FacturePaiementComponent} from './ChymallPages/Imprissions/facture-paiement/facture-paiement.component';
import {ClientsEnligneComponent} from './ChymallPages/Clients/clients-enligne/clients-enligne.component';
import {RapportProfileComponent} from './ChymallPages/Profiles/rapport-profile/rapport-profile.component';
import {RapportRetraitsComponent} from './ChymallPages/Retraits/rapport-retraits/rapport-retraits.component';
import {ProfileEnligneGuard} from './ChymallServices/auth/profile-enligne.guard';
import {ProfileVisualiserComponent} from './ChymallPages/Profiles/profile-visualiser/profile-visualiser.component';
// tslint:disable-next-line:max-line-length
import {ProfileVisualiserByClientComponent} from './ChymallPages/Profiles/profile-visualiser-by-client/profile-visualiser-by-client.component';
import {ProfilesUpdateGuard} from './ChymallPages/Profiles/profiles-update/profiles-update.guard';
import {RetraitsAllGuard} from './ChymallPages/Retraits/retraits-all/retraits-all.guard';
import {RapportRetraisGuard} from './ChymallPages/Retraits/rapport-retraits/rapport-retrais.guard';
import {ClientUpdateGuard} from './ChymallPages/Clients/clients-update/client-update.guard';

const routes: Routes = [
  {
    path: '',
    component: BaseLayoutComponent,
    children: [

      // Dashboads

      {path: '', component: AnalyticsComponent, canActivate: [AuthGuardService, CheckAdminGuard], data: {extraParameter: 'dashboardsMenu'}},

      // Elements

      // Components

      // Tables


      // Widgets


      // Forms Elements


      // Charts


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
      {path: 'clients/:id/details', component: ClientsIdComponent, canActivate: [AuthGuardService], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'clients/new', component: ClientsNewComponent, canActivate: [AuthGuardService, AdhesionGuardService], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'clients/:id/update', component: ClientsUpdateComponent, canActivate: [AuthGuardService, ClientUpdateGuard], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'clients/enligne', component: ClientsEnligneComponent, canActivate: [AuthGuardService, ProfileEnligneGuard], data: {extraParameter: 'elementsMenu'}},

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
      {path: 'profiles/all', component: ProfilesAllComponent, canActivate: [AuthGuardService, AdhesionGuardService], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'profiles/:idclient/:username/all', component: ProfilesByClientComponent, canActivate: [AuthGuardService, AdhesionGuardService], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'profiles/visualiser/:idclient/:username/all', component: ProfileVisualiserByClientComponent, canActivate: [AuthGuardService], data: {extraParameter: 'elementsMenu'}},

      // tslint:disable-next-line:max-line-length
      {path: 'profiles/completer', component: ProfilesCompleterUsernameComponent, canActivate: [AuthGuardService, TechniqueGuardService], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'profiles/enligne', component: ProfilesEnligneComponent, canActivate: [AuthGuardService, ProfileEnligneGuard], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'profiles/visualiser', component: ProfileVisualiserComponent, canActivate: [AuthGuardService], data: {extraParameter: 'elementsMenu'}},

      // tslint:disable-next-line:max-line-length
      {path: 'profiles/:id/details', component: ProfilesIdComponent, canActivate: [AuthGuardService], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'profiles/:id/:username/new', component: ProfilesNewComponent, canActivate: [AuthGuardService, AdhesionGuardService], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'profiles/:id/update', component: ProfilesUpdateComponent, canActivate: [AuthGuardService, ProfilesUpdateGuard], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'profiles/rapport', component: RapportProfileComponent, canActivate: [AuthGuardService, AdhesionGuardService], data: {extraParameter: 'elementsMenu'}},


      // RETRAITS

      // tslint:disable-next-line:max-line-length
      {path: 'retraits/all', component: RetraitsAllComponent, canActivate: [AuthGuardService, RetraitsAllGuard], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'retraits/:id/details', component: RetraitsIdComponent, canActivate: [AuthGuardService], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'retraits/new', component: RetraitsNewComponent, canActivate: [AuthGuardService, ComptabiliteGuardService], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'retraits/demande/new', component: RetraitsDemandeNewComponent, canActivate: [AuthGuardService, TranfertGuard], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'retraits/demande/all', component: RetraitsAllDemandesComponent, canActivate: [AuthGuardService, TranfertGuard], data: {extraParameter: 'elementsMenu'}},

      // tslint:disable-next-line:max-line-length
      {path: 'retraits/rapport', component: RapportRetraitsComponent, canActivate: [AuthGuardService, RapportRetraisGuard], data: {extraParameter: 'elementsMenu'}},

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
      {path: 'activites', component: ActivitesComponent, canActivate: [AuthGuardService, CheckAdminGuard], data: {extraParameter: 'elementsMenu'}},
      // tslint:disable-next-line:max-line-length
      {path: 'pacts/all', component: PactsAllComponent, canActivate: [AuthGuardService, CheckAdminGuard], data: {extraParameter: 'elementsMenu'}}


    ]

  },
  {
    path: '',
    component: PagesLayoutComponent,
    children: [

      // User Pages

      {path: 'connexion', component: ConnexionComponent, data: {extraParameter: ''}},
      {path: 'facture-retrait', component: FactureRetraitArgentComponent, data: {extraParameter: ''}},
      {path: 'facture-paiement', component: FacturePaiementComponent, data: {extraParameter: ''}}
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
