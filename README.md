## [제 17회 공개SW 개발자대회] 알약 인식 기능을 활용한 복용 약 관리 앱 - 찰칵 메디슨 💊

### 💡 Update Condition
> 0811 : 메인 화면 - 로그인 전/후 화면 만들기

<img src="https://github.com/WhatIsMethIs/WhatIsMethIs-App/assets/114139700/2c03e627-394e-4eed-932e-d68842b3faae" width="324" height="702"/>
<img src="https://github.com/WhatIsMethIs/WhatIsMethIs-App/assets/114139700/e13c66f2-ddec-46b7-aee2-13dc9e61039f" width="324" height="702"/>

- 파일 구성 
1) 로고 + 마이페이지 행 & '오늘의 복약 정보' 텍스트 + 화살표 버튼
2) 복약 정보를 띄울 위젯 
3) 사진으로 알약 찾기 / 이름으로 알약 찾기 / 비상 연락망 가로스크롤 위젯
4) 로그인 전 화면에 나타날 '로그인 후에 ~~' 텍스트
- '오늘의 복약 정보' 텍스트 옆 화살표 버튼을 누르면 복약 정보 조회 페이지로 넘어갑니다. ➡️ 구현 예정
- 중앙의 '더보기' 텍스트 옆 화살표 버튼을 누르면 그 날의 모든 복약 정보가 표시되는데, ➡️ 구현 예정
- 새로운 창이 뜨는 것이 아닌 한 페이지에 모두 표시됩니다. ➡️ 구현 예정
- 사진으로 알약 찾기 / 이름으로 알약 찾기 / 비상 연락망 위젯은 가로 스크롤을 이용하였습니다.
- 가로 스크롤을 이용하여 위젯을 넘길 때, 위젯 하단에 표시되는 바는 아직 구현되지 않았습니다. ➡️ 구현 예정


> 0812 : 복약 정보 등록 화면 - 틀 짜기

<img src="https://github.com/StopSoo/WhatIsMethIs-App/assets/114139700/e59ba81b-36e1-46f1-b33f-e5e3f40e02da" width="324" height="702"/>

- To do list
1) DropdownButton 해결하기
2) margin, padding 깔끔하게 정리하기
3) time picker 선택 창 코드 정리하기
4) main.dart 파일에 구현되어 있는 클래스들 각각 한 파일로 정리하기
5) 어제 구현한 가로스크롤 바 완성하기


> 0814 : 메인 화면 수정
* 공통
- [x] 텍스트 스타일 dart 파일 수정하기 -> 지윤이가 수정해주면 그거 가져오기로 함

* 메인 화면
- [x] ‘오늘의 복약 정보’ 텍스트 + 우측 화살표 버튼 / 더보기’ 텍스트 + 아래쪽 화살표 버튼 / 상단 우측 마이페이지 버튼 -> 모두 다른 페이지로 넘어갈 버튼으로 만들기
- [x] 화살표 2개 + 위젯 내 그림 아이콘 -> cupertino 아이콘으로 변경
- [x] 하단 세 개의 위젯 모두 하나의 버튼으로 변경

> 0815: 메인 화면 수정 & 복약 정보 등록 화면 구체화
<img src="https://github.com/StopSoo/WhatIsMethIs-App/assets/114139700/0b2b6ae2-846e-46dc-8686-74ae5ce7116f" width="324" height="702"/>

* 메인 화면
- [x] 모든 InkWell 버튼을 Cupertino 버튼으로 변경
* 복약 정보 등록하기 화면
- [x] 모든 InkWell 버튼을 Cupertino 버튼으로 변경
- [x] 박스 모두 이미지 따지 말고 Container로 그림 다시 그리기
- [x] 복약 알림 우측 스위치 구현하기 
- [ ] 알약 개수 / 복약 주기 / 복약 알림 dropdownbutton 구현하기
- [ ] 페이지 상하 스크롤 구현하기
- [x] 회색 박스 -> 이미지 말고 Container로 구현하기
- [x] 복약 시간 버튼 클릭시 색상 변경 -> 각각을 bool 변수로 둘 것

- 누적된 To do list
1) DropdownButton 구현하기
2) margin, padding 깔끔하게 정리하기
3) ~~main.dart 파일 정리하기~~
4) ~~time picker 창 구현하기~~
5) ~~메인 화면 가로 스크롤 바 만들기~~
6) ~~복약 정보 등록 화면 페이지 상하 스크롤 구현 -> 페이지 오버플로우 해결~~

+ 마지막 세 번째 뷰 만들기 !

> 0816: 메인 화면 가로 스크롤 바 구현 시도 & 복약 정보 등록 화면 버튼 구체화

* 공통
- [x] 하나의 화면을 하나의 파일로 구성하기
- [x] 남은 이미지들 모두 Container로 변경하기


* 메인 화면
<br><img src="https://github.com/StopSoo/WhatIsMethIs-App/assets/114139700/5c81b1bb-6db8-4311-b985-809780224659" width="324" height="702"/></br>
- [x] 가로 스크롤 바 구현하기 -> 구현하는 데는 성공했으나 우측 오버플로우 해결 실패 ..


* 복약 정보 등록 화면 (자동) 
<br><img src="https://github.com/StopSoo/WhatIsMethIs-App/assets/114139700/983913e0-9fd7-4623-a1aa-4e67d9490fe9" width="324" height="702"/> <img src="https://github.com/StopSoo/WhatIsMethIs-App/assets/114139700/3860a17a-41ec-486e-8233-ebb9296bf8c4" width="324" height="702"/> <img src="https://github.com/StopSoo/WhatIsMethIs-App/assets/114139700/e9e6cd49-0f47-4d1a-a787-778a72c0a1ba" width="324" height="702"/></br>

- [ ] dropdownbutton 구현하기
- [x] 복용 기간 - date picker 구현하기 -> 취소/완료 버튼은 구현되지 않음
- [ ] 복약 알림 - time picker 구현하기
- [x] 페이지 상하 스크롤 구현하기 - 안 보여도 내려갈 수 있게 !

