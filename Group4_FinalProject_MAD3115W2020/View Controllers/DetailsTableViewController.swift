//
//  DetailsTableViewController.swift
//  Group4_FinalProject_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-27.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit

class DetailsTableViewController: UITableViewController {
    static var segmentValue: Int = Int()
    var customerList: [Customer] = []
    var driverList: [Driver] = []
    var ownerList: [Owner] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        customerList = DataStorage.getInstance().getAllCustomers()
        driverList = DataStorage.getInstance().getAllDrivers()
        ownerList = DataStorage.getInstance().getAllOwners()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if DetailsTableViewController.segmentValue == 0{
            return customerList.count
        }else if DetailsTableViewController.segmentValue == 1{
            return driverList.count
        }else if DetailsTableViewController.segmentValue == 2{
            return ownerList.count
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailsViewCell", for: indexPath)
        
        if DetailsTableViewController.segmentValue == 0{
            let person = customerList[indexPath.row]
            cell.textLabel?.text = person.firstName
            cell.detailTextLabel?.text = person.lastName
        }else if DetailsTableViewController.segmentValue == 1{
            let person = driverList[indexPath.row]
            cell.textLabel?.text = person.firstName
            cell.detailTextLabel?.text = person.lastName
        }else if DetailsTableViewController.segmentValue == 2{
            let person = ownerList[indexPath.row]
            cell.textLabel?.text = person.firstName
            cell.detailTextLabel?.text = person.lastName
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          if DetailsTableViewController.segmentValue == 0{
                let person = customerList[indexPath.row]
            SpecificDetailsViewController.segmentValue = 0
            SpecificDetailsViewController.personId = person.id
              }else if DetailsTableViewController.segmentValue == 1{
                  let person = driverList[indexPath.row]
            SpecificDetailsViewController.segmentValue = 1
            SpecificDetailsViewController.personId = person.id
              }else if DetailsTableViewController.segmentValue == 2{
                  let person = ownerList[indexPath.row]
            SpecificDetailsViewController.segmentValue = 2
            SpecificDetailsViewController.personId = person.id
              }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
