class AuthenticateResponse {
  bool success;
  AuthenticateResult result;

  AuthenticateResponse({this.success, this.result});

  AuthenticateResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    result =
        json['result'] != null ? AuthenticateResult.fromJson(json['result']) : null;
  }
}

class AuthenticateResult {
  Agent agent;
  String token;

  AuthenticateResult({this.agent, this.token});

  AuthenticateResult.fromJson(Map<String, dynamic> json) {
    agent = json['agent'] != null ? new Agent.fromJson(json['agent']) : null;
    token = json['token'];
  }
}

class Agent {
  String status;
  String email;
  String name;
  bool active;
  Wall wall;
  String id;

  Agent({this.status, this.email, this.name, this.active, this.wall, this.id});

  Agent.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    email = json['email'];
    name = json['name'];
    active = json['active'];
    wall = json['wall'] != null ? new Wall.fromJson(json['wall']) : null;
    id = json['id'];
  }
}

class Wall {
  bool blocksDaytimeSlots;
  List<String> allowedProviders;
  Picture picture;
  Screensaver screensaver;
  String city;
  Location location;
  double basePricing;
  String wallDescription;
  String zipcode;
  String address;
  String name;
  int order;
  List<String> webcams;
  String createdAt;
  String id;
  List<LiveViews> liveViews;

  Wall(
      {this.blocksDaytimeSlots,
      this.allowedProviders,
      this.picture,
      this.screensaver,
      this.city,
      this.location,
      this.basePricing,
      this.wallDescription,
      this.zipcode,
      this.address,
      this.name,
      this.order,
      this.webcams,
      this.createdAt,
      this.id,
      this.liveViews});

  Wall.fromJson(Map<String, dynamic> json) {
    blocksDaytimeSlots = json['blocksDaytimeSlots'];
    allowedProviders = json['allowedProviders'].cast<String>();
    picture =
        json['picture'] != null ? new Picture.fromJson(json['picture']) : null;
    screensaver = json['screensaver'] != null
        ? new Screensaver.fromJson(json['screensaver'])
        : null;
    city = json['city'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    basePricing = json['basePricing'];
    wallDescription = json['wallDescription'];
    zipcode = json['zipcode'];
    address = json['address'];
    name = json['name'];
    order = json['order'];
    webcams = json['webcams'].cast<String>();
    createdAt = json['createdAt'];
    id = json['id'];
    if (json['liveViews'] != null) {
      liveViews = new List<LiveViews>();
      json['liveViews'].forEach((v) {
        liveViews.add(new LiveViews.fromJson(v));
      });
    }
  }
}

class Picture {
  String uri;
  String hash;
  String id;
  String url;

  Picture({this.uri, this.hash, this.id, this.url});

  Picture.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    hash = json['hash'];
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uri'] = this.uri;
    data['hash'] = this.hash;
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}

class Screensaver {
  VideoDetails videoDetails;
  Media media;
  String status;
  String id;

  Screensaver({this.videoDetails, this.media, this.status, this.id});

  Screensaver.fromJson(Map<String, dynamic> json) {
    videoDetails = json['videoDetails'] != null
        ? new VideoDetails.fromJson(json['videoDetails'])
        : null;
    media = json['media'] != null ? new Media.fromJson(json['media']) : null;
    status = json['status'];
    id = json['id'];
  }
}

class VideoDetails {
  String platform;
  String videoId;
  String title;
  String description;
  String link;
  int duration;
  String thumbnailUrl;

  VideoDetails(
      {this.platform,
      this.videoId,
      this.title,
      this.description,
      this.link,
      this.duration,
      this.thumbnailUrl});

  VideoDetails.fromJson(Map<String, dynamic> json) {
    platform = json['platform'];
    videoId = json['videoId'];
    title = json['title'];
    description = json['description'];
    link = json['link'];
    duration = json['duration'];
    thumbnailUrl = json['thumbnailUrl'];
  }
}

class Media {
  Video video;
  Audio audio;

  Media({this.video, this.audio});

  Media.fromJson(Map<String, dynamic> json) {
    video = json['video'] != null ? new Video.fromJson(json['video']) : null;
    audio = json['audio'] != null ? new Audio.fromJson(json['audio']) : null;
  }
}

class Video {
  String uri;
  String id;
  String url;

  Video({this.uri, this.id, this.url});

  Video.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    id = json['id'];
    url = json['url'];
  }
}

class Audio {
  String uri;
  String id;
  String url;

  Audio({this.uri, this.id, this.url});

  Audio.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    id = json['id'];
    url = json['url'];
  }
}

class Location {
  double lat;
  double lng;

  Location({this.lat, this.lng});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

class LiveViews {
  String originalLink;
  String embedLink;

  LiveViews({this.originalLink, this.embedLink});

  LiveViews.fromJson(Map<String, dynamic> json) {
    originalLink = json['originalLink'];
    embedLink = json['embedLink'];
  }
}
