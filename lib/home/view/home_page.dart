import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_hotspot/app/app.dart';
import 'package:prayer_hotspot/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hotspot'),
          actions: <Widget>[
            IconButton(
              key: const Key('homePage_logout_iconButton'),
              icon: const Icon(Icons.exit_to_app),
              onPressed: () =>
                  context.read<AppBloc>().add(AppLogoutRequested()),
            )
          ],
        ),
        body: (deviceWidth >= 600 && deviceWidth < 1000)
            ? TabletUI()
            : SizedBox());
  }
}

class TabletUI extends StatelessWidget {
  const TabletUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          NavigationRail(
              extended: deviceWidth > 770 ? true : false,
              destinations: [
                NavigationRailDestination(
                    icon: Icon(Icons.home), label: Text("Home")),
                NavigationRailDestination(
                    icon: Icon(Icons.home), label: Text("Home"))
              ],
              selectedIndex: 0),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 500),
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: 30,
                      itemBuilder: (context, index) {
                        return Card(
                            elevation: 0,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      height: 300,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://images.pexels.com/photos/2387873/pexels-photo-2387873.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                                              fit: BoxFit.cover))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ));
                      }),
                )),
          ),
        ],
      ),
    );
  }
}
