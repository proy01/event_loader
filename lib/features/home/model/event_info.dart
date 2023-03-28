class EventInfo {

  int id;
  String title;
  String description;
  String bannerImage;
  DateTime dateTime;
  String orgName;
  String orgIcon;
  String venueName;
  String venueCity;
  String venueCountry;

  EventInfo(this.id,
      this.title,
      this.description,
      this.bannerImage,
      this.dateTime,
      this.orgName,
      this.orgIcon,
      this.venueName,
      this.venueCity,
      this.venueCountry);

  factory EventInfo.fromJSON(Map json){
    return EventInfo(
        json['id'],
        json['title'],
        json['description'],
        json['banner_image'],
        DateTime.parse(json['date_time']),
        json['organiser_name'],
        json['organiser_icon'],
        json['venue_name'],
        json['venue_city'],
        json['venue_country']);
  }

  @override
  String toString() {
    return 'EventInfo{id: $id, title: $title, description: $description, bannerImage: $bannerImage, dateTime: $dateTime, orgName: $orgName, orgIcon: $orgIcon, venueName: $venueName, venueCity: $venueCity, venueCountry: $venueCountry}';
  }
}