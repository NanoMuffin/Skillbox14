//
//  ToDoListViewController.swift
//  Skillbox14
//
//  Created by Александр Сорока on 17.04.2020.
//  Copyright © 2020 Александр Сорока. All rights reserved.
//

import UIKit
import RealmSwift

class ToDoListViewController: UIViewController {

    
    
    var toDos = 0
    let realm = try! Realm()
    let realmObject = Data()
    var someString = "Text is here"
    var newTask = ["Your ToDos:"]
    lazy var allToDos = realm.objects(Data.self)
    var firstNumber = 1
    
    @IBOutlet weak var tableVIew: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.toDos = allToDos.last?.toDoNumbers ?? toDos
        print(realm.objects(Data.self))
        
        
        
//        realmObject.toDo = "Here is your ToDos"
//        try! realm.write {
//            self.realm.add(self.realmObject)
//        }
//
        

        // Do any additional setup after loading the view.
    }
    
   
    func toDoMaker() {

        let alertController = UIAlertController(title: "Hello", message: "Type your task here", preferredStyle: .alert)
        alertController.addTextField { (complition) in
        }

        let action = UIAlertAction.init(title: "Done", style: .cancel){ (action) in

            try! self.realm.write {
            let newItem = Data()
            newItem.toDo = alertController.textFields?.last?.text ?? ""
            newItem.toDoNumbers = self.allToDos.count
                self.realm.add(newItem)
              }
            self.toDos += 1
            self.tableVIew.reloadData()
        }

        alertController.addAction(action)

        self.present(alertController, animated: true)
        self.tableVIew.reloadData()


    }
    
    
    @IBAction func addButton(_ sender: Any) {
        toDoMaker()
        self.tableVIew.reloadData()
        
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(true)
//
//        try! realm.write {
//            self.realmObject.toDoNumbers = toDos
//            realm.add(realmObject)
//        }
//
//    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ToDoListViewController: UITableViewDataSource, UITableViewDelegate {
    
//    Mark: TableView DataSource Methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ToDoListTableViewCell
        cell.itemLabel.text = allToDos[indexPath.row].toDo
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allToDos.count
    }
    
    //    Mark: TableView Delegate Methods
//     Deleting objects from either realm and tableView
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == .delete) {
            let itemToDelete = allToDos[indexPath.row]
            
            try! realm.write {
                realm.delete(allToDos[indexPath.row])
            }
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}
