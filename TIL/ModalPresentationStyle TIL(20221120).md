# ModalPresentationStyle
- PresentationStyle은 지금 화면이 어떤 크기인가에 영향을 받는다
- 모든 화면에 대해서 프로파일을 제공할 수도 있겠지만, 그랬다가는 지나치게 복잡해지고 오토 레이아웃의 장점도 퇴색되기 때문에(모든 기기마다 레이아웃을 일일이 설정해야 한다면 오토 레이아웃은 필요가 없기 때문) Regular,Compact의 두가지로 구분을 한다.
- Regular가 길고, Compact가 짧은 것
- 아이폰은 세로일 때 가로가 Compact, 세로가 Regular이고, 가로로 돌리면 반대로 가로가 Regular, 세로가 Compact가 된다.
- 아이패드는 가로 세로 모두 Regular 입니다.

## 종류

### Automaic
### None
### FullScreen
### PageSheet
### CurrentContext
### OverCurrentContext
### PopOver
### BlurOverFullScreen
### OverFullScreen

### 기타 
#### Style 앞에 Over가 앞에 붙은 경우 이는 무슨 기능을 뜻하는가?
- Over가 앞에 붙은 경우의 스타일을 지정할 경우 Presenting을 시키는 주체의 ViewContrller 계층이 살아있다 Modal되는 Controller의 BackGround Color를 투명으로 할 경우 사라지지 않고 존재하는 것을 확인 할 수 있다
- 반대의 경우 ViewWillDisApper가 출력되어 계층이 사라진다
