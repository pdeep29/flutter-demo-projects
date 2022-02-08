import 'package:flutter/material.dart';
import 'package:my_app/screens/question_screen.dart';
import '../model/movie.dart';
import '../widget/top_movie_list.dart';
import '../widget/horizontal_list.dart';
import '../widget/vertical_list.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                // printStatement();
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: const Center(child: Text('Movies')),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Open shopping cart',
            onPressed: () {
              Navigator.pushNamed(context, QuestionScreenState.routeName);
              //  printStatement();
            },
          ),
        ],
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
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Recomented',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    child: const Text("View All"),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Container(
              height: 280,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movieList.length,
                  itemBuilder: (cx, i) => HorizontalList(i)

                  // children: <Widget>[
                  //   HorizontalList(),
                  //   HorizontalList(),
                  //   HorizontalList(),
                  //   HorizontalList(),
                  //   HorizontalList(),
                  //   HorizontalList(),
                  // ],
                  ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Best Of 2019',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    child: const Text("View All"),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Container(
              height: 630,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                  // scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: bestMovieList.length,
                  itemBuilder: (cx, i) => VerticalList(i)),

              // ListView(
              //   // physics: NeverScrollableScrollPhysics(),
              //   children: <Widget>[
              //     VerticalList(),
              //     VerticalList(),
              //     VerticalList(),
              //     VerticalList(),
              //     VerticalList(),
              //     VerticalList(),
              //     VerticalList(),
              //     VerticalList(),
              //   ],
              // ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Top Rated Movies',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    child: const Text("View All"),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Container(
              height: 280,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: topRatedMovieList.length,
                  itemBuilder: (cx, i) => TopMovieList(i)),
            ),
          ],
        ),
      ),
    );
  }
}
