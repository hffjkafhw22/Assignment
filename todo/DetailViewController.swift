//
//  DetailViewController.swift
//  todo
//
//  Created by Hongyan Zhou S2972126 on 10/4/18.
//  Copyright © 2018年 griffith.edu.au. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {


    var todo:TodoModel?
    @IBOutlet weak var todoText: UITextField!
    
    @IBOutlet weak var todoTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoText.delegate = self as? UITextFieldDelegate
        // Do any additional setup after loading the view.
        
        // set navigation title for different mode
        if todo == nil{
            self.navigationItem.title = "create an event"
        }else{
            self.navigationItem.title = "edit event"
            todoText.text = todo?.title
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //save to do item
    @IBAction func okTapped(sender: AnyObject) {
  
        if todo == nil {
            // New todo
            // let uuid = NSUUID.UUID().UUIDString
            let uuid = NSUUID().uuidString
            todo = TodoModel(id: uuid,  title: todoText.text!)
            todos.append(todo!)
        }
        else {
            todo?.title = todoText.text!
        }
    }
    
    // MARK: - Textfield
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //resign virtual keyboard
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        todoText.resignFirstResponder()
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
