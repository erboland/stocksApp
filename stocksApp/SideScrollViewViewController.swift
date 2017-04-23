//
//  SideScrollViewViewController.swift
//  stocks
//
//  Created by Ербол Каршыга on 4/21/17.
//  Copyright © 2017 Octopus. All rights reserved.
//

import UIKit

class SideScrollViewViewController: UIViewController {
    @IBOutlet weak var sideScrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        sideScrollView.bounces = false
        let V1: UIViewController = (storyboard?.instantiateViewController(withIdentifier: "Profile"))!
        let V2: UIViewController = (storyboard?.instantiateViewController(withIdentifier: "Main"))!
        let V3: UIViewController = (storyboard?.instantiateViewController(withIdentifier: "V1"))!
        self.addChildViewController(V3)
        self.addChildViewController(V2)
self.addChildViewController(V1)
        V1.didMove(toParentViewController: self)
        V2.didMove(toParentViewController: self)
        V3.didMove(toParentViewController: self)
        
        var V2frame: CGRect = V2.view.frame
        V2frame.origin.x = self.view.frame.width
        V2.view.frame = V2frame
        
        var V3frame: CGRect = V3.view.frame
        V3frame.origin.x = 2*self.view.frame.width
        V3.view.frame = V3frame
        
        self.sideScrollView.addSubview(V1.view)
        self.sideScrollView.addSubview(V2.view)
        self.sideScrollView.addSubview(V3.view)
        self.sideScrollView.contentSize = CGSize(width: self.view.frame.width*3, height: self.view.frame.height)
        sideScrollView.contentOffset = CGPoint(x: self.view.frame.width, y: self.view.frame.minY)
        print("lol")
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
