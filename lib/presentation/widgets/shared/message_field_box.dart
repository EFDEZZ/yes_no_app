import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({
    super.key, 
    required this.onValue
    });

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();/* Nos va a dar control del el input al cual se asocia */
    final FocusNode focusNode = FocusNode();/* Para mantener el foco en el input al presionar el boton de enviar del teclado*/

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );
    
    final inputDecoration = InputDecoration(
        /*Para que la caja de texto tenga el color del tema y salga redondeada  */
        hintText: ('End your message with a "?"'),
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,/* Para que salga el input con color de fondo */

        /* Para agregar el boton de enviar */
        suffixIcon: IconButton (
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            final textValue = textController.value.text;/* El contenido de la caja de texto se guarda en esta variable */
            textController.clear();/* Para que despues de presionar el boton enviar se vacie el contenido de la caja */
            onValue(textValue);
          },
          ), 
      );

    return TextFormField(
      /* Para que al hacer click fuera de la caja de input se pierda el enfoque en esta */
      onTapOutside: (event) {
        focusNode.unfocus();
      },/* ---------------- */

      focusNode: focusNode,/* Para mantener el foco en el input al presionar el boton de enviar del teclado*/
      controller: textController,
      decoration: inputDecoration,
      
      onFieldSubmitted: (value) {
        textController.clear();/* Para que despues de presionar el boton enviar se vacie el contenido de la caja */
        focusNode.requestFocus();/* Para mantener el foco en el input al presionar el boton de enviar del teclado*/
        onValue(value);
      },
    );
  }
}