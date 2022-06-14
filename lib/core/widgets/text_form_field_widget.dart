// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
//
// class TextFieldFormWidget extends StatefulWidget {
//   late String hint;
//   final String title;
//   final TextStyle titleStyle;
//   final TextStyle errorStyle;
//   final TextStyle textFieldStyle;
//   EdgeInsetsGeometry viewPadding;
//   final String initialValue;
//   final Key key;
//   InputDecoration decoration;
//   final String attribute;
//   final TextInputType keyboardType;
//   final int maxLines;
//   final int minLines;
//   final bool autovalidate;
//   TextEditingController controller = TextEditingController();
//   final bool obscureText;
//   final ValueChanged onChanged;
//   final bool maxLengthEnforced;
//   final int maxLength;
//   final ValueChanged<String> onFieldSubmitted;
//   final List<FormFieldValidator> validators;
//   final FormFieldSetter onSaved;
//
//   //final ValueTransformer valueTransformer;
//   bool isDense;
//   bool enabled;
//
//   TextFieldFormWidget({
//     @required this.attribute,
//     this.hint!,
//     this.title = "",
//     this.titleStyle,
//     this.errorStyle,
//     this.textFieldStyle,
//     this.viewPadding,
//     this.initialValue = "",
//     this.key,
//     this.decoration,
//     this.keyboardType,
//     this.maxLines = 1,
//     this.minLines = 1,
//     this.autovalidate = false,
//     this.controller,
//     this.obscureText = false,
//     this.onChanged,
//     this.maxLengthEnforced = false,
//     this.enabled = true,
//     this.maxLength,
//     this.onFieldSubmitted,
//     this.validators = const [],
//     this.onSaved,
//     //this.valueTransformer,
//     this.isDense = true,
//   });
//
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return _TextFieldFormWidget(
//         this.attribute,
//         this.hint,
//         this.title,
//         this.titleStyle,
//         this.errorStyle,
//         this.textFieldStyle,
//         this.viewPadding,
//         this.initialValue,
//         this.key,
//         this.decoration,
//         this.keyboardType,
//         this.maxLines,
//         this.autovalidate,
//         this.controller,
//         this.obscureText,
//         this.maxLengthEnforced,
//         this.maxLength,
//         this.onFieldSubmitted,
//         this.validators,
//         this.onSaved,
//         //this.valueTransformer,
//         this.isDense,
//         this.minLines,
//         this.enabled);
//   }
// }
//
// class _TextFieldFormWidget extends State<TextFieldFormWidget> {
//   final String hint;
//   final String title;
//   final TextStyle titleStyle;
//   final TextStyle errorStyle;
//   final TextStyle textFieldStyle;
//   EdgeInsetsGeometry viewPadding;
//   final String initialValue;
//   final Key key;
//   InputDecoration decoration;
//   final String attribute;
//   final TextInputType keyboardType;
//   int maxLines;
//   final bool autovalidate;
//   TextEditingController controller = TextEditingController();
//   final bool obscureText;
//   final bool maxLengthEnforced;
//   final int maxLength;
//   final int minLines;
//   final ValueChanged<String> onFieldSubmitted;
//   final List<FormFieldValidator> validators;
//   GlobalKey<FormFieldState> _fieldKey;
//
// //  FormBuilderState _formState;
//   final FormFieldSetter onSaved;
//
//   // final ValueTransformer valueTransformer;
//   bool isDense;
//   bool enabled;
//
//   _TextFieldFormWidget(
//       this.attribute,
//       this.hint,
//       this.title,
//       this.titleStyle,
//       this.errorStyle,
//       this.textFieldStyle,
//       this.viewPadding,
//       this.initialValue,
//       this.key,
//       this.decoration,
//       this.keyboardType,
//       this.maxLines,
//       this.autovalidate,
//       this.controller,
//       this.obscureText,
//       this.maxLengthEnforced,
//       this.maxLength,
//       this.onFieldSubmitted,
//       this.validators,
//       this.onSaved,
//       //this.valueTransformer,
//       this.isDense,
//       this.minLines,
//       this.enabled,
//       );
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _fieldKey = GlobalKey<FormFieldState>();
//     //_formState = FormBuilder.of(context);
//     //_formState?.registerFieldKey(attribute, _fieldKey);
//     if (controller == null) {
//       controller = TextEditingController();
//       controller.text = initialValue;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
// //    if(widget.initialValue!=null && widget.initialValue.isNotEmpty)
// //      controller.text = widget.initialValue;
//     if (maxLines < minLines) maxLines = minLines;
//     if (decoration == null) {
//       decoration = InputDecoration(
//         filled: true,
//         /* fillColor: enabled?Colors.white:kAddPeopleExpansionHeaderColor,
//         enabledBorder: FabergeTheme.TextFormBoarderDecoration(context),
//         disabledBorder: FabergeTheme.TextFormBoarderDecoration(context),
//         focusedBorder: FabergeTheme.TextFormBoarderDecoration(context),
//         errorBorder: FabergeTheme.TextFormBoarderDecoration(context),
//         focusedErrorBorder: FabergeTheme.TextFormBoarderDecoration(context),*/
//         contentPadding: EdgeInsets.all(10),
//         errorMaxLines: 3,
//         errorStyle: errorStyle,
//         isDense: isDense,
//         //border: InputBorder.none
//       );
//     }
//     // TODO: implement build
// //    controller.addListener(() {
// //      if (onChanged != null) onChanged(controller.text);
// //    });
//     //Dimens.init(context, allowFontScaling: false);
//     if (viewPadding == null)
//       viewPadding = EdgeInsets.all(10);
//     return Padding(
//       padding: viewPadding,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Visibility(
//             visible: title != null && title.isNotEmpty,
//             child: Padding(
//               padding: EdgeInsets.only(bottom: 8),
//               child: Text(title,
//                   style: titleStyle),
//             ),
//           ),
//           TextFormField(
//             key: key,
//             validator: (val) {
//               for (int i = 0; i < validators.length; i++) {
//                 if (validators[i](val) != null) return validators[i](val);
//               }
//               return null;
//             },
//             onSaved: (val) {
//               var transformed;
//               /* if (valueTransformer != null) {
//                 transformed = valueTransformer(val);
//                 _formState?.setAttributeValue(attribute, transformed);
//               } else
//                 _formState?.setAttributeValue(attribute, val);*/
//               if (onSaved != null) {
//                 onSaved(transformed ?? val);
//               }
//             },
//             style: textFieldStyle,
//             autovalidateMode : autovalidate ? AutovalidateMode.always : AutovalidateMode.disabled,
//             maxLines: maxLines,
//             minLines: minLines,
//             keyboardType: keyboardType ??
//                 (maxLines == 1 ? TextInputType.text : TextInputType.multiline),
//             obscureText: obscureText,
//             controller: controller,
//             maxLength: maxLength,
//             enabled: enabled,
//             onChanged: (val) {
//               if (widget.onChanged != null) widget.onChanged(val);
//             },
//             maxLengthEnforced: maxLengthEnforced,
//             decoration: decoration.copyWith(
//               hintText: hint ?? "",
//               //hintStyle: FabergeTheme.DefaultFormTextStyle(context)
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
