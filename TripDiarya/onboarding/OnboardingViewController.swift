//
//  OnboardingViewController.swift
//  TripDiarya
//
//  Created by 김동준 on 2022/04/10.
//

import Foundation
import UIKit

class OnboardingViewContorller: UIViewController{
    
    private lazy var v = OnboardingView(frame: view.frame)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = v
    }
    
}
