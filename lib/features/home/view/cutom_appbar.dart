import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key, required this.image, required this.context}) : super(key: key);

  String image;
  BuildContext context;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size(MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height);

}

class _CustomAppBarState extends State<CustomAppBar> {

  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    final image = Image.network(
      widget.image,
      fit: BoxFit.fill,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
    );
    return PreferredSize(
        preferredSize: widget.preferredSize,
        child: Stack(
          children: [
            Container(
              child: image,
            ),
            Positioned(
                top: 20,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: Navigator.of(context).pop,
                                icon: const Icon(Icons.arrow_back), color: Colors.white,),
                            Text('Event Details', style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),),
                          ],
                        ),
                        IconButton(onPressed: (){
                          setState(() {
                            isBookmarked = !isBookmarked;
                          });
                        }, icon: isBookmarked ? const Icon(Icons.bookmark, color: Colors.white,) : const Icon(Icons.bookmark_add_outlined, color: Colors.white,))
                      ],
                    ),
                  ),
                )),

          ],
        ));
  }
}
