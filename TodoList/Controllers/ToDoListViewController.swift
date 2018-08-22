//
//  ViewController.swift
//  TodoList
//
//  Created by GPS-02 on 20/08/2018.
//  Copyright © 2018 Lucas Botelho. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        let newItem = Item()
        newItem.title = "Test1"
        itemArray.append(newItem)
        if let items = defaults.array(forKey: "TodoListArray") as? [Item]{
           itemArray = items
        }
    }


    //MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        if itemArray[indexPath.row].done {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //MARK - Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        itemArray[indexPath.row].done  = !itemArray[indexPath.row].done
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add Item Method

    @IBAction func AddButtonItem(_ sender: UIBarButtonItem) {
        var newItem  = UITextField()
        let alert = UIAlertController(title: "Add a New ToDo List Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            let textField = Item()
            textField.title = newItem.text!
            self.itemArray.append(textField)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
    
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            newItem = alertTextField
        }
        alert.addAction(action)
    
        present(alert, animated: true, completion: nil)
    }
    

}

