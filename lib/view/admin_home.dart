import 'package:e_comm/container/dashboard_text.dart';
import 'package:e_comm/container/home_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/auth_service.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Dashboard'),
        actions: [
          IconButton(onPressed: (){
            AuthService().logout();
            Navigator.pushNamedAndRemoveUntil(context, '/login', (route)=>false);
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 235,
              padding:  EdgeInsets.all(12),
              margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
              decoration: BoxDecoration(color: Colors.deepPurple.shade100,borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                DashboardText(keyword: 'Total order ',value: '100',),
                  DashboardText(keyword: 'Total product',value: '100',),
                  DashboardText(keyword: 'Total product',value: '100',),
                  DashboardText(keyword: 'Total product',value: '100',),
                  DashboardText(keyword: 'Total product',value: '100',),
              ],),),
            Row(
              children: [
                HomeButton(onTap: (){}, name: "All Order"),
                SizedBox(width: 10,),
                HomeButton(onTap: (){}, name: "All Products"),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                HomeButton(onTap: (){}, name: "Promos"),
                SizedBox(width: 10,),
                HomeButton(onTap: (){}, name: "Banners"),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                HomeButton(onTap: (){
                  Navigator.pushNamed(context, '/category');
                }, name: "Categories"),
                SizedBox(width: 10,),
                HomeButton(onTap: (){}, name: "Coupons"),
              ],
            ),
          ],),
      ),
    );
  }
}
