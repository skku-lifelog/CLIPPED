# lifelog

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Directory Structure ###
```
.
├── assets/
│   ├── icons
│   └── images
└── lib/
    ├── pages
    ├── screens/
    │   ├── login/
    │   │   ├── login_member       : 이메일 로그인 페이지
    │   │   ├── login_membership   : 회원가입 시작 ~ 비밀번호 입력 폼
    │   │   ├── login_membership2  : 약관동의 및 가입완료 폼
    │   │   └── login_screen       : 카카오톡/이메일/회원가입 선택 페이지(시작)
    │   ├── mypage/
    │   │   └── clipedit           : 마이페이지 클립 수정 페이지
    │   └── home
    ├── widgets/
    │   ├── clip/
    │   │   └── tagbubble  : 클립만드는 도구(색, 태그명)
    │   ├── home/
    │   │   ├── clip        : 메인페이지 추천클립 위젯
    │   │   ├── clipline    : 상단 클릅라인 위젯
    │   │   ├── findlinker  : 추천 링커 위젯
    │   │   └── paper       : 메인페이지 게시글(페이퍼) 위젯
    │   └── login/
    │       ├── checkbox    : 회원가입 체크박스
    │       ├── login_box   : 회원가입 이동 버튼
    │       ├── login_textbox : 회원가입 입력 폼
    │       └── terms       : 이용약관 텍스트 입력
    └── main.dart
```
