import 'package:flutter/material.dart';
import 'package:iparkpatrol_mobile/utlis/colors.dart';
import 'package:iparkpatrol_mobile/widgets/text_widget.dart';

class NewTextFieldWidget extends StatefulWidget {
  final String? hint;
  final String? label;
  bool? isObscure;
  final TextEditingController controller;
  final double? width;
  final IconData? prefixIcon;
  final double? height;
  final int? maxLine;
  final TextInputType? inputType;
  late bool? showEye;
  late Color? color;
  late Color? borderColor;
  late Color? hintColor;
  late double? radius;
  final String? Function(String?)? validator; // Add validator parameter
  bool? isEnabled;
  final TextCapitalization? textCapitalization;
  final FontStyle? fontStyle;
  final String? errorText;
  final String? suffix;
  final bool? isRequred;
  bool? showErrorMsg;

  NewTextFieldWidget(
      {super.key,
      required this.suffix,
      this.hint = '',
      this.isRequred = true,
      this.fontStyle = FontStyle.italic,
      this.label,
      this.prefixIcon,
      required this.controller,
      this.isObscure = false,
      this.width = 325,
      this.height = 50,
      this.maxLine = 1,
      this.hintColor = Colors.white,
      this.borderColor = const Color(0xff0093CB),
      this.showEye = false,
      this.color = Colors.white,
      this.radius = 5,
      this.textCapitalization = TextCapitalization.sentences,
      this.inputType = TextInputType.text,
      this.validator,
      this.errorText,
      this.showErrorMsg = true,
      this.isEnabled = true // Add validator parameter
      });

  @override
  State<NewTextFieldWidget> createState() => _NewTextFieldWidgetState();
}

class _NewTextFieldWidgetState extends State<NewTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: widget.label,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Bold',
                  color: primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              widget.isRequred!
                  ? const TextSpan(
                      text: '*',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Bold',
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : const TextSpan(
                      text: '',
                      style: TextStyle(
                        fontSize: 0,
                        fontFamily: 'Bold',
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: widget.width,
          height: widget.height,
          child: TextFormField(
            enabled: widget.isEnabled,
            style: const TextStyle(
              fontFamily: 'Regular',
              fontSize: 14,
              color: Colors.black,
            ),
            textCapitalization: widget.textCapitalization!,
            keyboardType: widget.inputType,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              suffixIcon: TextWidget(
                text: widget.suffix!,
                fontSize: 14,
                color: Colors.grey,
                fontFamily: 'Regular',
              ),
              contentPadding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              hintStyle: TextStyle(
                fontStyle: widget.fontStyle!,
                fontFamily: 'Regular',
                fontSize: 14,
                color: Colors.grey,
              ),
              hintText: widget.hint,
              border: InputBorder.none,
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.borderColor!,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.borderColor!,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.borderColor!,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              errorText: widget.errorText,
              errorStyle: TextStyle(
                  fontFamily: 'Bold',
                  fontSize: widget.showErrorMsg! ? 12 : 0.1),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),

            maxLines: widget.maxLine,
            obscureText: widget.isObscure!,
            controller: widget.controller,
            validator:
                widget.validator, // Pass the validator to the TextFormField
          ),
        ),
      ],
    );
  }
}
