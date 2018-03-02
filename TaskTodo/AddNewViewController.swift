//
//  AddNewViewController.swift
//  TaskTodo
//
//  Created by If Only on 3/2/18.
//  Copyright © 2018 Gnuh Nav Inc. All rights reserved.
//

import UIKit

// Add new delegate
protocol AddNewViewControllerDelegate: class {
    func addNewTodo(todo: Todo)
}

class AddNewViewController: UIViewController {
    // MARK: - Outlet
    @IBOutlet weak var tfTodoName: UITextField!
    
    // MARK: - Variable
    static let identifier = "addNewVC"
    weak var delegate: AddNewViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Action
    // Add new todo
    @IBAction func handledAddTodo(_ sender: Any) {
        // Name TextField
        if let name = self.tfTodoName.text,
            name != "" {
            // New todo
            let todo = Todo(name: name, isCompleted: false)
            
//            // Callback via delegate
//            if let delegate = self.delegate {
//                delegate.addNewTodo(todo: todo)
//                self.navigationController?.popViewController(animated: true)
//            }
            
            // Post notification via userInfo
//            let userInfo = ["name" : name]
//            NotificationCenter.default.post(name: Notification.Name("addNewItem"), object: nil, userInfo: userInfo)
            
            // Post notification via object
            NotificationCenter.default.post(name: Notification.Name("addNewItem"), object: todo)
            self.navigationController?.popViewController(animated: true)
            
            self.navigationController?.popViewController(animated: true)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
