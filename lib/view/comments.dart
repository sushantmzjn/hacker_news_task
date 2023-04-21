import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hacker_news/model/story_data.dart';
import 'package:hacker_news/provider/comment_provider.dart';

import '../services/comments_services.dart';

class Comments extends ConsumerWidget {
  final StoryData storyData;
  Comments({required this.storyData});

  @override
  Widget build(BuildContext context, ref) {
    final commentData = ref.watch(commentsProvider(storyData.kids));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        title: Text('Comments'),
      ),
        body: commentData.when(
            data: (data){
            return data.isEmpty ? Center(child : Text('No Comments',style: TextStyle(fontSize: 16.sp),))
                : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(3,3)
                                  )
                                ]
                            ),
                            child: ListTile(
                              leading: Icon(CupertinoIcons.person_fill),
                              title: Text(data[index].by),
                              subtitle: Text(data[index].text),
                            ),
                          ),
                        )
                      ],
                    );
                  });
            },
            error: (error, stack)=> Center(child: Text('$error')),
            loading: ()=> Center(child: CupertinoActivityIndicator(radius: 18, color: Colors.blue,)))

        );
  }
}
