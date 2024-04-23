import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sihproject/model/community_post_model.dart';

class CommunityController extends GetxController {
  final RxList<CommunityPost> communityPosts = <CommunityPost>[].obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   // fetchCommunityPosts();
  // }

  void fetchCommunityPosts() async {
    try {
      final QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('CommunityPost').get();

      communityPosts.assignAll(querySnapshot.docs.map((doc) {
        // Cast doc.data() to Map<String, dynamic> explicitly
        final data = doc.data() as Map<String, dynamic>;
        return CommunityPost.fromMap(data);
      }).toList());
    } catch (error) {
      debugPrint('Error fetching community posts: $error');
    }
  }
}