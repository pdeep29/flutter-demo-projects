import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const routeName = '/movie-details';
  @override
  Widget build(BuildContext context) {
    final routeDetails =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final id = routeDetails['id'];
    final image = routeDetails['imageUrl'];
    final title = routeDetails['title'];
    final description = routeDetails['description'];
    final rating = routeDetails['rating'];
    final year = routeDetails['year'];
    final duration = routeDetails['duration'];
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                // printStatement();
                Navigator.pop(context);
                // Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        // title: const Center(child: Text('Movie Details')),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(children: <Widget>[
          Center(
            child: Card(
              elevation: 5,
              child: Hero(
                tag: id!,
                child: Container(
                  height: 450,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(image!),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title!,
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, letterSpacing: 2),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <
              Widget>[
            Card(
              elevation: 5,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.timer,
                      size: 45,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      duration!,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.calendar_today_rounded,
                      size: 45,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      year!,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.star_border,
                      size: 45,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      rating!,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )
          ]),
          const SizedBox(
            height: 20,
          ),
          Text(
            description!,
            style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ]),
      ),
      bottomNavigationBar: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(
                shape: (const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                )),
                backgroundColor: Colors.lightBlue,
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const <Widget>[
                  Icon(
                    Icons.play_circle_outline,
                    color: Colors.white,
                  ),
                  Text(
                    'Watch Trailer',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),

              // child:
              onPressed: () {},
            ),
            // TextButton(
            //   style: TextButton.styleFrom(backgroundColor: Colors.blue),
            //   child: Text(
            //     'Book Now',
            //     style: TextStyle(color: Colors.white),
            //   ),
            //   onPressed: () {},
            // ),
          ),
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(
                shape: (const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                )),
                backgroundColor: Colors.lightGreen,
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 5,
                    width: 5,
                  ),
                  Text(
                    'Buy Now',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),

              // child:
              onPressed: () {},
            ),
            // TextButton(
            //   style: TextButton.styleFrom(backgroundColor: Colors.blue),
            //   child: Text(
            //     'Book Now',
            //     style: TextStyle(color: Colors.white),
            //   ),
            //   onPressed: () {},
            // ),
          ),
        ],
      ),
    );
  }
}
