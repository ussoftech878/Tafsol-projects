// ignore_for_file: equal_keys_in_map

import 'package:get/get.dart';

// Create a class to handle translation
class TranslationService extends Translations {
  // Define language maps for English and Arabic
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          //authflow
          'Continue with Apple': 'Continue with Apple',
          'Continue with Google': 'Continue with Google',
          'Continue with Email': 'Continue with Email',
          'Continue as Guest': 'Continue as Guest',
          'Don’t have an account?': 'Don’t have an account?',
          'Sign Up': 'Sign Up',
          'Welcome back!': 'Welcome back!',
          'Sign into your account': 'Sign into your account',
          'Email': 'Email',
          'Password': 'Password',
          'Forgot Password?': 'Forgot Password?',
          'Login': 'Login',
          'Create Account': 'Create Account',
          'Phone Number': 'Phone Number',
          'Continue': 'Continue',
          'Verify Number': 'Verify Number',
          'You will receive an SMS with the one-time password (OTP) needed to verify your number.':
              'You will receive an SMS with the one-time password (OTP) needed to verify your number.',
          'Resend Code': 'Resend Code',
          'Enter Your Details': 'Enter Your Details',
          'First Name': 'First Name',
          'Enter your first name': 'Enter your first name',
          'Last Name': 'Last Name',
          'Enter your last name': 'Enter your last name',
          'Gender': 'Gender',
          'Male': 'Male',
          'Female': 'Female',
          'Confirm Password': 'Confirm Password',
          'Reset Password': 'Reset Password',
          'Change Password': 'Change Password',
          'Enter your new password below to complete the password reset process.':
              'Enter your new password below to complete the password reset process.',
          'Your password has been reset': 'Your password has been reset',
          'Your password has been successfully reset and can now log in with your new password.':
              'Your password has been successfully reset and can now log in with your new password.',
          'Got it!': 'Got it!',

          //onboarding
          'Find great deals': 'Find great deals',
          'Discover local spots with delicious food that\'s too good to waste.':
              'Discover local spots with delicious food that\'s too good to waste.',
          'Next': 'Next',
          'Quick and easy pickup': 'Quick and easy pickup',
          'Once you\'ve reserved a meal, just swing by the store and pick it up.':
              'Once you\'ve reserved a meal, just swing by the store and pick it up.',
          'Big savings, small changes': 'Big savings, small changes',
          'Find discounted food and help reduce waste while keeping your wallet happy.':
              'Find discounted food and help reduce waste while keeping your wallet happy.',
          'All Set!': 'All Set!',
          'Location': 'Location',
          'Where would you like to find your meal deals?':
              'Where would you like to find your meal deals?',
          'Pick your area so we can match you with local meal deals.':
              'Pick your area so we can match you with local meal deals.',
          'Use My Current Location': 'Use My Current Location',
          'Maybe Later': 'Maybe Later',
          'Notifications': 'Notifications',
          'Stay Updated!': 'Stay Updated!',
          'Want to stay in the know? Get alerts for order updates, new stores and exclusive deals, right when they happen.':
              'Want to stay in the know? Get alerts for order updates, new stores and exclusive deals, right when they happen.',
          'Allow Notifications': 'Allow Notifications',

          //checkout and payment
          'Checkout Items': 'Checkout Items',
          'Store details': 'Store details',
          'Subtotal': 'Subtotal',
          'Total': 'Total',
          'Select': 'Select',
          'Deduct from wallet': 'Deduct from wallet',
          'By choosing to reserve this meal and using the Wajba app, you agree to our':
              'By choosing to reserve this meal and using the Wajba app, you agree to our',
          'Terms & Conditions.': 'Terms & Conditions.',
          'Pay with': 'Pay with',
          'Change payment method': 'Change payment method',
          'Enter voucher': 'Enter voucher',
          'Remove': 'Remove',
          'Clear wallet deduction': 'Clear wallet deduction',
          'Pay with Wallet': 'Pay with Wallet',
          'Balance': 'Balance',
          'Full Amount': 'Full Amount',
          'Custom': 'Custom',
          'Amount Deducted': 'Amount Deducted',
          'Deduct From Wallet': 'Deduct From Wallet',
          'Enter Custom Amount': 'Enter Custom Amount',
          'Valid till': 'Valid till',
          'off': 'off',

          //home
          'Within': 'Within',
          'Search for food or stores': 'Search for food or stores',
          'Meals': 'Meals',
          'Café': 'Café',
          'Groceries': 'Groceries',
          'Bakery': 'Bakery',
          'Dessert': 'Dessert',
          'Close to you': 'Close to you',
          'See All': 'See All',
          'Usual Pick': 'Usual Pick',
          'Left': 'Left',
          "Pick up": 'Pick up',
          'Tomorrow': 'Tomorrow',
          'Recommended for you': 'Recommended for you',
          'Home': 'Home',
          'Browse': 'Browse',
          'Favorites': 'Favorites',
          'Account': 'Account',
          'Limited Offer': 'Limited Offer',
          "Seems like there aren't many stores in your area. Tap here to expand your location radius for more options.":
              "Seems like there aren't many stores in your area. Tap here to expand your location radius for more options.",

          //Browse
          'Sorted by': 'Sorted by',
          'Relevance': 'Relevance',
          'Map': 'Map',
          'List': 'List',
          'Select Distance': 'Select Distance',
          'Search for a city': 'Search for a city',
          'Show Results': 'Show Results',
          'Use my current location': 'Use my current location',
          'Sort By': 'Sort By',
          'Rating': 'Rating',
          'Distance': 'Distance',
          'Sort Results': 'Sort Results',
          'Filter Options': 'Filter Options',
          'Pick-up day': 'Pick-up day',
          'Today': 'Today',
          'Pick-up time': 'Pick-up time',
          'Categories': 'Categories',
          'Coffee': 'Coffee',
          'Vegetarian': 'Vegetarian',
          'Vegan': 'Vegan',
          'Apply Filters': 'Apply Filters',
          'Clear Filters': 'Clear Filters',

          //Unavailable items
          'Pickup order from': 'Pickup order from',
          'Reserve': 'Reserve',
          'Items': 'Items',
          'Sold Out': 'Sold Out',
          'The bag may contain some sandwiches, teas, chocolates or coffee and ground beans.':
              'The bag may contain some sandwiches, teas, chocolates or coffee and ground beans.',
          'What you need to know': 'What you need to know',
          'The bag may contain some sandwiches, teas, chocolates or coffee and ground beans.':
              'The bag may contain some sandwiches, teas, chocolates or coffee and ground beans.',
          'More info': 'More info',
          'Allergens': 'Allergens',
          'Store Reviews': 'Store Reviews',
          'Food Quality': 'Food Quality',
          'Staff Service': 'Staff Service',
          'Overall Value': 'Overall Value',
          'Item Details': 'Item Details',
          'What’s in': 'What’s in',
          'The bag may contain some sandwiches, teas, chocolates or coffee and ground beans.':
              'The bag may contain some sandwiches, teas, chocolates or coffee and ground beans.',
          "This store has no available bags today. Click here to see some recommendations that are just as good!":
              "This store has no available bags today. Click here to see some recommendations that are just as good!",
          "Recommended stores": 'Recommended stores',
          "This store doesn't have any bags available, but here are some equally great alternatives!":
              "This store doesn't have any bags available, but here are some equally great alternatives!",

          //Order confirmation
          "Your Order": "Your Order",
          'Order Confirmation': 'Order Confirmation',
          'Pending Pick-Up': 'Pending Pick-Up',
          'Trouble with the order?': 'Trouble with the order?',
          'to pick up': 'to pick up',
          'What would you like to do?': 'What would you like to do?',
          'Cancel reservation': 'Cancel reservation',
          'Contact support': 'Contact support',
          'Cancel order?': 'Cancel order?',
          'Are you sure you want to cancel your order with':
              'Are you sure you want to cancel your order with',
          'Yes, cancel': 'Yes, cancel',
          "No, don’t cancel": "No, don’t cancel",
          "Collect Order": 'Collect Order',
          'Ready to collect? Just share the order ID with the staff to proceed.':
              'Ready to collect? Just share the order ID with the staff to proceed.',
          'Slide to collect': 'Slide to collect',
          'You’ve picked up your order!': 'You’ve picked up your order!',
          'Your order has been collected! Thank you.':
              'Your order has been collected! Thank you.',
          'Got it!': 'Got it!',
          'You just saved a meal!': 'You just saved a meal!',
          'Thank you for helping reduce food waste and making a change':
              'Thank you for helping reduce food waste and making a change',

          //My Orders
          'My Orders': 'My Orders',
          'Active orders': 'Active orders',
          'Past orders': 'Past orders',
          'Order Confirmation ': 'Order Confirmation ',
          'Order Completed': 'Order Completed',
          'Rate this order': 'Rate this order',
          'Overview': 'Overview',
          'Order details': 'Order details',
          'Back to home': 'Back to home',

          //Support
          'Contact Us': 'Contact Us',
          'Choose topic': 'Choose topic',
          'Select a topic...': 'Select a topic...',
          'Which order do you need help with?':
              'Which order do you need help with?',
          'Select an order...': 'Select an order...',
          'Upload images': 'Upload images',
          'Message': 'Message',
          'I have an issue with the order...':
              'I have an issue with the order...',
          'Submit': 'Submit',
          "Your message has been sent!": "Your message has been sent!",
          "We will do our best to get back to you at the soonest. Remember to check your spam folder in some cases.":
              "We will do our best to get back to you at the soonest. Remember to check your spam folder in some cases.",

          //Canceled Order
          'Order Cancelled': 'Order Cancelled',
          'Refund process': 'Refund process',
          'Cancellation request received': 'Cancellation request received',
          'Amount refunded to wallet': 'Amount refunded to wallet',
          'Amount will be refunded within': 'Amount will be refunded within',
          'working days': 'working days',
          'Pending selection of refund option':
              'Pending selection of refund option',
          "Choose Refund Option": 'Choose Refund Option',
          'Wallet (Instant Refund)': 'Wallet (Instant Refund)',
          'Original Payment Method': 'Original Payment Method',
          'The amount will be refunded within 14 working days, subject to bank processing times.':
              'The amount will be refunded within 14 working days, subject to bank processing times.',
          "Refund": "Refund",

          //favorites
          "My favorites": "My favorites",
          "Remove from favorites?": "Remove from favorites?",
          "Are you sure you want to remove": 'Are you sure you want to remove',
          'from your favorites?': 'from your favorites?',
          'Remove Favorite': 'Remove Favorite',

          //Account
          'CO2 avoided': 'CO2 avoided',
          'Money saved': 'Money saved',
          'Manage Account': 'Manage Account',
          'Account details': 'Account details',
          'Payment methods': 'Payment methods',
          'Vouchers': 'Vouchers',
          'Support': 'Support',

          //Account details
          "Edit Profile": "Edit Profile",
          'Update Profile': 'Update Profile',
          'Delete Account': 'Delete Account',

          //Rate order
          'Rate your order from': 'Rate your order from',
          'How was the food?': 'How was the food?',
          'How friendly were the staff?': 'How friendly were the staff?',
          'How was the value for money?': 'How was the value for money?',
          'Submit Review': 'Submit Review',
          'Thank you!': 'Thank you!',
          'We will use your feedback to constantly improve our services.':
              'We will use your feedback to constantly improve our services.',

          //Wallet
          'Wallet': 'Wallet',
          'Your Balance': 'Your Balance',
          'Add funds': 'Add funds',
          'Recent activity': 'Recent activity',
          'Wallet funded': 'Wallet funded',
          'Wallet payment': 'Wallet payment',
          'Order refund': 'Order refund',
          'Amount sent': 'Amount sent',
          'Explore Stores': 'Explore Stores',
          'Wallet Transactions': 'Wallet Transactions',
          'Choose Payment Method': 'Choose Payment Method',
          'Payment Failed': 'Payment Failed',
          'Something went wrong, please try the payment at another time.':
              'Something went wrong, please try the payment at another time.',

          //Notifications
          "Unread Notifications": "Unread Notifications",
          'Inbox': 'Inbox',
          'Search...': 'Search...',
          'Notification Details': 'Notification Details',
          'Got it': 'Got it',

          //Money Saved
          'Money Saved': 'Money Saved',
          'This Month': 'This Month',
          'Bags Ordered': 'Bags Ordered',
          'Original Value': 'Original Value',
          'You Paid': 'You Paid',
          'Total money saved': 'Total money saved',

          //CO2 Avoided
          'CO2 Avoided': 'CO2 Avoided',
          'Smartphone charges': 'Smartphone charges',
          'Equal to charging your smartphone':
              'Equal to charging your smartphone',
          'times.': 'times.',
          'Trees planted': 'Trees planted',
          'Equal to planting': 'Equal to planting',
          'trees to absorb C02 over a year.':
              'trees to absorb C02 over a year.',
          'Kilometers driven in a car': 'Kilometers driven in a car',
          'Equal to driving a car for': 'Equal to driving a car for',
          'kilometers.': 'kilometers.',
          'Cups of hot coffee': 'Cups of hot coffee',
          'Equal to brewing': 'Equal to brewing',
          'cups of hot coffee.': 'cups of hot coffee.',
          'Total CO2 avoided': 'Total CO2 avoided',

          //Donations
          'Where are the donations from?': 'Where are the donations from?',
          'With every order, we donate 1% of the amount to local charities and institutions.':
              'With every order, we donate 1% of the amount to local charities and institutions.',

          //Vouchers
          'Available Vouchers': 'Available Vouchers',

          //Frequently Asked Questions
          'Frequently Asked Questions': 'Frequently Asked Questions',
          "How do the ratings work?": "How do the ratings work?",
          'Why are the meals affordable?': 'Why are the meals affordable?',

          //Terms & Conditions
          'Terms & Conditions': 'Terms & Conditions',
          "Welcome to Wajba! By using our app, you agree to the following terms and conditions. Please read them carefully.":
              "Welcome to Wajba! By using our app, you agree to the following terms and conditions. Please read them carefully.",
          "1. Acceptance of Terms": '1. Acceptance of Terms',
          'By downloading, accessing, or using Wajba, you acknowledge that you have read, understood, and agree to these terms. If you do not agree, do not use the app.':
              'By downloading, accessing, or using Wajba, you acknowledge that you have read, understood, and agree to these terms. If you do not agree, do not use the app.',
          '2. User Accounts': '2. User Accounts',
          "You must provide accurate and complete information when creating an account.":
              "You must provide accurate and complete information when creating an account.",
          "You are responsible for keeping your login credentials secure.":
              "You are responsible for keeping your login credentials secure.",
          "3. Use of the App": "3. Use of the App",
          "Wajba is intended for personal, non-commercial use.":
              "Wajba is intended for personal, non-commercial use.",
          "Do not misuse the app by interfering with its normal operation or accessing it using unauthorized methods.":
              "Do not misuse the app by interfering with its normal operation or accessing it using unauthorized methods.",
          "4. Content and Usage": "4. Content and Usage",
          "All app content, including text, graphics, and logos, is the property of Wajba or its licensors.":
              "All app content, including text, graphics, and logos, is the property of Wajba or its licensors.",
          'You may not reproduce, distribute, or create derivative works without explicit permission.':
              'You may not reproduce, distribute, or create derivative works without explicit permission.',

          //miscellaenous
          "Select Payment Method": "Select Payment Method",
          'Debit/Credit Card': 'Debit/Credit Card',
          'Apple Pay': 'Apple Pay',
          'Google Pay': 'Google Pay',
          'BenefitPay': 'BenefitPay',
          'My Cards': 'My Cards',
          'Visa ending in': 'Visa ending in',
          'Expiry': 'Expiry ',
          'Default card': 'Default card',
          'Set as default': 'Set as default',
          'Add new card': 'Add new card',
          'Pay Amount': 'Pay Amount',
          'Add Card': 'Add Card',
          'Card number': 'Card number',
          'Name on card': 'Name on card',
          'Save card for later': 'Save card for later',
          'Delete': 'Delete',
          'digits': 'digits',
          'Delete Card?': 'Delete Card?',
          'Are you sure you want to remove VISA card ending with':
              'Are you sure you want to remove VISA card ending with',
          'Remove Card': 'Remove Card',
          'Nevermind': 'Nevermind',
        },
        'ar': {},
      };
}
