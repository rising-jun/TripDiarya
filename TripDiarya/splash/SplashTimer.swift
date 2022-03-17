//
//  SplashTimer.swift
//  TripDiarya
//
//  Created by 김동준 on 2022/03/17.
//

import Foundation
import RxSwift

class SplashTimer{
    private var animationTimer: Observable<Int>?
    //private var after4sec = PublishSubject<ReadyState>()
    private var timerDelegate: TimerDelegate?
    private lazy var disposeBag = DisposeBag()
    
    init(timerSec: Int){
        self.animationTimer = Observable<Int>.interval(.seconds(timerSec), scheduler: MainScheduler.instance).take(1)
    }
}
extension SplashTimer: TimerStartable{
    func setDelegate(timerDelegate: TimerDelegate){
        self.timerDelegate = timerDelegate
    }
    
    func timerStart() {
        animationTimer?.bind(onNext: { [weak self] _ in
            guard let self = self else { return }
            self.timerDelegate?.timerDidOver()
        }).disposed(by: disposeBag)
    }
}
protocol TimerStartable{
    func timerStart()
    func setDelegate(timerDelegate: TimerDelegate)
}

protocol TimerDelegate{
    func timerDidOver()
}
