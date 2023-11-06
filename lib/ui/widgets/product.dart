import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/app_assets.dart';
import '../utils/app_color.dart';

class Product extends StatefulWidget {

  Product();

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(6),
        width: MediaQuery.of(context).size.width * .4,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightBlue),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.network(
                  "",
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * .15,
                ),
                Image.asset(
                  AppAssets.icFav,
                )
              ],
            ),
            Spacer(),
            Text(
              "",
              textAlign: TextAlign.start,
              maxLines: 2,
              style: TextStyle(height: 1),
            ),
            Spacer(),
            Row(
              children: [
                Text("Review()"),
                Icon(
                  Icons.star,
                  color: Colors.amberAccent,
                ),
              ],
            ),
            Row(
              children: [
                Text("EGP "),
                Spacer(),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: FloatingActionButton(
                    backgroundColor: AppColors.primaryColor,
                    onPressed: () {

                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}