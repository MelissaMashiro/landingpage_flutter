import 'package:flutter/material.dart';
import 'package:flutter_landing/providers/page_provider.dart';
import 'package:flutter_landing/ui/shared/custom_app_menu.dart';
import 'package:flutter_landing/ui/views/about_view.dart';
import 'package:flutter_landing/ui/views/contact_view.dart';
import 'package:flutter_landing/ui/views/home_view.dart';
import 'package:flutter_landing/ui/views/location_view.dart';
import 'package:flutter_landing/ui/views/pricing_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stack(
        children: [HomeBody(), Positioned(right: 0, child: CustomAppMenu())],
      ),
    ));
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context,listen: false);

    return PageView(
      controller: pageProvider.scrollController,
      scrollDirection: Axis.vertical,
      children: [
        HomeView(),
        AboutView(),
        PricingView(),
        ContactView(),
        LocationView(),
        
      ],
    );
  }
}
