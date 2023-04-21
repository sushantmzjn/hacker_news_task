import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hacker_news/services/stories_services.dart';
import 'package:hacker_news/view/comments.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final storyId = ref.watch(story);
    return Scaffold(
        body: CustomScrollView(
      shrinkWrap: true,
      slivers: [
        SliverAppBar(
          pinned: true,
          backgroundColor: Colors.red,
          expandedHeight: 250,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text('Hacker News', style: TextStyle(letterSpacing: 0.5, fontSize: 20.0),
            ),
            titlePadding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
            background: Image.asset('images/hacker_news.jpeg', fit: BoxFit.fill),
          ),
        ),
        SliverToBoxAdapter(
          child: storyId.when(
              data: (data) {
                return ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(14.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(3, 3))
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Title : '),
                                  Flexible(child: Text(data[index].title, maxLines: 2,)),
                                ],
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('By : '),
                                  Flexible(child: Text(data[index].by, maxLines: 2,)),
                                ],
                              ),
                              SizedBox(height: 4.h),
                              InkWell(
                                onTap: () {
                                  Get.to(() => Comments(storyData: data[index]),
                                      transition: Transition.leftToRightWithFade);
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(data[index].kids.length.toString(), style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),),
                                    SizedBox(width: 2.w,),
                                    Text('comments', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp, color: Colors.blue))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
              error: (error, stack) => Center(child: Text('$error')),
              loading: () => const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: CupertinoActivityIndicator(
                      radius: 18.0,
                      color: Colors.blue,
                    ),
                  )),
        )
      ],
    )
    );
  }
}
