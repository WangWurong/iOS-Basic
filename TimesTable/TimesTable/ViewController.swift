//
//  ViewController.swift
//  TimesTable
//
//  Created by 大兔子殿下 on 12/29/18.
//  Copyright © 2018 大兔子殿下. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var sliderValue: UISlider! // the current value of the slider
    
    // once the slider changes, refresh the table
    @IBAction func sliderChanged(_ sender: Any) {
        table.reloadData()
    }

    @IBOutlet weak var table: UITableView!
    
    // return the number of rows in table view: default as 50
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    // return the cell with the content
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // define the cell object
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        // define the cell value
        cell.textLabel?.text = String((Int(sliderValue.value * 20)) + (indexPath.row + 1))
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

