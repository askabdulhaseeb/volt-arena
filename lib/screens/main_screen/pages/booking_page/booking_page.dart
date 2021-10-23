import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../utilities/custom_images.dart';
import '../../../../utilities/utilities.dart';
import '../../../../widgets/empty_image_widget.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);
  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  bool _isLoading = false;
  Timer? searchOnStoppedTyping;
  // ignore: prefer_final_fields
  List<int> _booking = <int>[]; //TODO: replace int with object

  Future<void> _onChange(String value) async {
    const Duration duration = Duration(milliseconds: 800);
    if (searchOnStoppedTyping != null) {
      setState(() => searchOnStoppedTyping!.cancel());
    }
    searchOnStoppedTyping = Timer(
      duration,
      () async {
        setState(() {
          _isLoading = true;
        });
        //TODO: apply search result as in search page
        setState(() {
          _isLoading = false;
        });
      },
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Utilities.padding),
          child: TextFormField(
            onChanged: (String value) => _onChange(value),
            decoration: const InputDecoration(
              hintText: 'Search ...',
              prefixIcon: Icon(CupertinoIcons.search),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: (_isLoading == true)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : (_booking.isEmpty)
                  ? EmptyImageWidget(
                      assetImage: CustomImages.emptyWishlist,
                      title: 'No Booking Founds',
                      subtitle:
                          '''Looks like you don't\nadd anything in your booking yet''',
                    )
                  : ListView.builder(
                      itemCount: _booking.length,
                      itemBuilder: (BuildContext context, int index) =>
                          const Text('Booking result'),
                      // TODO: display booking search result as in search page
                    ),
        ),
      ],
    ));
  }
}
