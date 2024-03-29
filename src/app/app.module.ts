import {BrowserModule} from '@angular/platform-browser';
import {NgModule} from '@angular/core';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import {NgReduxModule} from '@angular-redux/store';
import {NgRedux, DevToolsExtension} from '@angular-redux/store';
import {rootReducer, ArchitectUIState} from './ThemeOptions/store';
import {ConfigActions} from './ThemeOptions/store/config.actions';
import {AppRoutingModule} from './app-routing.module';
import {LoadingBarRouterModule} from '@ngx-loading-bar/router';

import {CommonModule} from '@angular/common';
import {HttpClientModule} from '@angular/common/http';
import {AppComponent} from './app.component';

// BOOTSTRAP COMPONENTS

import {AngularFontAwesomeModule} from 'angular-font-awesome';
import {NgbModule} from '@ng-bootstrap/ng-bootstrap';
import {PerfectScrollbarModule} from 'ngx-perfect-scrollbar';
import {PERFECT_SCROLLBAR_CONFIG} from 'ngx-perfect-scrollbar';
import {PerfectScrollbarConfigInterface} from 'ngx-perfect-scrollbar';
import {ChartsModule} from 'ng2-charts';

// LAYOUT

import {BaseLayoutComponent} from './Layout/base-layout/base-layout.component';
import {PagesLayoutComponent} from './Layout/pages-layout/pages-layout.component';
import {PageTitleComponent} from './Layout/Components/page-title/page-title.component';

// HEADER

import {HeaderComponent} from './Layout/Components/header/header.component';
import {SearchBoxComponent} from './Layout/Components/header/elements/search-box/search-box.component';
import {UserBoxComponent} from './Layout/Components/header/elements/user-box/user-box.component';

// SIDEBAR

import {SidebarComponent} from './Layout/Components/sidebar/sidebar.component';
import {LogoComponent} from './Layout/Components/sidebar/elements/logo/logo.component';

// FOOTER

import {FooterComponent} from './Layout/Components/footer/footer.component';

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


// Chart.js Examples

import { UtilisateursNewComponent } from './ChymallPages/Utilisateurs/utilisateurs-new/utilisateurs-new.component';
import { UtilisateursIdComponent } from './ChymallPages/Utilisateurs/utilisateurs-id/utilisateurs-id.component';
import { UtilisateursAllComponent } from './ChymallPages/Utilisateurs/utilisateurs-all/utilisateurs-all.component';
import { UtilisateursUpdateComponent } from './ChymallPages/Utilisateurs/utilisateurs-update/utilisateurs-update.component';
import { ClientsNewComponent } from './ChymallPages/Clients/clients-new/clients-new.component';
import { ClientsIdComponent } from './ChymallPages/Clients/clients-id/clients-id.component';
import { ClientsUpdateComponent } from './ChymallPages/Clients/clients-update/clients-update.component';
import { ClientsAllComponent } from './ChymallPages/Clients/clients-all/clients-all.component';
import { ProfilesNewComponent } from './ChymallPages/Profiles/profiles-new/profiles-new.component';
import { ProfilesIdComponent } from './ChymallPages/Profiles/profiles-id/profiles-id.component';
import { ProfilesAllComponent } from './ChymallPages/Profiles/profiles-all/profiles-all.component';
import { ProfilesUpdateComponent } from './ChymallPages/Profiles/profiles-update/profiles-update.component';
import { RetraitsNewComponent } from './ChymallPages/Retraits/retraits-new/retraits-new.component';
import { RetraitsAllComponent } from './ChymallPages/Retraits/retraits-all/retraits-all.component';
import { RetraitsIdComponent } from './ChymallPages/Retraits/retraits-id/retraits-id.component';
import { ProduitsNewComponent } from './ChymallPages/Produits/produits-new/produits-new.component';
import { ProduitsAllComponent } from './ChymallPages/Produits/produits-all/produits-all.component';
import { ProduitsIdComponent } from './ChymallPages/Produits/produits-id/produits-id.component';
import { ProduitsUpdateComponent } from './ChymallPages/Produits/produits-update/produits-update.component';
import { StockagesNewComponent } from './ChymallPages/Stockages/stockages-new/stockages-new.component';
import { StockagesAllComponent } from './ChymallPages/Stockages/stockages-all/stockages-all.component';
import { StockagesIdComponent } from './ChymallPages/Stockages/stockages-id/stockages-id.component';
import { ConnexionComponent } from './ChymallPages/connexion/connexion.component';
import { RetraitProduitsNewComponent } from './ChymallPages/RetraitProduits/retrait-produits-new/retrait-produits-new.component';
import { RetraitProduitsAllComponent } from './ChymallPages/RetraitProduits/retrait-produits-all/retrait-produits-all.component';
import { RetraitProduitsIdComponent } from './ChymallPages/RetraitProduits/retrait-produits-id/retrait-produits-id.component';
import { ActivitesComponent } from './ChymallPages/activites/activites.component';
import { ProfilesByClientComponent } from './ChymallPages/Profiles/profiles-by-client/profiles-by-client.component';
import { CustomModalComponent } from './ChymallServices/auth/custom-modal/custom-modal.component';
// tslint:disable-next-line:max-line-length
import { ProfilesCompleterUsernameComponent } from './ChymallPages/Profiles/profiles-completer-username/profiles-completer-username.component';
import { RetraitsDemandeNewComponent } from './ChymallPages/Retraits/retraits-demande-new/retraits-demande-new.component';
import { TechniqueComponent } from './ChymallPages/Profiles/technique/technique.component';
import { RetraitsAllDemandesComponent } from './ChymallPages/Retraits/retraits-all-demandes/retraits-all-demandes.component';
import { PactsAllComponent } from './ChymallPages/pacts-all/pacts-all.component';
import { ProfilesEnligneComponent } from './ChymallPages/Profiles/profiles-enligne/profiles-enligne.component';
import { FacturePaiementComponent } from './ChymallPages/Imprissions/facture-paiement/facture-paiement.component';
import { FactureRetraitArgentComponent } from './ChymallPages/Imprissions/facture-retrait-argent/facture-retrait-argent.component';
import { ClientsEnligneComponent } from './ChymallPages/Clients/clients-enligne/clients-enligne.component';
import { RapportProfileComponent } from './ChymallPages/Profiles/rapport-profile/rapport-profile.component';
import { RapportRetraitsComponent } from './ChymallPages/Retraits/rapport-retraits/rapport-retraits.component';
import { ProfileVisualiserComponent } from './ChymallPages/Profiles/profile-visualiser/profile-visualiser.component';
// tslint:disable-next-line:max-line-length
import { ProfileVisualiserByClientComponent } from './ChymallPages/Profiles/profile-visualiser-by-client/profile-visualiser-by-client.component';

// CHY
// import {AutocompleteLibModule} from 'angular-ng-autocomplete';

const DEFAULT_PERFECT_SCROLLBAR_CONFIG: PerfectScrollbarConfigInterface = {
  suppressScrollX: true
};

@NgModule({
  declarations: [

    // LAYOUT

    AppComponent,
    BaseLayoutComponent,
    PagesLayoutComponent,
    PageTitleComponent,

    // HEADER

    HeaderComponent,
    SearchBoxComponent,
    UserBoxComponent,

    // SIDEBAR

    SidebarComponent,
    LogoComponent,

    // FOOTER

    FooterComponent,

    // DEMO PAGES

    // Dashboards

    AnalyticsComponent,

    // User Pages

    // Elements



    // Components

    // Tables



    // Dashboard Boxes


    // Form Elements

    // CHARTS


    // Chart.js Examples
    UtilisateursIdComponent,
    UtilisateursNewComponent,
    UtilisateursAllComponent,
    UtilisateursUpdateComponent,
    ClientsNewComponent,
    ClientsIdComponent,
    ClientsUpdateComponent,
    ClientsAllComponent,
    ProfilesNewComponent,
    ProfilesIdComponent,
    ProfilesAllComponent,
    ProfilesUpdateComponent,
    RetraitsNewComponent,
    RetraitsAllComponent,
    RetraitsIdComponent,
    ProduitsNewComponent,
    ProduitsAllComponent,
    ProduitsIdComponent,
    ProduitsUpdateComponent,
    StockagesNewComponent,
    StockagesAllComponent,
    StockagesIdComponent,
    ConnexionComponent,
    RetraitProduitsNewComponent,
    RetraitProduitsAllComponent,
    RetraitProduitsIdComponent,
    ActivitesComponent,
    ProfilesByClientComponent,
    CustomModalComponent,
    ProfilesCompleterUsernameComponent,
    RetraitsDemandeNewComponent,
    TechniqueComponent,
    RetraitsAllDemandesComponent,
    PactsAllComponent,
    ProfilesEnligneComponent,
    FacturePaiementComponent,
    FactureRetraitArgentComponent,
    ClientsEnligneComponent,
    RapportProfileComponent,
    RapportRetraitsComponent,
    ProfileVisualiserComponent,
    ProfileVisualiserByClientComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    NgReduxModule,
    CommonModule,
    LoadingBarRouterModule,
    // Angular Bootstrap Components

    PerfectScrollbarModule,
    NgbModule,
    AngularFontAwesomeModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,

    // Charts

    ChartsModule,
  ],
  providers: [
    {
      provide:
      PERFECT_SCROLLBAR_CONFIG,
      // DROPZONE_CONFIG,
      useValue:
      DEFAULT_PERFECT_SCROLLBAR_CONFIG,
      // DEFAULT_DROPZONE_CONFIG,
    },
    ConfigActions,
  ],
  bootstrap: [AppComponent]
})

export class AppModule {
  constructor(private ngRedux: NgRedux<ArchitectUIState>,
              private devTool: DevToolsExtension) {

    this.ngRedux.configureStore(
      rootReducer,
      {} as ArchitectUIState,
      [],
      [devTool.isEnabled() ? devTool.enhancer() : f => f]
    );

  }
}
