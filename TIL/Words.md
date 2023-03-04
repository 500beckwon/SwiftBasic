# 개발에서 많이 보이는 용어(용례)/단어 개념들 정리

## 포인터
- 메모리 영억을 1바이트 단위로 가르키는 주소

## ADT
- 추상 자료형(Abstract Data Type)은 데이터나 연산이 무엇인지는 정의되지만 데이터나 연산을 어떻게(How) 컴퓨터 상에서 구현할 것인지는 정의되지 않는다 즉 객체외 연산들의 명세가 구현으로부터 분리된 자료형을 말한다
- 예를 들어 연산을 정의할 때 연산의 이름, 매개 변수, 반환형을 정의하지만 연산을 구현하는 구체적인 코드는 주어지지 않는 것이 바로 추상 자료형이다

## Architecture

## Components
- 여러 개의 프로그램 함수들을 모아 하나의 특정한 기능을 수행할 수 있도록 구성한 작은 기능적 단위를 말한다
- 프로그램의 한 부분을 의미하며 재사용이 가능한 최소 단위를 말한다.


## Util
- 보통 Util 클래스는 문자열 관련, 랜덤값 생성, 날짜 및 시간 처리 등 프로젝트 전역에서 사용되는 특정 로직이나 독립적인 기능을 구현해둔 클래스/패키지
- 프로젝트 전역에서 사용될 수도 있는 기능, 특정 로직이나 독립적인 기능, 가능하면 어떤 상태를 가지지 않는 기능
- Util 패키지는 보통은 Model, View, Controller와 같은 특정 계층에 있지 않고 어디서든 사용할 수 있다.

## UseCase

## 디자인 패턴

## Model

## Entities

## storage

## 개발에서 '동적', '정적' 단어

## REST, REST API, RESTful
- REST
    - Representational State Transfer의 약자로 자원을 이름으로 구분하여 해당 자원의 상태를 주고받는 모든 것을 의미한다
    - 네트워크 상에서 Client와 Server 사이의 통신 방식 중 하나
- REST API
    - API(Application Programming Interface)란 데이터와 기능의 집합을 제공하여 컴퓨터 프로그램간 상호작용을 촉진하며, 서로 정보를 교환가능 하도록 하는 것 
    - REST 기반으로 서비스 API를 구현한 것, 최근 OpenAPI(누구나 사용할 수 있도록 공개된 API: 구글 맵, 공공 데이터 등), 마이크로 서비스(하나의 큰 애플리케이션을 여러 개의 작은 애플리케이션으로 쪼개어 변경과 조합이 가능하도록 만든 아키텍처) 등을 제공하는 업체 대부분은 REST API를 제공한다.

- RESTful
    - RESTful은 일반적으로 REST라는 아키텍처를 구현하는 웹 서비스를 나타내기 위해 사용되는 용어이다.
    - ‘REST API’를 제공하는 웹 서비스를 ‘RESTful’하다고 할 수 있다.
    - RESTful은 REST를 REST답게 쓰기 위한 방법으로, 누군가가 공식적으로 발표한 것이 아니다. 즉, REST 원리를 따르는 시스템은 RESTful이란 용어로 지칭된다.
    - RESTful의 목적은 이해하기 쉽고 사용하기 쉬운 REST API를 만드는 것이다
    - RESTful한 API를 구현하는 근본적인 목적이 성능 향상에 있는 것이 아니라 일관적인 컨벤션을 통한 API의 이해도 및 호환성을 높이는 것이 주 동기이니, 성능이 중요한 상황에서는 굳이 RESTful한 API를 구현할 필요는 없다.

## Article

## JWToken

## 소켓

## 라우터(Router)

## Presenter

## Interactor

## 비즈니스 로직(Business Logic)

## Sut, Stub, Test Double

## DTO
- DTO는 Data Transfor Object(데이터 전송 객체), 데이터ㅗㅓ 전송을 위해 생성되는 객체를 의미한다
