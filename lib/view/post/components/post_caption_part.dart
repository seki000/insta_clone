import 'package:flutter/material.dart';
import 'package:insta_clone/view/post/screens/enlarge_image_screen.dart';
import 'package:insta_clone/view_models/post_view_model.dart';
import 'package:provider/provider.dart';
import '../../../utils/constants.dart';
import 'hero_image.dart';

class PostCaptionPart extends StatelessWidget {
  final PostCaptionOpenMode from;
  const PostCaptionPart({required this.from});

  @override
  Widget build(BuildContext context) {
      if (from == PostCaptionOpenMode.FROM_POST) {
      final postViewModel = Provider.of<PostViewModel>(context);
      final image = (postViewModel.imageFile != null)
          ? Image.file(postViewModel.imageFile!)
          : Image.asset("assets/images/no_image.png");

      return ListTile(
        //TODO
        leading: HeroImage(
          image: image,
          onTap: () => _displayLargeImage(context, image),
        ),
        //TODO
        // title: PostCaptionInputTextField(),
      );
    } else {
      return Container();
      //TODO
    }
  }

  _displayLargeImage(BuildContext context, Image image) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => EnlargeImageScreen(image: image)));
  }
}
