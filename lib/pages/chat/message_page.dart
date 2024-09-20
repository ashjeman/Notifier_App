/*
import 'package:flutter/material.dart';
import 'package:chatview/chatview.dart';
import 'package:notifier_app/services/message_service.dart';
import 'package:notifier_app/services/messaging_service.dart';

import '../../models/message.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  late ChatController chatController;
  late MessageService messageService;
  //List<Messages>? messageList = [];

  getMessageList() async{
    messageList = await MessagingService().getMessages();
    print(messageList);
  }

  @override
  void initState() {
    super.initState();

    getMessageList();

    //messageService = MessageService();
    messageService.getMessages();

    // Initialize the chatController in initState
    chatController = ChatController(
      initialMessageList: messageList,
      scrollController: ScrollController(),
      currentUser: ChatUser(id: '1', name: 'Flutter'),
      otherUsers: [ChatUser(id: '2', name: 'Simform')],
    );

    messageService.messagesStream.listen((List<Message> messages) {
      print(messages);  // Prints the entire list
      messages.forEach((msg) {
        print(msg);      // Prints each message with the overridden toString()
      });
    });
  }

  final List<Message> messageList = [
    Message(
      id: '1',
      message: "Hi",
      createdAt: DateTime.now(),
      sentBy: '1',
    ),
    Message(
      id: '2',
      message: "Hello",
      createdAt: DateTime.now(),
      sentBy: '2',
    ),
  ];

  void onSendTap(String messageText, ReplyMessage replyMessage, MessageType messageType) {
    final newMessage = Message(
      id: '3',
      message: messageText, // Use the passed messageText here
      createdAt: DateTime.now(),
      sentBy: '1', // Change this based on the actual sender
      replyMessage: replyMessage,
      messageType: messageType,
    );
    chatController.addMessage(newMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatView(
        chatController: chatController,
        onSendTap: onSendTap,
        chatViewState: ChatViewState.hasMessages,
        featureActiveConfig: const FeatureActiveConfig(
          enableSwipeToSeeTime: true,
          enableScrollToBottomButton: true
        ),
        appBar: const ChatViewAppBar(
          chatTitle: "Boss",
          userStatus: "online",
          actions: [Icon(Icons.more_vert)],
        ),
        chatBackgroundConfig: const ChatBackgroundConfiguration(
          backgroundColor: Color(0xffe6e6e6)
        ),
        sendMessageConfig: const SendMessageConfiguration(
          textFieldConfig: TextFieldConfiguration(textStyle: TextStyle(color: Colors.black))
        ),
      ),
    );
  }
}

 */