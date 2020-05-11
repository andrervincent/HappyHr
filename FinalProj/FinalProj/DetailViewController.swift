//
//  DetailViewController.swift
//  FinalProj
//
//  Created by Andre Vincent on 4/11/20.
//  Copyright © 2020 Andre Vincent. All rights reserved.
//
/*
 Detail view is not a page with interaction,
it only serves to show the progress */
import UIKit
import Parse
class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of reports in the database
        return reports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // select what types of information needs to be in each cell and go forth from there
        let cell = reports.dequeueReusableCell(withIdentifier: "Report")        return cell
    }
    

    @IBOutlet weak var imageField: UIImageView!
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var ReportsTable: UITableView!
    let reports = [PFObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        ReportsTable.dataSource = self
        ReportsTable.delegate = self
        // Do any additional setup after loading the view.
    }
    
}
