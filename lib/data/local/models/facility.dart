enum Facility {
  rooftop,
  petAllowed,
  valetParking,
  takeAway,
  barsAndPubs,
  dineIn,
  buffet
}

extension FacilityExtension on Facility {
  String get label {
    switch (this) {
      case Facility.rooftop:
        return "Rooftop";
      case Facility.petAllowed:
        return "Pet Allowed";
      case Facility.valetParking:
        return "Valet Parking";
      case Facility.takeAway:
        return "Take Away";
      case Facility.barsAndPubs:
        return "Bars & Pubs";
        case Facility.dineIn:
        return "Dine In";
      case Facility.buffet:
        return "Buffet";
    }
  }
}