//
//  ViewController.swift
//  TodoList
//
//  Created by GPS-02 on 20/08/2018.
//  Copyright © 2018 Lucas Botelho. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray = ["Find Mike","Buy Eggos", "Destory Demogorgon"]
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        if let items = defaults.array(forKey: "TodoListArray") as? [String]{
            itemArray = items
        }
    }


    //MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //MARK - Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add Item Method

    @IBAction func AddButtonItem(_ sender: UIBarButtonItem) {
        var newItem  = UITextField()
        let alert = UIAlertController(title: "Add a New ToDo List Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            self.itemArray.append(newItem.text!)
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

