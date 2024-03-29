
# 컴파일러 Complier
- 컴파일러는 특정 프로그래밍 언어로 쓰여 있는 문서를 다른 프로그래밍 언어로 옮기는 언어 번역 프로그램을 말한다. (by 위키백과)

## 상세
- xcode에 코드를 입력하면 다음과 같은 4가지의 일이 일어나게 됩니다.
1. Preprocessing
2. Compiling
3. Assembling
4. Linking


## 설명
- 전처리는 Preprocessor(전처리기)가 수행한다
- 전처리기는 컴파일이 되기전에 해야 할 것을 실행하는 역할을 의미한다

## COMPILE(컴파일)
- 컴파일은 Compiler(컴파일러)가 우리가 작성한 소스코드를 assembly code로 바꾸는 행위를 말한다
- 어셈블리 코드란 우리가 사용하는 코드보다 저수준 언어를 의미한다

## ASSEMBLE(어셈블)
- 어셈블은 Assembler(어셈블러)가 컴파일러가 변환한 어셈블리 코드를 machine code로 바꾸는 행위를 말한다

## LINK(링크)
- 링크는 Linker(링커)가 여러 개의 파일에 나뉜 머신 코드들을 합쳐주는 행위를 의미한다
- 코드가 작성되어 있는 파일들을 한 가지로 합치는 것을 링크라고 한다

## 학습내용
- 이 4개의 과정을 거쳐야 내가 작성한 소스코드가 컴퓨터가 이해할 수 있는 머신 코드로 변환된다고 한다.
- 이 모든 과정은 Xcode에서 알아서 처리해준다
- 이 4가지 과정을 모두 합쳐 Compile 한다고 표현합니다.
- 어셈블리어는 모르겠지만 기계어에 가까운 언어라고 하는 것 같다
- 저수준 언어라는 것은 일종의 명품급이 아닌 컴퓨터가 봤을 때 이해하기 쉬운 수준의 언어임을 의미하고 반대로 고수준 언어는 사람이 이해하기 쉬운 수준을 의미한다 swift는 고수준 언어라고 한다
