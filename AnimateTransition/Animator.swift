//
//  Animator.swift
//  AnimateTransition
//
//  Created by x13089xx on 2016/12/14.
//  Copyright © 2016年 Kosuke Nakamura. All rights reserved.
//

import UIKit

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let animationDuration = 1.0
    var transition: Bool = false
    
    
    /**
     * 遷移時間を返す
     */
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }
    
    /**
     * アニメーションを開始する処理
     */
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        self.interruptibleAnimator(using: transitionContext).startAnimation()
    }
    
    /**
     * UIViewPropertyAnimatorを返す
     */
    func interruptibleAnimator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        
        let fromView = fromVC?.view  // 元のview
        let toView = toVC?.view  // 遷移先のview
        
        let containerView = transitionContext.containerView
        containerView.addSubview(fromView!)
        containerView.addSubview(toView!)
        
        let timing: UITimingCurveProvider = UICubicTimingParameters(animationCurve: .linear)
        let animator = UIViewPropertyAnimator(duration: animationDuration, timingParameters: timing)
        let springParameters: UISpringTimingParameters = UISpringTimingParameters(dampingRatio: 0.3, initialVelocity: CGVector.zero)
        let animator2 = UIViewPropertyAnimator(duration: animationDuration, timingParameters: springParameters)
        
        if transition {
            // ----------遷移時----------
            toView?.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            
            // アニメーション処理
            animator2.addAnimations {
                fromView?.alpha = 0.0
                toView?.transform = .identity
            }
            // アニメーション終わりの処理
            animator2.addCompletion {_ in
                transitionContext.completeTransition(true)
            }
            
            return animator2
        } else {
            // ----------戻り時----------
            // アニメーション処理
            animator.addAnimations {
                fromView?.alpha = 0.0
                toView?.alpha = 1.0
            }
            // アニメーション終わりの処理
            animator.addCompletion {_ in
                transitionContext.completeTransition(true)
            }
            
            return animator
        }
    }
    

}
