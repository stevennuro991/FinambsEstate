import 'package:flutter/material.dart';
import 'package:estate/utils/colorscheme.dart';




ListView myLeadsAgentsList(){

  return ListView.builder(
      itemCount: 6
      ,itemBuilder: (context,index){
    return GestureDetector(onTap: (){
      Navigator.pushNamed(context, 'AgentDetails');
    },
      child: Column(
        children: [
          index==0?const SizedBox(height: 10,):
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 3.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      maxRadius: 35,
                      backgroundImage:  AssetImage('assets/images/john.jpg'),
                    ),
                    const SizedBox(width: 10,)
                    ,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'John Smith',
                          style:  TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 3,),

                        Row(
                          children: const[
                            Text(
                              'Real Estate',
                              style: TextStyle(color: Colors.grey,fontSize: 12),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.orange,
                            ),
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.orange,
                            ),
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.orange,
                            ),
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.orange,
                            ),
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.orange,
                            )
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          children:const [
                             Icon(
                              Icons.place,
                              size: 16,
                              color: primaryColor,
                            ),
                            Text(
                              '00000 Susan Apartment,New York ,USA',
                              style: TextStyle(color: Colors.grey,fontSize: 12),
                            ),
                            SizedBox(width: 5),

                          ],
                        ),
                        const SizedBox(height: 3,),
                        const Text('View Details',style: TextStyle(
                          color: primaryColor,decoration: TextDecoration.underline,fontWeight: FontWeight.w500
                        ),)

                      ],
                    ),

                  ],
                ),
              ),
              const Divider()
            ],
          ),
        ],
      ),
    );
  });
}