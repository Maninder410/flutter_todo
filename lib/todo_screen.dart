import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/add_todo_screen.dart';
import 'package:todo/constant.dart';
import 'package:todo/todo_provider.dart';

class TodoScreen extends ConsumerWidget {
   TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoProvider);
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Todos'
      ,
      style: TextStyle(fontSize: 30,
      fontWeight: FontWeight.bold),)),
      ),
      body: todoList.isEmpty? Center(child: Text("Well done ! you have completed all tasks"),):ListView.builder(
        itemCount: todoList.length,
        itemBuilder: 
        
      (context, index){
        return ListTile(
          leading: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // color: colorList[index].priority
              color: colorList[todoList[index].priority!],
              border: Border.all(color: Colors.black,
              width: 2)
              ),

          ),
          title: Text(todoList[index].title!),
          trailing: 
          IconButton(
            icon: Icon(Icons.delete,
          color: Colors.red,),
          onPressed: (){
              ref.read(todoProvider.notifier).removeTodo(todoList[index]);
          },),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(
            builder: (_)=>AddTodoScreen()));

        },
      child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}