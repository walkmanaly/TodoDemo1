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
            TodoItem(id: 1, name: "take care baby", image: "child-selected", detail: "9:00"),
            TodoItem(id: 2, name: "have a phone call", image: "phone-selected", detail: "12:00"),
            TodoItem(id: 3, name: "go shopping", image: "shopping-cart-selected", detail: "18:00"),
            TodoItem(id: 4, name: "have a traval", image: "travel-selected", detail: "19:00")
        ]
        
    }
}

func setNoMoreDataLabel(_ label: UILabel,
                        frame: CGRect,
                        text: String,
                        textAliment: NSTextAlignment,
                        font: UIFont,
                        textColor: UIColor) {
    label.frame = frame
    label.text = text
    label.textAlignment = textAliment
    label.font = font
    label.textColor = textColor
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if todoItems.count > 0 {
            return todoItems.count
        } else {
            let messageLabel = UILabel()
            setNoMoreDataLabel(messageLabel, frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), text: "no more data", textAliment: .center, font: UIFont(name: "Palatino-Italic", size: 20)!, textColor: .black)
            tableView.backgroundView = messageLabel
            tableView.separatorStyle = UITableViewCellSeparatorStyle.none
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ID: String = "TodoItemCell"
        let cell = tableView .dequeueReusableCell(withIdentifier: ID, for: indexPath)
        let item = todoItems[indexPath.row]
        cell.imageView?.image = UIImage(named: item.image)
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.detail
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            todoItems.remove(at: indexPath.row)
            
            tableView.reloadData()
        }
    }
}



