import 'package:corner_cafe/cafe/home/categories.dart';
import 'package:corner_cafe/cafe/home/list_view.dart';
import 'package:corner_cafe/models/cafe_model.dart';
import 'package:flutter/material.dart';
import '../../models/item.dart';
import 'category_menu.dart';


class Home extends StatefulWidget {
  const Home({super.key});
  

  @override
  State<Home> createState() => _CafeWidgetState();
}

class _CafeWidgetState extends State<Home> {
  late CafeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? selectedCategory;
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CafeModel());

    _model.textController ??= TextEditingController(text: 'tea . . . . .');
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }
    T createModel<T>(BuildContext context, T Function() modelBuilder) {
    return modelBuilder();
  }





  @override
  Widget build(BuildContext context) {
    // List of special, popular, and regular items
    List<CafeItem> cafeItems = [
      // Special and popular item
      CafeItem(
        name: 'Machiato',
        price: 40,
        imageUrl: 'https://images.unsplash.com/photo-1521127474489-d524412fd439?w=500&h=500',
        description: 'A perfect blend of espresso and milk',
        isSpecial: true,
        isPopular: true,
        category: 'Coffee',
      ),

      // Only popular item
      CafeItem(
        name: 'Cappuccino',
        price: 35,
        imageUrl: 'https://images.unsplash.com/photo-1551024601-bec78aea704b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxjYXBwdWNjaW5vfGVufDB8fHx8MTYyODQ0OTcwMw&ixlib=rb-4.0.3&q=80&w=1080',
        description: 'A hot cup of cappuccino to start your day',
        isPopular: true,
        category: 'coffee',
      ),

      // Only special item
      CafeItem(
        name: 'Jimma Coffee',
        price: 20,
        imageUrl: 'https://images.unsplash.com/photo-1630861412229-67e2acb44b7a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxldGhpb3BpYW4lMjBjb2ZmZWV8ZW58MHx8fHwxNzI3NzAyMDExfDA&ixlib=rb-4.0.3&q=80&w=1080',
        description: 'Premium coffee from the Jimma region',
        isSpecial: true,
        category: 'Coffee',
      ),
      CafeItem(
        name: 'Latte',
        price: 30,
        imageUrl: 'https://images.unsplash.com/photo-1498804103079-a6351b050096?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHxsYXR0ZXxlbnwwfHx8fDE2Mjg0NDk3MDN8MA&ixlib=rb-4.0.3&q=80&w=1080',
        description: 'A smooth, creamy latte',
        isPopular: true,
        category: 'Coffee',
      ),
      CafeItem(
        name: 'Bread',
        price: 10,
        imageUrl: 'https://images.unsplash.com/photo-1548538931-b47653628cdc?w=500&h=500',
        description: 'A soft bread',
        isSpecial: true,
        category: 'Pastries',
      ),
      CafeItem(
        name: 'Iced Tea',
        price: 25,
        imageUrl: 'https://images.unsplash.com/photo-1601390395693-364c0e22031a?w=500&h=500',
        isPopular: true,
        category: 'Tea',
      ),
    ];


       void navigateToCategoryMenu(BuildContext context, String category) {
          selectedCategory = category; 
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryMenuPage(category: category, items: cafeItems),
          ),
        );
        
  
      }
    List<CafeItem> popularItems = cafeItems.where((item) => item.isPopular).toList();
    List<CafeItem> specialItems = cafeItems.where((item) => item.isSpecial).toList();
    //List<CafeItem> normalItems = cafeItems.where((item) => !item.isSpecial && !item.isPopular).toList();


    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        //backgroundColor: Theme.of(context).textTheme.primaryBackground,
        body: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * 1,
          child: Stack(
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1541533260371-b8fc9b596d84?w=500&h=750',
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 1,
                fit: BoxFit.cover,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeIn,
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      'https://images.unsplash.com/photo-1630861413071-a424a4d6d155?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxFdGhpb3BpYW4lMjBjb2ZmZWV8ZW58MHx8fHwxNzI3NzA1NzQxfDA&ixlib=rb-4.0.3&q=80&w=1080',
                    ).image,
                  ),
                  gradient: const LinearGradient(
                    colors: [Color(0x99000000), Colors.transparent],
                    stops: [0, 1],
                    begin: AlignmentDirectional(0, -1),
                    end: AlignmentDirectional(0, 1),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome to',
                                style: Theme.of(context).textTheme
                                    .headlineSmall!
                                    .apply(
                                      fontFamily: 'Inter Tight',
                                      color: Colors.black,
                                    ),
                              ),
                              Text(
                                'Corner Cafe',
                                style: Theme.of(context).textTheme
                                    .displayMedium!
                                    .apply(
                                      fontFamily: 'Inter Tight',
                                      color: Colors.white,
                                    ),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 24,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Opacity(
                        opacity: 0.5,
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(width: 16,),
                                Expanded(
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'olor #e0e0e',
                                      hintStyle: Theme.of(context).textTheme
                                          .bodyLarge!
                                          .apply(
                                            fontFamily: 'Inter',
                                          ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                    ),
                                    style: Theme.of(context).textTheme.
                                        bodyMedium!
                                        .apply(
                                          fontFamily: 'Inter',
                                        ),
                                    minLines: 1,
                                    validator: _model.textControllerValidator
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Today\'s Specials',
                        style: Theme.of(context).textTheme.headlineSmall!.apply(fontFamily: 'Inter', color: Colors.white),
                            
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 200,
                        child: SpecialListView(items: specialItems),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Categories',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.apply(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.white,
                                ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          Categories(category: 'Coffee', icon: Icons.local_cafe, onTap: (){
                             navigateToCategoryMenu(context, 'Coffee');}), 
                          Categories(category: 'Pastries', icon: Icons.cake, onTap: ()=> navigateToCategoryMenu(context, 'Pastries'),),
                          Categories(category: 'Tea', icon: Icons.local_drink, onTap: () => navigateToCategoryMenu(context, 'Tea'),),
                          Categories(category: 'Deserts', icon: Icons.icecream, onTap: ()=> navigateToCategoryMenu(context, 'Deserts'),),

                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Popular Items',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.apply(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.white,
                                ),
                      ),
                      const SizedBox(height: 16),
                      PopularListView(items: popularItems),
                    ]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    
  }
}
