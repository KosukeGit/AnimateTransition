//
//  ViewController.swift
//  AnimateTransition
//
//  Created by x13089xx on 2016/12/14.
//  Copyright © 2016年 Kosuke Nakamura. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    let animator = Animator()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UIButton
        let button = UIButton()
        button.setTitle("next", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        button.center = self.view.center
        button.backgroundColor = UIColor.orange
        button.setTitleColor(UIColor.white, for: .normal)
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
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextView = storyboard.instantiateViewController(withIdentifier: "second") as! SecondViewController
        
        nextView.transitioningDelegate = self  // delegate設定
        
        present(nextView, animated: true, completion: nil)
    }
    
    /**
     * 遷移時のアニメーション処理
     */
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animator.transition = true
        return animator
    }
    
    /**
     * 戻り時のアニメーション処理
     */
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animator.transition = false
        return animator
    }


}

