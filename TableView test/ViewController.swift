//
//  ViewController.swift
//  TableView test
//
//  Created by Sang won Seo on 2018. 4. 30..
//  Copyright © 2018년 Sang won Seo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var myTableView: UITableView!
    var data = ["1", "2", "3", "4", "5"]
    var subData = ["one", "two", "three", "four", "five"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTableView.dataSource = self
        myTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //dynamic cell 설정 prototype
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "RE"
        let cell = myTableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        //title
        cell.detailTextLabel?.text = subData[indexPath.row]
        //subtitle
        
        let myImg = UIImage(named:"image\(indexPath.row).jpeg");
        cell.imageView?.image = myImg
        return cell
    }
}

