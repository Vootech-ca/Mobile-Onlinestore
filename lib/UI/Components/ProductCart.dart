import 'package:flutter/material.dart';
import 'package:mobile_onlinestore/Helper/Responsive.dart';
import 'package:mobile_onlinestore/Helper/ThemeOf.dart';
import 'package:simple_grid/simple_grid.dart';

SpGridItem ProductCard(BuildContext context) {
  return SpGridItem(
    xs: 6,
    sm: 4,
    md: 3,
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
              child: Image.network(
                'https://sc04.alicdn.com/kf/HTB1XZmDJFXXXXaAXFXX760XFXXXb.png',
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
              'Wholesale Kindergarten Uniform,Children White Blue Shirts kids clothes',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: textTheme(context).bodyText1),
          SizedBox(height: 10),
          Text('\$ 77',
              style: textTheme(context)
                  .button
                  ?.copyWith(fontWeight: FontWeight.w300)),
        ],
      ),
    ),
  );
}
