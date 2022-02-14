import 'package:api_with_provider/Model/postmodel.dart';
import 'package:api_with_provider/Provider/postprovider.dart';
import 'package:api_with_provider/Services/httpservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostDataScreen extends StatelessWidget {

  TextEditingController title = TextEditingController();
  TextEditingController subTitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Data'),
      ),
      body: ListView(children: [
        TextField(
          controller: title,
          decoration: InputDecoration(
              hintText: 'Title',
              hintStyle: TextStyle(color: Colors.grey),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade100)
              )
          ),
        ),
        TextField(
          controller: subTitle,
          decoration: InputDecoration(
              hintText: 'body',
              hintStyle: TextStyle(color: Colors.grey),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade100)
              )
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))), primary: Colors.yellow),
          child: Container(
            width: width*0.6,
            height: height*0.08,
            alignment: Alignment.center,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Text(
              'Add',
              style: TextStyle(fontSize: 16,color: Colors.black),
            ),
          ),
          onPressed: () async {
            HTTPService httpservices = HTTPService();
            var post = await httpservices.postsData(title.text, subTitle.text);
            print(post.title);
            context.read<PostProvider>().addPost(post);
            //print(context.watch<PostProvider>().posts.length);
            print(Provider.of<PostProvider>(context,listen: false).posts.length);
          },
        ),

        SizedBox(height: height*0.1,),
        Consumer<PostProvider>(
            builder: (context,data,child) {
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.posts.length,
                  itemBuilder: (context,ind){
                    return ListTile(
                      leading: Text(data.posts[ind].id.toString()),
                      title: Text(data.posts[ind].title.toString()),
                      subtitle: Text(data.posts[ind].body.toString()),
                    );
                  }
              );
            }
        )
      ],)
    );
  }
}
