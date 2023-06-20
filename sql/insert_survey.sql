-- -----------------------------------------------------
-- Table `semidb`.`surveyform`
-- 컬럼 : 질문번호 / 질문 / 답변 1 / 답변 2 / 답변 3 / 답변 4 / 답변 5
-- -----------------------------------------------------
insert into surveyform values(null,"질문 1. 아래의 항목들 중, 해당하는 사항을 골라주세요 (중복체크 가능)","해당사항 없음","가슴 두근거림","두통","고혈당","저림");
insert into surveyform values(null,"질문 2. 아래의 항목들 중, 해당하는 사항을 골라주세요 (중복체크 가능)","해당사항 없음","가슴 통증","메스꺼움","혈압 수치가 높음","호흡 곤란");
insert into surveyform values(null,"질문 3. 아래의 항목들 중, 해당하는 사항을 골라주세요 (중복체크 가능)","해당사항 없음","관절통","관절이 뻣뻣함","눈꺼풀 가장자리에 살점이 노랗게 튀어나옴","복부 통증");
insert into surveyform values(null,"질문 4. 아래의 항목들 중, 해당하는 사항을 골라주세요 (중복체크 가능)","해당사항 없음","어지러움","운동 장애(몸의 어느 한쪽이 마비된 상태)","다뇨(소변을 많이 본다)","말초 통증");
insert into surveyform values(null,"질문 5. 아래의 항목들 중, 해당하는 사항을 골라주세요 (중복체크 가능)","해당사항 없음","창백","소화 불량","기침이 자주 나온다","척추 후만(척추가 뒤로 휘어짐)");
insert into surveyform values(null,"질문 6. 아래의 항목들 중, 해당하는 사항을 골라주세요 (중복체크 가능)","해당사항 없음","아픈 관절 자리가 부음","눈의 각막 가장자리가 백색을 띄는 경우","스트레스 높음","언어 장애");
insert into surveyform values(null,"질문 7. 아래의 항목들 중, 해당하는 사항을 골라주세요 (중복체크 가능)","해당사항 없음","시야 장애","말초 신경장애","불안","손등과 무릎 등에 황색의 살갗이 돋아나는 발진이 생긴 경우");
insert into surveyform values(null,"질문 8. 아래의 항목들 중, 해당하는 사항을 골라주세요 (중복체크 가능)","해당사항 없음","구토","작열감(온몸에 열이 심해지고, 쐐기풀로 찌르는 듯한 감각) 이 있다","몸이 자주 붓는다","살갗 밑에 강낭콩이나 두툼하게 솟은 황색종이 발생한 경우");
insert into surveyform values(null,"질문 9. 아래의 항목들 중, 해당하는 사항을 골라주세요 (중복체크 가능)","해당사항 없음","가래가 자주 나온다","골절이 쉽게 일어남","관절 위 피부 부위를 세게 눌렀을 때에 아프다","손바닥에 노랗게 줄무늬가 생기거나, 압박받은 부위가 솟아오르는 황색종이 나타난 경우");
insert into surveyform values(null,"질문 10. 아래의 항목들 중, 해당하는 사항을 골라주세요 (중복체크 가능)","해당사항 없음","뒷목 당김","신체 감각 이상","다음(물을 많이 마신다)","현기증");
insert into surveyform values(null,"질문 11. 아래의 항목들 중, 해당하는 사항을 골라주세요 (중복체크 가능)","해당사항 없음","발한(병에 의해, 몸에 땀이 남)","흑색변","흉곽 팽윤(가슴이 부풀음)","골절이 쉽게 일어남");
insert into surveyform values(null,"질문 12. 아래의 항목들 중, 해당하는 사항을 골라주세요 (중복체크 가능)","해당사항 없음","발적(피부나 점막에 염증이 생겼을 때에 그 부분이 빨갛게 부어오르는 현상)","토혈(위나 식도 따위의 질환으로 피를 토함)","천명음(천식 등의 질환으로 내쉴 때 쌕쌕거리는 소리) 이 난다","신장 감소(키가 줄어들었다)");

select * from surveyform; #form table에 insert 잘들어갔는지 확인


-- -----------------------------------------------------
-- Table `semidb`.`infoDisease`
-- 컬럼 : 질병번호, 병명, 식재료들 (번호 / 병 이름 / 추천 식재료들) 
-- -----------------------------------------------------
insert into infodisease values(null,"고혈압","자몽, 오렌지, 레몬, 블루베리, 생선, 피스타ㅣ오, 당근, 토마토, 브로콜리, 요거트, 시금치");
insert into infodisease values(null,"뇌졸중","다시마, 감자, 고구마, 바나나, 사과, 배");
insert into infodisease values(null,"당뇨병","아몬드, 땅콩, 검은콩, 달걀, 치즈, 딸기, 아보카도, 토마토, 오이, 시금치");
insert into infodisease values(null,"동맥경화증","잡곡, 생선, 계란, 두유, 시리얼, 버섯");
insert into infodisease values(null,"급성심근경색","토마토, 당근, 호박, 생선, 콩, 두부, 포도, 블루베리, 오트밀");
insert into infodisease values(null,"위염","양배추, 브로콜리, 케일, 블루베리, 요거트, 마늘, 생강, 옥수수");
insert into infodisease values(null,"비만","계피, 고추, 녹차, 블루베리, 달걀, 커피, 식초, 땅콩");
insert into infodisease values(null,"만성폐쇄성 폐질환","도라지, 생강, 토마토, 브로콜리, 생선, 배");
insert into infodisease values(null,"골다공증","우유, 치즈, 멸치, 달걀, 생선 ");
insert into infodisease values(null,"관절염","생선, 아몬드, 호두, 올리브유, 블루베리, 시금치, 브로콜리, 생강, 마늘");
insert into infodisease values(null,"고지혈증","생선, 현미, 사과, 오렌지, 양파, 호두, 아몬드, 카레, 귀리, 가지");

select * from infodisease; #infodisease table에 insert 잘들어갔는지 확인 


-- -----------------------------------------------------
-- Table `semidb`.`surveyresult`
-- 컬럼 : 아이디, 결과질병 (설문 수행한 유저 아이디 / 설문 결과 의심 성인병 이름) 
-- -----------------------------------------------------
insert into surveyresult values("aaa","고혈압");
insert into surveyresult values("bbb","위염");
insert into surveyresult values("ccc","관절염");

select * from surveyresult; #result table에 insert 잘들어갔는지 확인 
