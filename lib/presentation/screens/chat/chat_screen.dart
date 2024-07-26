import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {

    /* Cuando la clase es de un Screen retorna un Scaffold */
    return Scaffold(
      appBar: AppBar(
        /* El leading es un espacio que se toma antes del titulo en el cual se puede poner un icono o como en este caso una miniatura para la foto de perfil */
        leading: const Padding(
          padding: EdgeInsets.all(3.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP.Qzr2dD7HUKcutK4GPJfJCgAAAA?rs=1&pid=ImgDetMain'), 
          ),
        ),
        title: const Text('My Little Princess ♥'),
        /* centerTitle: true, */ /* Para centrar el titulo */
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
              final message = chatProvider.messageList[index];

              return (message.fromWho == FromWho.hers)
              ? HerMessageBubble(message:message)
              : MyMessageBubble(message:message);
              
            },)),

            /* Caja de Texto de mensajes */
            MessageFieldBox(
             /*  onValue: (value) => chatProvider.sendMessage(value), */
              onValue: chatProvider.sendMessage,  /* Esto es otra forma de poner lo de arriba(es lo mismo) */
            ),

          ],
        ),
      ),
    );
  }
}