import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hiring_task/application/albums/albums_details_bloc.dart';
import 'package:hiring_task/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:hiring_task/presentation/album_details/widgets/photo_details.dart';

final log = getLogger();

class AlbumPhotosList extends StatelessWidget {
  final AlbumDetailsFetched success;

  const AlbumPhotosList({Key? key, required this.success}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider.builder(
        itemCount: success.album.photosList!.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            PhotoDetails(success: success, itemIndex: itemIndex),
        options: buildCarouselOptions(context),
      ),
    );
  }

  CarouselOptions buildCarouselOptions(BuildContext context) {
    return CarouselOptions(
      height: MediaQuery.of(context).size.height * 0.75,
      aspectRatio: 16 / 9,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      onPageChanged:
          (int index, CarouselPageChangedReason carouselPageChangedReason) {
        log.i(
            "index:$index carouselPageChangedReason:$carouselPageChangedReason");
      },
      scrollDirection: Axis.horizontal,
    );
  }
}
