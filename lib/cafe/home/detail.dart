import 'package:corner_cafe/cafe/home/specials.dart';
import 'package:corner_cafe/models/item.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; // Make sure to add carousel_slider to your pubspec.yaml

class DetailWidget extends StatefulWidget {
  const DetailWidget({
    super.key,
    required this.name,
    required this.description,
    required this.imgUrl, 
    required this.price,
  });
  final String name, description, imgUrl;
  final double price;

  @override
  State<DetailWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String selectedService = 'Dine-in';
  int sugarAmount = 2;
  int coffeeStrength = 3;
  int itemQuantity = 1;
  String _selectedServiceType = 'Dine-In';

  @override
  Widget build(BuildContext context) {
    List<CafeItem> items = [
      CafeItem(
        name: 'Machiato',
        price: 40,
        imageUrl:
            'https://images.unsplash.com/photo-1521127474489-d524412fd439?w=500&h=500',
        description: 'A perfect blend of espresso and milk',
        isSpecial: true,
        isPopular: true,
        category: 'Coffee',
      ),
      CafeItem(
        name: 'Cappuccino',
        price: 35,
        imageUrl:
            'https://images.unsplash.com/photo-1551024601-bec78aea704b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxjYXBwdWNjaW5vfGVufDB8fHx8MTYyODQ0OTcwMw&ixlib=rb-4.0.3&q=80&w=1080',
        description: 'A hot cup of cappuccino to start your day',
        isPopular: true,
        category: 'Coffee',
      ),
      // Add other CafeItems here...
    ];

    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: 300,
              child: Stack(
                children: [
                  Image.network(
                    widget.imgUrl,
                    width: MediaQuery.sizeOf(context).width,
                    height: 300,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 200,
                      color: Colors.grey[300],
                      child: const Center(child: Text('Image not available')),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          print('it is not poping the page');
                          Navigator.of(context).pop();
                        },
                        child: IconButton(
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: () {
                            // Go back to the previous screen
                          },
                        ),
                      ),
                    ),
                  ),
                  //Align(alignment: Alignment.topLeft,child: IconButton(icon: const Icon(Icons.arrow_back), onPressed: (){print('back');},),),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height * 1,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, Color(0x99000000)],
                        stops: [0, 1],
                        begin: AlignmentDirectional(0, 1),
                        end: AlignmentDirectional(0, -1),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: Theme.of(context).textTheme.headlineLarge!.apply(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.white,
                                ),
                          ),
                          Text(
                            widget.description,
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                                  fontFamily: 'Inter',
                                  color: const Color(0xFFE0E0E0),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                  color: Color(0x00FFF0D1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Customize Your Order',
                          style: Theme.of(context).textTheme.headlineSmall!.apply(
                                fontFamily: 'Inter Tight',
                                color: Colors.black,
                              ),
                        ),
                      Card(
                        color: Colors.white,
                        elevation: 8,
                        
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              const SizedBox(height: 16),
                              _buildSugarLevelSelector(context),
                              const SizedBox(height: 16),
                              _buildCoffeeStrengthSlider(context),
                          
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                            'Order Details', 
                            style: Theme.of(context).textTheme.headlineSmall!.apply(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.black,
                                ),
                            ),
                      Card(
                        color: Colors.white,
                        elevation: 8,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             
                              _buildQuantitySelector(context),
                             
                              const SizedBox(height: 16,),
                              _buildServiceTypeSelector(context),   
                              const SizedBox(height: 16),
                              _buildSideOptions(context),
                              const SizedBox(height: 16,),
                              _buildEstimatedTime(context),
                            ],
                          ),
                        ),
                      ),
                       const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                                Text('Total price: ',
                                  style: Theme.of(context).textTheme.headlineSmall!.apply(
                                        fontFamily: 'Inter Tight',
                                        color: Colors.black,
                                  ),
                              ),
                              const SizedBox(width: 16,),
                              Text(
                                '${widget.price * itemQuantity} ETB',
                                style: Theme.of(context).textTheme.headlineSmall!.apply(
                                    fontFamily: 'Inter Tight',
                                    color: Colors.blue,
                                  ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:  const EdgeInsetsDirectional.fromSTEB(32.0, 16, 32, 16),
              child: Column(
                children: [
                   SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: 48,
                     child: ElevatedButton(
                      onPressed: () {
                        _showSuccessDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          
                        )
                      ),
                      child: Text(
                        'Place Order',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                              fontFamily: 'Inter Tight',
                              color: Colors.white,
                            ), 
                      ),
                                       ),
                   ),
                  const SizedBox(height: 16),
                  _buildCarouselSlider(context, items),
                  const SizedBox(height: 16,),
                  _BuildShowAddress(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSugarLevelSelector(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Sugar amount',
          style: Theme.of(context).textTheme.bodyLarge!.apply(
                fontFamily: 'Inter',
              ),
        ),
        const SizedBox(width: 16,),
        Expanded(
          child: Container(
            width: 120,
            decoration: BoxDecoration(
              backgroundBlendMode: BlendMode.color,
              color: const Color(0x00FFF0D1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.remove,
                      color: Color.fromARGB(255, 29, 33, 36),
                      //size: 24,
                    ),
                    onPressed: () {
                      setState(() {
                        if (sugarAmount > 0) sugarAmount--;
                      });
                    },
                  ),
                  Text(
                    '$sugarAmount spoons',
                    style: Theme.of(context).textTheme.labelSmall!.apply(
                          fontFamily: 'Inter Tight',
                        ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.blue,
                      //size: 24,
                    ),
                    onPressed: () {
                      setState(() {
                        sugarAmount++;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCoffeeStrengthSlider(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Coffee Strength',
          style: Theme.of(context).textTheme.bodyLarge!.apply(
                fontFamily: 'Inter Tight',
              ),
        ),
        const SizedBox(height: 8),
        Slider(
          activeColor: Colors.brown,
          inactiveColor: const Color(0x00F1F4F8),
          min: 1,
          max: 5,
          divisions: 4,
          value: coffeeStrength.toDouble(),
          label: 'Strength: $coffeeStrength',
          onChanged: (newValue) {
            setState(() {
              coffeeStrength = newValue.round();
            });
          },
        ),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mild',
                style: Theme.of(context).
              textTheme.bodyLarge!.apply(
                    fontFamily: 'Inter Tight',
                    color: Colors.black,
              ),
                ),
              Text(
                'Strong', 
                style: Theme.of(context).
                textTheme.bodyLarge!.apply(
                      fontFamily: 'Inter Tight',
                      color: Colors.black,
              ),),
          ],),
        )
      ],
    );
  }

  Widget _buildQuantitySelector(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Quantity',
          style: Theme.of(context).textTheme.bodyLarge!.apply(
                fontFamily: 'Inter Tight',
              ),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  if (itemQuantity > 1) itemQuantity--;
                });
              },
            ),
            Text(
              '$itemQuantity',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  itemQuantity++;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
  Widget _buildServiceTypeSelector(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Service Type',
        style: Theme.of(context).textTheme.bodyLarge!.apply(
              fontFamily: 'Inter Tight',
            ),
      ),
      ListTile(
        title: Text(
          'Dine-In', 
          style: Theme.of(context).
              textTheme.bodyLarge!.apply(
                    fontFamily: 'Inter Tight',
                    color: Colors.black,
              ),
          ),
        leading: Radio<String>(
          value: 'Dine-In',
          groupValue: _selectedServiceType,
          activeColor: Colors.brown,
          onChanged: (String? value) {
            setState(() {
              _selectedServiceType = value!;
            });
          },
        ),
      ),
      ListTile(
        title: Text(
          'Takeout',
          style: Theme.of(context).
              textTheme.bodyLarge!.apply(
                    fontFamily: 'Inter Tight',
                    color: Colors.black,
              ),
          ),
        leading: Radio<String>(
          value: 'Takeout',
          groupValue: _selectedServiceType,
          activeColor: Colors.brown,
          onChanged: (String? value) {
            setState(() {
              _selectedServiceType = value!;
            });
          },
        ),
      ),
    ],
  );
}

Widget _buildEstimatedTime(BuildContext context){
  return Row(
    children: [
       Text(
        'Estimated time',
        style: Theme.of(context).
              textTheme.bodyLarge!.apply(
                    fontFamily: 'Inter Tight',
                    color: Colors.black,
              ),
        ),
      const SizedBox(width: 16),
      Row(
        children: [
          const Icon(Icons.access_time, color: Colors.purple,),
          Text(
            '15 min',
            style: Theme.of(context).
            textTheme.bodyLarge!.apply(
                  fontFamily: 'Inter Tight',
                  color: Colors.black,
            ),),
        ],)
    ],);
}
 Widget _buildSideOptions(BuildContext context) {
  // Define your list of side options
    List<String> sides = ['Fries', 'Salad', 'cookies'];
    String? selectedSide; // This will hold the currently selected side

    return DropdownButtonFormField<String>(
            value: selectedSide, // The current selected side (initially null)
            hint: const Text('Select a side'), // Placeholder when nothing is selected
            items: sides.map((String side) {
              return DropdownMenuItem<String>(
                value: side,
                child: Text(side),
              );
            }).toList(),
            onChanged: (newValue) {
              // Handle change in selection
              selectedSide = newValue;
            },
            decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.brown, width: 2.0), // Custom border when not focused
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.brown, width: 2.0), // Custom border when focused
            ),
            border: OutlineInputBorder(), // Default border
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12), // Adjust padding
          ),
          );
  }


  Widget _buildCarouselSlider(BuildContext context, List<CafeItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Recommended for you',
            style: Theme.of(context).textTheme.headlineSmall!.apply(
                  fontFamily: 'Inter',
                ),
          ),
        ),
        const SizedBox(height: 16),
        CarouselSlider.builder(
          itemCount: items.length,
          itemBuilder: (context, index, realIndex) {
            final item = items[index];
            return Specials(onTap: (){}, item: item);
          },
          options: CarouselOptions(
            viewportFraction: 0.5,
            height: 200,
            enlargeCenterPage: true,
            autoPlay: true,
          ),
        ),
      ],
    );
  }
}

void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //title: const Text('Thank You!'),
          content: Container(
              constraints: const BoxConstraints(
              maxHeight: 240, // Set a maximum height for the dialog
              maxWidth: 300,  // Set a maximum width for the dialog
            ),

            child: Column(
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1634394005200-5f0d18060a32?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y29mZmVlJTIwcHJlcGFyYXRpb258ZW58MHx8MHx8fDA%3D',
                  //height: 100,
                  //width: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 8),
                Text(
                  "Thanks for ordering! We're on it. Your delicious order will be ready soon.",
                  style: Theme.of(context).textTheme.bodyLarge!.apply(
                  fontFamily: 'Inter Tight',
                ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                'OK',
                style: Theme.of(context).textTheme.bodyLarge!.apply(
                  fontFamily: 'Inter Tight',
                ),
                ),
            ),
          ],
        );
      },
    );
  }

Widget _BuildShowAddress(BuildContext context){
  return Container(
    decoration: const BoxDecoration(
      backgroundBlendMode: BlendMode.color,
      color: Colors.white,
    ),
    child: Column(
      children: [
        Row(
          children: [
            const Icon(Icons.location_city, ),
            const SizedBox(width: 8,), 
            Text('Our Adress is', style: Theme.of(context).textTheme.headlineSmall!.apply(
                        fontFamily: 'Inter',
                      ),),
          ],
        ),
        const SizedBox(height: 8,),
        const Text('Adama, Mebrat Hail, AMG Mall 9th floor'),
      
      ],
    ),
  );
}