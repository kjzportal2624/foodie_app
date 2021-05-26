import 'package:flutter/material.dart';
import 'package:foodie_app/constants/style.dart';
import 'package:foodie_app/screens/login_screen/login_screen.dart';
import 'package:foodie_app/services/local_storage_service.dart';
import 'package:foodie_app/services/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_app/blocs/logout_bloc/logout_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndialog/ndialog.dart';

class AccountDrawer extends StatelessWidget {
  const AccountDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils();
    final LocalStorageService localStorageService = LocalStorageService();

    return Drawer(
      child: BlocListener<LogoutBloc, LogoutState>(
        listener: (context, state) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ProgressDialog pd = ProgressDialog(
            context,
            blur: 5.0,
            dismissable: false,
            dialogTransitionType: DialogTransitionType.Shrink,
            transitionDuration: Duration(milliseconds: 100),
            message: Text(
              "Logging out",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            title: null,
          );

          if (state is LogoutError) {
            /* Close the dialog */
            Navigator.pop(context);

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
              (Route<dynamic> route) => false,
            );
          }

          if (state is LogoutLoading) {
            pd.show();
          }

          if (state is LogoutSuccess) {
            pd.dismiss();

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
              (Route<dynamic> route) => false,
            );
          }
        },
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: kColorBlack,
                image: DecorationImage(
                  image: AssetImage('assets/images/pizza.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(kColorBlack.withOpacity(0.5), BlendMode.dstATop),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi there 😊!',
                    style: kTitleHeading.copyWith(color: kColorWhite, fontSize: 35.sp),
                  ),
                  SizedBox(height: 10.0.h),
                  Text(
                    'Welcome to Foodie App!',
                    style: kTitleHeading.copyWith(color: kColorWhite, fontSize: 35.sp),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0.h),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      boxShadow: [
                        BoxShadow(color: kColorGrey, offset: Offset(0.0, 0.0), blurRadius: 6.0),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 66.0.w,
                      backgroundColor: kColorWhite,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/user.jpg'),
                        radius: 60.0.w,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0.h),
                  Text(localStorageService.user!.name, style: kTextRegular.copyWith(fontWeight: FontWeight.w800)),
                  SizedBox(height: 5.0.h),
                  Text(utils.formatDate(DateTime.now()), style: kTextRegular.copyWith(fontStyle: FontStyle.italic)),
                  SizedBox(height: 15.0.h),
                  Text(localStorageService.user!.course, style: kTextRegular),
                  SizedBox(height: 5.0.h),
                  Text(localStorageService.user!.school, style: kTextRegular),
                  SizedBox(height: 35.0.h),
                  TextButton.icon(
                    onPressed: () => context.read<LogoutBloc>().add(LogoutAccount()),
                    icon: Icon(Icons.logout, size: kIconSize),
                    label: Text('Logout', style: kTextRegular.copyWith(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
