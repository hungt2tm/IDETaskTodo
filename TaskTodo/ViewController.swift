//
//  ViewController.swift
//  TaskTodo
//
//  Created by If Only on 3/2/18.
//  Copyright © 2018 Gnuh Nav Inc. All rights reserved.
//

import UIKit

struct Todo {
    var name: String
    var isCompleted: Bool = false
}

class ViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variable
    
    
    
    // Todo Array
    var todos: [Todo] = [
        Todo(name: "Scale Screen Size", isCompleted: true),
        Todo(name: "Render Mode", isCompleted: false),
        Todo(name: "UI Scale Mode", isCompleted: true),
        Todo(name: "Reference Resolution", isCompleted: false),
        Todo(name: "Add Component", isCompleted: false),
        Todo(name: "Padding, Cell Size, Spacing", isCompleted: false),
        Todo(name: "Child Alignment", isCompleted: true),
        Todo(name: "Constraint", isCompleted: false),
        Todo(name: "Awake method", isCompleted: true),
        Todo(name: "Serialize Field", isCompleted: false),
        Todo(name: "Apple", isCompleted: false),
        Todo(name: "Bing", isCompleted: false),
        Todo(name: "Google", isCompleted: false),
        Todo(name: "Yahoo", isCompleted: false),
        Todo(name: "GitHub", isCompleted: false),
        Todo(name: "Disney", isCompleted: false),
        Todo(name: "Facebook", isCompleted: false),
        Todo(name: "Twitter", isCompleted: false),
        Todo(name: "LinkedIn", isCompleted: false),
        Todo(name: "YouTube", isCompleted: false),
        Todo(name: "SoundCloud", isCompleted: false),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // Observer notification
        NotificationCenter.default.addObserver(self, selector: #selector(addNewItem(noti:)), name: Notification.Name.init("addNewItem"), object: nil)
    }
    
    // Get callback via notification
    @objc func addNewItem(noti: Notification) {
//        if let userInfo = noti.userInfo {
//            if let name = userInfo["name"] as? String {
//                let todo = Todo(name: name, isCompleted: false)
//                self.todos.insert(todo, at: 0)
//                self.tableView.reloadData()
//            }
//        }
        
        if let todo = noti.object as? Todo {
            self.todos.insert(todo, at: 0)
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBAction
    @IBAction func handledMoveToAddNew(_ sender: Any) {
        // Move to add new view controller
        if let addNewVC = self.storyboard?.instantiateViewController(withIdentifier: AddNewViewController.identifier) as? AddNewViewController {
            addNewVC.delegate = self
            self.navigationController?.pushViewController(addNewVC, animated: true)
        }
    }
    

}

extension ViewController: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 3
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoTableViewCell
//        cell.textLabel?.text = "Row \(indexPath.row)"
        let todo = todos[indexPath.row]
        let label = cell.viewWithTag(100) as! UILabel
        label.text = todo.name
        if todo.isCompleted {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        cell.delegate = self
        cell.indexPath = indexPath
        return cell
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Header \(section)"
//    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var todo = self.todos[indexPath.row]
        if todo.isCompleted {
            todo.isCompleted = false
        } else {
            todo.isCompleted = true
        }
        self.todos[indexPath.row] = todo
        self.tableView.reloadRows(at: [indexPath], with: .none)
    }
    
}

// Get callback via delegate from AddNewViewController
extension ViewController: AddNewViewControllerDelegate {
    func addNewTodo(todo: Todo) {
        self.todos.insert(todo, at: 0)
        self.tableView.reloadData()
    }
}

// get callback via delegate from TodoTableViewCell
extension ViewController: TodoTableViewCellDelegate {
    func getIndexPath(indexPath: IndexPath) {
        print("Index Path: \(indexPath)")
    }
}



