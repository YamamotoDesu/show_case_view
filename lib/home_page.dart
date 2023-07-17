import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _add = GlobalKey();
  final GlobalKey _item = GlobalKey();
  final GlobalKey _search = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ShowCaseWidget.of(context).startShowCase([_add, _item, _search]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: false,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Showcase(
              key: _search,
              description: 'Tap to search item',
              overlayOpacity: 0.5,
              targetShapeBorder: const CircleBorder(),
              targetPadding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.search,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Showcase(
        key: _add,
        description: 'Tap to add on item',
        overlayOpacity: 0.5,
        targetShapeBorder: const CircleBorder(),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
        ),
      ),
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) => index == 4
            ? Showcase(
                key: _item,
                overlayOpacity: 0.5,
                description: 'Tap to see details',
                child: listItem(index),
              )
            : listItem(index),
      ),
    );
  }

  listItem(int index) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.green,
        child: Icon(Icons.apps),
      ),
      title: Text('Flutter Title Example $index'),
      subtitle: Text('Flutter sub title data $index'),
      trailing: const Text('July 2023'),
    );
  }
}
