//
//  ServiceListViewController.swift
//  MeetingRoomsDynamic
//
//  Created by Lingostar on 2016. 4. 5..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import UIKit

class ServiceListViewController: UITableViewController {
    
    var branch:Branch?
    
    override func viewDidLoad() {
        self.title = branch?.name
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rowCount = branch?.services?.count else {
            return 0
        }
        return rowCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCell", for: indexPath)
        
        guard let service = branch?.services?[(indexPath as NSIndexPath).row] else {
            return cell
        }
        cell.textLabel?.text = service.name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MeetingRoomSegue" {
            guard let destination = segue.destination as? MeetingRoomsListController, let selectedIndex = (self.tableView.indexPathForSelectedRow as NSIndexPath?)?.row , let service = branch?.services?[selectedIndex] else {
                return
            }
            destination.service = service
        }
    }
}
