part of 'input_widgets_library.dart';

class TextFormInput extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? fieldName;
  final bool isMandotary;
  final bool isTextArea;
  final RegExp? regExp;
  final String? validatorMsg;
  final Color? fillColor;
  final bool obscureText;

  const TextFormInput(
      {super.key,
      this.hintText,
      this.prefixIcon,
      this.controller,
      this.fieldName,
      this.regExp,
      this.validatorMsg,
      this.fillColor,
      this.isTextArea = false,
      this.isMandotary = false,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    String? formFieldValidator(
        value, String? validatorMsg, RegExp? regExp, bool isMandotary) {
      if (isMandotary) {
        if (value!.isEmpty && RegExp(r'^[a-zA-Z0-9_.-]*$').hasMatch(value)) {
          return (validatorMsg != null && validatorMsg != "")
              ? validatorMsg
              : fieldName != null && fieldName != ""
                  ? "$fieldName Field required"
                  : "Field required";
        } else {
          return null;
        }
      } else if (isMandotary && regExp != null) {
        if (value!.isEmpty && regExp.hasMatch(value)) {
          return (validatorMsg != null && validatorMsg != "")
              ? validatorMsg
              : 'Enter Valid value';
        } else {
          return null;
        }
      } else {
        return null;
      }
    }

    return TextFormField(
      validator: (value) =>
          formFieldValidator(value, validatorMsg, regExp, isMandotary),
      style: kInputFieldText,
      maxLines: isTextArea ? 5 : 1,
      controller: controller,
      obscureText: obscureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          hintText: hintText,
          prefixIcon: prefixIcon,
          prefixIconColor: kPrefixIconColor,
          hintStyle: kInputFieldHintLighterText,
          filled: true,
          fillColor: fillColor ?? kInputFieldBgColor,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  width: 2,
                  style: BorderStyle.solid,
                  color: kInputFieldFocusStrokeColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  width: 2,
                  style: BorderStyle.solid,
                  color: kInputFieldErrorStrokeColor)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  width: 2,
                  style: BorderStyle.solid,
                  color: kInputFieldErrorStrokeColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  width: 1.4,
                  style: BorderStyle.solid,
                  color: kAppBgMediumShade))),
    );
  }
}
