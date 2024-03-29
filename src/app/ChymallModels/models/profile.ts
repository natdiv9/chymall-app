export class Profile {
    public id?: number;
    public id_client: number;
    public username: string;
    public niveau_adhesion: string;
    public capital: number;
    public produit_trading: string;
    public produit_adhesion: string;
    public activation_compte?: number;
    public activation_trading?: number;
    public solde?: number;
    public etat_trading?: number;
    public etat_activation?: number;
    public etat_produit_adhesion?: number;
    public etat?: number;
    public password?: string;
    public data?: string;
    public username_parain?: string;
    public password_parain?: string;
    public date_activation?: string;
    public is_online_profile?: number;
}
