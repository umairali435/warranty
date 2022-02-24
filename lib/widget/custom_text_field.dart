import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warranty_watch/helper/constants.dart';
import 'package:warranty_watch/helper/extensions/context_extention.dart';
//Helpers

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final double? width, height;
  final int? maxLength;
  final String? floatingText, hintText;
  final TextStyle hintStyle, errorStyle, inputStyle;
  final TextStyle? floatingStyle;
  final EdgeInsets? contentPadding;
  final void Function(String? value)? onSaved, onChanged;
  final VoidCallback? onTap;
  final Widget? prefix;
  final bool showCursor;
  final bool autofocus;
  final bool showErrorBorder;
  final TextAlign textAlign;
  final Alignment errorAlign, floatingAlign;
  final Color fillColor;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? Function(String? value) validator;

  const CustomTextField({
    Key? key,
    this.controller,
    this.width,
    this.height = 47,
    this.maxLength,
    this.floatingText,
    this.floatingStyle,
    this.onSaved,
    this.onChanged,
    this.onTap,
    this.prefix,
    this.showCursor = true,
    this.showErrorBorder = false,
    this.autofocus = false,
    this.textAlign = TextAlign.start,
    this.errorAlign = Alignment.centerRight,
    this.floatingAlign = Alignment.centerLeft,
    this.fillColor = Constants.whiteColor,
    this.hintText,
    this.hintStyle = const TextStyle(
      fontSize: 17,
      color: Constants.grey,
    ),
    this.errorStyle = const TextStyle(
      height: 0,
      color: Colors.transparent,
    ),
    this.inputStyle = const TextStyle(
      fontSize: 17,
      color: Constants.whiteColor,
    ),
    this.contentPadding = const EdgeInsets.fromLTRB(17, 10, 1, 10),
    required this.keyboardType,
    required this.textInputAction,
    required this.validator,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? errorText;
  bool hidePassword = true;

  bool get hasError => errorText != null;

  bool get showErrorBorder => widget.showErrorBorder && hasError;

  bool get hasFloatingText => widget.floatingText != null;

  bool get isPasswordField =>
      widget.keyboardType == TextInputType.visiblePassword;

  void _onSaved(String? value) {
    value = value!.trim();
    widget.controller?.text = value;
    widget.onSaved?.call(value);
  }

  void _onChanged(String value) {
    if (widget.onChanged != null) {
      _runValidator(value);
      widget.onChanged!(value);
    }
  }

  String? _runValidator(String? value) {
    final error = widget.validator(value!.trim());
    setState(() {
      errorText = error;
    });
    return error;
  }

  void _togglePasswordVisibility() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  UnderlineInputBorder _focusedBorder() {
    return const UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(9)),
      borderSide: BorderSide(
        color: Constants.primaryColor,
        width: 2,
      ),
    );
  }

  UnderlineInputBorder _normalBorder() {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: Constants.grey),
    );
  }

  UnderlineInputBorder _errorBorder() {
    return UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(9)),
      borderSide: BorderSide(
        color: Constants.redColor,
        width: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //Floating text
        if (hasFloatingText) ...[
          SizedBox(
            width: widget.width,
            child: Align(
              alignment: widget.floatingAlign,
              child: Text(
                widget.floatingText!,
                style: widget.floatingStyle ??
                    context.bodyText1.copyWith(
                      color: Constants.grey,
                      fontSize: 14,
                    ),
              ),
            ),
          ),
          const SizedBox(height: 2),
        ],

        //TextField
        SizedBox(
          height: widget.height,
          width: widget.width,
          child: TextFormField(
            onTap: widget.onTap,
            controller: widget.controller,
            textAlign: widget.textAlign,
            autofocus: widget.autofocus,
            maxLength: widget.maxLength,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            style: widget.inputStyle,
            showCursor: widget.showCursor,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            textAlignVertical: TextAlignVertical.center,
            autovalidateMode: AutovalidateMode.disabled,
            cursorColor: Colors.white,
            obscureText: isPasswordField && hidePassword,
            validator: _runValidator,
            onFieldSubmitted: _runValidator,
            onSaved: _onSaved,
            onChanged: _onChanged,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: widget.hintStyle,
              errorStyle: widget.errorStyle,
              // fillColor: widget.fillColor,
              prefixIcon: widget.prefix,
              contentPadding: widget.contentPadding,
              // isDense: true,
              // filled: true,
              counterText: '',
              enabledBorder: _normalBorder(),
              border: InputBorder.none,
              focusedBorder: _focusedBorder(),
              focusedErrorBorder: _focusedBorder(),
              errorBorder: showErrorBorder ? _errorBorder() : null,
              suffixIcon: isPasswordField
                  ? InkWell(
                      onTap: _togglePasswordVisibility,
                      child: const Icon(
                        Icons.remove_red_eye_sharp,
                        color: Constants.grey,
                        size: 22,
                      ),
                    )
                  : null,
            ),
          ),
        ),

        //Error text
        if (hasError) ...[
          const SizedBox(height: 2),
          SizedBox(
            width: widget.width,
            child: Align(
              alignment: widget.errorAlign,
              child: Text(
                errorText!,
                style: context.bodyText1.copyWith(
                  fontSize: 13,
                  color: Constants.redColor,
                ),
              ),
            ),
          ),
        ]
      ],
    );
  }
}
