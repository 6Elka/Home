//: A UIKit based Playground for presenting user interface
  
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

import RxSwift

//example("PublishSubject") {
//    let disposableBag = DisposeBag()
//
//    let subject = PublishSubject<String>()
//    subject.subscribe {
//        print("Suscription First: ", $0)
//    }.disposed(by: disposableBag)
//
//    subject.on(.next("Hello"))
//    subject.onNext("RxSwift")
//    subject.onCompleted()
//    subject.subscribe(onNext: {
//        print("Suscription Second: ", $0)
//    })
//
//    subject.onNext("Hi!")
//    subject.onNext("My name is Artem")
//}

//example("ReplaySubject") {
//    let disposableBag = DisposeBag()
////
////    let subject = ReplaySubject<String>.create(bufferSize: 1)
////    subject.subscribe {
////        print("First subscription: ", $0)
////    }.disposed(by: disposableBag)
////
////    subject.onNext("a")
////    subject.onNext("c")
////
////    subject.subscribe {
////        print("Second subscription: ", $0)
////    }.disposed(by: disposableBag)
////
////    subject.onNext("d")
////    subject.onNext("e")
//
//    let subject = ReplaySubject<Int>.create(bufferSize: 3)
//    subject.onNext(1)
//    subject.onNext(2)
//    subject.onNext(3)
//    subject.onNext(4)
//
//    subject.subscribe {
//        prrvable int($0)
//    }.disposed(by: disposableBag)
//}

//
//example("Variable") {
//    let disposable = DisposeBag()
//
//    let variable = BehaviorSubject(value: "A")
//    variable.asObservable().subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposable)
//
//    variable
//}

example("SlideEffect") {
    let disp = DisposeBag()
    
    let arr = [0, 32, 100, 300]
    let observable = Observable.from(arr)
    
    observable.do {
        print("\($0)F = ", terminator: "")
    }.map {
        Double($0 - 32) * 5 / 9.0
    }.subscribe {
        print(String(format: "%.1f", $0))
    }.disposed(by: disp)
}
