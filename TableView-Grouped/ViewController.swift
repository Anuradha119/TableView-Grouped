//
//  ViewController.swift
//  TableView-Grouped
//
//  Created by Marni Anuradha on 12/27/19.
//  Copyright © 2019 Marni Anuradha. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var item = [String]()
    
    static var name = [String]()
    static var age = [Int16]()
    static var email = [String]()
    static var actor = [String]()
    static var cricketer = [String]()
    static var politician = [String]()
    static var designation = [String]()
    static var rowIndex:Int!
    static var segmentedControl = [UISegmentedControl]()
    var data:[NSManagedObject]!
    
    var tableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true))
        createUI()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "abc")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0)
        {
            return ViewController.actor.count
        }
        else if(section == 1)
        {
            return ViewController.cricketer.count
        }
         
           return ViewController.politician.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "abc", for: indexPath)
        
        if(indexPath.section == 0)
        {
            cell.textLabel?.text = ViewController.actor[indexPath.row]
        }
        else if(indexPath.section == 1)
        {
            cell.textLabel?.text = ViewController.cricketer[indexPath.row]
        }
        
        else{
            cell.textLabel?.text = ViewController.politician[indexPath.row]
        }
        
        cell.detailTextLabel?.text = String(ViewController.age[indexPath.row]) + "  :  " + ViewController.email[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        ViewController.rowIndex = indexPath.row
        let targetVC = storyboard?.instantiateViewController(identifier: "secondVC")
        
        navigationController?.pushViewController(targetVC!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0)
        {
            return "Actors"
        }
        if(section == 1)
        {
            return "Cricketers"
        }
        if(section == 2)
        {
            return "Politicians"
        }
        return "all"
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.gray
    }
    
    func createUI()
    {
        tableView = UITableView()
        tableView = .init(frame: view.frame, style: UITableView.Style.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        ViewController.name = [String]()
        ViewController.age = [Int16]()
        ViewController.email = [String]()
        ViewController.actor = [String]()
        ViewController.cricketer = [String]()
        ViewController.politician = [String]()
        item = [String]()
        
        var text:String!
        data = CRUD.fetchData(entityName: "Contacts")
        print("data:", data)
        for x in data
        {
            let path = x.value(forKey: "designation") as! String
            
            let name = x.value(forKey: "name") as! String
            text = name
            ViewController.name.append((x.value(forKey: "name") as! String))
            
            let age = x.value(forKey: "age") as! Int16
            text += "\n" + "\(age)"
            ViewController.age.append((x.value(forKey: "age") as! Int16))
            
            let email = x.value(forKey: "email") as! String
            text += "\n" + "\(email)"
            ViewController.email.append((x.value(forKey: "email") as! String))
            
            if(path == "Actors")
            {
                ViewController.actor.append(text)
                
            }
            
            if(path == "Cricketers")
            {
                ViewController.cricketer.append(text)
            }
            
            if(path == "Politicians")
            {
                ViewController.politician.append(text)
            }
            
            tableView.reloadData()
        }
    }
    @IBAction func addContactBtnTap(_ sender: Any) {
        
        ViewController.rowIndex == nil
        
        let targetVC = self.storyboard?.instantiateViewController(identifier: "secondVC")
        
        navigationController?.pushViewController(targetVC!, animated: true)
    }
}

