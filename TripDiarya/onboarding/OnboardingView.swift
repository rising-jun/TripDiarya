//
//  OnboardingView.swift
//  TripDiarya
//
//  Created by 김동준 on 2022/04/10.
//

import Foundation
import UIKit

class OnboardingView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI(){
        backgroundColor = .white
    }
}
