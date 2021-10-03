import 'package:flutter/material.dart';

class Logo {
  Widget logoWigdet(String logoImage) {
    return SizedBox(
      height: 200,
      width: 200,
      child: InkWell(
        onTap: () {},
        child: Image.network(
          logoImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
