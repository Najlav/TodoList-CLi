//
//  main.swift
//  Todo_list
//
//  Created by Najla Alshehri on 23/12/2021.
//
import Foundation

var Task_list:[Task] = [];
var run = true
while(run){
 start()
 var error = false
    repeat {
    print("\nPlease enter the operation number:")
    var choice: Int = 0

    if let operation = Int(readLine() ?? "0") {
         choice = operation
    }else{
         print("please enter the operation number")
    }

    switch choice {

     case 1: //add new task
        print("Please enter the new task:")
        if let input = readLine() {
            newTask(name: input)
        }else{
            print(" 🔻🔺🔻🔺🔻🔺🔻 INVALID INPUT 🔺🔻🔺🔻🔺🔻🔺")
        }

     case 2: //modify task
        print("Please enter the task number:")
        var index = 0
        if let input = Int(readLine() ?? "0"){
            index = input
        }else{
            print(" 🔻🔺🔻🔺🔻🔺🔻 INVALID INPUT 🔺🔻🔺🔻🔺🔻🔺")
            break
        }
        print("Please enter the modifiecation:")
        var modifiedTask = ""
        if let input2 = readLine(){
            modifiedTask = input2
        }else{
            print(" 🔻🔺🔻🔺🔻🔺🔻 INVALID INPUT 🔺🔻🔺🔻🔺🔻🔺")
            break
        }
        modifyTask(index : index , newName : modifiedTask)

     case 3: // delete task
         print("Please enter the task number to be deleted:")
        if let input = Int(readLine() ?? "0"){
            deleteTask(index: input)
        }else{
            print(" 🔻🔺🔻🔺🔻🔺🔻 INVALID INPUT 🔺🔻🔺🔻🔺🔻🔺")
        }

     case 4: // completed task
         print("Please enter the completed task Number:")
         if let input = Int(readLine() ?? "0"){
             SetCompleted(index : input)
         }else{
             print(" 🔻🔺🔻🔺🔻🔺🔻 INVALID INPUT 🔺🔻🔺🔻🔺🔻🔺")
         }

     case 5:
        run = false
        print("Bye👋🏻")

     default:
         print("Unvalid input")
         error = true
     }
   } while(error)
 
}

//--------------------- struct ------------------------
struct Task {
    var name : String
    var isCompleted : Bool

    init(name: String, isCompleted : Bool) {
        self.name = name
        self.isCompleted = isCompleted
    }

}

//--------------------- functions ------------------------
func newTask(name : String){
    Task_list.append(Task(name : name , isCompleted : false))
    print(" 🟩🟩🟩🟩🟩🟩🟩 PROCESS COMPLETED 🟩🟩🟩🟩🟩🟩🟩")
}

func SetCompleted(index : Int){
    if index - 1 < Task_list.count {
   Task_list[index - 1].isCompleted = true
    print(" 🟩🟩🟩🟩🟩🟩🟩 PROCESS COMPLETED 🟩🟩🟩🟩🟩🟩🟩")
    }else{
        print(" 🔺🔻🔺🔻🔺🔻 THE TASK DOESN'T EXIST🔺🔻🔺🔻🔺🔻")

    }
}

func modifyTask(index : Int , newName : String){
    if index - 1 < Task_list.count {
    Task_list[index - 1].name = newName
        print(" 🟩🟩🟩🟩🟩🟩🟩 PROCESS COMPLETED 🟩🟩🟩🟩🟩🟩🟩")
    }else{
        print(" 🔺🔻🔺🔻🔺🔻 THE TASK DOESN'T EXIST🔺🔻🔺🔻🔺🔻")
    }
}

func deleteTask(index : Int){
    if index - 1 < Task_list.count {
    Task_list.remove(at: index - 1)
        print(" 🟩🟩🟩🟩🟩🟩🟩 PROCESS COMPLETED 🟩🟩🟩🟩🟩🟩🟩")
    }else{
        print(" 🔺🔻🔺🔻🔺🔻 THE TASK DOESN'T EXIST🔺🔻🔺🔻🔺🔻")
    }
}

func start(){
    print(" \n⭐️ Hello, welcome to swift Todo List program ⭐️ \n")
    if (Task_list.count < 1) {
        print("""
              ------------------- Todo List -------------------
                             
              
                              Your list is empty
              
              """)
    }else{
        print("------------------- Todo List -------------------")
        for index in  0..<Task_list.count{
            print("\(index + 1). \(Task_list[index].name) \(Task_list[index].isCompleted == true ? " - ✅" : "")")

            }
           }

       print("\n")

    print("""
          ---------------------- Menu ---------------------
                          
          1. Add new Task
          2. Modify a task
          3. delete a task
          4. Mark as Completed
          5. Exit
          -------------------------------------------------
          """)


}
