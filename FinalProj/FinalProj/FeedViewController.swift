//
//  FeedViewController.swift
//  FinalProj
//
//  Created by Andre Vincent on 5/5/20.
//  Copyright © 2020 Andre Vincent. All rights reserved.
//

import UIKit
import Parse
import Cosmos

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // reports handles the display of the cells, the Dashboard Table is for
    // handling each cell.
    var reports = [PFObject]()
    @IBOutlet weak var DashboardTable: UITableView!
    let refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        DashboardTable.delegate = self
        DashboardTable.dataSource = self
        self.DashboardTable.rowHeight = UITableView.automaticDimension
        self.DashboardTable.estimatedRowHeight = 600
        // for refreshing the Feed View
        
        // Do any additional setup after loading the view.
        refreshControl.addTarget(self, action: #selector(loadReports), for: .valueChanged)
        DashboardTable.refreshControl = refreshControl
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // identifier(ReportsTableCell) and cell 'type' (ReportsTableViewCell) must be different
        let cell = DashboardTable.dequeueReusableCell(withIdentifier: "ReportsTableCell") as! ReportsTableViewCell
        let report = reports[indexPath.row]
        //print(report["comments"])
        
        cell.barName.text = report["barName"] as! String
        cell.userComments.text = report["comments"] as! String
        if report["starRating"] != nil {
            cell.starRating.rating = report["starRating"] as! Double
        }
        else {
            cell.starRating.rating = (report["rating"] as! NSString).doubleValue
        }
        
        cell.userRating.text = report["rating"] as! String + "/5"
        return cell
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        loadReports()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.DashboardTable.reloadData()
        print(self.reports)
    }
    // Makes a network request to get updated data
    // Updates the tableView with the new data
    // Hides the RefreshControl
    func refreshControlAction(_ refreshControl: UIRefreshControl) {

        // ... Create the URLRequest `myRequest` ...
        let url = URL(string: "https://secure-tundra-47274.herokuapp.com/parse")
        let request = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        // Configure session so that completion handler is executed on main UI thread
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task: URLSessionDataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in

            // ... Use the new data to update the data source ...

            // Reload the tableView now that there is new data
            self.DashboardTable.reloadData()

            // Tell the refreshControl to stop spinning
            self.refreshControl.endRefreshing()
        }
        task.resume()
    }
    
    @objc func loadReports() {
        let fetchReports = PFQuery(className: "submissions")
        fetchReports.findObjectsInBackground { (barsFound, error) in
            if barsFound != nil {
                self.reports = barsFound!
                self.DashboardTable.reloadData()
                
            }
        }
    }
}
