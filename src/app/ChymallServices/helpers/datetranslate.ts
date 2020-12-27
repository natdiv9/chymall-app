export class Datetranslate {
    public static getFrenchDay(date: Date) {
        const day = date.getDay();
        switch (day) {
            case 1:
                return 'Lundi';
            case 2:
                return 'Mardi';
            case 3:
                return 'Mercredi';
            case 4:
                return 'Jeudi';
            case 5:
                return 'Vendredi';
            case 6:
                return 'Samedi';
            case 7:
                return 'Dimanche';
            default:
                return '';
        }
    }

    public static getFrenchMonth(date: Date) {
        const month = date.getMonth();
        switch (month) {
            case 0:
                return 'Janvier';
            case 1:
                return 'Février';
            case 2:
                return 'Mars';
            case 3:
                return 'Avril';
            case 4:
                return 'Mai';
            case 5:
                return 'Juin';
            case 6:
                return 'Juillet';
            case 7:
                return 'Août';
            case 8:
                return 'Septembre';
            case 9:
                return 'Octobre';
            case 10:
                return 'Novembre';
            case 11:
                return 'Décembre';
            default:
                return '';
        }
    }

    public static formatInFrench(date: Date) {
        const month = Datetranslate.getFrenchMonth(date);
        const dayweek = Datetranslate.getFrenchDay(date);
        const chaine = dayweek + ' ' + date.getDate() + ' ' + month + ' ' + date.getFullYear();
        return chaine;
    }
}
