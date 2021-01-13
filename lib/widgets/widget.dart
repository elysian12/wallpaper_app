import 'package:flutter/material.dart';
import 'package:wallpaper_app/models/wallpaper_model.dart';
import 'package:wallpaper_app/views/image_view.dart';

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Wallpaper",
        style: TextStyle(color: Colors.black87, fontSize: 16),
      ),
      Text(
        "Atals",
        style: TextStyle(color: Colors.blue, fontSize: 16),
      )
    ],
  );
}

Widget createdBy() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Created By :",
        style: TextStyle(
            color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w400),
      ),
      Text(
        "Aman Singh",
        style: TextStyle(
            color: Colors.blue, fontSize: 14, fontWeight: FontWeight.w400),
      )
    ],
  );
}

Widget wallpaperList({List<WallpaperModel> wallpapers, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallpaper) {
        return GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageView(
                            imgUrl: wallpaper.scr.portrait,
                          )));
            },
            child: Hero(
              tag: wallpaper.scr.portrait,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    child: Image.network(
                      wallpaper.scr.portrait,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
