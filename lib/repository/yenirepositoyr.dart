class ornekRepository {
  List<Personal> personeller = [
    Personal("Erdem", "Saray", "22481212", "Bilişim Departmanı"),
    Personal("Ali", "Kaya", "22481212", "Bilişim Departmanı"),
    Personal("Erdem", "Saray", "22481212", "Bilişim Departmanı"),
    Personal("Erdem", "Saray", "22481212", "Bilişim Departmanı"),
    Personal("Erdem", "Saray", "22481212", "Bilişim Departmanı"),
    Personal("Erdem", "Saray", "22481212", "Bilişim Departmanı"),



  ];
}

class Personal {
  String ad;
  String soyad;
  String sicilNo;
  String departman;

  Personal(this.ad, this.soyad, this.sicilNo, this.departman);
}
