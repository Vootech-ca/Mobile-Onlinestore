import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile_onlinestore/Helper/Responsive.dart';
import 'package:mobile_onlinestore/Helper/ThemeOf.dart';
import 'package:mobile_onlinestore/Models/ItemModel.dart';
import 'package:mobile_onlinestore/UI/Screens/DetailsScreen/DetailsScreen.dart';
import 'package:simple_grid/simple_grid.dart';

import '../../Constants.dart';
import '../../dummyData.dart';

SpGridItem ProductCard(BuildContext context, Item item) {
  return SpGridItem(
    xs: 6,
    sm: 4,
    md: 3,
    child: GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, DetailsScreen.routeDetailsScreen,arguments: item),
      child: Container(
        // margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(8.0),
        width: Responsive.sW(context) / 2,
        decoration: BoxDecoration(
          color: theme(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              spreadRadius: 1,
              offset: Offset(1, 1),
              color: theme(context).primaryColor,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
              child: Center(
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: productImageDummy,
                  placeholder: (context, url) =>
                      Image.asset(Constants.placeHolder),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(item.itemTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textTheme(context).bodyText1),
            SizedBox(height: 10),
            Text('\$ ${item.itemPrice}',
                style: textTheme(context)
                    .button
                    ?.copyWith(fontWeight: FontWeight.w300)),
          ],
        ),
      ),
    ),
  );
}
