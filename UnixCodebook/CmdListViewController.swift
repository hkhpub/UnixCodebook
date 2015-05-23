//
//  ViewController.swift
//  UnixCodebook
//
//  Created by Aaron on 5/23/15.
//  Copyright (c) 2015 hkh. All rights reserved.
//

import UIKit

class CmdListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // 명령어 데이터 array type
    var cmdData:NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var myTableView:UITableView =
            UITableView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
        myTableView.delegate = self
        myTableView.dataSource = self
        self.view.addSubview(myTableView)
        
        if let path = NSBundle.mainBundle().pathForResource("Cmdurl", ofType: "plist") {
            cmdData = NSArray(contentsOfFile: path)
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell()
        var item = cmdData![indexPath.row] as? NSDictionary
        
        cell.textLabel?.text = item?.objectForKey("cmd") as? String
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cmdData!.count
    }
    
    // table view 클릭 이벤트
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        var detailVC:CmdDetailViewController = CmdDetailViewController()
        let storyBoard = UIStoryboard(name:"Main", bundle: nil)
        let detailVC = storyBoard.instantiateViewControllerWithIdentifier("CmdDetailViewController") as! CmdDetailViewController
        detailVC.data = cmdData![indexPath.row] as? NSDictionary
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

