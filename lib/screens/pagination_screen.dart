import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/photo_model.dart';
import 'package:flutter_tutorial/providers/user_provider.dart';
import 'package:flutter_tutorial/utils/utils.dart';
import 'package:provider/provider.dart';

class PaginationScreen extends StatefulWidget {
  const PaginationScreen({super.key});

  @override
  State<PaginationScreen> createState() => _PaginationScreenState();
}

class _PaginationScreenState extends State<PaginationScreen> {
  late UserProvider provider;
  bool isLoading = true;
  bool loader = false;
  @override
  void initState() {
    provider = Provider.of<UserProvider>(context, listen: false);
    pagination();
    super.initState();
  }

  int offset = 1;
  bool paginate = true;

  void pagination() {
    if (!paginate) return;
    setState(() {
      loader = true;
    });
    provider.getPhotos(offset: offset).then((value) {
      isLoading = false;

      if (value < 10) paginate = false;
      loader = false;
      offset++;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photos'), centerTitle: true),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: Selector<UserProvider, List<PhotoModel>>(
                    selector: (ctx, p1) => p1.photos,
                    builder: (context, list, child) {
                      return NotificationListener(
                        onNotification: (notification) =>
                            Utils.scrollNotifier(notification, pagination),
                        child: GridView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: list.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) => GridTile(
                            footer: Text(list[index].author),
                            child: Image.network(list[index].pic),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (loader) const Center(child: CircularProgressIndicator())
              ],
            ),
    );
  }
}
