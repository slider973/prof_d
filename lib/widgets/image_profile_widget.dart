import 'dart:io';
import 'dart:async';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:image_picker/image_picker.dart';
import '../repositories/user_repository.dart';

FirebaseStorage storage = FirebaseStorage.instance;
FirebaseFunctions cloudFunctions = FirebaseFunctions.instance;

class ImageProfileWidget extends StatefulWidget {
  final String userPhotoUrl;
  const ImageProfileWidget({
    Key? key,
    required this.userPhotoUrl,
  }) : super(key: key);

  @override
  State<ImageProfileWidget> createState() => _ImageProfileWidgetState();
}

class _ImageProfileWidgetState extends State<ImageProfileWidget> {
  final userID = FirebaseAuth.instance.currentUser!.uid;
  File? _image;
  final picker = ImagePicker();
  bool loading = true;

  Future<void> sendPhotoToFirebase(String namePhoto) async {
    Reference storageRef =
        storage.ref('Users').child('photoProfile').child(namePhoto);
    UploadTask uploadTask = storageRef.putFile(_image!);
    await uploadTask.whenComplete(() => print('File Upload'));
    final String link = await storageRef.getDownloadURL();
    UserRepository.updatePathUserDoc(userID, 'image', link);
  }

  Future getImage() async {
    try {
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
          sendPhotoToFirebase('$userID.png');
        } else {
          print('No image selected.');
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FxContainer(
      paddingAll: 0,
      borderRadiusAll: 24,
      child: InkWell(
        onTap: () => getImage(),
        child: SizedBox(
          height: 150,
          width: 150,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(widget.userPhotoUrl),
          ),
        ),
      ),
    );
  }
}
