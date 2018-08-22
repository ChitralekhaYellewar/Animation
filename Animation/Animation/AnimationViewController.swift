//
//  AnimationViewController.swift
//  Animation
//
//  Created by Chitralekha Yellewar on 22/08/18.
//  Copyright © 2018 Chitralekha Yellewar. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleBottomContraint: NSLayoutConstraint!
    @IBOutlet weak var subtitleLabel: UILabel!
    let constants = Constants()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideLabels()
        startAnimation()
    }
    
    func hideLabels() {
        self.titleLabel.alpha = .zeroAlpha
        self.subtitleLabel.alpha = .zeroAlpha
    }
    
    func startAnimation() {
        animateTitleLabel()
    }
    
    // MARK: animate title.
    func animateTitleLabel() {
        UIView.transition(with: self.titleLabel, duration: TimeInterval(constants.ANIMATE_DURATION), options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.titleLabel.alpha = .oneAplha
            self.titleBottomContraint.constant = self.view.frame.height*CGFloat.labelBottomMutliplier
            self.view.layoutIfNeeded()
        }, completion: { (finished) in
            self.animateSubtitle()
        })
    }
    
    //MARK: animate subtitle.
    func animateSubtitle() {
        UIView.animate(withDuration: TimeInterval(constants.ANIMATE_DURATION), animations: {
            self.subtitleLabel.alpha = .oneAplha
            self.view.layoutIfNeeded()
            print("Animation Done")
            })
    }
}

extension CGFloat {
    public static let zeroAlpha = CGFloat(0.0)
    public static let oneAplha = CGFloat(1.0)
    public static let labelBottomMutliplier = CGFloat(0.55)
}
