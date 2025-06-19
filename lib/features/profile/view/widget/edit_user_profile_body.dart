import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/core/styles/text_styles.dart';
import 'package:furniture_app/core/widgets/custom_button.dart';
import 'package:furniture_app/core/widgets/custom_text_form_field.dart';
import 'package:furniture_app/features/profile/view/widget/profile_photo_bottom_sheet.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../core/styles/colors_app.dart';
import '../../../../core/styles/image_app.dart';
import '../../../../core/widgets/country_code_picker.dart';
import 'package:path/path.dart' as path;
class EditUserProfileBody extends StatefulWidget {
  const EditUserProfileBody({super.key});

  @override
  State<EditUserProfileBody> createState() => _EditUserProfileBodyState();
}

class _EditUserProfileBodyState extends State<EditUserProfileBody> {
  File? _savedImage;
  Future<void> _pickImage(ImageSource source) async {
    // Request permissions
    if (source == ImageSource.camera) {
      final cameraStatus = await Permission.camera.request();
      if (!cameraStatus.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Camera permission denied')),
        );
        Navigator.pop(context);
        return;
      }
    }
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: source,
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 80,
      );

      if (pickedFile != null) {
        final appDir = await getApplicationDocumentsDirectory();
        final fileName = path.basename(pickedFile.path);
        final savedImage = await File(pickedFile.path).copy('${appDir.path}/$fileName');

        setState(() {
          _savedImage = savedImage;
        });
      }
    } catch (e) {
      print('Error picking image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image. Please try again.')),
      );
    }
    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 80.r,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    ImageApp.chair,
                    fit: BoxFit.cover,
                  ),
                ),
                CircleAvatar(
                    radius: 26.r,
                    backgroundColor: ColorsApp.kBackGroundColor,
                    child: IconButton(
                      onPressed: () => showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                        ),
                        builder: (_) => ProfilePhotoBottomSheet(
                          onCameraTap: () => _pickImage(ImageSource.camera),
                          onGalleryTap: () => _pickImage(ImageSource.gallery),
                          onDeleteTap: () {
                            setState(() {
                              _savedImage = null;
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      icon: const Icon(
                        Icons.camera_alt,
                        color: ColorsApp.kPrimaryColor,
                      ),
                    )),
              ],
            ),
            SizedBox(height: 25.h),
            CustomTextFormField(hintText: "Full Name"),
            SizedBox(height: 20.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CountryCodePicker(
                  onChanged: (code) {
                    print('Selected code: $code');
                  },
                ),
                SizedBox(width: 8.w),
                Expanded(child: CustomTextFormField(hintText: "Phone")),
              ],
            ),
            SizedBox(height: 20.h),
            CustomTextFormField(hintText: "Email"),
            SizedBox(height: 20.h),
            CustomTextFormField(hintText: "Address"),
            SizedBox(height: 20.h),
            CustomButton(
              text: "Save",
              style: TextStyles.white18,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
