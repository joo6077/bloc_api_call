# bloc_api_call

## 1. 프로젝트 구조
```
.
└── lib/    
    ├── application/       앱 전반적으로 사용되는 유틸
    │   ├── class
    │   ├── const
    │   ├── enums
    │   ├── styles
    │   ├── types
    │   ├── utils
    │   └── app.dart
    ├── domain/    
    │   ├── dataSources       api 엔트리 포인트 담당
    │   ├── models       데이터 모델 담당
    │   └── repositories       데이터를 저장하고 불러오는 로직 담당
    └── presentation/       
        ├── detail/
        │   ├── bloc       리포지토리로 받아온 데이터를 뷰에 상태 및 이벤트 적용
        │   ├── widgets       detail에 쓰이는 위젯들
        │   └── detail_page.dart
        ├── list/
        │   ├── bloc/       리포지토리로 받아온 데이터를 뷰에 상태 및 이벤트 적용
        │   │   ├── category
        │   │   └── list
        │   ├── controllers       뷰 컨트롤러
        │   ├── widgets       list에 쓰이는 위젯들
        │   └── list_page.dart
        └── widgets       프로젝트 공통으로 쓰이는 위젯들
```
프로젝트를 최대한 서로 의존하는 부분 없지만 간단하게 설계하려고 노력했습니다.

- UI에 사용되는 모든 위젯 button, modal, pagination, radio, checkbox를 직접 개발했습니다.
- 리스트페이지 일반 - 광고 배치를 효율적(UI에서 연산을 최소)으로 하고자 따로 리스트를 만들어 관리하도록 구현했습니다.
- 실전 프로젝트를 한다고 생각하여 구조를 잡고 설계했습니다.
- paginationModel 하나로 페이지 정보 데이터를 받는 모델(리스트, 광고)들을 담을 수 있게 구현했습니다.
- 사용자 편의성을 위해 임의로 상세 페이지에 뒤로가기 버튼을 적용했습니다.
- 사용자 경험 향상을 위해 splash 효과를 주었습니다.
- 고객센터 대응 -> 광고 가리기, 게시판, 스켈레톤 로딩을 구현했습니다.