//
//  NetworkManager.swift
//  TCPTest
//
//  Created by dev dfcc on 12/19/23.
//

import Network

class NetworkManager {
    static let shared = NetworkManager()
    
    func establishConnection() {
        let hostname = "www.google.com"
        let port = NWEndpoint.Port(rawValue: 80)! // HTTP 기본 포트는 80

        let connection = NWConnection(host: NWEndpoint.Host(hostname), port: port, using: .tcp)

        connection.stateUpdateHandler = { state in
            switch state {
            case .ready:
                print("Connected to \(hostname)")
                // 연결이 준비되면 서버로부터 데이터 수신을 시작
                self.sendData(connection: connection)
            case .failed(let error):
                print("Failed to connect: \(error)")

            default:
                break
            }
        }

        connection.start(queue: .global())
    }

    func sendData(connection: NWConnection) {
        // HTTP GET 요청을 문자열로 작성
        let getRequest = "GET / HTTP/1.1\r\nHost: \(connection.endpoint.debugDescription)\r\nConnection: close\r\n\r\n"

        guard let data = getRequest.data(using: .utf8) else { return }

        connection.send(content: data, completion: .contentProcessed({ sendError in
            if let sendError = sendError {
                print("Send error: \(sendError)")
            } else {
                print("Data was sent to the server")
                // 데이터 전송 후 응답 받기
                self.receiveData(connection: connection)
            }
        }))
    }

    func receiveData(connection: NWConnection) {
        connection.receive(minimumIncompleteLength: 1, maximumLength: 65536) { data, _, isComplete, error in
            if let data = data, !data.isEmpty {
                // 서버로부터 받은 데이터 처리
                let receivedString = String(data: data, encoding: .utf8)
                print("Received data: \(receivedString ?? "")")
            }
            if isComplete {
                // 연결 종료
                connection.cancel()
            } else if let error = error {
                print("Received error: \(error)")
            } else {
                // 계속해서 데이터 수신
                self.receiveData(connection: connection)
            }
        }
    }
}


