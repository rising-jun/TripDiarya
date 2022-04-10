//
//  OnboardingViewModel.swift
//  TripDiarya
//
//  Created by 김동준 on 2022/04/10.
//

import Foundation
import RxSwift
import RxCocoa

class OnboardingViewModel: ViewModelType{
    private let disposeBag = DisposeBag()
    private let state = BehaviorRelay<OnboardingState>(value: OnboardingState())
    
    func transform(input: Input) -> Output {
        
        return Output(state: state.asDriver())
    }

    struct Input{
        let viewState: Observable<ViewState>?
    }
    
    struct Output{
        var state: Driver<OnboardingState>?
        
    }
    
    struct OnboardingState{
        var viewLogic: ViewLogic?
    }
    
}
