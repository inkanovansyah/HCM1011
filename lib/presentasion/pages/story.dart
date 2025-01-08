import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'package:hcm1011/presentasion/bloc/bloc_delate_story/delate_story_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_story/bloc_list_story_bloc.dart';
import 'package:hcm1011/data/model/liststory.dart';
import 'package:hcm1011/presentasion/pages/upload.dart';

class Story extends StatefulWidget {
  const Story({super.key});

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
    Future.microtask(
        () => context.read<BlocListStoryBloc>().add(const Fetchlist()));
  }

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    if (token.isNotEmpty) {
      bool isExpired = JwtDecoder.isExpired(token);
      if (isExpired) {
        showSessionTimeoutDialog();
      }
    } else {
      showSessionTimeoutDialog();
    }
  }

  void showSessionTimeoutDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Session Timeout"),
          content: const Text("You have been logged out due to inactivity."),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("Login"),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/login');
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkdarkBlueColor,
        centerTitle: true,
        elevation: 0.0,
        title: const Text(
          'Heroes Stories',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous page
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Screen()),
              );
            },
            icon: const Icon(Icons.add_circle_outline, color: Colors.white),
          ),
        ],
      ),
      backgroundColor: const Color(0xffEEF2FD),
      body: _buildCarousel(),
    );
  }

  Widget _buildCarousel() {
    return BlocListener<DelateStoryBloc, DelateStoryState>(
      listener: (context, state) {
        if (state is DelateStoryLoaded) {
          context.read<BlocListStoryBloc>().add(Fetchlist());
        }
      },
      child: BlocBuilder<BlocListStoryBloc, BlocListStoryState>(
        builder: (context, state) {
          if (state is BlocListStoryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BlocListStoryLoaded) {
            final filteredStoryList = state.storyList
                ?.where((story) => story.is_delete == '0')
                .toList();

            if (filteredStoryList == null || filteredStoryList.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/status/no_info.png'),
                    const SizedBox(height: 6),
                    const Text(
                      'No data available',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            }

            return PageView.builder(
              itemCount: filteredStoryList.length,
              controller: PageController(viewportFraction: 1.0),
              itemBuilder: (context, index) {
                final story = filteredStoryList[index];
                return _buildStoryItem(context, story);
              },
            );
          } else if (state is BlocListStoryError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('Data kosong...'));
          }
        },
      ),
    );
  }

  Widget _buildStoryItem(BuildContext context, Datums story) {
    return FutureBuilder<String?>(
      future: _getEmployeeIdFromSharedPreferences(),
      builder: (context, snapshot) {
        return Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                story.source ?? '',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      story.nameFile ?? '',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      story.description ?? '',
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
            if (story.employeeId == snapshot.data)
              Positioned(
                top: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Icon Download dengan Lingkaran Putih
                    GestureDetector(
                      onTap: () async {
                        await _saveImageToGallery(story.source ?? '');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // Warna lingkaran putih
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(8), // Padding lingkaran
                        child: const Icon(Icons.download, color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Icon Delete dengan Lingkaran Putih
                    GestureDetector(
                      onTap: () {
                        context
                            .read<DelateStoryBloc>()
                            .add(DeleteStory(id: story.storyId!));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // Warna lingkaran putih
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(8), // Padding lingkaran
                        child: const Icon(Icons.delete, color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }

  Future<void> _saveImageToGallery(String url) async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      var response = await http.get(Uri.parse(url));
      final result = await ImageGallerySaver.saveImage(
        response.bodyBytes,
        quality: 100,
        name: "downloaded_image",
      );

      if (result['isSuccess']) {
        Fluttertoast.showToast(msg: "Image saved successfully!");
      } else {
        Fluttertoast.showToast(msg: "Failed to save image.");
      }
    } else {
      Fluttertoast.showToast(msg: "Storage permission denied.");
    }
  }

  Future<String?> _getEmployeeIdFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('employee_id');
  }
}
