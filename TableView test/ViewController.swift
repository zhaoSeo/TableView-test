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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "1st Section"
        } else {
            return "2nd Section"
        }
    }
    //dynamic cell 설정 prototype
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "RE"
        let cell = myTableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        //다시 재활용.
        cell.textLabel?.text = data[indexPath.row]
        //title
        cell.detailTextLabel?.text = subData[indexPath.row]
        //subtitle
        
        let myImg = UIImage(named:"image\(indexPath.row).jpeg");
        cell.imageView?.image = myImg
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("section = \(indexPath.section) row = \(indexPath.row)")
        print(data[indexPath.row])
        print(subData[indexPath.row])
        let myAlert = UIAlertController(title: data[indexPath.row], message: subData[indexPath.row], preferredStyle: UIAlertControllerStyle.alert)
        let Action = UIAlertAction(title: "\(indexPath.section) Section \(indexPath.row) Row Selected", style: .default, handler: { (action: UIAlertAction) -> Void in
        })
        let okAction = UIAlertAction(title: "확인", style: .default, handler: { (action: UIAlertAction) -> Void in
        })
        
        let kAction = UIAlertAction(title: "DELETE", style: .default, handler: { (action: UIAlertAction) -> Void in
        })
        //후행 클로져 let okAction = UIAlertAction(title: "종료", style: .default, {(action: UIAlertAction) -> Void in
        let cancelAction = UIAlertAction(title: "CANCEL", style: .cancel, handler: { (action: UIAlertAction) -> Void in
        })
        
        myAlert.addAction(Action)
        myAlert.addAction(okAction)
        myAlert.addAction(kAction)
        myAlert.addAction(cancelAction)
        
        present(myAlert, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        //row와 height를 조절.
    }
}

