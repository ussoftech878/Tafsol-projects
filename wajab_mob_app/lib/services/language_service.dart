// ignore_for_file: equal_keys_in_map

import 'package:get/get.dart';

class TranslationService extends Translations {
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
          'Log Out': 'Log Out',
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

          //My Orders
          'My Orders': 'My Orders',
          'Active orders': 'Active orders',
          'Past orders': 'Past orders',
          'Order Confirmation ': 'Order Confirmation ',
          'Order Completed': 'Order Completed',
          'Rate this order': 'Rate this order',
          'Overview': 'Overview',
          'Order details': 'Order details',
          'Today at': 'Today at',
          'AM': 'AM',
          'The Walk, Riffa': 'The Walk, Riffa',
          'Back to home': 'Back to home',
          'Sandwich Bag': 'Sandwich Bag',
          'Pastries Bag': 'Pastries Bag',

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
          'CO2 avoided': 'CO\u2082 avoided',
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
          'Total money \nsaved': 'Total money saved',

          //CO2 Avoided
          'CO2 Avoided': 'CO2 Avoided',
          "Feburary": "Feburary",

          'Smartphone charges': 'Smartphone charges',
          'Equal to charging your smartphone X times.':
              'Equal to charging your smartphone X times.',
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
          'Total CO2 \navoided': 'Total CO2 \navoided',

          //Donations
          'Where are the donations from?': 'Where are the donations from?',
          'With every order, we donate 1% of the amount to local charities and institutions.':
              'With every order, we donate 1% of the amount to local charities and institutions.',

          //Vouchers
          'Available Vouchers': 'Available Vouchers',
          'Valid till December 12, 2024': 'Valid till December 12, 2024',

          //Frequently Asked Questions
          'Frequently Asked Questions': 'Frequently Asked Questions',
          "FAQs": "FAQs",
          "How do the ratings work?": "How do the ratings work?",
          'Why are the meals affordable?': 'Why are the meals affordable?',
          "What is Wajba?": "What is Wajba?",

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
          "Pick-up details": "Pick-up details",
          'My Cards': 'My Cards',
          'Visa ending in': 'Visa ending in',
          'Expiry': 'Expiry ',
          'Default card': 'Default card',
          'Set as default': 'Set as default',
          'Add new card': 'Add new card',
          "Thank you for helping reduce food\nwaste and making a change":
              "Thank you for helping reduce food\nwaste and making a change",
          'Pay Amount': 'Pay Amount',
          'Add Card': 'Add Card',
          'Card number': 'Card number',
          'Name on card': 'Name on card',
          'Save card for later': 'Save card for later',
          'Delete': 'Delete',
          'digits': 'digits',
          'Edit Card': 'Edit Card',
          'Delete Card?': 'Delete Card?',
          'Are you sure you want to remove VISA card ending with':
              'Are you sure you want to remove VISA card ending with',
          'Remove Card': 'Remove Card',
          'Never mind': 'Never mind',
          "Pick-Up Today at": "Pick-Up Today at",
          'kg': 'kg',
          'BHD': 'BHD',
        },
        'ar': {
          //login with screen
          'Continue with Apple': 'إستمر باستخدام Apple',
          'Continue with Google': 'إستمر باستخدام Google',
          'Continue with Email': 'إستمر باستخدام البريد الإلكتروني',
          'Continue as Guest': 'إستمر بدون حساب',
          'Don\'t have an account? ': 'ليس لديك حساب؟',
          'Sign Up': ' سجل الآن',
          //login bottom sheet
          'Welcome Back!': 'مرحبًا بعودتك!',
          'Sign into your account': 'سجّل الدخول إلى حسابك',
          'Email': 'البريد الإلكتروني',
          'Password': 'كلمة المرور',
          'Forgot Password?': 'نسيت كلمة المرور؟',
          'Login': 'تسجيل الدخول',
          //auth
          "Create Account": "إنشاء حساب",
          "Continue": "تابع",
          "Phone Number": "رقم الهاتف",
          "Verify Phone": "تحقق من الرقم",
          "You will receive an SMS with the one-time password (OTP) needed to verify your number.":
              "ستتلقى رسالة نصية قصيرة تحتوي على كلمة المرور لمرة واحدة (OTP) اللازمة للتحقق من رقمك.",
          "Resend Code 59s": "إعادة إرسال الرمز 59s",
          "Enter Your Details": "أدخل بياناتك",
          "First Name": "الاسم الأول",
          "Enter your first name": "أدخل اسمك الأول",
          "Last Name": "اسم العائلة",
          "Enter your last name": "أدخل اسم عائلتك",
          "Gender": "الجنس",
          "Male": "ذكر",
          "Female": "أنثى",
          "Email (Optional)": "البريد الإلكتروني",
          "someone@gmail.com": "someone@gmail.com",
          "Password": "كلمة المرور",
          "Confirm Password": "تأكيد كلمة المرور",
          'Reset Password': 'إعادة تعيين كلمة المرور',
          'Change Password': 'تغيير كلمة المرور',
          'Enter your new password below to complete the password reset process.':
              'الرجاء إدخال كلمة المرور الجديدة، لإستكمال عملية تغيير كلمة المرور.',
          'Your password has been reset': 'تم إعادة تعيين كلمة المرور',
          'Your password has been successfully reset and can now log in with your new password.':
              'تم إعادة تعيين كلمة المرور الخاصة بك بنجاح ويمكنك الآن تسجيل الدخول باستخدام كلمة المرور الجديدة.',
          'Got it': 'حسنًا!',
          //onboarding
          'Find great deals': 'ابحث عن عروض رائعة',
          'Discover local spots with delicious food\nthat\'s too good to waste.':
              'اكتشف أماكن محلية تقدم طعامًا لذيذًا لا\nينبغي إهداره.',
          'Skip': 'تخطَّ',
          'Quick and easy pickup': 'استلام سريع وسهل',
          'Once you\'ve reserved a meal, just swing\nby the store and pick it up.':
              'بمجرد حجز وجبتك، ما عليك سوى التوجه إلى\nالمتجر واستلامها.',
          'Big savings, small changes': 'توفير كبير، تغييرات صغيرة',
          'Find discounted food and help reduce\nwaste while keeping your wallet happy.':
              'ابحث عن طعام مخفض وساعد في تقليل\nالهدر مع الحفاظ على ميزانيتك سعيدة.',
          'All Set!': 'All Set!',
          'Location': 'Location',
          'Where would you like to\nfind your meal deals?':
              'أين تود العثور على عروض\nالوجبات الخاصة بك؟',
          'Pick your area so we can match you with\nlocal meal deals.':
              'اختر منطقتك لنتمكن من مطابقتك مع عروض\nالوجبات المحلية.',
          'Use My Current Location': 'استخدم موقعي الحالي',
          'Maybe Later': 'ربما لاحقًا',
          'Notifications': 'الإشعارات',
          'Location': 'الموقع',
          'Stay Updated!': 'ابقَ على اطلاع!',
          'Want to stay in the know? Get alerts for\norder updates, new stores and exclusive\ndeals, right when they happen.':
              'هل تريد البقاء على اطلاع؟ احصل على تنبيهات\nلتحديثات الطلبات، والمتاجر الجديدة، والعروض\nالحصرية فور حدوثها.',
          'Allow Notifications': 'السماح بالإشعارات',
          //home
          'Within 4.1 km': 'ضمن 4.1 كم',
          'Manama': 'المنامة',
          'Search for food or stores': 'ابحث عن طعام أو متاجر',
          'Meals': 'وجبات',
          'Café': 'مقهى',
          'Groceries': 'البقالة',
          'Bakery': 'مخبز',
          'Dessert': 'مخبز',
          'Close to you': 'قريب منك',
          'See All': 'عرض الكل',
          'Usual Pick': 'Usual Pick',
          '5 Left': 'تبقى 3',
          'BHD ': 'د.ب',
          "Pick up Tomorrow 2:00am - 5:00am":
              'الاستلام غدًا من 2:00 صباحًا - 5:00 صباحًا',
          'Tomorrow': 'Tomorrow',
          'Recommended for you': 'موصى به لك',
          'Home': 'Home',
          'Browse': 'Browse',
          'Favorites': 'Favorites',
          'Account': 'Account',
          'Limited Offer': 'Limited Offer',
          "Seems like there aren't many stores in your area. Tap here to expand your location radius for more options.":
              "Seems like there aren't many stores in your area. Tap here to expand your location radius for more options.",

          //usama working start
          //Account
          'CO2 avoided': 'الانبعاثات المتجنبة',
          'Money saved': 'المال المدخر',
          'kg': 'كغ',
          'Smartphone charges': 'شحن الهواتف الذكية',
          'Equal to charging your smartphone X times.':
              'يعادل شحن هاتفك الذكي X مرات.',
          'times.': 'مرات.',
          'BHD': 'د.ب',
          'Feburary': 'فبراير',
          'Manage Account': 'إدارة الحساب',
          'Account details': 'تفاصيل الحساب',
          'Total CO2 \navoided': ' إجمالي الانبعاثات\n المتجنبة',
          'Payment methods': 'طرق الدفع',
          'Vouchers': 'القسائم',
          'Support': 'الدعم',
          'My Orders': 'طلباتي',
          "FAQs": "الأسئلة الشائعة",
          'Terms & Conditions.': 'الشروط والأحكام',
          'Log Out': 'تسجيل الخروج',
          'This Month': 'هذا الشهر',
          'Bags Ordered': 'الحقائب المطلوبة',
          'Original Value': 'القيمة الاصليه',
          'You Paid': 'ما دفعته',
          'Total money \nsaved': ' إجمالي المال \nالمدخر',
          'Active orders': 'الطلبات النشطة',
          'Past Orders': 'Past Orders',
          'Today at': 'اليوم من',
          'AM': 'صباحًا',
          'Pick up': 'الاستلام',
          'Your Order': 'طلبك',
          'Order Confirmation': 'تاكيد الطلب',
          'Order Cancelled': 'تم إتمام الطلب',
          'Refund process': 'عملية الاسترداد',
          'Cancellation request received': 'تم استلام طلب الإلغاء',
          'Amount refunded to wallet': 'تمت استعادة المبلغ إلى المحفظة',
          'Overview': 'نظرة عامة',
          'The Walk, Riffa': 'ذا ووك، الرفاع',
          'Order details': 'تفاصيل الطلب',
          'Sandwich Bag': 'حقيبة سندويشات',
          'Pastries Bag': 'حقيبة معجنات',
          'Total': 'الإجمالي',
          'Order Completed': 'تم إتمام الطلب',
          'Rate this order': 'تقييم الطلب',
          'Back to Home': 'العودة إلى الرئيسية',
          'Rate your order from': 'قيّم طلبك من',
          'How was the food?': 'كيف كانت الوجبة؟',
          'How friendly were the staff?': 'ما مدى ودية الموظفين؟',
          'How was the value for money?': 'كيف كانت القيمة مقابل المال؟',
          'Submit Review': 'إرسال المراجعة',
          'Thank you!': 'شكرًا لك!',
          'We will use your feedback to constantly improve our services.':
              'سنستخدم ملاحظاتك لتحسين خدماتنا بشكل مستمر.',
          'Got it!': 'فهمت!!',
          "Edit Profile": "تحرير الملف الشخصي",
          "Update Profile": "تحديث الملف الشخصي",
          "Delete Account": "حذف الحساب",
          'Delete': 'حذف',
          "My Cards": " بطاقتي",
          "Set as default": 'تعيين كالبطاقة الأساسية',
          "Default card": "البطاقة الأساسية",
          "Add new card": "إضافة بطاقة جديدة",
          "Pay Amount": "دفع المبلغ",
          "Add Card": "إضافة بطاقة",
          "Name on card": 'الاسم على البطاقة',
          "Expiry": 'تاريخ الانتهاء',
          "Save card for later": 'حفظ البطاقة للاستخدام لاحقًا',
          "What would you like to do?": "ماذا تريد أن تفعل؟",
          "Edit Card": "تحرير البطاقة",
          "Card number": "رقم البطاقة",
          "Pending Pick-Up": "في انتظار البيك اب",
          "Pick-up details": "تفاصيل الاستلام",
          "Pick-Up Today at": "الاستلام اليوم في الساعة",
          "Trouble with the order?": "مشكلة في الطلب؟",
          "to pick up": "للاستلام",
          "Collect Order": "استلام الطلب",
          "Ready to collect? Just share the order ID with the staff to proceed.":
              "جاهز للاستلام؟ فقط شارك رقم الطلب مع الموظف للمتابعة.",
          "Slide to collect": "اسحب للاستلام",
          "Cancel reservation": "إلغاء الحجز",
          "Contact Support": "طلب الدعم",
          "Cancel order?": "إلغاء الطلب؟",
          "Are you sure you want to cancel your order with":
              "هل أنت متأكد أنك تريد إلغاء طلبك مع",
          "Yes, cancel": "نعم ، إلغاء",
          "No, don’t cancel": 'لا، لا تلغِ',
          "You just saved a meal!": "لقد أنقذت وجبة!",
          "Thank you for helping reduce food\nwaste and making a change":
              'شكرًا لمساعدتك في تقليل هدر الطعام وإحداث التغيير.',
          "Available Vouchers": " القسائم المتاحة",
          'Valid till December 12, 2024': 'صالحة حتى 12 ديسمبر 2024',
          "Frequently Asked Questions": " أسئلة شائعة",
          "What is Wajba?": "ما هي واجبة؟",
          "How do the ratings work?": "كيف تعمل التقييمات؟",
          'Why are the meals affordable?': 'لماذا الوجبات بأسعار معقولة؟',
          'Contact Us': 'تواصل معنا',
          'Choose topic': 'اختر الموضوع',
          'Select a topic...': 'حدد موضوعًا...',
          'Which order do you need help with?': 'أي طلب تحتاج المساعدة بشأنه؟',
          'Select an order...': 'حدد طلبًا...',
          'Upload images': 'رفع صور',
          'Message': 'الرسالة',
          "Submit": "إرسال",
          "Your message has been sent!": "تم إرسال رسالتك!",
          "We will do our best to get back to you at the soonest. Remember to check your spam folder in some cases.":
              "سنبذل قصارى جهدنا للرد عليك في أقرب وقت ممكن. تذكر التحقق من مجلد البريد العشوائي في بعض الحالات.",
          "Delete Card?": "هل تريد حذف البطاقة؟",
          "Are you sure you want to remove VISA card ending with":
              'هل أنت متأكد أنك تريد إزالة بطاقة فيزا التي تنتهي',
          "Remove Card": "إزالة البطاقة",
          "Never mind": 'لا داعي'
          //usama working end
        },
      };
}
