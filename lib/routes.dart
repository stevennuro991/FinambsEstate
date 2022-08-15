import 'package:estate/screens/contactus_screen.dart';
import 'package:estate/screens/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:estate/screens/aboutus_screen.dart';
import 'package:estate/screens/add_property.dart';
import 'package:estate/screens/agent_details.dart';
import 'package:estate/screens/agents.dart';
import 'package:estate/screens/audio_call.dart';
// import 'package:estate/screens/contact_us.dart';
// import 'package:estate/screens/dashboard.dart';
import 'package:estate/screens/filters.dart';
import 'package:estate/screens/followers.dart';
import 'package:estate/screens/following.dart';
// import 'package:estate/screens/forgot_password.dart';
import 'package:estate/screens/house_details.dart';
import 'package:estate/screens/inner_chat.dart';
import 'package:estate/screens/location.dart';
import 'package:estate/screens/my_leads.dart';
import 'package:estate/screens/new_contact_us.dart';
// import 'package:estate/screens/news_and_blog.dart';
// import 'package:estate/screens/news_and_blog_details.dart';
import 'package:estate/screens/notifications.dart';
// import 'package:estate/screens/opt_screen.dart';
import 'package:estate/screens/properties.dart';
import 'package:estate/screens/saved_searches.dart';
import 'package:estate/screens/search_properties.dart';
import 'package:estate/screens/search_property.dart';
import 'package:estate/screens/see_all_screen.dart';
import 'package:estate/screens/settings.dart';
import 'package:estate/screens/login_screen.dart';
import 'package:estate/screens/signup_screen.dart';
import 'package:estate/screens/splash_screen.dart';
import 'package:estate/screens/terms_and_conditions.dart';
import 'package:estate/screens/video_call.dart';
import 'package:estate/screens/wishlist.dart';

class RouteGenerator {
  // ignore: missing_return
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case 'Dashboard':
        return MaterialPageRoute(builder: (context) => MainScreen());
      case 'SignUp':
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case 'SignIn':
        return MaterialPageRoute(builder: (context) => const SignInScreen());
      // case 'ForgotPassword':
      //   return MaterialPageRoute(builder: (context) => AboutUs());
      // case 'OtpScreen':
      //   return MaterialPageRoute(builder: (context)=>OtpScreen());
      case 'AboutUs':
        return MaterialPageRoute(builder: (context) => AboutUs());
      case 'AgentDetails':
        return MaterialPageRoute(builder: (context) => AgentDetails());
      case 'Agents':
        return MaterialPageRoute(builder: (context) => Agents());
      case 'InnerChat':
        return MaterialPageRoute(builder: (context) => InnerChat());
      case 'ContactUs':
        return MaterialPageRoute(builder: (context) => ContactUs());
      case 'MyLeads':
        return MaterialPageRoute(builder: (context) => MyLeads());
      case 'HouseDetails':
        return MaterialPageRoute(builder: (context) => HouseDetails());
      case 'Filters':
        return MaterialPageRoute(builder: (context) => Filters());
      case 'Location':
        return MaterialPageRoute(builder: (context) => const Location());
      case 'Notifications':
        return MaterialPageRoute(builder: (context) => Notifications());
      case 'Wishlist':
        return MaterialPageRoute(builder: (context) => Wishlist());
      case 'SearchProperties':
        return MaterialPageRoute(builder: (context) => SearchProperties());
      case 'SearchProperty':
        return MaterialPageRoute(builder: (context) => SearchProperty());
      case 'SavedSearches':
        return MaterialPageRoute(builder: (context) => SavedSearches());
      case 'Notifications':
        return MaterialPageRoute(builder: (context) => Notifications());
      // case 'NewsAndBlog':
      //   return MaterialPageRoute(builder: (context) => NewsAndBlog());
      // case 'NewsAndBlogDetails':
      //   return MaterialPageRoute(builder: (context) => NewsAndBlogDetails());
      case 'NewContactUs':
        return MaterialPageRoute(builder: (context) => NewContactUs());
      case 'TermsAndConditions':
        return MaterialPageRoute(builder: (context) => TermsAndConditions());
      case 'Settings':
        return MaterialPageRoute(builder: (context) => Settings());
      case 'AddProperty':
        return MaterialPageRoute(builder: (context) => AddProperty());
      case 'VideoCall':
        return MaterialPageRoute(builder: (context) => VideoCall());
      case 'AudioCall':
        return MaterialPageRoute(builder: (context) => AudioCall());
      case 'SeeAllScreen':
        return MaterialPageRoute(builder: (context) => SeeAllScreen());
      case 'SearchProperty':
        return MaterialPageRoute(builder: (context) => SearchProperty());
      case 'Followers':
        return MaterialPageRoute(builder: (context) => Followers());
      case 'Following':
        return MaterialPageRoute(builder: (context) => Following());
      case 'Properties':
        return MaterialPageRoute(builder: (context) => Properties());
    }
  }
}
