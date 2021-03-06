//
//  main.swift
//  Todo_list
//
//  Created by Najla Alshehri on 23/12/2021.
//
import Foundation

var taskList:[Task] = [];
var run = true
print(" \nβ­οΈ Hello, welcome to swift Todo List program β­οΈ \n")
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
            print(" π»πΊπ»πΊπ»πΊπ» INVALID INPUT πΊπ»πΊπ»πΊπ»πΊ")
        }

     case 2: //modify task
        print("Please enter the task number:")
        var index = 0
        if let input = Int(readLine() ?? "0"){
            index = input
        }else{
            print(" π»πΊπ»πΊπ»πΊπ» INVALID INPUT πΊπ»πΊπ»πΊπ»πΊ")
            break
        }
        print("Please enter the modifiecation:")
        var modifiedTask = ""
        if let input2 = readLine(){
            modifiedTask = input2
        }else{
            print(" π»πΊπ»πΊπ»πΊπ» INVALID INPUT πΊπ»πΊπ»πΊπ»πΊ")
            break
        }
        modifyTask(index : index , newName : modifiedTask)

     case 3: // delete task
         print("Please enter the task number to be deleted:")
        if let input = Int(readLine() ?? "0"){
            deleteTask(index: input)
        }else{
            print(" π»πΊπ»πΊπ»πΊπ» INVALID INPUT πΊπ»πΊπ»πΊπ»πΊ")
        }

     case 4: // completed task
         print("Please enter the completed task Number:")
         if let input = Int(readLine() ?? "0"){
             SetCompleted(index : input)
         }else{
             print(" π»πΊπ»πΊπ»πΊπ» INVALID INPUT πΊπ»πΊπ»πΊπ»πΊ")
         }

     case 5:
        run = false
        print("Byeππ»")

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
    taskList.append(Task(name : name , isCompleted : false))
    print("π©π©π©π©π©π©π© PROCESS COMPLETED π©π©π©π©π©π©π©")
}

func SetCompleted(index : Int){
    if index - 1 < taskList.count {
        taskList[index - 1].isCompleted = true
    print("π©π©π©π©π©π©π© PROCESS COMPLETED π©π©π©π©π©π©π©")
    }else{
        print(" πΊπ»πΊπ»πΊπ» THE TASK DOESN'T EXISTπΊπ»πΊπ»πΊπ»")

    }
}

func modifyTask(index : Int , newName : String){
    if index - 1 < taskList.count {
        taskList[index - 1].name = newName
        print("π©π©π©π©π©π©π© PROCESS COMPLETED π©π©π©π©π©π©π©")
    }else{
        print(" πΊπ»πΊπ»πΊπ» THE TASK DOESN'T EXISTπΊπ»πΊπ»πΊπ»")
    }
}

func deleteTask(index : Int){
    if index - 1 < taskList.count {
        taskList.remove(at: index - 1)
        print("π©π©π©π©π©π©π© PROCESS COMPLETED π©π©π©π©π©π©π©")
    }else{
        print(" πΊπ»πΊπ»πΊπ» THE TASK DOESN'T EXISTπΊπ»πΊπ»πΊπ»")
    }
}

func start(){
    if (taskList.count < 1) {
        print("""
              ------------------- Todo List -------------------
                             
              
                              Your list is empty
              
              """)
    }else{
        print("------------------- Todo List -------------------")
        for index in  0..<taskList.count{
            print("\(index + 1). \(taskList[index].name) \(taskList[index].isCompleted == true ? " - β" : "")")

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
