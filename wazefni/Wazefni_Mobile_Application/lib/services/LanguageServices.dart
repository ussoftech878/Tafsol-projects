// ignore_for_file: equal_keys_in_map

import 'package:get/get.dart';

// Create a class to handle translation
class TranslationService extends Translations {
  // Define language maps for English and Arabic
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          //Onboarding 1
          'Qualified candidates are at your fingertips':
              'Qualified candidates are \n at your fingertips',
          'Find the best oppurtunities without moving or searching':
              'Browse the best jobs easily and comfortably without the hassle of searching and moving around',
          'Goodbye to efforts and expenses': 'Goodbye to efforts and expenses',
          "Quick and effective hiring": "Quick and effective hiring",
          'change_lang': 'عربي',
          'wazefni_iraq': 'Wazefni Iraq',
          'description':
              'Connecting you with opportunities quickly to achieve success. We\'re the choice that sets you apart with unique services',
          'Next': 'Next',
          'Back': 'Back',
          'Skip': 'Skip',
          //Onboarding 2
          'For Job Seekers': 'For Job Seekers',
          'description2':
              'Find jobs that match your skills easily. Get noticed by employers and receive direct invitations that fit your profile',
          "Build a professional resume": "Build a professional resume",
          "One-click job applications": "One-click job applications",
          "Track your application": "Track your application",
          "Get replies and meet employers": "Get replies and meet employers",
          //Onboarding 3
          'For Employers': 'For Employers',
          'description3':
              'Save time and effort with candidates tailored to \nyour needs. Post jobs, track applications, and\n schedule interviews easily',
          'Get Started': 'Get Started',
          //Onboarding 4
          "Sort candidtates and set interviews":
              "Sort candidtates and set interviews",
          "Track applications from anywhere.":
              "Track applications from anywhere.",
          "Announce your job vacancies.": "Announce your job vacancies.",
          "Share latest news about business.":
              "Share latest news about business.",
          'Create account': 'Create account',
          'Job seeker': 'Job seeker',
          'Employers': 'Employers',
          'Looking for Employees': 'Looking for employees',
          'Looking for jobs': 'Looking for jobs',
          'About Us': 'About Us',
          'Sign In': 'Sign In',
          "Start": "Start",
          //Signup
          "Sigup description":
              "Fill out your details below or join in one step using your \nsocial media account",
          "Full Name": "Full Name",
          //corporateSignup
          "NameField": "The official name of the company",

          // EmployerSignup
          "EmployerSignupBar":
              "Create a special projects account using the options below\n to ensure excellence and credibility",
          //InstitutionSignup
          "InstitutionSignupBar":
              "Creating an institution account is done via email only to\n maintain excellence and high credibility",
          "InstitutionNameField": "The official name of the institution",
          //OrganizationSignup
          "OrganizationSignupBar":
              "Creating an organization account is done via email only to \nmaintain excellence and high credibility",
          "OrganizationNameField": "The official name of the organization",
          //WelcomeScreen
          "welcome_description":
              'Create your account on wazefni_iraq and discover \nthousands of jobs where we connect talents and \nopportunities to achieve success.',
          "Create your account to connect with top talent and link competencies to opportunities for business success.":
              "Create your account to connect with top talent and link competencies to opportunities for business success.",
          //SigninScreen
          'Welcome Back': 'Welcome Back',
          "Log in to wazefni_iraq and discover thousands of jobs where we match talent with opportunities for success":
              "Log in to wazefni_iraq and discover thousands of jobs where we match talent with opportunities for success",
          "Forgot your Password?": "Forgot your Password?",
          "Don\t have an account ?": "Don't have an account ?",
          "Account Recovery": "Account Recovery",
          "Enter your email to receive a password reset code.":
              "Enter your email to receive a password reset code.",

          "Register with Facebook": "Register with Facebook",
          "Sign Up with Google": "Sign up with Google",
          'Create a new account': 'Create a new account',
          ' Log In': ' Log In',
          "Login": "Login",
          "Welcome": "Welcome",
          "Mail": "Mail",
          "Phone": "Phone",
          "Password": "Password",
          "Register": "Register",
          "By registering you agree to our ":
              "By registering you agree to our ",
          "Terms of Use": "Terms of Use",
          "Privacy Policy": "Privacy Policy",
          " and ": " and ",
          'Aready have an Account?': 'Aready have an Account?',
          'account check': 'Don\'t have an account? ',
          'Recover via ': 'Recover via ',
          'Phone Number': 'Phone Number',
          "Continue": "Continue",
          "Email": "Email",

          //OTP screen
          "Password Recovery": "Password Recovery",
          'Enter the confirmation code sent via email to ':
              'Enter the confirmation code sent via email to ',
          'example@email.com': '\nexample@email.com',
          'Edit Email': 'Edit Email',
          'You will receive the code within':
              'You will receive the code within ',
          "seconds": " seconds",
          "Didn't receive the code?": "Didn't receive the code?",
          "Resend": " Resend",
          'Edit Phone': 'Edit Phone',
          "Email Confirmation": "Email Confirmation",
          "Enter Confirmation Code": "Enter Confirmation Code",
          "or": "or",

          "Your sector": "Your sector",

          //jobemployer Welcome screen
          "Employer welcome intro":
              "Create your account to connect with top talent and link\n competencies to opportunities for business success.",
          "Choose your industry account type":
              "Choose your industry account type",
          "Special projects": "Special projects",
          "I’m a business owner looking for employees":
              "I’m a business owner\nlooking for employees",
          "Companies": "Companies",
          "We are a company looking for employees":
              "We are a company \nlooking for employees",
          "Institutions": "Institutions",
          "We are an institution looking for employees":
              "We are an institution \nlooking for employees",
          "Organizations": "Organizations",
          "We are an organization looking for employees":
              "We are an organization \nlooking for employees",
          "Small & Medium": "Small & Medium",
          "Shops, restaurants, markets, and small factories":
              "Shops, restaurants, markets, and small factories",

          //Employer Signup Email
          "The commercial name of the project":
              "The commercial name of the project",
          "CorpBar":
              "Creating a company account is done via email only to \nmaintain excellence and high credibility",

          //newPassword
          "Set a new password": "Set a new password",
          "Create a strong secure password to protect your account":
              "Create a strong secure password to protect your account",
          "New Password": "New Password",
          "Confirm password": "Confirm password",
          "Save": "Save",

          'Welcome back': 'Welcome back',
          'Enter your phone to receive a password reset code.':
              'Enter your phone to receive a password reset code.',
          'The confirmation code sent via Whatsapp to ':
              'The confirmation code sent via Whatsapp to ',
          "Password didnt match": "Password didn't match",

          //Emailinfo
          "Make a great first impression": "Make a great first impression",
          "Add a professional profile picture to best represent you":
              "Add a professional profile picture to best represent you",
          "Profile Picture": "Profile Picture",
          "Enter your personal information": "Enter your personal information",
          "Enter data accurately for a unique and precise experience.":
              "Enter data accurately for a unique and precise experience.",
          "Date of Birth": "Date of Birth",
          "City": "City",
          "Choose your favorite sector": "Choose your favorite sector",
          "Male": "Male",
          "Female": "Female",
          "Mail (Optional)": "Mail (Optional)",
          "Upload your logo to represent your business professionally.":
              "Upload your logo to represent your business professionally.",
          "Your logo": "Your logo",
          "Enter Project Information": "Enter Project Information",
          "Enter data accurately for a unique and precise experience. Your information is private and visible only to you.":
              "Enter data accurately for a unique and precise experience.\n Your information is private and visible only to you.",
          "Name of hiring manager": "Name of hiring manager",
          "Do you need help?": "Do you need help?",
          "Contact us": "Contact us",
          "Enter Company Information": "Enter Company Information",
          "Enter Institution Information": "Enter Institution Information",
          "Enter Organization Information": "Enter Organization Information",
          "Terms of Use": "Terms of Use",
          "You will receive the code within ":
              "You will receive the code within ",
          "seconds": " seconds",
          'Enter your email to receive a password reset code.':
              "Enter your email to receive a password reset code.",

          "The confirmation code sent via Whatsapp to +964 123456789":
              "The confirmation code sent via Whatsapp to +964 123456789",

          //Tooltip
          "At least a binary name": "At least a binary name",
          "Example: example@email.com": "Example: example@email.com",

          "Invalid email address (example: example@email.com)":
              "Invalid email address (example: example@email.com)",

          "Example: 123-456-7890": "Example: 123-456-7890",
        },
        'ar': {
          "Qualified candidates are at your fingertips":
              "أفضل الكفاءات بين يديك ومرشحون \n مثاليون لتحقيق أهدافك",
          "Quick and effective hiring": "توظيف سريع وفعال",
          "Find the best oppurtunities without moving or searching":
              "تصفح أفضل الوظائف بسهولة وراحة دون عناء البحث والتنقل",
          'Goodbye to efforts and expenses': 'وداعا للجهود والمصاريف',
          'change_lang': 'English',
          'wazefni_iraq': 'وظفني العراق',
          'description':
              'يربط بينك وبين الفرص بسهولة وسرعة لتحقيق النجاح نحن الخيار الذي يميزك بفضل خدماتنا الفريدة',
          'Next': 'التالي',
          'Back': 'رجوع',
          'Skip': 'تخطي',
          //Onboarding 2
          'For Job Seekers': 'للباحثين عن العمل',
          'description2':
              'اختصر وقتك وابحث عن فرص عمل تناسبك بسهولة نحن نرشحك أمام أصحاب العمل لتتلقى دعوات عمل مباشرة ونقدم لك وظائف تتوافق تماماً مع مؤهلاتك',
          "Build a professional resume": "أنشئ سيرة ذاتية احترافية",
          "One-click job applications": "قدم للوظائف بنقرة واحدة",
          "Track your application": "تابع طلبات التقديم من أي مكان",
          "Get replies and meet employers": "انتظر رد وقابل أصحاب العمل",

          //Onboarding 3
          'For Employers': 'لأصحاب الأعمال',
          'description3':
              'نوفر لك الوقت والجهد حيث يتقدم فقط المرشحون المتوافقون مع احتياجاتك كما نرشح لك موظفين جاهزين فوراً للعمل لتسريع عملية التوظيف',
          'Get Started': 'ابدأ الآن',
          //WelcomeScreen
          "welcome_description":
              'انشئ حسابك في وظفني العراق واكتشف الآلاف من الوظائف حيث نربط بين المواهب والفرص لتحقيق النجاح',
          "Create your account to connect with top talent and link competencies to opportunities for business success.":
              "انشئ حسابك في وظفني العراق واكتشف الآلاف من الموظفين المميزين لدعم اعمالك حيث نربط الكفاءات بالفرص لتحقيق النجاح",
          //Onboarding 4
          "Sort candidtates and set interviews": "صنف المرشحين وحدد المقابلات",
          "Track applications from anywhere.": "تابع طلبات التقديم من أي مكان",
          "Announce your job vacancies.": "اعلن عن الوظائف الشاغرة لديك",
          "Share latest news about business.": "انشر آخر الاخبار حول عملك",
          'Create account': 'ابدأ بإنشاء حسابك',
          'Job seeker': 'باحث عن عمل',
          "Start": "لنبدأ",

          //Signup
          "Sigup description":
              "املأ بياناتك أدناه أو انضم بخطوة واحدة باستخدام حسابك على شبكات التواصل",
          "Full Name": "الاسم الكامل",

          //jobemployer Welcome screen
          "Employer welcome intro":
              "انشئ حسابك في وظفني العراق واكتشف الآلاف من الموظفين \nالمميزين لدعم اعمالك حيث نربط الكفاءات بالفرص لتحقيق النجاح",
          "Choose your industry account type":
              "اختر نوع الحساب الذي يمثل مجال عملك",
          "Special projects": "مشاريع خاصة",
          "I’m a business owner looking for employees":
              "أنا صاحب مشروع ابحث\nعن موظفين",
          "Companies": "شركات",
          "We are a company looking for employees":
              "نحن شركة رسمية نبحث\nعن موظفين",
          "Institutions": "مؤسسات",
          "We are an institution looking for employees":
              "نحن مؤسسة رسمية نبحث\nعن موظفين",
          "Organizations": "منظمات",
          "We are an organization looking for employees":
              "نحن منظمة رسمية نبحث\nعن موظفين",
          "Already have an account?": "Already have an account?",
          "Small & Medium": "المتوسطة والصغيرة",
          "Shops, restaurants, markets, and small factories":
              "المتاجر والمطاعم والأسواق والمصانع الصغيرة",

          //SigninScreen
          'Welcome Back': 'مرحبًا بعودتك',
          "Log in to wazefni_iraq and discover thousands of jobs where we match talent with opportunities for success":
              "سجّل دخولك إلى وظفني العراق واكتشف الآلاف من الوظائف حيث نربط بين المواهب والفرص لتحقيق النجاح",
          "Forgot your Password?": "نسيت كلمة المرور؟",
          "account check": "ليس لديك حساب؟",
          "Account Recovery": "استعادة الحساب",
          "Enter your email to receive a password reset code.":
              "أدخل بريدك الالكتروني لاستلام رمز إعادة تعين كلمة المرور",
          'Recover via ': "استعد حسابك عبر ",
          'Phone Number': 'رقم الهاتف',

          //Employer Signup
          "The commercial name of the project": "الاسم التجاري للمشروع",
          "EmployerSignupBar":
              "انشاء حساب المشاريع الخاصة يتم عبر الخيارات المتاحة ادناه للحفاظ على التميز والمصداقية العالية",
          "CorpBar":
              "انشاء حساب الشركات يتم عبر البريد الالكتروني فقط للحفاظعلى التميز والمصداقية العالية",
          "InstitutionSignupBar":
              "انشاء حساب المؤسسات يتم عبر البريد الالكتروني فقط للحفاظعلى التميز والمصداقية العالية",
          "OrganizationSignupBar":
              "انشاء حساب المنظمات يتم عبر البريد الالكتروني فقط للحفاظعلى التميز والمصداقية العالية",

          //Otp Screen
          "Password Recovery": "استرجاع كلمة المرور",
          "Enter the confirmation code sent via email to ":
              "أدخل رمز التأكيد المرسل عبر البريد الإلكتروني",
          "example@email.com": "example@email.com",
          "Edit Email": "تعديل البريد الإلكتروني",
          "Edit Phone": "تعديل رقم الهاتف",
          "You will receive the code within": " سوف يصلك الرمز خلال",
          "Didn't receive the code?": "لم يصلك الرمز؟",
          "Resend": " أعد إرساله",
          "Email Confirmation": "تأكيد البريد الإلكتروني",
          "Enter Confirmation Code": 'ادخل رمز التأكيد',

          'Employers': 'صاحب عمل',
          'Looking for Employees': 'أبحث عن موظفين',
          'Looking for jobs': 'أبحث عن وظيفة',
          'About Us': 'تسجيل الدخول',
          'Sign In': 'من نحن',
          'Mail': "البريد الالكتروني",
          'Phone': "الهاتف",
          "Welcome": "أهلًا بك",
          "Register with Facebook": "تسجيل باستخدام فيسبوك",
          "Sign Up with Google": "تسجيل باستخدام جوجل",
          'Create a new account': ' انشاء حساب جديد',
          'or': 'او',
          'Aready have an Account?': 'لديك حساب بالفعل؟ ',
          ' Log In': ' تسجيل الدخول',
          'Login': 'تسجيل دخول',
          "Password": "كلمة المرور",
          "Continue": "متابعة",
          "Email": "البريد الالكتروني",
          "Register": "تسجيل",
          "By registering you agree to our ": "من خلال التسجيل انت توافق على  ",
          "Terms of Use": "شروط الاستخدام",
          "Privacy Policy": "سياسة الخصوصية",
          " and ": " و ",

          //newPassword
          "Set a new password": "تعيين كلمة مرور جديدة",
          "Create a strong secure password to protect your account":
              "قم بانشاء كلمة مرور قويه وآمنه لحماية حسابك",
          "New Password": "كلمة المرور الجديدة",
          "Confirm password": "تأكيد كلمة المرور",
          "Save": "حفظ",
          "Welcome back": "مرحبًا بعودتك",
          "Enter your phone to receive a password reset code.":
              "ادخل رقم الهاتف المستخدم لاستلام رمز إعادة تعين كلمة المرور",
          "The confirmation code sent via Whatsapp to ":
              "تم ارسال الرمز إلى واتساب",
          "Password didnt match": "كلمة المرور غير متطابقة",

          //Emailinfo
          "Make a great first impression": "اترك انطباعًا اوليًا رائعًا",
          "Add a professional profile picture to best represent you":
              "اضف صورة شخصية احترافية لتمثلك بأفضل شكل",
          "Profile Picture": "الصورة الشخصية",
          "Enter your personal information": "ادخل معلوماتك الشخصية",
          "Enter data accurately for a unique and precise experience.":
              "ادخال البيانات ادناه مهم لضمان دقة المعلومات وتقديم تجربة مميزة.",
          "Date of Birth": "تاريخ الميلاد",
          "City": "المدينة",
          "Choose your favorite sector": "اختر قطاعك المفضل",
          "Your sector": "اختر القطاع",
          "Male": "ذكر",
          "Female": "انثى",
          "Mail (Optional)": "البريد الالكتروني (اختياري)",
          "Upload your logo to represent your business professionally.":
              "اضف صورة شعارك لتمثل عملك بشكل احترافي",
          "Your logo": "اضف شعارك",
          "Enter Project Information": "ادخل معلومات المشروع",
          "Enter data accurately for a unique and precise experience. Your information is private and visible only to you.":
              "ادخال البيانات ادناه مهم لضمان دقة المعلومات وتقديم تجربة مميزة\nالبيانات الهامة خاصه بك ولن يراها احد غيرك",
          "Name of hiring manager": "اسم مدير التوظيف",
          "Do you need help?": "هل تحتاج إلى مساعدة؟ ",
          "Contact us": "تواصل معنا",
          "Enter Company Information": "ادخل معلومات الشركة",
          "Enter Institution Information": "ادخل معلومات المؤسسة",
          "Enter Organization Information": "ادخل معلومات المنظمة",

          //corporate
          "NameField": "الاسم الرسمي للشركة",

          //Institution
          "InstitutionNameField": "الاسم الرسمي للمؤسسة",

          //Organization
          "OrganizationNameField": "الاسم الرسمي للمنظمة",
          //Errors
          "Terms of Use": "شروط الاستخدام",
          "Invalid email address (example: example@email.com)":
              "(مثال: example@email.com) عنوان البريد الإلكتروني غير صالح ",
          "The password must be at least 6 numbers or letters":
              "يجب أن تحتوي كلمة المرور على 6 أحرف على الأقل",
          "Please enter your password": "الرجاء إدخال كلمة المرور",
          "Please check your phone number": "الرجاء التحقق من رقم الهاتف",
          "seconds": " ثانية ",
          "This field requires at least the binary name":
              "هذا الحقل يتطلب الاسم الثنائي على الاقل",
          "Invalid phone number (example: xxx-xxx-xxx)":
              "رقم الهاتف غير صالح (مثال: xxx-xxx-xxx)",
          "You will receive the code within ": "سوف يصلك الرمز خلال ",
          "seconds": " ثانية",
          'Enter Confirmation code': 'ادخل رمز التأكيد',
          "The confirmation code sent via Whatsapp to +964 123456789":
              "تم ارسال الرمز إلى واتساب964 123456789 +",

          //Tooltip
          "At least a binary name": "على الأقل اسم ثنائي",
          "Example: example@email.com": "مثال:example@email.com",

          "Example: 123-456-7890": "مثال: 7890-456-123",
        },
      };
}
