//
//  ViewController.swift
//  ToDoList
//
//  Created by Haydee Rodriguez on 05/08/16.
//  Copyright © 2016 lizRodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
   //class let MAX_SIZE_TXT = 50
    static let MAX_SIZE_TXT = 50 //Las estaticas no se pueden sobreescribir
    let todoList = ToDoList()
        
    @IBAction func  addButtonPressed(sender: UIButton){
        print("Agregando un elemento a la lista: \(itemTextField.text)")
        todoList.addItem(itemTextField.text!)
        tableView.reloadData()
        self.itemTextField = nil
        self.itemTextField?.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = todoList
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: Metodos del table view
    func scrollViewDidScroll(scrollView: UIScrollView) {
        self.itemTextField?.resignFirstResponder()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showItem", sender: self)
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, ReplaceString string: String)-> Bool{
        if let newString = textField.text as? NSString{
            let updatedString = newString.stringByReplacingCharactersInRange(range, withString: string)
            return updatedString.characters.count <= ViewController.MAX_SIZE_TXT
        }
        else{
            return true
        }
    }

}

