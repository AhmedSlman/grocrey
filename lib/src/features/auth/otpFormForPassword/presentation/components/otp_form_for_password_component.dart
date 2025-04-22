// class _SetNewPassViewState extends State<SetNewPassView> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: BlocConsumer<VerifyCodeCubit, VerifyCodeState>(
//             listener: (context, state) {
//               // Handle state changes here (e.g., show success/failure message)
//             },
//             builder: (context, state) {
//               return Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 67.h),
//                     Center(child: Image.asset(AppAssets.logoColored)),
//                     SizedBox(height: 9.h),
//                     Text(
//                       'ادخل كلمه المرور الجديده',
//                       style: TextStyle(
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                     SizedBox(height: 10.h),
//                     Text(
//                       'قم بانشاء كلمه مرور جديده',
//                       style: TextStyle(
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     SizedBox(height: 50.h),
//                     Text(
//                       'كلمه المرور',
//                       style: TextStyle(
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                     SizedBox(height: 10.h),
//                     CustomTextFormField(
//                       controller: _passwordController,
//                       labelText: 'Password',
//                       hintText: 'أدخل كلمة المرور الخاصة بك',
//                       isPassword: true,
//                       prefixIcon: Icon(Icons.lock, color: Colors.grey[600]),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'يرجى إدخال كلمة المرور';
//                         }
//                         return null;
//                       },
//                     ),

//                     SizedBox(height: 20.h),
//                     Text(
//                       'تاكيد كلمه المرور',
//                       style: TextStyle(
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                     SizedBox(height: 10.h),
//                     CustomTextFormField(
//                       controller: _confirmPasswordController,
//                       labelText: 'confirm Password',
//                       hintText: 'تاكيد كلمه المرور',
//                       isPassword: true,
//                       prefixIcon: Icon(Icons.lock, color: Colors.grey[600]),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'يرجى تأكيد كلمة المرور';
//                         }
//                         if (value != _passwordController.text) {
//                           return 'كلمات المرور غير متطابقة';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 60.h),
//                     Center(
//                       child: CustomButton(
//                         text: 'تحديث كلمه المرور',
//                         onPressed: () {
//                           if (_formKey.currentState?.validate() ?? false) {
//                             // Trigger the password update logic
//                             // For example, calling an API or a BLoC event
//                             print('Password Updated');
//                           }
//                         },
//                         width: 230.w,
//                         height: 40.h,
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
