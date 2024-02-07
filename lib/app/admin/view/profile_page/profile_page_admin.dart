import 'package:ecommerce_int2/helper/app_properties.dart';
import 'package:ecommerce_int2/app/admin/view/others/contacts.dart';
import 'package:ecommerce_int2/main.dart';
import 'package:ecommerce_int2/app/admin/view/profile_page/showMessagesAdmin.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../user_and_seller/view/profile_page_content/faq_page.dart';
import '../../../user_and_seller/view/profile_page_content/restrict_seller.dart';
import '../../../user_and_seller/view/profile_page_content/restrict_user.dart';
import '../../../user_and_seller/view/profile_page_content/restricted_seller.dart';
import '../../../user_and_seller/view/profile_page_content/restricted_user.dart';
import '../../../user_and_seller/view/settings/settings_page.dart';
import 'extra_charges_admin.dart';


class ProfilePageAdmin extends StatelessWidget {
  static const routeName = "/ProfileAdmin";

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_statements

    final email = GoRouterState.of(context).extra as String;
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: kToolbarHeight),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  maxRadius: 48,
                  backgroundImage: AssetImage('assets/background.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    email,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8), bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: transparentYellow, blurRadius: 4, spreadRadius: 1, offset: Offset(0, 1))]),
                  height: 150,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                                icon: Image.asset('assets/icons/wallet.png'),
                                onPressed: () {
                                  launch(context, RestrictUser.routeName, email);
                                }),
                            Text(
                              'Restrict\nUser',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                          IconButton(
                            icon: Image.asset('assets/icons/truck.png'),
                            onPressed: () => launch(context, RestrictedUser.routeName, email),
                          ),
                          Text(
                            'Restricted\nUsers',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ]),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Image.asset('assets/icons/card.png'),
                              onPressed: () => launch(context, RestrictSeller.routeName, email),
                            ),
                            Text(
                              'Restrict\nSeller',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                          IconButton(
                            icon: Image.asset('assets/icons/contact_us.png'),
                            onPressed: () => launch(context, RestrictedSeller.routeName, email),
                          ),
                          Text(
                            'Restricted\nSeller',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ]),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: Text('User Contacts'),
                  subtitle: Text('View user contacts'),
                  leading: CircleAvatar(
                    foregroundImage: AssetImage('assets/icons/img_profile.png'),
                  ),
                  trailing: Icon(Icons.chevron_right, color: yellow),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ContactsList())),
                ),
                Divider(),
                ListTile(
                  title: Text('Settings'),
                  subtitle: Text('Privacy and logout'),
                  leading: Image.asset(
                    'assets/icons/settings_icon.png',
                    fit: BoxFit.scaleDown,
                    width: 30,
                    height: 30,
                  ),
                  trailing: Icon(Icons.chevron_right, color: yellow),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => SettingsPage())),
                ),
                Divider(),
                ListTile(
                  title: Text('Extra Charges'),
                  subtitle: Text('Help center and legal support'),
                  leading: Image.asset('assets/icons/support.png'),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: yellow,
                  ),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ExtraChargesAdmin())),
                ),
                Divider(),
                ListTile(
                  title: Text('Messages'),
                  subtitle: Text('Received Messages'),
                  leading: Image.asset('assets/icons/support.png'),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: yellow,
                  ),
                  onTap: () => launch(context, ShowMessagesAdmin.routeName, email),
                ),
                Divider(),
                ListTile(
                  title: Text('FAQ'),
                  subtitle: Text('Questions and Answer'),
                  leading: Image.asset('assets/icons/faq.png'),
                  trailing: Icon(Icons.chevron_right, color: yellow),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => FaqPage())),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
