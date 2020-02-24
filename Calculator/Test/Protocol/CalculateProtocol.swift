//
//  CalculateProtocol.swift
//  Test
//
//  Created by TrackEnsure on 2020-02-24.
//  Copyright © 2020 Eugene. All rights reserved.
//

import Foundation
import UIKit

protocol CalculateProtocol {
    func addnumber(sender: UIButton, displayLabel:UILabel)
    func addpoint(sender: UIButton, displayLabel:UILabel)
    func operation(sender: UIButton, displayLabel:UILabel)
    func clearact(sender: UIButton, displayLabel:UILabel)
    func change(sender: UIButton, displayLabel:UILabel)
    func equal(sender: UIButton, displayLabel:UILabel,tableView:UITableView)
    func addnewHistory(hist : String , full : Bool,tableView:UITableView)
    func errorClearFunc(displayLabel:UILabel)
    func back(sender: UIButton, displayLabel:UILabel)
}
