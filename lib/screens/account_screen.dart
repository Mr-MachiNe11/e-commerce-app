import 'package:ecommerce_app/firebase_helper/firebase_auth_helper.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Account',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Column(
              children: [
                const Icon(
                  Icons.person_outline,
                  size: 150,
                ),
                const Text(
                  'Rakibul Islam',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'zrakib13331@gmail.com',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  //height: 45,
                  width: 130,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.red)),
                      child: const Text('Edit Profile')),
                ),
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.shopping_bag_outlined),
                      title: const Text('Your Orders'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.favorite_outline),
                      title: const Text('Favourite'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.info_outlined),
                      title: const Text('About us'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.support),
                      title: const Text('Support'),
                    ),
                    ListTile(
                      onTap: () {
                        FirebaseAuthHelper.instance.signOut();
                        setState(() {});
                      },
                      leading: const Icon(Icons.exit_to_app_outlined),
                      title: const Text('Log out'),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text('Version 1.0.0'),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
