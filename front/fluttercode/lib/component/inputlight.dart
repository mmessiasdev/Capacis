import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


class InputTextFieldLight extends StatefulWidget {
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

  const InputTextFieldLight(
      {Key? key,
      this.width,
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
  State<InputTextFieldLight> createState() => _InputTextFieldLightState();
}

class _InputTextFieldLightState extends State<InputTextFieldLight> {
  bool _isVisible = false;

  @override
  void initState() {
    _isVisible = widget.obsecureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: TextFormField(
          textDirection: TextDirection.ltr,
          controller: widget.textEditingController,
          initialValue: widget.initialValue,
          validator: widget.validation ??
              (val) {
                return null;
              },
          keyboardType: widget.textInputType,
          inputFormatters: widget.inputFormatters,
          textInputAction: widget.textInputAction,
          enabled: widget.enable,
          onChanged: (val) {
            if (widget.onChange != null) {
              widget.onChange!(val);
            }
          },
          onEditingComplete: widget.onEditComplete,
          obscureText: _isVisible,
          style:
              GoogleFonts.aleo(fontSize: 11, color: Color.fromRGBO(240, 238, 209, 1)),
          textAlign: widget.textAlign,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            icon: widget.icon,
            hintText: widget.hint,
            labelText: widget.title,
            labelStyle: const TextStyle(
              color: Color.fromRGBO(240, 238, 209, 1),
            ),
            suffixIcon: widget.obsecureText
                ? GestureDetector(
                    child: _isVisible
                        ? const Icon(
                            Icons.visibility_off,
                            size: 18,
                            color: Colors.grey,
                          )
                        : const Icon(
                            Icons.visibility,
                            size: 18,
                            color: Colors.grey,
                          ),
                    onTap: () => setState(() {
                      _isVisible = !_isVisible;
                    }),
                  )
                : null,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            hintStyle:
                const TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
            border: const UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(width: 1, color: Color.fromRGBO(240, 238, 209, 1)),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(width: 1, color: Color.fromRGBO(240, 238, 209, 1)),
            ),
            errorBorder: const UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(width: 1, color: Color.fromRGBO(240, 238, 209, 1)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(width: 1, color: Color.fromRGBO(240, 238, 209, 1)),
            ),
          ),
        ),
      ),
    );
  }
}
