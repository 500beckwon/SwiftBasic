# Library

## iOS 에서의 Library
- 프로그램에 연결할 수 있는 패키징된 파일들의 모음

## Static Library(정적 라이브러리)
- 라이브러리가 주된 실행 파일의 코드에 패킹되어 있다
- 빌드 시스템이 가장 단순하다
- 실행 프로그램에 물리적으로 복사되어 올라간다
- Link 시점에 라이브러리를 executable(실행 가능한) 파일 바이너리에 포함
- 컴파일 될 때 사용할 코드들을 Executable file에 복사하여 사용(.A 형식 파일)
- 불필요하게 파일들이 커지고 메모리 공간 활용의 효율이 낮은 단점이 존재
- 실행 바이너리 속에 라이브러리블이 포함되어 있으므로 별도의 추가 작업없이 독립적으로 라이브러리 사용 가능

## Share Library(공유 = 동적 라이브러리)
- 링커에 라이브러리의 참조만 저장
-  .dyilb
- 심볼과 참조를 결정짓고 해당 라이브러리를 사용
- RunTime 중에 프로그램에 해당 라이브러리 코드를 찾아서 연결
- 공유 라이브러리를 메모리에 올릴려면, 찾고 올리는데에 시간이 걸리므로 성능 정하가 발생하는 단점이 존재
- 필요시 사용할 수 있도록 최소한의 정보만 포함하여 링크하므로 메모리 효율이 상승

## 정적 동적 차이점
- 동적 라이브러리는 참조만 저장하고 주된 실행 파일에 패키징 되어있지 않고 정적 라이브러리는 실행파일의 코드에 패킹되어 있다

## Framework
- framework는 공유 리소스를 캡슐화 하는 계층적인 디렉토리이다. dynamic shared library나, nib파일, image, localized strings, header file 같은 리소스를 하나의 package로 관리한다. 따라서 framework는 extra asset과 메타데이터와 version이 번들로 패킹된 static 하거나 dynamic 한 library이다. UIKit은 UI요소를 display하기 위해 image asset이 필요한, 버전정보를 가지고있는 프레임워크이다.
- 라이브러리는 단순히 실행 가능한 코드이지만 프레임워크는 공유 라이브러리 + 헤더 + 각종 리소스까지 모든 것을 Bundle로 묶어놓은 것
- Bundle은 서브 디렉토리 내부의 파일 디렉토리를 의미한다
- 프레임워크가 몸집이 크고 라이브러리가 작으며 프레임워크 안에 라이브러러가 속할 수 있다

## Static Framework와 Dynamic Framework 

### Static Framework 
- Source File + Static Library + Static Linker
- Static Linker를 통해 Static Library 코드가 Execute file(= appliccation file) 내로 들어가 Heap 메모리에 상주
- Static Library가 복사되므로, Static Framework를 여러 Framework에서 사용하면 코드 중복이 발생
- 필요한 파일들을 Heap에 복사해와서 사용하는 것이므로 런타임 속도가 빠름
- 메모리가 많이 사용
- 컴파일 속도가 오래 걸림

### Dynamic Framework

- Source File + Dynamic Library References + Dynamic Library + Static Linker
- 파일이 아닌 주소를 execute file (= application file)에 저장하고, Static Linker를 통해서 Stack으로 필요한 라이브러리들을 불러와서 사용하는 형태
- 주소 정보들은 Heap에 상주
- 주소값을 Heap에 저장해놓고 사용하는 것이므로 컴파일 속도가 적게 걸림
- 메모리를 효율적으로 사용
- 런타임 속도가 느림

## Compile
- 사람이 이해할 수 있는 Object Code 에서 실행 가능한 파일로 변경하는 작업

## Link
- 컴퓨터가 이해할 수 있는 Object Code에서 실행 가능한 파일로 변경하는 작업
- 라이브러리와 앱의 소스코드 파일을 병합하는 프로세스

## Linker
- Linker는 input으로 Object 파일, Libraries(.a, .tbd, .dylib) 를 받고 단일 파일로 결합해 주는 역할을 하는 executable filed을 생성해주는 역할을 가지고 있다

## Mach-O file format
- 개발자의 소스코드가 컴파일러에 의해 object file로 변환됨 (.swift -> .o)
- object file이 static linker에 의해 executable code 또는 static library로 변환됨
- 이 과정을 linking이라고 한다

## Static Linking
- Static Linking에서 library의 source code는 literal하게 어플리케이션의 소스로 복사된다.
- 따라서 executable 파일의 용량이 커지고, 이는 load시간 증가로 이어지며 따라서 앱의 바이너리가 느린 startup time을 가진다.
- 동일한 라이브러리를 다시 link하려고 하면 process가 중복된 symbol에 의해 실패할 것이다.

## Dynamic Linking
- Dynamic Libraries 는 바이너리의 소스에 embed되지 않고, runtime에 load된다.
- 그 말은 즉슨 앱이 더 작아지고, 작아진 binary file에 의해 startup time이 significant하게 빨라질 수 있다.
- dynamic library는 다수의 executable을 공유할 수 있기 때문에 memory footprint또한 적게 쓴다. 가끔 shared libraries라 불린다.
