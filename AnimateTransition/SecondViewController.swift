//
//  SecondViewController.swift
//  AnimateTransition
//
//  Created by x13089xx on 2016/12/14.
//  Copyright © 2016年 Kosuke Nakamura. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // backgroundColor
        self.view.backgroundColor = UIColor.blue
        
        // UIButton
        let button = UIButton()
        button.setTitle("back", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        button.center = self.view.center
        button.backgroundColor = UIColor.white
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(touchButton(sender:)), for: .touchUpInside)
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
     * buttonが押された時の処理
     */
    func touchButton(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
