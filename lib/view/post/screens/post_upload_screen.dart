import 'package:flutter/material.dart';
import 'package:insta_clone/generated/l10n.dart';
import 'package:insta_clone/utils/constants.dart';
import 'package:insta_clone/view_models/post_view_model.dart';
import 'package:provider/provider.dart';

import '../components/post_caption_part.dart';

class PostUploadScreen extends StatelessWidget {
  final UploadType uploadType;

  const PostUploadScreen({required this.uploadType});

  @override
  Widget build(BuildContext context) {
    Future(() {
      final postViewModel = context.read<PostViewModel>();
      if (!postViewModel.isImagePicked && !postViewModel.isProcessing) {
        postViewModel.pickImage(uploadType);
      }
    });

    return Consumer<PostViewModel>(builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
            leading: model.isProcessing
                ? Container()
                : IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => _cancelPost(context),
                  ),
            title: model.isProcessing
                ? Text(S.of(context).underProcessing)
                : Text(S.of(context).post),
            actions: [
              (model.isProcessing || !model.isImagePicked)
                  ? IconButton(
                      onPressed: () => _cancelPost(context),
                      icon: Icon(Icons.close))
                  : IconButton(
                      onPressed: () => null, //TODO 投稿処理
                      icon: Icon(Icons.done))
            ]),
        body: model.isProcessing
            ? Center(
                child: CircularProgressIndicator(),
              )
            : model.isImagePicked
                ? Column(
                    children: [
                      Divider(),
                     PostCaptionPart(from: PostCaptionOpenMode.FROM_POST),
                     // HeroImage(image: image, onTap: onTap),
                      Divider(),
                      // PostLocationPart(),
                      Divider(),
                    ],
                  )
                : Container(),
      );
    });
  }

  _cancelPost(BuildContext context) {
    //TODO viewModel

    Navigator.pop(context);
  }
}
