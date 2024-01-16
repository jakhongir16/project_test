import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class CarouselImageConstruction extends StatefulWidget {
  CarouselImageConstruction({super.key, required this.imageUrls});
  List<String> imageUrls;

  @override
  State<CarouselImageConstruction> createState() => _CarouselImageConstructionState();
}

class _CarouselImageConstructionState extends State<CarouselImageConstruction> {
  int present = 0;
  int imageChosen  = 0;
  final List<Image> pictures = [];
  @override
  void initState() {
    super.initState();
    for(var url in widget.imageUrls){
      pictures.add(
        Image.network(
          url,
          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
            return const Center(child: Text('Изображение не найдено'),
            );
          },
        )
      );
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for(var picture in pictures){
      precacheImage(picture.image, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children : [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: SizedBox(
            child: CarouselSlider(
              items: pictures,

              options: CarouselOptions(
                viewportFraction: 1,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                autoPlay: false,
                aspectRatio: 16 / 9,
                pageSnapping: true,
                onPageChanged: (index, reason){
                  setState(() {
                    present = index;
                  });
                }
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7.5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: widget.imageUrls.map((url){
                    int index = widget.imageUrls.indexOf(url);
                    double opacity = 1.0 / (index + 1);
                    return Container(
                      width: 7.0,
                      height: 7.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 2.5,
                        vertical: 5
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: present == index
                          ? Colors.black
                          : Colors.grey.withOpacity(opacity),
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        )
        ],

    );
  }
}


// CarouselSlider.builder(
// itemCount: widget.imageUrls.length,
// itemBuilder: (_, index, __) => Container(
// clipBehavior: Clip.antiAlias,
// decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
// child: Image.network(widget.imageUrls[index],
// fit: BoxFit.cover,
// errorBuilder: (context, error, stackTrace) =>
// const Icon(Icons.error, size: 32)),
// ),
// options: CarouselOptions(
// height: 257,
// aspectRatio: 1.33,
// viewportFraction: 1,
// onPageChanged: (index, _) => setState(() => (imageChosen = index)),
// ),
// );