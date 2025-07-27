import 'package:yummify/core/firebase/firebase.dart';
import 'package:yummify/features/shopping/data/data_sources/meal/base_meal_data_source.dart';

class RemoteMealDataSource extends BaseMealDataSource {
  RemoteMealDataSource(this._firebase);
  final Firebase _firebase;

  @override
  Future<List<Map<String, dynamic>>> getMeals() async {
    try {
      return _firebase.store
          .collection("meals")
          .get()
          .then((value) => value.docs.map((doc) => doc.data()).toList());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> addMeal() async {
    try {
      print("Adding meals to Firestore");
      for (final meal in meals) {
        final ref = _firebase.store.collection("meals").doc();
        await ref.set(meal);
        await ref.update({"id": ref.id});
      }
      return "Meals added successfully";
    } catch (e) {
      print("Error adding meals: $e");
      rethrow;
    }
  }
}

const List<Map<String, dynamic>> meals = [
  {
    "id": 'meal_001',
    "name": 'Classic Beef Burger',
    "desc":
        'Juicy beef patty with lettuce, tomato, onion, pickles, and our special sauce on a sesame seed bun',
    "img":
        'https://images.unsplash.com/photo-1594212699903-ec8a3eca50f5?w=500&h=500&fit=crop',
    "categoryId": 'burger',
    "price": 12.99,
    "rating": 4.5,
    "reviewsCount": 234,
  },
  {
    "id": 'meal_002',
    "name": 'Cheese Lover\'s Burger',
    "desc":
        'Double beef patties with triple cheese - cheddar, swiss, and american, topped with crispy bacon',
    "img":
        'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&h=500&fit=crop',
    "categoryId": 'burger',
    "price": 15.99,
    "rating": 4.7,
    "reviewsCount": 189,
  },
  {
    "id": 'meal_003',
    "name": 'Veggie Delight Burger',
    "desc":
        'Plant-based patty with avocado, grilled mushrooms, lettuce, tomato, and vegan mayo',
    "img":
        'https://images.unsplash.com/photo-1520072959219-c595dc870360?w=500&h=500&fit=crop',
    "categoryId": 'burger',
    "price": 11.99,
    "rating": 4.3,
  },
  {
    "id": 'meal_004',
    "name": 'BBQ Bacon Burger',
    "desc":
        'Beef patty with smoky BBQ sauce, crispy bacon, onion rings, and melted cheddar cheese',
    "img":
        'https://images.unsplash.com/photo-1553979459-d2229ba7433b?w=500&h=500&fit=crop',
    "categoryId": 'burger',
    "price": 14.99,
    "rating": 4.6,
    "reviewsCount": 267,
  },
  {
    "id": 'meal_005',
    "name": 'Spicy Jalapeño Burger',
    "desc":
        'Spicy beef patty with jalapeños, pepper jack cheese, chipotle mayo, and fresh salsa',
    "img":
        'https://images.unsplash.com/photo-1599554495-5cd8f4d8c0e8?w=500&h=500&fit=crop',
    "categoryId": 'burger',
    "price": 13.99,
    "rating": 4.4,
  },
  {
    "id": 'meal_006',
    "name": 'Margherita Pizza',
    "desc":
        'Classic Italian pizza with fresh mozzarella, tomato sauce, and basil leaves on thin crust',
    "img":
        'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=500&h=500&fit=crop',
    "categoryId": 'pizza',
    "price": 16.99,
    "rating": 4.8,
    "reviewsCount": 312,
  },
  {
    "id": 'meal_007',
    "name": 'Pepperoni Feast',
    "desc":
        'Loaded with double pepperoni, mozzarella cheese, and our signature tomato sauce',
    "img":
        'https://images.unsplash.com/photo-1628840042765-356cda07504e?w=500&h=500&fit=crop',
    "categoryId": 'pizza',
    "price": 18.99,
    "rating": 4.6,
    "reviewsCount": 289,
  },
  {
    "id": 'meal_008',
    "name": 'BBQ Chicken Pizza',
    "desc":
        'Grilled chicken, BBQ sauce, red onions, cilantro, and mozzarella on crispy crust',
    "img":
        'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=500&h=500&fit=crop',
    "categoryId": 'pizza',
    "price": 19.99,
    "rating": 4.5,
    "reviewsCount": 245,
  },
  {
    "id": 'meal_009',
    "name": 'Veggie Supreme',
    "desc":
        'Bell peppers, mushrooms, onions, olives, tomatoes, and spinach with mozzarella cheese',
    "img":
        'https://images.unsplash.com/photo-1511689660979-10d2b1aada49?w=500&h=500&fit=crop',
    "categoryId": 'pizza',
    "price": 17.99,
    "rating": 4.4,
    "reviewsCount": 198,
  },
  {
    "id": 'meal_010',
    "name": 'Four Cheese Pizza',
    "desc":
        'A blend of mozzarella, cheddar, parmesan, and gorgonzola cheeses with garlic and herbs',
    "img":
        'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=500&h=500&fit=crop',
    "categoryId": 'pizza',
    "price": 20.99,
    "rating": 4.7,
    "reviewsCount": 176,
  },
  {
    "id": 'meal_011',
    "name": 'Spaghetti Carbonara',
    "desc":
        'Classic Italian pasta with creamy egg sauce, crispy bacon, and parmesan cheese',
    "img":
        'https://images.unsplash.com/photo-1612874742237-6526221588e3?w=500&h=500&fit=crop',
    "categoryId": 'pasta',
    "price": 14.99,
    "rating": 4.6,
    "reviewsCount": 223,
  },
  {
    "id": 'meal_012',
    "name": 'Fettuccine Alfredo',
    "desc":
        'Creamy parmesan sauce with butter and garlic, served over fresh fettuccine pasta',
    "img":
        'https://images.unsplash.com/photo-1645112411341-6c4fd023714a?w=500&h=500&fit=crop',
    "categoryId": 'pasta',
    "price": 13.99,
    "rating": 4.5,
    "reviewsCount": 201,
  },
  {
    "id": 'meal_013',
    "name": 'Penne Arrabbiata',
    "desc":
        'Spicy tomato sauce with garlic, red chili flakes, and fresh basil over penne pasta',
    "img":
        'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=500&h=500&fit=crop',
    "categoryId": 'pasta',
    "price": 12.99,
    "rating": 4.4,
    "reviewsCount": 167,
  },
  {
    "id": 'meal_014',
    "name": 'Seafood Linguine',
    "desc":
        'Fresh linguine with shrimp, scallops, mussels, and calamari in white wine sauce',
    "img":
        'https://images.unsplash.com/photo-1563379926898-05f4575a45d8?w=500&h=500&fit=crop',
    "categoryId": 'pasta',
    "price": 22.99,
    "rating": 4.8,
    "reviewsCount": 145,
  },
  {
    "id": 'meal_015',
    "name": 'Lasagna Bolognese',
    "desc":
        'Layers of pasta with rich meat sauce, béchamel, and melted mozzarella cheese',
    "img":
        'https://images.unsplash.com/photo-1574894709920-11b28e7367e3?w=500&h=500&fit=crop',
    "categoryId": 'pasta',
    "price": 16.99,
    "rating": 4.7,
    "reviewsCount": 289,
  },
  {
    "id": 'meal_016',
    "name": 'Caesar Salad',
    "desc":
        'Crisp romaine lettuce, parmesan cheese, croutons, and our house-made Caesar dressing',
    "img":
        'https://images.unsplash.com/photo-1546793665-c74683f339c1?w=500&h=500&fit=crop',
    "categoryId": 'salad',
    "price": 9.99,
    "rating": 4.3,
    "reviewsCount": 178,
  },
  {
    "id": 'meal_017',
    "name": 'Greek Salad',
    "desc":
        'Fresh tomatoes, cucumbers, olives, feta cheese, and red onions with olive oil dressing',
    "img":
        'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?w=500&h=500&fit=crop',
    "categoryId": 'salad',
    "price": 10.99,
    "rating": 4.5,
    "reviewsCount": 156,
  },
  {
    "id": 'meal_018',
    "name": 'Grilled Chicken Salad',
    "desc":
        'Mixed greens with grilled chicken breast, avocado, cherry tomatoes, and balsamic vinaigrette',
    "img":
        'https://images.unsplash.com/photo-1604909052743-94e838986d24?w=500&h=500&fit=crop',
    "categoryId": 'salad',
    "price": 12.99,
    "rating": 4.6,
    "reviewsCount": 234,
  },
  {
    "id": 'meal_019',
    "name": 'Quinoa Power Bowl',
    "desc":
        'Quinoa, roasted vegetables, chickpeas, avocado, and tahini dressing',
    "img":
        'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=500&h=500&fit=crop',
    "categoryId": 'salad',
    "price": 11.99,
    "rating": 4.4,
    "reviewsCount": 145,
  },
  {
    "id": 'meal_020',
    "name": 'Asian Sesame Salad',
    "desc":
        'Mixed cabbage, carrots, edamame, and crispy wontons with sesame ginger dressing',
    "img":
        'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?w=500&h=500&fit=crop',
    "categoryId": 'salad',
    "price": 10.99,
    "rating": 4.3,
    "reviewsCount": 123,
  },
  {
    "id": 'meal_021',
    "name": 'Chocolate Lava Cake',
    "desc":
        'Warm chocolate cake with molten chocolate center, served with vanilla ice cream',
    "img":
        'https://images.unsplash.com/photo-1624353365286-3f8d62daad51?w=500&h=500&fit=crop',
    "categoryId": 'dessert',
    "price": 7.99,
    "rating": 4.9,
    "reviewsCount": 345,
  },
  {
    "id": 'meal_022',
    "name": 'New York Cheesecake',
    "desc": 'Creamy cheesecake with graham cracker crust and berry compote',
    "img":
        'https://images.unsplash.com/photo-1533134242443-d4fd215305ad?w=500&h=500&fit=crop',
    "categoryId": 'dessert',
    "price": 6.99,
    "rating": 4.7,
    "reviewsCount": 267,
  },
  {
    "id": 'meal_023',
    "name": 'Tiramisu',
    "desc":
        'Classic Italian dessert with coffee-soaked ladyfingers and mascarpone cream',
    "img":
        'https://images.unsplash.com/photo-1571877227200-a0d98ea607e9?w=500&h=500&fit=crop',
    "categoryId": 'dessert',
    "price": 8.99,
    "rating": 4.8,
    "reviewsCount": 289,
  },
  {
    "id": 'meal_024',
    "name": 'Ice Cream Sundae',
    "desc":
        'Three scoops of ice cream with chocolate sauce, whipped cream, and cherry on top',
    "img":
        'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=500&h=500&fit=crop',
    "categoryId": 'dessert',
    "price": 5.99,
    "rating": 4.5,
    "reviewsCount": 198,
  },
  {
    "id": 'meal_025',
    "name": 'Apple Pie à la Mode',
    "desc": 'Warm apple pie with cinnamon, served with vanilla ice cream',
    "img":
        'https://images.unsplash.com/photo-1535920527002-b35e96722eb9?w=500&h=500&fit=crop',
    "categoryId": 'dessert',
    "price": 6.99,
    "rating": 4.6,
    "reviewsCount": 176,
  },
];
