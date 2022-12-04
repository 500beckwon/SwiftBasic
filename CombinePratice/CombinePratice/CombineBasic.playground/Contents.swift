import UIKit
import Combine

Just(5).sink {
    print($0)
}

let provider = (1...10).publisher

provider.sink { _ in
    print("데이터 전달 Over")
} receiveValue: { data in
    print(data)
}

let hello: String


let publisher = Just("Hi")

let subscriber = publisher.sink { result in
    switch result {
    case .finished:
        print("Finished")
    case .failure(let error):
        print(error.localizedDescription)
    }
} receiveValue: { value in
    print(value)
}

class TestSubscriber: Subscriber {
    typealias Input = String
    typealias Failure = Never
    
    var subscription: Subscription?
    func receive(subscription: Subscription) {
        print("구독 시작")
        subscription.request(.max(1))
        self.subscription = subscription
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print(input,"input")
        return .none
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("완료")
    }
}

let testPublisher = ["123123", "45645654", "3495834908"].publisher

testPublisher.print().subscribe(TestSubscriber())

let subject = PassthroughSubject<String, Never>()

let subscriber2 = TestSubscriber()
subject.print().subscribe(subscriber2)

subject.send("Zedd")
subject.send("Terror Jr")
subject.send("Alan Walker")
subject.send("Martin Garrix")
subject.send("Don Diablo")

subscriber2.subscription?.request(.max(2))
subject.send(completion: .finished)
subject.send("Avicii")
subject.send("LANY")
subject.send("Cash Cash")
