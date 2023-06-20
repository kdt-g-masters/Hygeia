-- form 질문과 답변
insert into form values(1,"질문1번.당신은 어떠십니까?","증상없음","고혈압","뇌졸중","당뇨병","동맥경화");

select * from form; #form table에 insert 잘들어갔는지 확인

truncate form; #form table 내용을 모두 삭제


-- infodisease 질병번호, 병명, 식재료들
insert into infodisease values(null,"고혈압","자몽, 오렌지, 레몬, 블루베리, 생선, 피스타ㅣ오, 당근, 토마토, 브로콜리, 요거트, 시금치");

select * from infodisease; #infodisease table에 insert 잘들어갔는지 확인 

truncate infodisease; #infodisease table 내용을 모두 삭제


-- result (아이디, 질병번호)
insert into result values("aaa",1);
insert into result values("bbb",2);
insert into result values("ccc",3);

select * from result; #result table에 insert 잘들어갔는지 확인 

truncate result; #infodisease table 내용을 모두 삭제