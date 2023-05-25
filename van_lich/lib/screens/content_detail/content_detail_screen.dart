import 'package:flutter/material.dart';

class ContentDetailScreen extends StatefulWidget {
  ContentDetailScreen({Key? key, required this.id}) : super(key: key);
  String id;

  @override
  State<ContentDetailScreen> createState() => _ContentDetailScreenState();
}

class _ContentDetailScreenState extends State<ContentDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
          tag: widget.id,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image(
                  image: AssetImage('assets/images/ba-trieu-01.png'),
                  fit: BoxFit.cover,
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.8,
                  minChildSize: 0.3,
                  maxChildSize: 0.8,
                  builder: (context, controller) {
                    return ClipRRect(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                      child: Container(
                        color: Colors.white70,
                        child: Column(
                          children: [
                          const SizedBox(height: 10,),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            width: 100,
                            height: 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.black,
                            ),
                          ),
                            Expanded(
                              child: Container(
                                child: SingleChildScrollView(
                                  child: const Text('hehee'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              )
            ],
          )),
    );
  }
}
