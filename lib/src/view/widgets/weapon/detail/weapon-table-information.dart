import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/app-color.dart';

class WeaponTableInformation extends StatelessWidget {
  final Map<String, dynamic> map;
  final Color color;

  const WeaponTableInformation({
    Key? key,
    required this.map,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: AppColor.grey8, width: 1),
      children: [
        for (int index = 0; index < map.length; index++)
          TableRow(
            decoration: index % 2 == 0 ? BoxDecoration(color: color) : null,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  map.keys.elementAt(index),
                  style: Get.textTheme.bodyLarge!.copyWith(
                    fontSize: 13,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  map.values.elementAt(index).toString(),
                  style: Get.textTheme.bodyLarge!.copyWith(
                    fontSize: 13,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
