import 'dart:typed_data';
import 'package:digimanage/screens/profile/you_screen/utils.dart';
import 'package:digimanage/services/storage_service.dart';
import 'package:digimanage/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../models/user.dart';
import '../../../../services/user_data_database_service.dart';

class EditProfile extends StatefulWidget {
  final UserData userData;

  const EditProfile(this.userData);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Uint8List? _image;

  bool loading = false;
  dynamic res;

  final _formKey = GlobalKey<FormState>();
  final UserDatabaseService _userDatabaseService = UserDatabaseService();
  final StorageService _storageService = StorageService();

  //late UserData userData;



  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  Future<void> updateUserData(UserData userData) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });

      if (_image != null) {
        userData.dpUrl = await _storageService.uploadImage(_image!,userData.uid);
      }
      _userDatabaseService.updateUserData(userData);
      res = await UserDatabaseService.getCurUserData();
      if (res != null) {
        loading = false;
        Navigator.pop(context, userData);
        showSnackBar("profile updated successfully", context);
      }
    }
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserData userData = widget.userData;

    return Scaffold(
      appBar: AppBar(
        title: const Text("You"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, userData);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        actions: [
          IconButton(
                  onPressed: () async {
                    updateUserData(userData);
                  },
                  icon: const Icon(
                    Icons.done,
                  ))
        ],
      ),
      body: loading == true
          ? const Center(child: CircularProgressIndicator(color: Colors.blue,))
          : Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        _image == null
                            ? ProfilePic.netIm(userData.dpUrl)
                            : ProfilePic(_image),
                        Positioned(
                            left: 70,
                            bottom: -10,
                            child: IconButton(
                              icon: const Icon(Icons.add_a_photo),
                              onPressed: selectImage,
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(hintText: "Full Name"),
                            initialValue: userData.name,
                            validator: (val) =>
                                val!.isEmpty ? "Enter full name" : null,
                            onChanged: (val) {
                              setState(() => userData.name = val);
                            },
                          ), // Full Name

                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 130,
                                child: TextFormField(
                                  decoration: InputDecoration(hintText: "Year"),
                                  initialValue: userData.year,
                                  validator: (val) =>
                                      val!.isEmpty ? "Enter Year" : null,
                                  onChanged: (val) {
                                    setState(() => userData.year = val);
                                  },
                                ),
                              ), //Year
                              SizedBox(
                                width: 180,
                                child: TextFormField(
                                  //keyboardType: TextInputType.numberWithOptions(),
                                  decoration:
                                      InputDecoration(hintText: "Branch"),
                                  initialValue: userData.branch,
                                  validator: (val) =>
                                      val!.isEmpty ? "Enter branch" : null,
                                  onChanged: (val) {
                                    setState(() => userData.branch = val);
                                  },
                                ),
                              ), //Branch
                            ],
                          )
                        ]),
                  )
                ],
              ),
            ),
    );
  }
}
