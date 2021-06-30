# Restaurant App

**Group Members:**
1. Wasique Mohammad - 1822997
2. Jaki Fayek Alvi Rahman - 1721485

**Project Summary:**

With the increasing popularity of food delivery, the traditional telephone order food has inconvenience to the customers and the food delivery store. How to make the food-delivery more quickly and conveniently has become a concern of people. Food-delivery app has easy and simple features, but now the food-delivery app is no more convenient for people, the overall is relatively old, not novel enough, cannot attract new users. Based on this feature, we decided to design a system for people.

**Project Objective:**
```
•	Ensuring customer satisfaction by remaining accessible and friendly.

•	Thorough knowledge of menu offerings, including food images and details.

•	Identifying, and fulfilling customer needs.
```

**Instructions**
1. Clone the repo
```
git clone https://github.com/fanalis93/Restaurant_flut.git
```

2. Change directory
```
cd Restaurant_flutt
```

3. Fetch Dependencies from pubspec.yaml
```
flutter pub get
```

4. Run the App
```
flutter run
```

**Dependencies Used**
```
  firebase_core: ^1.3.0
  animate_do: ^2.0.0
  cupertino_icons: ^1.0.0
  flutter_icons: ^1.1.0
  flutter_screenutil: ^5.0.0+2
  flutter_staggered_grid_view: ^0.4.0
  flutter_svg: ^0.22.0
  google_fonts: ^2.1.0
  cloud_firestore: ^2.2.2
  firebase_auth: ^1.4.1
  simple_animations: ^1.3.3
  fluttertoast: ^8.0.7
  ```

**Screen Details**

| Screen     | Functionality |
| ---      | ---       |
| ![login](https://user-images.githubusercontent.com/28630547/123994765-448eda80-da00-11eb-8b6b-c23481bd4c26.PNG) | **Signin Screen**: This is the landing screen for the application. The user will be able to enter existing credential to sign in or create a new accounted which is hosted on Firebase.         |
| ![signup](https://user-images.githubusercontent.com/28630547/123994901-68eab700-da00-11eb-80b3-8d2edb36250f.PNG)     | **Signup Screen**: In this screen the user will be able to create a new user account where the credentials will be pushed to the Firebase authentication storage.        |
| ![menu](https://user-images.githubusercontent.com/28630547/123995083-8ae43980-da00-11eb-8de9-e44a3f9f8cd8.PNG)     | **Meal Menu Screen**: In this screen, the user will be able to view the available meal items.        |
| ![mealdetails](https://user-images.githubusercontent.com/28630547/123995123-95063800-da00-11eb-9bcd-4525069b857e.PNG)     | **Meal Details**: In this screen, user will be able to view more clearer image of the item pressed and be able to view the details and price. The user will be able to add the item to the cart.        |
| ![cart](https://user-images.githubusercontent.com/28630547/123995203-ab13f880-da00-11eb-9f40-deca9d7ff7cd.PNG)     | **Cart**: In this screen, the user will be able to view the items that have been added to the cart and their total bill. The user will also be able to checkout for delivery.        |

**ISSUES**
1. Cart Screen is currently in static mode.
