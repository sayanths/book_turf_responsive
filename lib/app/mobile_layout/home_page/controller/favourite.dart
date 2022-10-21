import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/model/product_model.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/service/get_service.dart';

class FavouriteController extends GetxController {
  void addToFavorite(Datum data) async {
    TurfHomeModel response = TurfHomeModel(
     // turfUserId: "63469bcad9ce0474dd70083c",
      data: [
        Datum(
          id: data.id,
          turfName: data.turfName,
          turfPlace: data.turfPlace,
          turfCreatorId: data.turfCreatorId,
          turfAmenities: TurfAmenities(
            turfCafeteria: data.turfAmenities!.turfCafeteria,
            turfDressing: data.turfAmenities!.turfDressing,
            turfParking: data.turfAmenities!.turfParking,
            turfGallery: data.turfAmenities!.turfGallery,
            turfWashroom: data.turfAmenities!.turfWashroom,
            turfWater: data.turfAmenities!.turfWater,
          ),
          turfCategory: TurfCategory(
            turfBadminton: data.turfCategory!.turfBadminton,
            turfCricket: data.turfCategory!.turfCricket,
            turfFootball: data.turfCategory!.turfFootball,
            turfYoga: data.turfCategory!.turfYoga,
          ),
          turfImages: TurfImages(
            turfImages1: data.turfImages!.turfImages1,
            turfImages2: data.turfImages!.turfImages2,
            turfImages3: data.turfImages!.turfImages3,
          ),
          turfInfo: TurfInfo(
            turfIsAvailable: data.turfInfo!.turfIsAvailable,
            turfMap: data.turfInfo!.turfMap,
            turfRating: data.turfInfo!.turfRating,
          ),
          // turfTime: TurfTime(
          //   timeAfternoon: data.turfTime!.timeAfternoon,
          //   timeEvening: data.turfTime!.timeEvening,
          //   timeMorning: data.turfTime!.timeMorning,
          // ),
          turfType: TurfType(
            turfSevens: data.turfType!.turfSevens,
            turfSixes: data.turfType!.turfSixes,
          ),
        ),
      ],
      status: true,
    );
    
    HomeService().addWishlist(response);
   
  }
}
