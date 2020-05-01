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
            self.realm.add(self.realmObject)
            self.realmObject.toDo = alertController.textFields?.last?.text ?? ""
                self.realmObject.toDoNumbers = self.allToDos.count
              }
            self.toDos += 1
            self.tableVIew.reloadData()
        }

        alertController.addAction(action)

        self.present(alertController, animated: true)


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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ToDoListTableViewCell
        cell.itemLabel.text = allToDos[indexPath.row].toDo
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos
    }
    
}
