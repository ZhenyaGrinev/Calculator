//
//  ViewController.swift
//  Test
//
//  Created by TrackEnsure on 2020-02-13.
//  Copyright © 2020 Eugene. All rights reserved.
//

import UIKit
class ViewController: UIViewController , UITableViewDataSource ,UITableViewDelegate{
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var model : Model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return model.str.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        cell.textLabel?.text = model.str[indexPath.row]
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addnumber(sender: UIButton) {
        model.addnumber(sender: sender, displayLabel: displayLabel)
    }
    
    @IBAction func addpoint(sender: UIButton) {
        model.addpoint(sender: sender, displayLabel: displayLabel)
    }
    
    @IBAction func operation(sender: UIButton) {
        model.operation(sender: sender, displayLabel: displayLabel)
    }
    
    @IBAction func clearact(sender: UIButton) {
        model.clearact(sender: sender, displayLabel: displayLabel)
    }
    
    @IBAction func change(sender: UIButton) {
        model.change(sender: sender, displayLabel: displayLabel)
    }
    
    @IBAction func equal(sender: UIButton) {
        model.equal(sender: sender, displayLabel: displayLabel, tableView: tableView)
    }
    
    @IBAction func back(sender: UIButton) {
        model.back(sender: sender, displayLabel: displayLabel)
    }
}


