//
//  ViewController.swift
//  todo
//
//  Created by Hongyan Zhou S2972126 on 10/4/18.
//  Copyright © 2018年 griffith.edu.au. All rights reserved.
//

import UIKit


var todos:[TodoModel] = []

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    //project logic and sequence
    // 1. create a storyboard to do list ui
    // 2. set the basic tableview page and the detail viewpage.
    // 3. allow user to create new event and add it to the tempary storage
    // 4. display all data to tableview.
    // 5. allow user to view their single event information in a detail view.
    // hint: box first,model second, then add, display, delete.edit
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // to do event list init.
        todos = [TodoModel(id:"1",title:"shopping"),TodoModel(id:"2",title:"do ios homework"),TodoModel(id:"3",title:"chat with friend"),TodoModel(id:"4",title:"watch a movie"),TodoModel(id:"5",title:"play the ball")]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //determine how many items to be displayed
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return todos.count
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    
    

    // display to do list data to actual tableview cells.
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = self.tableview.dequeueReusableCell(withIdentifier: "todoCell")! as UITableViewCell
        var todo:TodoModel
        todo = todos[indexPath.row] as TodoModel
        let title = cell.viewWithTag(102) as! UILabel
        title.text = todo.title
        return cell
    }
    // MARK - UITableViewDelegate
   
    
    
    // Editing
    
    // Allows customization of the editingStyle for a particular cell located at 'indexPath'. If not implemented, all editable cells will have UITableViewCellEditingStyleDelete set for them when the table has editing property set to YES.

    
    
    // Delete the cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableview.setEditing(editing, animated: true)
    }
    // Move the cell
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return self.isEditing
    }
    
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let todo = todos.remove(at: sourceIndexPath.row)
        todos.insert(todo, at: destinationIndexPath.row)
    }
    
    //set the unit cell height to 80
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 80
    }
    // MARK - UITableViewDelegate
    // Delete the cell

    // Unwind
    @IBAction func close(segue: UIStoryboardSegue) {
        print("closed!")
        self.tableview.reloadData()
    }
   
    // jump to detail view ,also pass some data.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditTodo"{
            var vc = segue.destination as! DetailViewController
            // var indexPath = tableView.indexPathForCell(sender as UITableViewCell)
            var indexPath = tableview.indexPathForSelectedRow
            if let index = indexPath {
                vc.todo = todos[index.row]
            }
        }
    }
    // MARK - Storyboard stuff
    // Unwind

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
