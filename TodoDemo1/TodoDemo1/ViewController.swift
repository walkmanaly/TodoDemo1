//
//  ViewController.swift
//  TodoDemo1
//
//  Created by Nick on 2017/11/15.
//  Copyright © 2017年 Nick. All rights reserved.
//

import UIKit

var todoItems = [TodoItem]()

class ViewController: UIViewController {
    
    @IBOutlet weak var itemTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Hello world!")
        todoItems = [
            TodoItem(id: 1, name: "go to work", image: "image1", detail: "9:00"),
            TodoItem(id: 2, name: "eat lunch", image: "image2", detail: "12:00"),
            TodoItem(id: 3, name: "go home", image: "image3", detail: "18:00"),
            TodoItem(id: 4, name: "eat dinner", image: "image4", detail: "19:00")
        ]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if todoItems.count > 0 {
            return todoItems.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ID: String = "TodoItemCell"
        let cell = tableView .dequeueReusableCell(withIdentifier: ID, for: indexPath)
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
}



