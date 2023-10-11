import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:contentpub_admin/state_container.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  final double maxWidth;
  const BannerWidget({super.key, required this.maxWidth});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  String? tenantId;
  String? coworkerId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: buildBanner(widget.maxWidth),
        builder: (context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.hasData) {
            return snapshot.data ?? CircularProgressIndicator();
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  Future<Widget> buildBanner(double maxWidth) async {
    if (maxWidth <= 300) {
      // Mobile view with small image on the left
      return Container(
        height: 80,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Image.network(
              'https://javawebdevelopmentcom-production-public.s3.eu-central-1.amazonaws.com/logo.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      );
    } else {
      // Desktop view with full-width banner

      if (await StateContainer.of(context).isUserSignedIn()) {
        return Container(
          height: 80,
          width: maxWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Image.network(
                    'https://javawebdevelopmentcom-production-public.s3.eu-central-1.amazonaws.com/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Text('${StateContainer.of(context).tenantId ?? 'unknown tenant'}'),
                  ElevatedButton(
                      onPressed: () {
                        Amplify.Auth.signOut();
                      },
                      child: const Text('Logout')),
                ],
              )
            ],
          ),
        );
      }

      return Container(
        height: 80,
        width: maxWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 20),
                child: InkWell(
                  child: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Image.network(
                        'https://javawebdevelopmentcom-production-public.s3.eu-central-1.amazonaws.com/logo.png',
                        fit: BoxFit.cover,
                      )),
                  onTap: () {
                    //  StateContainer.of(context).appRouterDelegate.gotoHome();
                  },
                ),
              ),
            ),
            Text(StateContainer.of(context).authUser.username)
          ],
        ),
      );
    }
  }
}
