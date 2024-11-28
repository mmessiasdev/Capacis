import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Consult/component/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class InputTextField extends StatefulWidget {
  final String? Function(String?)? validation;
  final Function()? onEditComplete;
  final TextEditingController? textEditingController;
  final String hint;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool enable;
  final String title;
  final String? initialValue;
  final bool obsecureText;
  final TextAlign textAlign;
  final TextInputAction textInputAction;
  final Function(String val)? onChange;
  final double? width;
  final double? height;
  final Icon? icon;
  final int? minLines;
  final int? maxLines;
  final Color? fcolor;
  final bool? fill;

  const InputTextField(
      {Key? key,
      this.fcolor,
      this.fill,
      this.width,
      this.minLines,
      this.maxLines,
      this.height,
      this.validation,
      this.textEditingController,
      this.hint = "",
      this.icon,
      this.onChange,
      this.textInputType,
      required this.title,
      this.inputFormatters,
      this.enable = true,
      this.initialValue,
      this.obsecureText = false,
      this.textAlign = TextAlign.left,
      this.onEditComplete,
      this.textInputAction = TextInputAction.next})
      : super(key: key);

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool _isVisible = false;

  @override
  void initState() {
    _isVisible = widget.obsecureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        textDirection: TextDirection.ltr,
        controller: widget.textEditingController,
        initialValue: widget.initialValue,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        validator: widget.validation ??
            (val) {
              return null;
            },
        keyboardType: widget.textInputType,
        inputFormatters: widget.inputFormatters,
        cursorColor: nightColor,
        textInputAction: widget.textInputAction,
        enabled: widget.enable,
        onChanged: (val) {
          if (widget.onChange != null) {
            widget.onChange!(val);
          }
        },
        onEditingComplete: widget.onEditComplete,
        obscureText: _isVisible,
        style: GoogleFonts.montserrat(
            fontSize: 18, color: Color.fromRGBO(0, 0, 0, 1)),
        textAlign: widget.textAlign,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          filled: widget.fill,
          fillColor: SecudaryColor,
          icon: widget.icon,
          hintText: widget.hint,
          labelText: widget.title,
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          suffixIcon: widget.obsecureText
              ? GestureDetector(
                  child: _isVisible
                      ? const Icon(
                          Icons.visibility_off,
                          size: 14,
                          color: Colors.grey,
                        )
                      : const Icon(
                          Icons.visibility,
                          size: 14,
                          color: Colors.grey,
                        ),
                  onTap: () => setState(() {
                    _isVisible = !_isVisible;
                  }),
                )
              : null,
          hintStyle: const TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ),
    );
  }
}
