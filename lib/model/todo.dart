class Todo{

  int id;

//description is the text we see on
//main screen card text

String description;

//isDone used to mark what todoo item is completed
bool isDone = false;

Todo({this.id,this.description,this.isDone});

factory Todo.fromDatabaseJson(Map<String,dynamic> data) => Todo(

  //This will be used to convert JSON objects that
  //are coming from querying the database and converting
  //it into a Todoo object

  id: data['id'],
  description: data['description'],
  //Since sqlite doesn't have boolean type for true/false
  //we will 0 to denote that it is false
  //and 1 for true
  isDone: data['is_done']==0?false:true,
);

Map<String,dynamic> toDatabaseJson() =>{
  //This will be used to convert Todo0 objects that
  //are to be stored into the datbase in a form of JSON

  "id":this.id,
  "description":this.description,
  "is_done":this.isDone==false?0:1,
};
}