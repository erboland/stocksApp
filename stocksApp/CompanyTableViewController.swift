//
//  CompanyTableViewController.swift
//  stocksApp
//
//  Created by Ербол Каршыга on 4/25/17.
//  Copyright © 2017 Octopus. All rights reserved.
//

import UIKit

class CompanyTableViewController: UITableViewController {

    let sections = [" News", " Statistics", " Orders"]
    var cell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return 3
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(section)
        switch section {
        case 0:
            return 4
        case 1:
            return 5
        case 2:
            return 4
        default:
            fatalError("Errrooooooor")
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
        case 0:
            
            let  cell = tableView.dequeueReusableCell(withIdentifier: "News") as! NewsTableViewCell
//            cell.newsLabel.text = newsArray[indexPath.row].text
//            cell.dateLabel.text = newsArray[indexPath.row].date
            return cell
        case 1:
            let  cell = tableView.dequeueReusableCell(withIdentifier: "Stat") as! StatsTableViewCell
            switch indexPath.row {
            case 0:
                cell.firstLabel.text = "OPEN"
                cell.secondLabel.text = " VOLUME"
                print("ok")
            case 1:
                cell.firstLabel.text = "HIGH"
                cell.secondLabel.text = " AVG VOl"
            case 2:
                cell.firstLabel.text = "LOW"
                cell.secondLabel.text = " MKT CAP"
            case 3:
                cell.firstLabel.text = "1Y HIGH"
                cell.secondLabel.text = " RATIO"
            default:
                cell.firstLabel.text = "1Y LOW"
                cell.secondLabel.text = " D/Y"
            }
            return cell
        case 2:
            let  cell = tableView.dequeueReusableCell(withIdentifier: "Order") as! OrdersTableViewCell
//            cell.dateLabel.text = ordersArray[indexPath.row].date
//            cell.priceLabel.text = ordersArray[indexPath.row].price
//            cell.sharesLabel.text = ordersArray[indexPath.row].shares
            return cell
        default:
            print("default")
            let cell = tableView.dequeueReusableCell(withIdentifier: "news")!
            return cell
        }

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 100
        case 1:
            return 50
        case 2:
            return 100
        default:
            return 100
        }
    }
 
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let title = self.sections[section]
        let view = UIView()

        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 50))
        titleLabel.text = title
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont(name: "AvenirNext-Bold", size: 20)
        view.addSubview(titleLabel)
        
        return view
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
