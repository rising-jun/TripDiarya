//
//  SplashVioew.swift
//  TripDiarya
//
//  Created by 김동준 on 2022/03/16.
//

import Foundation
import UIKit
import SnapKit
import Then
import Lottie

class SplashView: BaseView{

    lazy var introLabel = UILabel().then { introLabel in
        introLabel.text = "모두의 여행일지"
        introLabel.textColor = .systemGray5
        introLabel.adjustsFontSizeToFitWidth = true
        introLabel.textAlignment = .center
        introLabel.font = UIFont.boldSystemFont(ofSize: 24)
    }
    
    private lazy var animationView = AnimationView(name: "")
    
    override func setupUI() {
        super.setupUI()
        backgroundColor = .systemBlue
        addSubViews(animationView, introLabel)
        setLottieContentMode()
        animationView.snp.makeConstraints { make in
            make.center.equalTo(self)
            make.width.equalTo(200)
            make.height.equalTo(150)
        }
        
        introLabel.snp.makeConstraints { make in
            make.top.equalTo(animationView.snp.bottom).offset(10)
            make.centerX.equalTo(animationView)
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
    }
    
    private func setLottieContentMode(){
        animationView.contentMode = .scaleAspectFit
    }
    
}


