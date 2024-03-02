import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/model/bundle/bundle-model.dart';
import '../../../utils/constants/app-size.dart';

class BundleCard extends StatelessWidget {
  final BundleModel bundle;
  const BundleCard({super.key, required this.bundle});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: bundle.displayIcon!,
            height: AppSize.screenHeight! * 0.23,
            width: AppSize.screenWidth,
            fit: BoxFit.fill,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: Text(bundle.displayName!, style: Get.textTheme.bodyLarge!),
            ),
          ),
        ],
      ),
    );
  }
}
