//
//  SplashViewModel.swift
//  TripDiarya
//
//  Created by 김동준 on 2022/03/16.
//

import Foundation
import RxSwift
import RxCocoa

final class SplashViewModel: ViewModelType{
    private let disposeBag = DisposeBag()
    private let state = BehaviorRelay<SplashViewState>(value: SplashViewState())
    private var timeover = PublishSubject<ReadyState>()
    private var timer: TimerStartable?
    
    init(timer: TimerStartable){
        self.timer = timer
        timer.setDelegate(timerDelegate: self)
    }
    
    struct Input{
        let viewState: Observable<ViewState>?
    }
    struct Output{
        var state: Driver<SplashViewState>?
    }
    struct SplashViewState{
        var timeOver: ReadyState?
        var viewLogic: ViewLogic?
    }
    
    func transform(input: Input) -> Output {
        input.viewState?.filter{$0 == .viewDidLoad}.take(1)
            .withLatestFrom(state){ viewState, state -> SplashViewState in
                var newState = state
                newState.viewLogic = .setupView
                return newState
            }.bind(to: self.state)
            .disposed(by: disposeBag)
        
        input.viewState?.filter{$0 == .viewWillAppear}.take(1)
            .bind(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.timer?.timerStart()
            }).disposed(by: disposeBag)
        
        timeover.filter{$0 == .ready}
        .take(1)
        .withLatestFrom(state){ viewState, state -> SplashViewState in
            var newState = state
            newState.timeOver = .ready
            return newState
        }.bind(to: self.state)
            .disposed(by: disposeBag)
        
        return Output(state: state.asDriver())
    }
}
extension SplashViewModel: TimerDelegate{
    func timerDidOver() {
        timeover.onNext(.ready)
    }
}

enum ReadyState{
    case ready
    case yet
}

enum ViewLogic{
    case setupView
}
