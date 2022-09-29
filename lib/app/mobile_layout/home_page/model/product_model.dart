class VendorProductModel {
  bool? status;
  List<Data>? data;
  VendorProductModel({
    this.status,
    this.data,
  });
}

class Data {
  TurfCatogery? turfCatogery;
  TurfType? turfType;
  TurfAmenities? turfAmenities;
  TurfImages? turfImages;
  TurfTime? turfTime;
  String? id;
  String? turfCreatorId;
  String? turfName;
  String? turfPlace;
  String? turfMuncipality;
  String? turfDistrict;
  int? v;

  Data({
    this.turfCatogery,
    this.turfType,
    this.turfAmenities,
    this.turfImages,
    this.turfTime,
    this.id,
    this.turfCreatorId,
    this.turfName,
    this.turfPlace,
    this.turfMuncipality,
    this.turfDistrict,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        turfCatogery: json["turf_catogery"],
        turfType: json["turf_type"],
        turfAmenities: json["turf_amenities"],
        turfImages: json["turf_images"],
        turfTime: json["turf_time"],
        id: json["_id"],
        turfCreatorId: json["turf_creator_id"],
        turfName: json["turf_name"],
        turfPlace: json["turf_place"],
        turfMuncipality: json["turf_muncipality"],
        turfDistrict: json["turf_district"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "turf_catogery": turfCatogery,
        "turf_type": turfType,
        "turf_amenities": turfAmenities,
        "turf_images": turfImages,
        "turf_time": turfTime,
        "_id": id,
        "turf_creator_id": turfCreatorId,
        "turf_name": turfName,
        "turf_place": turfPlace,
        "turf_muncipality": turfMuncipality,
        "turf_district": turfDistrict,
        "__v": v,
      };
}

class TurfAmenities {
  bool? turfWashroom;
  bool? turfWater;
  bool? turfDressing;
  bool? turfParcking;
  bool? turfGallery;
  bool? turfCafeteria;

  TurfAmenities({
    this.turfWashroom,
    this.turfWater,
    this.turfDressing,
    this.turfParcking,
    this.turfGallery,
    this.turfCafeteria,
  });

  factory TurfAmenities.fromJson(Map<String, dynamic> json) => TurfAmenities(
        turfWashroom: json["turf_washroom"],
        turfWater: json["turf_water"],
        turfDressing: json["turf_dressing"],
        turfParcking: json["turf_parcking"],
        turfGallery: json["turf_gallery"],
        turfCafeteria: json["turf_cafeteria"],
      );

  Map<String, dynamic> toJson() => {
        "turf_washroom": turfWashroom,
        "turf_water": turfWater,
        "turf_dressing": turfDressing,
        "turf_parcking": turfParcking,
        "turf_gallery": turfGallery,
        "turf_cafeteria": turfCafeteria,
      };
}

class TurfCatogery {
  bool? turfCricket;
  bool? turfFootball;
  bool? turfBadminton;
  bool? turfYoga;
  TurfCatogery({
    this.turfCricket,
    this.turfFootball,
    this.turfBadminton,
    this.turfYoga,
  });

  factory TurfCatogery.fromJson(Map<String, dynamic> json) => TurfCatogery(
        turfCricket: json["turf_cricket"],
        turfFootball: json["turf_football"],
        turfBadminton: json["turf_badminton"],
        turfYoga: json["turf_yoga"],
      );

  Map<String, dynamic> toJson() => {
        "turf_cricket": turfCricket,
        "turf_football": turfFootball,
        "turf_badminton": turfBadminton,
        "turf_yoga": turfYoga,
      };
}

class TurfImages {
  TurfImages({
    this.turfImages1,
    this.turfImages2,
    this.turfImages3,
  });

  String? turfImages1;
  String? turfImages2;
  String? turfImages3;

  factory TurfImages.fromJson(Map<String, dynamic> json) => TurfImages(
        turfImages1: json["turf_images1"],
        turfImages2: json["turf_images2"],
        turfImages3: json["turf_images3"],
      );

  Map<String, dynamic> toJson() => {
        "turf_images1": turfImages1,
        "turf_images2": turfImages2,
        "turf_images3": turfImages3,
      };
}

class TurfTime {
  TurfTime({
    this.timeMorning,
    this.timeAfternoon,
    this.timeEvening,
  });

  String? timeMorning;
  String? timeAfternoon;
  String? timeEvening;

  factory TurfTime.fromJson(Map<String, dynamic> json) => TurfTime(
        timeMorning: json["time_morning"],
        timeAfternoon: json["time_afternoon"],
        timeEvening: json["time_evening"],
      );

  Map<String, dynamic> toJson() => {
        "time_morning": timeMorning,
        "time_afternoon": timeAfternoon,
        "time_evening": timeEvening,
      };
}

class TurfType {
  TurfType({
    this.turfSevens,
    this.turfSixes,
  });

  bool? turfSevens;
  bool? turfSixes;

  factory TurfType.fromJson(Map<String, dynamic> json) => TurfType(
        turfSevens: json["turf_sevens"],
        turfSixes: json["turf_sixes"],
      );

  Map<String, dynamic> toJson() => {
        "turf_sevens": turfSevens,
        "turf_sixes": turfSixes,
      };
}
