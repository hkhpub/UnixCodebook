//
//  CmdDetailViewController.swift
//  UnixCodebook
//
//  Created by Aaron on 5/23/15.
//  Copyright (c) 2015 hkh. All rights reserved.
//

import UIKit

class CmdDetailViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lblCmd: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblSyntax: UILabel!
    @IBOutlet weak var lblExample: UILabel!
    
    var data:NSDictionary?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        println("\(data)")
        
        self.lblCmd.text = data?.objectForKey("cmd") as? String
        self.lblDesc.text = data?.objectForKey("desc") as? String
        self.lblSyntax.text = data?.objectForKey("syntax") as? String
        self.lblExample.text = data?.objectForKey("example") as? String
        
//    scrollView.contentSize=CGSizeMake(self.scrollView.frame.width, 1000)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
