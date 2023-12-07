import 'package:flutter/material.dart';
import 'package:instagram/utils/colors.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mobileBackgroundColor,
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 4)
                  .copyWith(right: 0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1618641662184-bafefb91a542?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8bGlvbnxlbnwwfHwwfHx8MA%3D%3D"),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'syedabdulrabb',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: ListView(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shrinkWrap: true,
                              children: ['Delete']
                                  .map(
                                    (e) => InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 12),
                                        child: Text(e),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.more_vert))
                ],
              ),

              
            ),
            //IMAGE SECTION
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                child: Image.network(
                  'https://images.unsplash.com/photo-1618641662184-bafefb91a542?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8bGlvbnxlbnwwfHwwfHx8MA%3D%3D',
                  fit: BoxFit.cover,
                ),
              ),

              //LIKE COMMENT SECTION
              Row(
                children: [
                  IconButton(onPressed: (){}, icon:const Icon(Icons.favorite,color: Colors.red,))
                  ,IconButton(onPressed: (){}, icon:const Icon(Icons.comment_outlined))
                  ,IconButton(onPressed: (){}, icon:const Icon(Icons.send)),
                  Expanded(child: Container()),
                  IconButton(onPressed: (){},icon:const Icon(Icons.bookmark_border),)
                ],
              ),
              //DESCRIPTON AND NUM OF COMMENTS

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize:MainAxisSize.min ,
                  children: [
                    Text('1231 likes',style: Theme.of(context).textTheme.bodyMedium,),
                    
                  ],
                ),
              )
        ],
      ),
    );
  }
}
