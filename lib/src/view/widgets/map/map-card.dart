import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/model/map/map-model.dart';
import '../../../utils/constants/app-size.dart';

class MapCard extends StatelessWidget {
  final MapModel map;
  final VoidCallback onTap;
  const MapCard({super.key, required this.map, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: map.splash!,
        child: SizedBox(
          height: AppSize.screenHeight! * 0.25,
          width: AppSize.screenWidth,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: 0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(7)),
                  child: CachedNetworkImage(
                    imageUrl: map.splash!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                left: 15,
                top: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      map.displayName!,
                      style: Get.textTheme.displaySmall!.copyWith(fontSize: 30),
                    ),
                    Text(
                      map.coordinates!,
                      style: Get.textTheme.bodyLarge!.copyWith(
                        fontFamily: "Bebas Neue",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
