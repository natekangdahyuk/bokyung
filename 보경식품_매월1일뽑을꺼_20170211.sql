select * from DM_List_Temp with(nolock)

--truncate table DM_List_Temp

select localName, count(*) from dm_List_temp with(nolock)
group by localName

select  count(*) from DM_List_Temp with(nolock)







select address, count(*) from DM_List_Temp with(nolock)
--where address like '경기도%'
group by address
order by address

delete DM_List_Temp
where address in ('면목로 127','명덕로2길 30','목동서로 280','문장로19길 15','문화로234번길 102','법주사로 216')

select * from dm_List_temp
 where 
address like '강원%'


begin tran
delete DM_List_Temp
where 
address like '강원도 강릉시%' or address like '강원도 동해시%' or address like '강원도 속초시%' or address like '강원도 삼척시%' or address like '강원도 춘천시%'
or address like '강원도 철원군%' or address like '강원도 횡성군%' or address like '강원도 평창군%' or address like '강원도 태백시%' or address like '강원도 정선군%'
or address like '강원도 양양군%' or address like '강원도 고성군%' or address like '강원도 영월군%' or address like '강원도 홍천군%' or address like '강원도 인제군%'
or address like '강원도 양구군%' or address like '강원도 화천군%' 

commit tran

--rollback tran

select   *  from DM_List_Sent 
	where stat <> -1  and address not like '%강원%' and name like '%하나로%'
	order by update_DT,address, name

--stat 종류 확인
select stat from [dbo].[DM_List_Sent]
group by stat

-- 실제 고객 종류 확인
select * from [dbo].[DM_List_Sent]
where stat >90

-- 이름과 주소로 정보 확인
select top 100 * from DM_List_Sent
where name like '%무지개%' 
and
 name like '%무지개%' 
and
address like '%원주%'




--신규 주문자 등록
	update DM_List_Sent
	set stat =99, tel = '062-385-8210', real_name='부천슈퍼마켓협동조합', real_hp='010-5219-8307',  real_Address ='경기 부천시 오정구 오정동 오정물류단지 부천슈퍼마켓협동조합'
	where idx =141284


	select * from DM_List_Sent where stat <> -1 order by update_dt

	select * from DM_List_Sent where stat = -1 and update_Dt > ='2016-05-19' order by update_DT





-- 반송자 등록
update DM_List_Sent
set stat= -1, update_DT=getdate()
where idx in (148656)

-- 반품주소 , 문의한 주소
select idx,stat, name,address,roadAddress,real_address,zipcode,tel,real_name,real_hp,wDate, platform,update_DT,etc from DM_List_Sent
where  address like '%연제%'
and name like '%탑세%'
order by idx desc



update DM_List_Sent
set stat = 100, tel='064-743-2272', update_DT=getdate(), etc='whdnr7000@naver.com'
where  idx = 100848


-- truncate table DM_List_Temp
select count(*) from DM_List_Temp with(nolock)  -- 196,693 -- 전국 모든 데이터(mart), 35,411(han)
select  *  from DM_List_Temp with(nolock) order by wDate desc

-- truncate table DM_List_Temp
--테이블 설명
DM_List_Temp : 툴에서 네이버 지도의 상호명을 검색하여 저장한다.
DM_List_Temp_Working : 
						DM_List_Temp 에서 
											중복 지우고, 
											필터링 데이터 지우고,  

											현재고객 주소와 일체하는것 지우고, 
											이 중 DM_List_Sent 반송된 것 지우고,
											
											 에 있는 데이터는 
											우편번호 작업을 위해 복사하여 실 작업 전 테이블


--[시작]
지난 보낸 날짜가 언제인지 확인해 보자
use mart
select top 10 * from dm_list_sent  order by wdate desc; -- (2015-07-28  ~ 2015-08-06) 2번에 걸쳐 1,418개


-- (수동)지난 보낸 테이블에서 반송 주소록을 먼저 업데이트 한다. 보통 2,000개 보내면 약 400개 정도 20%가 반송
update dm_list_sent
set stat = -1, update_DT=getdate()
where idx in (88712)


 select * from [dbo].dm_list_sent
 where
   (address like '%경기%' 
and address like '%성남%')
and name like '%삼익%' 



--[끝](수동)지난 보낸 테이블에서 반송 주소록을 먼저 업데이트 한다. 보통 2,000개 보내면 약 400개 정도 20%가 반송

select * from DM_List_Sent where update_DT >'2015-10-27' and stat = -1 
select * from DM_List_Sent where stat = 0 -- 이놈 중에 현재 거래 하는 놈도 있을 것이고 악마같은 놈도 있을 것이다. stat 으로 처리 필요 -- 2016년 3월22일 기준 28,817개

-- DM_List_Sent의 중복된 주속록 이 있는지 확인 -- max(stat) 에 -1 이 아닌게 보이면 반송처리
select address , count(*) , max(stat) from DM_List_Sent
group by address
having count(*) > 1
order by max(stat) desc

select * from DM_List_Sent where update_DT >'2015-10-26' and stat = -1 



--중간에 쉬고 왔다.. 어디까지 처리 되었나
select  * from dm_list_sent  where update_DT > '2015-10-19' and stat = -1 order by name   
select  * from dm_list_sent  where wDate > '2015-03-15' and wDate < '2015-07-28'  and stat = -1 and  update_dt > '2015-08-24'  and stat = -1 order by update_DT desc 

select count(*) from dm_list_sent where stat = -1 and wDate > '2015-07-28' --xxx 개 -- 오늘 반송처리한 실제 갯수(중복 포함이니..대략 600개 정도)

-- 지난 보낸 날짜에 몇개나 보냈는지 확인해 보자
select  * from dm_list_sent  where wDate > '2015-10-26' and stat <> -1 -- 한달 뒤 8월 24일 기준 1,418 보내서   반송 77개... 양호하군....
select  * from dm_list_sent  where update_DT > '2015-08-24' and stat <> -1


-- 프로그램을 통해 주소록을 저장하자.
-- 저장 되었다면 데이터를 확인한다.

--1. 기존 dm_list_temp 테이블의 정보를 확인 한다.
select count(*) from dm_list_temp with(nolock) -- 보통 전국 수집 쓰레기 데이타는 196,693개 이제 가공작업을 하자

select * from  dm_list_temp with(nolock) order by address

-- 들어온 주소 중 4자리 주소는 2자리 주소로 업데이트
update  dm_list_temp 
	set 
	 address = case 
							when left(address,4) ='경상북도' then replace(address, '경상북도','경북')
							when left(address,4) ='경상남도' then replace(address, '경상남도','경남')
							when left(address,4) ='전라북도' then replace(address, '전라북도','전북')
							when left(address,4) ='전라남도' then replace(address, '전라남도','전남')
							when left(address,4) ='충청북도' then replace(address, '충청북도','충북')
							when left(address,4) ='충청남도' then replace(address, '충청남도','충남')

							when left(address,3) ='경기도' then replace(address, '경기도','경기')
							when left(address,3) ='강원도' then replace(address, '강원도','강원')
							when left(address,5) ='부산광역시' then replace(address, '부산광역시','부산')
							when left(address,5) ='서울특별시' then replace(address, '서울특별시','서울')
							when left(address,5) ='인천광역시' then replace(address, '인천광역시','인천')
							when left(address,5) ='울산광역시' then replace(address, '울산광역시','울산')
							when left(address,5) ='광주광역시' then replace(address, '광주광역시','광주')
							when left(address,5) ='대구광역시' then replace(address, '대구광역시','대구')
							when left(address,5) ='대전광역시' then replace(address, '대전광역시','대전')
							when left(address,7) ='제주특별자치도' then replace(address, '제주특별자치도','제주')
							when left(address,7) ='세종특별자치시' then replace(address, '세종특별자치시','세종')
					
							else address
						end 

-- 도로명 주소도  4자리 주소는 2자리 주소로 업데이트
update  dm_list_temp 
	set 
	 roadAddress = case 
							when left(roadAddress,4) ='경상북도' then replace(roadAddress, '경상북도','경북')
							when left(roadAddress,4) ='경상남도' then replace(roadAddress, '경상남도','경남')
							when left(roadAddress,4) ='전라북도' then replace(roadAddress, '전라북도','전북')
							when left(roadAddress,4) ='전라남도' then replace(roadAddress, '전라남도','전남')
							when left(roadAddress,4) ='충청북도' then replace(roadAddress, '충청북도','충북')
							when left(roadAddress,4) ='충청남도' then replace(roadAddress, '충청남도','충남')

							when left(roadAddress,3) ='경기도' then replace(roadAddress, '경기도','경기')
							when left(roadAddress,3) ='강원도' then replace(roadAddress, '강원도','강원')
							when left(roadAddress,5) ='부산광역시' then replace(roadAddress, '부산광역시','부산')
							when left(roadAddress,5) ='서울특별시' then replace(roadAddress, '서울특별시','서울')
							when left(roadAddress,5) ='인천광역시' then replace(roadAddress, '인천광역시','인천')
							when left(roadAddress,5) ='울산광역시' then replace(roadAddress, '울산광역시','울산')
							when left(roadAddress,5) ='광주광역시' then replace(roadAddress, '광주광역시','광주')
							when left(roadAddress,5) ='대구광역시' then replace(roadAddress, '대구광역시','대구')
							when left(roadAddress,5) ='대전광역시' then replace(roadAddress, '대전광역시','대전')
							when left(roadAddress,7) ='제주특별자치도' then replace(roadAddress, '제주특별자치도','제주')
							when left(roadAddress,7) ='세종특별자치시' then replace(roadAddress, '세종특별자치시','세종')
					
							else address
						end 

-- 혹시나 변환 안된게 있는지 확인
select * from dm_List_temp -- dm_List_temp
where address like '%경상북도%' or address like '%경상남도%' or address like '%전라북도%' or address like '%전라남도%' or address like '%충청북도%' or address like '%충청남도%' or address like '%경기도%'
or address like '%강원도%' or address like '%부산광역시%' or address like '%서울특별시%' or address like '%인천광역시%' or address like '%울산광역시%' or address like '%광주광역시%' or address like '%대구광역시%'
or address like '%대전광역시%' or address like '%제주특별자치도%' or address like '%세종특별자치시%' 
order by name desc

select * from dm_List_sent -- dm_List_sent 
where (address like '%경상북도%' or address like '%경상남도%' or address like '%전라북도%' or address like '%전라남도%' or address like '%충청북도%' or address like '%충청남도%' or address like '%경기도%'
or address like '%강원도%' or address like '%부산광역시%' or address like '%서울특별시%' or address like '%인천광역시%' or address like '%울산광역시%' or address like '%광주광역시%' or address like '%대구광역시%'
or address like '%대전광역시%' or address like '%제주특별자치도%' or address like '%세종특별자치시%' ) and stat  <> -1

-- 주소 형태가 아닌것들 골라내서 지우기
begin tran
delete dm_List_temp
where address not like '%경북%' and address not like '%경남%' and address not like '%전북%' and address not like '%전남%' and address not like '%충북%' and address not like '%충남%' 
and address not like '%경기%' and address not like '%강원%' and address not like '%부산%' and address not like '%서울%' and address not like '%인천%' and address not like '%울산%' 
and address not like '%광주%' and address not like '%대구%' and address not like '%대전%' and address not like '%제주%' and address not like '%세종%'
commit tran



--중복 데이터 확인 

--/////////////////////////////////////////////////////////////////////////////////////////////////////////
--/////////////////////////////////////////////////////////////////////////////////////////////////////////
--/////////////////////////////////////////////////////////////////////////////////////////////////////////

-- 생각을 잘하자....
-- temp 에 오늘받은 주소 중에 

--1. 오늘 받은 것중 이상한 이름, 이상한 카테고리,번지가 없는것은 제거하고 슈퍼라 생각되는 것들만 Select 하여 워킹테이블에 복사 지운다.  -- 중복삭제전 27,067  -- 중복 건수
--2. 오늘 받은 것중 중복된 것은 제외한다.

--3. 반송 주소록에 있는 것은 제외한다..
--4. 거래처 주소록은 제외한다
--5. 지금까지 단 한번도 보내지 않은 신빙 주소록을 따로 저장한다. (5만 - 보낸유니크)
--6. 지금까지 보낸적 있는 것 중(5만 - 보낸유니크) 시도별로 분류해서 2천개를 채운다.
--/////////////////////////////////////////////////////////////////////////////////////////////////////////
--/////////////////////////////////////////////////////////////////////////////////////////////////////////
--/////////////////////////////////////////////////////////////////////////////////////////////////////////
--/////////////////////////////////////////////////////////////////////////////////////////////////////////
--/////////////////////////////////////////////////////////////////////////////////////////////////////////


-- *카테고리1 확인 --(새로운 것이 나오면 쓸것 또는 쓰지 말아야 할것에  추가하고 지운다.)
select max(name),cateName1 from DM_List_Temp
where 
cateName1  not in ('관리,운영','낚시','농축산', '대형마트','병원부속시설','생활용품점','슈퍼마켓','식품','식품판매','휴게소','생활,편의','쇼핑,유통','쇼핑/편의','콘도','농업협동조합')
and -- 쓰지 말아야 할것
cateName1 not in ('시설,건물','콘도,리조트','행정안전부','건축,토목','기업,빌딩','담배제조','도서,음반,문구','도서관','레저,테마','서점','치안','임신,출산','이탈리아음식','도시락,컵밥','오락시설','도로','귀금속,시계','관람,체험','전자,가전','중개,알선','해물,생선요리','키즈카페,실내놀이터','카쉐어링','침구,커튼','출판사','수선','무예,격투기','문화생활','레져/체육','까페','교육','관광/명소','공공/행정','인력공급,고용알선','다이어트,비만','불교','영,유아,아동','하수,폐기물,환경','햄버거','Care 마사지,지압','세탁소','양식','학원','부동산서비스','금융서비스','가구판매','간식','건강식품판매','건설,건축','결혼','골프','관광,명소','관광지부속시설','교육단체','교통시설','금융서비스','기념품판매','기사식당','기업','꽃집,꽃배달','농업','농축산','단체,협회','당구','도서','마케팅','목욕탕,사우나','무역업,중개업','무예','문구,사무용품','문화센터','미술,공예','미용',
'백화점','법률,행정','병원','보관,저장','볼링','부동산서비스','분식','뷔페','빌딩','사진','상가,아케이드','상설할인매장','샤브샤브','세탁소','수영,수상','숙박','술집','스키,스노우보드','스포츠시설','스포츠용품','아시아음식','애완동물','약국','양식','에너지','여가시설','여행사','영화,영상','오토바이','요가,필라테스','운명감정','유아','유아교육','유흥시설','음악','의료기기판매','이발소','이사','인쇄,복사','인터넷,IT','일식','임업','자동차','자전거,싸이클','전문대행','전자제품','정보통신','제조업','종교','주거시설','중고용품','중식','지방행정기관','축산업','취미','친목','카페','통신판매','패밀리레스토랑','패션','패스트푸드','퓨전요리','학교','학교부속시설','학습교재','학습시설','학원','한식','행정기관','화장실','환경','공원시설물','대체의학','어업','치킨','운송','치킨','축구',' ','도박,복권','디자인','신문','직업전문교육','_welfare 사회,복지','가구,인테리어','개신교','건물','건설업','게임','공공,사회기관','공사,공단','광고,마케팅','광업','금융,보험','기업/빌딩','놀이동산','놀이터','농공시설','교습학원','관광지','금융','도로시설','도시락','마사지,지압','문화,예술','건강,의료','문화시설','물류,유통','반려동물','버스','버스회사','병원,의원','보험','부동산','빵집/베이커리','사진,스튜디오','사회,복지','상담','생명보험사','교통,운수서비스','교통,운수','교육,학문','가공식품','서비스,산업','설계,엔지니어링','세차','세탁','소프트웨어개발','손해보험사','수리,AS','스포츠,레크레이션학원','스포츠,오락','시장','식료품'
,'신발','신용','신용조합','안경원','야구','어학원','엔터테인먼트','여객,화물운송','여행,명소','연구소','연애,결혼','연예기획사','영상,오디오,방송','유아학습','음식','음식점','음악학원','의료단체','의료시설','인쇄업','임대,대여','자동차관련','자동차정비,수리','장례','재활용','전기,가스,수도사업','전문,기술서비스','전문디자인','전시,판매','종합도소매','주유소','주택','지불,결제대행','지원,대행','직업,기술학원','철판요리','청소','출판업','취미,레저용품','취미학원','카센터','카페,디저트','커피프렌차이즈','컴퓨터프로그래밍,정보서비스업','택시회사'
,'통신','패션잡화','협회,단체','호텔','화물운송','화장품','회원권','편의시설', '교육원,교육센터','무역','자전거도로','LPG충전소','육류,고기요리','은행','휴대폰','전자부품','가구','귀금속,보석','기계,장비제조','캐주얼웨어'
)
group by cateName1 order by cateName1

-- *위에 cateName1 지울거를 복사하여 not in 을 in으로 바꾸고 지운다... 
-- *지우기 전에 갯수 확인
select count(*) from DM_List_Temp
where 
cateName1 in ('시설,건물','콘도,리조트','행정안전부','건축,토목','기업,빌딩','담배제조','도서,음반,문구','도서관','레저,테마','서점','치안','임신,출산','이탈리아음식','도시락,컵밥','오락시설','도로','귀금속,시계','관람,체험','전자,가전','중개,알선','해물,생선요리','키즈카페,실내놀이터','카쉐어링','침구,커튼','출판사','수선','무예,격투기','문화생활','레져/체육','까페','교육','관광/명소','공공/행정','인력공급,고용알선','다이어트,비만','불교','영,유아,아동','하수,폐기물,환경','햄버거','Care 마사지,지압','세탁소','양식','학원','부동산서비스','금융서비스','가구판매','간식','건강식품판매','건설,건축','결혼','골프','관광,명소','관광지부속시설','교육단체','교통시설','금융서비스','기념품판매','기사식당','기업','꽃집,꽃배달','농업','농축산','단체,협회','당구','도서','마케팅','목욕탕,사우나','무역업,중개업','무예','문구,사무용품','문화센터','미술,공예','미용',
'백화점','법률,행정','병원','보관,저장','볼링','부동산서비스','분식','뷔페','빌딩','사진','상가,아케이드','상설할인매장','샤브샤브','세탁소','수영,수상','숙박','술집','스키,스노우보드','스포츠시설','스포츠용품','아시아음식','애완동물','약국','양식','에너지','여가시설','여행사','영화,영상','오토바이','요가,필라테스','운명감정','유아','유아교육','유흥시설','음악','의료기기판매','이발소','이사','인쇄,복사','인터넷,IT','일식','임업','자동차','자전거,싸이클','전문대행','전자제품','정보통신','제조업','종교','주거시설','중고용품','중식'
,'지방행정기관','축산업','취미','친목','카페','통신판매','패밀리레스토랑','패션','패스트푸드','퓨전요리','학교','학교부속시설','학습교재','학습시설','학원','한식','행정기관','화장실','환경','공원시설물','대체의학','어업','치킨','운송','치킨','축구',' ','도박,복권','디자인','신문','직업전문교육','_welfare 사회,복지','가구,인테리어','개신교','건물','건설업','게임','공공,사회기관','공사,공단','광고,마케팅','광업','금융,보험','기업/빌딩','놀이동산','놀이터','농공시설','교습학원','관광지','금융','도로시설','도시락','마사지,지압','문화,예술','건강,의료','문화시설','물류,유통','반려동물','버스','버스회사','병원,의원','보험','부동산','빵집/베이커리','사진,스튜디오','사회,복지','상담','생명보험사','교통,운수서비스','교통,운수','교육,학문','가공식품','서비스,산업','설계,엔지니어링','세차','세탁','소프트웨어개발','손해보험사','수리,AS','스포츠,레크레이션학원','스포츠,오락','시장','식료품'
,'신발','신용','신용조합','안경원','야구','어학원','엔터테인먼트','여객,화물운송','여행,명소','연구소','연애,결혼','연예기획사','영상,오디오,방송','유아학습','음식','음식점','음악학원','의료단체','의료시설','인쇄업','임대,대여','자동차관련','자동차정비,수리','장례','재활용','전기,가스,수도사업','전문,기술서비스','전문디자인','전시,판매','종합도소매','주유소','주택','지불,결제대행','지원,대행','직업,기술학원','철판요리','청소','출판업','취미,레저용품','취미학원','카센터','카페,디저트','커피프렌차이즈','컴퓨터프로그래밍,정보서비스업','택시회사'
,'통신','패션잡화','협회,단체','호텔','화물운송','화장품','회원권','편의시설', '교육원,교육센터','무역','자전거도로','LPG충전소','육류,고기요리','은행','휴대폰','전자부품','가구','귀금속,보석','기계,장비제조','캐주얼웨어'
)

-- *위에 cateName1 지울거를 복사하여 그대로 cateName1이 in 인거 확인하고 지운다...  대약 5,500개정도 지워짐
begin tran
delete from DM_List_Temp
where 
cateName1 in ('시설,건물','콘도,리조트','행정안전부','건축,토목','기업,빌딩','담배제조','도서,음반,문구','도서관','레저,테마','서점','치안','임신,출산','이탈리아음식','도시락,컵밥','오락시설','도로','귀금속,시계','관람,체험','전자,가전','중개,알선','해물,생선요리','키즈카페,실내놀이터','카쉐어링','침구,커튼','출판사','수선','무예,격투기','문화생활','레져/체육','까페','교육','관광/명소','공공/행정','인력공급,고용알선','다이어트,비만','불교','영,유아,아동','하수,폐기물,환경','햄버거','Care 마사지,지압','세탁소','양식','학원','부동산서비스','금융서비스','가구판매','간식','건강식품판매','건설,건축','결혼','골프','관광,명소','관광지부속시설','교육단체','교통시설','금융서비스','기념품판매','기사식당','기업','꽃집,꽃배달','농업','농축산','단체,협회','당구','도서','마케팅','목욕탕,사우나','무역업,중개업','무예','문구,사무용품','문화센터','미술,공예','미용',
'백화점','법률,행정','병원','보관,저장','볼링','부동산서비스','분식','뷔페','빌딩','사진','상가,아케이드','상설할인매장','샤브샤브','세탁소','수영,수상','숙박','술집','스키,스노우보드','스포츠시설','스포츠용품','아시아음식','애완동물','약국','양식','에너지','여가시설','여행사','영화,영상','오토바이','요가,필라테스','운명감정','유아','유아교육','유흥시설','음악','의료기기판매','이발소','이사','인쇄,복사','인터넷,IT','일식','임업','자동차','자전거,싸이클','전문대행','전자제품','정보통신','제조업','종교','주거시설','중고용품','중식'
,'지방행정기관','축산업','취미','친목','카페','통신판매','패밀리레스토랑','패션','패스트푸드','퓨전요리','학교','학교부속시설','학습교재','학습시설','학원','한식','행정기관','화장실','환경','공원시설물','대체의학','어업','치킨','운송','치킨','축구',' ','도박,복권','디자인','신문','직업전문교육','_welfare 사회,복지','가구,인테리어','개신교','건물','건설업','게임','공공,사회기관','공사,공단','광고,마케팅','광업','금융,보험','기업/빌딩','놀이동산','놀이터','농공시설','교습학원','관광지','금융','도로시설','도시락','마사지,지압','문화,예술','건강,의료','문화시설','물류,유통','반려동물','버스','버스회사','병원,의원','보험','부동산','빵집/베이커리','사진,스튜디오','사회,복지','상담','생명보험사','교통,운수서비스','교통,운수','교육,학문','가공식품','서비스,산업','설계,엔지니어링','세차','세탁','소프트웨어개발','손해보험사','수리,AS','스포츠,레크레이션학원','스포츠,오락','시장','식료품'
,'신발','신용','신용조합','안경원','야구','어학원','엔터테인먼트','여객,화물운송','여행,명소','연구소','연애,결혼','연예기획사','영상,오디오,방송','유아학습','음식','음식점','음악학원','의료단체','의료시설','인쇄업','임대,대여','자동차관련','자동차정비,수리','장례','재활용','전기,가스,수도사업','전문,기술서비스','전문디자인','전시,판매','종합도소매','주유소','주택','지불,결제대행','지원,대행','직업,기술학원','철판요리','청소','출판업','취미,레저용품','취미학원','카센터','카페,디저트','커피프렌차이즈','컴퓨터프로그래밍,정보서비스업','택시회사'
,'통신','패션잡화','협회,단체','호텔','화물운송','화장품','회원권','편의시설', '교육원,교육센터','무역','자전거도로','LPG충전소','육류,고기요리','은행','휴대폰','전자부품','가구','귀금속,보석','기계,장비제조','캐주얼웨어'
)
commit tran

select @@TRANCOUNT

select * from DM_List_Temp -- 118410


-- 카테고리2 확인--(새로운 것이 나오면 쓸것 또는 쓰지 말아야 할것에 추가하고 지운다.)
select max(name), max(cateName1),cateName2 from DM_List_Temp
where 
cateName2 not in ('벤제프','산업용품','손목시계','실내매장','자동판매기','조경','취미,레저용품',
'농협경제사업장','한식','프랜차이즈본사','치킨매니아','치킨,닭강정','치킨','맥주,호프','xxx','상가','다이어트,샐러드','노래방','그랜드마트','군인용품','과자,사탕,초코렛','','가공식품','낚시','쇼핑센터,할인매장','슈퍼,마트','슈퍼마켓','시장','식료품','아울렛','종합도소매','편의점','굿마트','나들가게','농협하나로마트','대형지역슈퍼','로그인마트','롯데마트','롯데슈퍼','메가마트','아파트상가','할인매장','훼미리마트','IGA마트','JOYMART','OK마트'
,'굿타임24','농업협동조합-현금인출기','전통식품','농협하나로클럽','롯데마켓999','롯데하이마트','문화관광형시장','빅마켓','킴스클럽') --쓸거
and  -- 아래는 지울거
cateName2  not in ('천연화장품','전자랜드21','이마트트레이더스','스키렌탈샵','롭스','고시원,고시텔','건강음료','가정용연료','이마트','오토바이수리','식품첨가물','수예,자수','비디오DVD감상실','볼링용품','공방','한지공예','쇼핑복합시설','보세의류','백화점','드러그스토어','대여감상','펠트','중고가구','주유소','전동모빌리티','자전거','음료','원목가구','영상,음향가전','여행가방','어린이가구','시트지,띠벽지','스키복,보드복','미용','문,창문','목욕탕,사우나','맞춤가구','남성전문미용실','가정,생활용품','가구상가,단지','다이어트제품','발관리','유아학습','KFC','지갑,벨트','유류판매','캠핑용품','직업안내','절,사찰','화장실','열쇠,도장','미용실','꽃집,꽃배달','반려동물','복권,로또','사진,스튜디오','세차','수리,AS','수선','운세,사주','자동차정비,수리','건강,의료용품', '개신교용품','건강보조식품','건어물', '건축,토목', '건축자재,용품','게임','결혼예물','곡류','골프용품','골프웨어','과일','과학기기,장비','가구','가구,인테리어','가방,핸드백','교복','구제의류'
 ,'귀금속,시계','근무복,작업복','금고','금제품전문','기,깃발','기계공구','기능성화장품','기타건축자재','기타매장','남성의류','남성정장','냉난방기','농업용품','달걀','닭','당구용품' ,'도자기','돼지고기','드럭스토어','등산,아웃도어','등산용품','레저,여행용품','리본공예','문구,팬시용품','물,생수','미니자판기','미술,공예품','미용기기,재료','방앗간','배드민턴용품','벽지,장판','보석전문','보일러','보청기','불교용품','사무기기','사무용가구','상가,아케이드','상품권판매','생활용품','서점','선박,해운장비','선반,앵글','세탁','소고기','속옷','수공예액세서리','수산물','수영용품','수입가전','수입식품','수입유아용품','수입의류','수집','스타킹','스포츠용품','스포츠의류','시계','시멘트','식료품주류매장'
 ,'신발','십자수','아케이트게임장','악기','안경원','애완동물','액자,표구','야구용품','양말','얼음','업소용가구','에어컨','여성의류','여성정장','연수기,정수기','열쇠,도어록','오토바이','욕실용품','우유,유제품','원단,섬유,직물','원예,화훼농원','유기농산물','유니폼,단체복','유아,아동교재','유아,아동용품','유아동복','육류','음반,CD','이벤트,파티','이불,담요','일회용품','자동차','자동차부품','자동차스티커','자동차용품,액세서리','자동차유리','자전거,사이클','장갑','장난감','재활용','재봉틀,미싱','재활용센타 매장','전자,가전','전자부품','전지,배터리','젓갈','정육점','정장','조명,디스플레이','조미료,향신료','종합가전','종합생활용품','종합사무용품','종합패션','좌훈,족욕,좌욕','주류','주방가구'
 ,'주방가전','주방용품','중고,물물교환','중고가전','지역재활용센터','차,커피','채소','철물점','출력,복사,제본','침구,커튼','침구류,직물','침대','카내비게이션,GPS','카오디오','캐주얼웨어','캠코더,카메라','커피자판기','컴퓨터','컴퓨터,모니터','퀼트','타월,수건','탁구용품','트로피,상패','특산물,관광민예품','판촉,기념품','패션','패션잡화','페인트','한복','헬스용품','화장도구','화장지,티슈','화장품,향수','휴대폰','휴대폰액세서리','CCTV','농수산물','축산업용품','가구인테리어매장','가구점','개그스토리','건강원','공인중개사','과일전문','기념품매장','꽃배달꽃농원','다이소','떡집','목욕탕','문구점','미니스톱','바이더웨이','보석점','부속시설','브랜드스포츠','브랜드신발매장','브랜드의류매장'
 ,'비디오DVD대여','사진관','삼성디지털프라자','세븐일레븐','아기의류매장','알파문구','애견미용','여행사','열쇠/도장','운수화물','유리','의료기기판매','의류신발매장','의류전문상가','이마트에브리데이','이사짐센타','인테리어매장','자전거대리점','전자제품','전자제품AS','종묘사','종합상가','지역서점','직판장','찜질방사우나','출력복사제본','토속특산물 매장','통신기기','포시즌마트','헤어샵','화장품','CU','GS25','GS마트','KT대리점','LG베스트샵','LGU+대리점','PC방'
 ,'SK대리점','SKT대리점','금매매','무용복','블랙박스','앤틱가구','어업용품','위드미','장례','청소용품','피부미용','하이마트','헤어악세서리','홈플러스익스프레스','반찬가게','소파','웹카메라','의자','임부복','축구용품','도서,음반,문구','CJ올리브영'
 ,'방향제,탈취제','스쿼시용품','알파','여성위생용품','침구류매장','코스코홀세일','홈플러스'
 )
group by cateName2 order by cateName2

-- 위에 cateName2 지울거를 복사하여 not in 을 in으로 바꾸고 지운다...  -- 대략 7,500개 정도 삭제 됨
delete from DM_List_Temp
where 
cateName2  in ('벤제프','산업용품','손목시계','실내매장','자동판매기','조경','취미,레저용품',
'천연화장품','전자랜드21','이마트트레이더스','스키렌탈샵','롭스','고시원,고시텔','건강음료','가정용연료','이마트','오토바이수리','식품첨가물','수예,자수','비디오DVD감상실','볼링용품','공방','한지공예','쇼핑복합시설','보세의류','백화점','드러그스토어','대여감상','펠트','중고가구','주유소','전동모빌리티','자전거','음료','원목가구','영상,음향가전','여행가방','어린이가구','시트지,띠벽지','스키복,보드복','미용','문,창문','목욕탕,사우나','맞춤가구','남성전문미용실','가정,생활용품','가구상가,단지','다이어트제품','발관리','유아학습','KFC','지갑,벨트','유류판매','캠핑용품','직업안내','절,사찰','화장실','열쇠,도장','미용실','꽃집,꽃배달','반려동물','복권,로또','사진,스튜디오','세차','수리,AS','수선','운세,사주','자동차정비,수리','건강,의료용품', '개신교용품','건강보조식품','건어물', '건축,토목', '건축자재,용품','게임','결혼예물','곡류','골프용품','골프웨어','과일','과학기기,장비','가구','가구,인테리어','가방,핸드백','교복','구제의류'
 ,'귀금속,시계','근무복,작업복','금고','금제품전문','기,깃발','기계공구','기능성화장품','기타건축자재','기타매장','남성의류','남성정장','냉난방기','농업용품','달걀','닭','당구용품' ,'도자기','돼지고기','드럭스토어','등산,아웃도어','등산용품','레저,여행용품','리본공예','문구,팬시용품','물,생수','미니자판기','미술,공예품','미용기기,재료','방앗간','배드민턴용품','벽지,장판','보석전문','보일러','보청기','불교용품','사무기기','사무용가구','상가,아케이드','상품권판매','생활용품','서점','선박,해운장비','선반,앵글','세탁','소고기','속옷','수공예액세서리','수산물','수영용품','수입가전','수입식품','수입유아용품','수입의류','수집','스타킹','스포츠용품','스포츠의류','시계','시멘트','식료품주류매장'
 ,'신발','십자수','아케이트게임장','악기','안경원','애완동물','액자,표구','야구용품','양말','얼음','업소용가구','에어컨','여성의류','여성정장','연수기,정수기','열쇠,도어록','오토바이','욕실용품','우유,유제품','원단,섬유,직물','원예,화훼농원','유기농산물','유니폼,단체복','유아,아동교재','유아,아동용품','유아동복','육류','음반,CD','이벤트,파티','이불,담요','일회용품','자동차','자동차부품','자동차스티커','자동차용품,액세서리','자동차유리','자전거,사이클','장갑','장난감','재활용','재봉틀,미싱','재활용센타 매장','전자,가전','전자부품','전지,배터리','젓갈','정육점','정장','조명,디스플레이','조미료,향신료','종합가전','종합생활용품','종합사무용품','종합패션','좌훈,족욕,좌욕','주류','주방가구'
 ,'주방가전','주방용품','중고,물물교환','중고가전','지역재활용센터','차,커피','채소','철물점','출력,복사,제본','침구,커튼','침구류,직물','침대','카내비게이션,GPS','카오디오','캐주얼웨어','캠코더,카메라','커피자판기','컴퓨터','컴퓨터,모니터','퀼트','타월,수건','탁구용품','트로피,상패','특산물,관광민예품','판촉,기념품','패션','패션잡화','페인트','한복','헬스용품','화장도구','화장지,티슈','화장품,향수','휴대폰','휴대폰액세서리','CCTV','농수산물','축산업용품','가구인테리어매장','가구점','개그스토리','건강원','공인중개사','과일전문','기념품매장','꽃배달꽃농원','다이소','떡집','목욕탕','문구점','미니스톱','바이더웨이','보석점','부속시설','브랜드스포츠','브랜드신발매장','브랜드의류매장'
 ,'비디오DVD대여','사진관','삼성디지털프라자','세븐일레븐','아기의류매장','알파문구','애견미용','여행사','열쇠/도장','운수화물','유리','의료기기판매','의류신발매장','의류전문상가','이마트에브리데이','이사짐센타','인테리어매장','자전거대리점','전자제품','전자제품AS','종묘사','종합상가','지역서점','직판장','찜질방사우나','출력복사제본','토속특산물 매장','통신기기','포시즌마트','헤어샵','화장품','CU','GS25','GS마트','KT대리점','LG베스트샵','LGU+대리점','PC방'
 ,'SK대리점','SKT대리점','금매매','무용복','블랙박스','앤틱가구','어업용품','위드미','장례','청소용품','피부미용','하이마트','헤어악세서리','홈플러스익스프레스','반찬가게','소파','웹카메라','의자','임부복','축구용품','도서,음반,문구','CJ올리브영'
 ,'방향제,탈취제','스쿼시용품','알파','여성위생용품','침구류매장','코스코홀세일','홈플러스'
 )
select @@TRANCOUNT

select count(*) from DM_List_Temp  -- 183,659



-- 이름 중에 이상한 것들 삭제하고 확인 -- 12,709 삭제
delete from DM_List_Temp 
where 
--010-2915-8450 진성마트라는 곳에서 다시는 보내지 말라함... 근데 어느지역인지 모름.. 나중에 전화해서 이놈만 1로 만들면 될듯
name like '%옥외%' or 
name like '%과일%' or name like '%바이올가%'or name like '%홀딩스%' or name like '%안경%' or name like '%반찬%' or name like '%도서%' or name  like '%정육%' or name like '%다이소%' or name like '%물류%' or name like '%물산%' or name like '%담배%' or name like '%협동조합%' or name like '%축협%' or name like '%노동%' or name like '%식품%' or name like '%컨설팅%' or name like '%축산%' or name like '%생협%' or name like '%집하장%' or name like '%화훼%' or name like '%현무%' or name like '%키즈니즈%' or name like '%자연드림%' or name like '%덕정%' or name like '%에스엠광적%' or name like '%아원%' or name like '%아이푸드%' or name like '%게이트오브%' or name like '%상사%' or name like '%중국%' or name like '%레몬영화%' or name like '%수암플러스%' or name like '%참외%' or name like '%에스엠케이%' or name like '%떡볶이%' or name like '%원더코코%' or name like '%홈쇼핑%' or name like '%문화센터%' or name like '%진성%' or name like '%펫%' or name like '%홍삼%' or name like '%커피%' or name like '%중고%' or name like '%골프%' or name like '%자재%' or name like '%오일%' or name like '%철물%' or name like 'cu%'
or name like '%cu%'or name like '%씨유%'or name like '%국군복지단%'or name like 'cu%' or name like '%gs%'or name like '%홈플러스%'or name like '이마트%'or name like '%세븐일레븐%'or name like '세븐 일레븐%'
or name like '미니스톱%'or name like '%공사중%'or name like '%호텔%'or name like '%치킨%'or name like '%활어회%'or name like '%횟집%'or name like '%ABC%'or name like '%의원%'or name like '%한우%'
or name like '%부동산%'or name like '%렌탈%'or name like '%리조트%'or name like '%민박%'or name like '%고기백화점%'or name like '%투어%'or name like '%식당%'or name like '%부대찌개%'or name like '%분식%'
or name like '%문구%' or name like '%미용마트%' or name like '%커튼%' or name like '%생곡%' or name like '%열쇠%' or name like '%씽크대%' or name like '%가판대%' or name like '%붙박이%' or name like '%벽지%' or name like '%이불%'
or name like '%군인%' or name like '%산천어%' or name like '%경찰%' or name like '%주방%' or name like '%환경%' or name like '%배터리%' or name like '%커텐%' or name like '%아이폰%' or name like '%학년%' or name like '%키친%'
or name like '%아울렛%' or name like '%키마트%' or name like '%케이스%' or name like '%휴대폰%' or name like '%침구%' or name like '%성인%' or name like '%디피%' or name like '%전자%'
or name like '%도로%' or name like '%천원%' or name like '%천냥%' or name like '%리빙%' or name like '%생활용품%' or name like '%그릇%' or name like '%지에스%' or name like '%고기할인%' or name like '%전기%' or name like '%공구%' or name like '%포병%' or name like '%대대%' or name like '%양돈%' or name like '%사무%'or name like '%재활용%'or name like '%베트남%'or name like '%포호아%'
or name like '%아이스크림%' or name like '%택시%' or name like '%가구%' or name like '%테크노%' or name like '%가방%' or name like '%면세%'
or name like '%foreign mart%' or name like '%KK마트%' or name like '%건강%'or name like '%크리스찬%'or name like '%기독%'or name like '%의료%'or name like '%바이오%'



-- 주소의 끝이 번지가 없는 것은 삭제  -- 107,517  보통 여기서 거의 삭제됨
delete DM_List_Temp
where  address like '%동' or address like '%면' or address like '%리' or address like '%읍'  or address like '%주차장' or address like '%입구' 
or address like '%동구' or address like '%서구' or address like '%남구' or address like '%북구'
or address like '%1가' or address like '%2가' or address like '%3가' or address like '%4가' or address like '%5가' or address like '%6가' or address like '%7가' or address like '%8가' or address like '%9가' 


select @@TRANCOUNT

select count(*) from DM_List_Temp  -- 61,549

-- 중복된게 있는지 확인 -- 엄청 많이 나온다.
SELECT min(idx) as idx , address, count(*) AS cnt FROM DM_List_Temp  with(nolock) 
	GROUP BY address HAVING count(*) > 1   
	order by cnt

SELECT min(idx) as idx , roadAddress, count(*) AS cnt FROM DM_List_Temp  with(nolock) 
	where roadAddress  <> '' -- is not null
	GROUP BY roadAddress HAVING count(*) > 1   
	order by cnt



-- 중복 데이터 제거 구 주소-- 39,523개 삭제
begin tran
	delete from DM_List_Temp
	where idx in (
	select a.idx as idx
	from DM_List_Temp a join ( SELECT min(idx) as idx , address, count(*) AS cnt FROM DM_List_Temp GROUP BY address HAVING count(*) > 1) b
	on a.address = b.address and a.idx <> b.idx);  

commit tran

select @@TRANCOUNT

-- 중복 데이터 제거 도로명 주소-- 124개 삭제
begin tran
	delete from DM_List_Temp
	where idx in (
	select a.idx as idx
	from DM_List_Temp a join ( SELECT min(idx) as idx , roadAddress, count(*) AS cnt FROM DM_List_Temp where roadAddress <> '' GROUP BY roadAddress HAVING count(*) > 1) b
	on a.roadAddress = b.roadAddress and a.idx <> b.idx);  

commit tran


select @@TRANCOUNT


--  위에 중복 삭제를 했다면.. 중복 데이타가 있는지 한번 더 확인
select isnull(sum(a.cnt),0)
from
	(
	SELECT min(idx) as idx , address, count(*) AS cnt FROM DM_List_Temp  with(nolock) 
	GROUP BY address HAVING count(*) > 1   --  주소 기준 중복 데이터 0건
	) a

--도로명주소 중복 확인
select isnull(sum(a.cnt),0)
from
	(
	SELECT min(idx) as idx , roadAddress, count(*) AS cnt FROM DM_List_Temp  with(nolock)  where roadAddress <> ''
	GROUP BY roadAddress HAVING count(*) > 1   --  주소 기준 중복 데이터 0건
	) a

-- 0. 새로 받은 주속록인데 기존 보낸 주소록의 주소 중 구 주소와 현재 들어온 구 주소가 같은 데이타는 삭제.
select a.name as Aname, a.address as Aaddress, b.address as xxx  from dm_list_temp a join dm_list_sent b on a.address = b.address where b.address <> '' -- 9427
begin tran
	delete from DM_List_Temp where address in (	 SELECT  address from DM_List_Sent where address <> '' )	

commit tran
select @@TRANCOUNT


-- 1. 새로 받은 주속록인데 기존 보낸 주소록의 주소 중 도로명 주소와 현재 들어온 도로명 주소가 같은 데이타는 삭제.
begin tran
	delete from DM_List_Temp where roadAddress in (	 SELECT  roadAddress from DM_List_Sent where roadAddress <> '' )	
commit tran

-- 2. 새로받은 주소록인데 보낸 주소록의 주소 중 도로명 주소와 현재 들어온 예전 주소가 같은 데이타는 삭제.
begin tran
	delete from DM_List_Temp where Address in (	 SELECT  roadAddress from DM_List_Sent where roadAddress <> '' )	
commit tran
-- 3. 새로받은 주소록인데 보낸 주소록의 주소 중 기존 주소와 현재 들어온 도로명 주소가 같은 데이타는 삭제.
begin tran
	delete from DM_List_Temp where roadAddress in (	 SELECT  Address from DM_List_Sent )	
commit tran


--a. 보낸 주소록의 전화번호 중 현재 들어온 전화번호가 같은 데이타는 삭제
begin tran
	delete from DM_List_Temp where tel in ( select tel from dm_list_sent  where tel <> '' or tel is not null) -- 142
commit tran


--b. 반송된 주소록은 여기서 지워주자
select a.name, a.address, a.tel, b.idx, b.tel, b.name, b.address from dm_list_sent a join DM_List_Temp b on a.tel = b.tel
where a.stat =-1  and a.tel <> ''
order by a.address -- 갯수 확인하고




--보낸 주소록 중 중복이 있는지 확인

-- 농협인데 진짜 농협인건 수동으로 걸러내서 지워주자
select * from dm_list_temp where name not like '%하나로%' and name  like '%농협%'

begin tran
	delete dm_list_temp
	where idx in
	(
	629,
	28236,
	36523,
	47517,
47844,
51944,
54684,
64511,
79342,
87286,
92471,
92525
	)
commit tran

select @@TRANCOUNT


select a.name as Aname, a.address as Aaddress, * from dm_list_temp a join dm_list_sent b on a.address = b.address
select a.name as Aname, a.address as Aaddress, * from dm_list_temp a join dm_list_sent b on a.roadAddress = b.roadAddress
select a.name as Aname, a.address as Aaddress, * from dm_list_temp a join dm_list_sent b on a.roadAddress = b.Address
select * from dm_list_temp -- 데이터 확인 -- 833개

select * from dm_list_temp where name like '%하나로%' -- 데이터 확인
-- 데이터 확인


-- 새로받은 주소
select * from DM_List_Temp  --7427개

select localName, count(*) from dm_List_temp with(nolock)
group by localName

-- 2018.05.01 여기 할차례... 강원도 중에서 한길한테 물어보고...지울것 지우고 진행  있을 것이다.

drop table DM_List_Temp_20180502
select * into DM_List_Temp_20180502 from DM_List_Temp 

-- 7427개 백업



--새로받은 주소를 mart_날짜 테이블로 복사
drop table mart_20180502
--새로운 테이블에 데이타를 복사해 놓자 --
select idx,name, tel, address, roadAddress, cateName1, cateName2, wDate
	into mart_20180502 
from DM_List_Temp 	where localName not like '%강원도%'
	order by address DESC	
	
	
--

-- 하나로는 500개를 맞춘다.
select * from mart_20180502 where name like '%하나로%' order by address  -- (select 500-209  = 291개 보충)
select 500 - 209

--1. 하나로 먼저 넣고 -- 2,000개가 안될경우
insert into chicken_20161018 ( name, tel, [address], roadAddress, wDate) 
	select top 291  name, tel, [address], roadAddress, getdate()  from DM_List_Sent 
	where stat <> -1  and address not like '%강원%' and name like '%하나로%'
	order by update_DT,address, name



select * from mart_20160903 where name not like '%하나로%' order by address  -- (select 1500-624  = 876 개 보충)

--2. 나머지는 마트로 넣는다.
insert into chicken_20161018 ( name, tel, [address], roadAddress, wDate) 
	select top 1000  name, tel, [address], roadAddress,  getdate()   from DM_List_Sent 
	where stat <> -1  and address not like '%강원%'  and name not like '%하나로%'
	order by update_DT,address, name
	
		

--현재 mart_날짜 테이블 정보
select * from mart_20180502 order by wDate

-- 혹시나 중복 데이타가 있는지 확인 없어야 함.
SELECT min(idx) as idx , address, count(*) AS cnt FROM mart_20180502  with(nolock) 
	GROUP BY address HAVING count(*) > 1   --  주소 기준 중복 데이터 0건


--새로운 주소가 2천개가 안되어 보낸 주소록에서 가져 왔다면...
select count(*) from  DM_List_Sent a join mart_20180502 b on a.address = b.address -- 기준 주소록 Loop 갯수 


-- 모자라서 돌려치기 한 주소록은 보낸 테이블의 update_DT 를 갱신  mart_20160322  테이블명 확인 (중요)

begin tran
	update DM_List_Sent 
	set update_DT = getdate()
	from DM_List_Sent a join mart_20160322 b on a.address = b.address

commit tran

select @@TRANCOUNT




-- 데이타를 다시 보자.
select count(*) from mart_20180502 -- 2,000개
select *  from mart_20180502  order by wDate -- 옛날주소, 도로명 주소가 서울, 경북, 경남과 같이 두 자리로 바꿔야 한다.
select * from mart_20180502  where name like '%하나로%' -- 하나로는 우리의 밥줄


--mart_날짜 테이블
select * from mart_20180502 a join dm_list_sent b on a.address = b.address where a.address <> '' and a.cateName1 is not null  -- 신규 들어온 아이의 주소가 기존 주소와 같다면 뭔가 이상.
select * from mart_20180502 a join dm_list_sent b on a.roadAddress = b.address where a.address <> '' and a.cateName1 is not null  -- 신규 들어온 아이의 주소가 기존 주소와 같다면 뭔가 이상.
select * from mart_20180502 a join dm_list_sent b on a.address = b.roadAddress where a.address <> '' and a.cateName1 is not null  -- 신규 들어온 아이의 주소가 기존 주소와 같다면 뭔가 이상.
--보낸 주소록에 있고 주소가 같은 아이들 지우자. (날짜 테이블이 delete 와 select 2개 임)
begin tran
	delete from mart_20180502
	where idx in (select a.idx from mart_20180502 a join dm_list_sent b on a.address = b.address where a.address <> '' and a.cateName1 is not null)
commit tran

begin tran
	delete from mart_20180502
	where idx in (select a.idx from mart_20180502 a join dm_list_sent b on a.roadAddress = b.address where a.address <> '' and a.cateName1 is not null)
commit tran

select @@TRANCOUNT


select * ,b.update_DT from mart_20180502 a join dm_list_sent b on a.tel = b.tel where a.tel <> ''  and a.cateName1 is not null -- 신규 들어온 아이의 전번이 기존 전번과 같다면 뭔가 이상.

--보낸 주소록에 있고 전화번호가 같은 아이들 지우자 (참조 테이블이 2개임)
begin tran
	delete from mart_20180502
	where idx in (select a.idx from mart_20180502 a join dm_list_sent b on a.tel = b.tel where a.tel <> '' and a.cateName1 is not null)
commit tran

select @@TRANCOUNT




select * from DM_List_Temp_Working
select * from mart_20180502  
drop table DM_List_Temp_Working -- 데이터를 지우고... 현재 추출된 놈들만 복사 하자(데이터 보호와 우편번호 추출을 위해)

select * into DM_List_Temp_Working from mart_20180502  -- 데이터 insert




select * from DM_List_Temp_Working  -- UVW_DM_LIST_MART 에서 DM_List_Temp_Working 를 참고하여 tempZip_Mart 에 우편번호와 함께 넣는다.



select * from tempZip_Mart -- 있으면 지우는 거지
drop table tempZip_Mart;

sp_helptext UVW_DM_LIST_MART

sp_helptext FN_GetzipCodeFromAddr

select * into tempZip_Mart from UVW_DM_LIST_MART 



select * from tempZip_Mart


SELECT  count(*)  FROM     tempZip_Mart
WHERE  (zipCode IS NULL) -- 0 이 될때 까지 수정.. 수정 -- 2만개 중에 8,132개가 우편번호가 없다... 도로명으로 패스

*************************************************
******************tempZip_Mart 에 idx (identity) 를 넣어준다.
*************************************************
--*1번째****************************************************************************************************************
SELECT *  FROM     tempZip_Mart
WHERE  (zipCode IS NULL) -- 0 이 될때 까지 수정
--*****************************************************************************************************************

-- [1번째 이건 성남시 분당구 처럼 띄워쓰기 그리고 5자리 우편번호] - 시작
set nocount on
declare @cnt int, @idx int, @zipCode varchar(7), @address varchar(100), @i int; set @i = 0;

DECLARE cur_Vender insensitive cursor

for
	SELECT  idx, address  FROM  tempZip_Mart  WHERE  (zipCode IS NULL)

	open cur_Vender

	fetch next from cur_Vender into @idx, @address

		while @@fetch_status =0
		begin			
			-- select DBO.FN_GetzipCodeFromRoadAddr(replace(@address, ' ', '|')), @idx	
			 update tempZip_mart set zipCode = DBO.FN_GetzipCodeFromRoadAddr_170809(replace(@address, ' ', '|')) where idx=@idx		

			fetch next from cur_Vender into @idx, @address
		end
		
		close cur_Vender
		
	DEALLOCATE cur_Vender
	--커서 마켓 끝		

set nocount off
-- [1번째 이건 성남시 분당구 처럼 띄워쓰기 그리고 5자리 우편번호] - 끝

--*4번째****************************************************************************************************************
SELECT *  FROM     tempZip_Mart
WHERE  (zipCode IS NULL) -- 0 이 될때 까지 수정
--*****************************************************************************************************************

-- [2번째 이건 성남시 분당구 빼고 일반 도시에서 번호찾기그리고 5자리 우편번호] - 시작
set nocount on
declare @cnt int, @idx int, @zipCode varchar(7), @address varchar(100), @i int; set @i = 0;

DECLARE cur_Vender insensitive cursor

for
	SELECT  idx, address  FROM  tempZip_Mart  WHERE  (zipCode IS NULL)

	open cur_Vender

	fetch next from cur_Vender into @idx, @address

		while @@fetch_status =0
		begin			
			-- select DBO.FN_GetzipCodeFromRoadAddr(replace(@address, ' ', '|')), @idx	
			 update tempZip_mart set zipCode = DBO.FN_GetzipCodeFromRoadAddr_170809_ggg(replace(@address, ' ', '|')) where idx=@idx		

			fetch next from cur_Vender into @idx, @address
		end
		
		close cur_Vender
		
	DEALLOCATE cur_Vender
	--커서 마켓 끝		

set nocount off
-- [2번째 이건 성남시 분당구 처럼 띄워쓰기 그리고 5자리 우편번호] - 끝
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------





-- 3번째 혹시나 구 주소에 있나 확인  8.1232 개 커서 돌려 확인하는데 걸린시간 (============2분 30초)
set nocount on
declare @cnt int, @idx int, @zipCode varchar(7), @address varchar(100), @i int; set @i = 0;

DECLARE cur_Vender insensitive cursor

for
	SELECT  idx, address  FROM  tempZip_Mart  WHERE  (zipCode IS NULL)

	open cur_Vender

	fetch next from cur_Vender into @idx, @address

		while @@fetch_status =0
		begin			
			-- select DBO.FN_GetzipCodeFromRoadAddr(replace(@address, ' ', '|')), @idx	
			 update tempZip_mart set zipCode = DBO.FN_GetzipCodeFromRoadAddr(replace(@address, ' ', '|')) where idx=@idx		

			fetch next from cur_Vender into @idx, @address
		end
		
		close cur_Vender
		
	DEALLOCATE cur_Vender
	--커서 마켓 끝		

set nocount off
-- 혹시나 도로명 주소에 있나 확인 끝
--*****************************************************************************************************************
SELECT *  FROM     tempZip_Mart
WHERE  (zipCode IS NULL) -- 0 이 될때 까지 수정
--*****************************************************************************************************************

-- 혹시나 도로명 주소에 있나 확인  [4번째 이건 roadName이아니라 ri 로 검색]
set nocount on
declare @cnt int, @idx int, @zipCode varchar(7), @address varchar(100), @i int; set @i = 0;

DECLARE cur_Vender insensitive cursor

for
	SELECT  idx, address  FROM  tempZip_Mart  WHERE  (zipCode IS NULL)

	open cur_Vender

	fetch next from cur_Vender into @idx, @address

		while @@fetch_status =0
		begin			
			-- select DBO.FN_GetzipCodeFromRoadAddr(replace(@address, ' ', '|')), @idx	
			 update tempZip_mart set zipCode = DBO.FN_GetzipCodeFromRoadAddr_ri(replace(@address, ' ', '|')) where idx=@idx		

			fetch next from cur_Vender into @idx, @address
		end
		
		close cur_Vender
		
	DEALLOCATE cur_Vender
	--커서 마켓 끝		

set nocount off
-- 혹시나 도로명 주소에 있나 [4번째] 확인 끝


SELECT  *  FROM     tempZip_Mart
WHERE  (zipCode IS NULL) -- 0 이 될때 까지 수정.. 



select @@TRANCOUNT



-- 지워도 될 정도라면
begin tran
	delete tempZip_Mart WHERE  (zipCode IS NULL) 

commit tran
select @@TRANCOUNT



-- 반품 지워 준다.(전번)
select a.name, a.address, a.tel, b.idx, b.tel, b.name, b.address from dm_list_sent a join tempZip_Mart b on a.tel = b.tel
where a.stat =-1  and a.tel <> ''
order by a.address -- 갯수 확인하고


-- 지운다(반품- 전번)
begin tran 
	delete tempZip_Mart
	from dm_list_sent a join tempZip_Mart b on a.tel = b.tel -- null 은 비교가 안되어.전화번호 한번, 주소로 한번더
	where stat =-1   and a.tel <> ''

commit tran
select @@TRANCOUNT

-- 반품 지워 준다.(주소)
select a.name, a.address, a.tel, b.idx, b.tel, b.name, b.address from dm_list_sent a join tempZip_Mart b on a.address = b.address -- null 은 비교가 안되어.전화번호 한번, 주소로 한번더
where stat =-1  
order by a.address -- 갯수 확인하고

-- 지운다.(반품 - 주소)
begin tran 
	delete tempZip_Mart
	from dm_list_sent a join tempZip_Mart b on a.address = b.address -- null 은 비교가 안되어.전화번호 한번, 주소로 한번더
	where stat =-1 
commit tran



--================================
-- 이번에 보낼 주소록
--================================
select count(*) from tempZip_Mart;
select * from tempZip_Mart

-- 2,000개 이상일 경우 서울은 지운다. -- 서울은 잘 안됨
--delete tempZip_Mart
select * from tempZip_Mart -- 확인 후 주석., delete 를 실행
where 
address like '강원 강릉시%' or address like '강원 동해시%' or address like '강원 속초시%' or address like '강원 삼척시%' or address like '강원 춘천시%'
or address like '강원 철원군%' or address like '강원 횡성군%' or address like '강원 평창군%' or address like '강원 태백시%' or address like '강원 정선군%'
or address like '강원 양양군%' or address like '강원 고성군%' or address like '강원 영월군%' or address like '강원 홍천군%' or address like '강원 인제군%'
or address like '강원 양구군%' or address like '강원 화천군%'  --or address like '서울%'  



--추출된 데이터는 DM 발송 리스트에 오늘 날짜로 해서 넣어 준다.(기존 보낸건 날짜 업데이트 했으니 완전 쌔거만 넣어 주면 된다.)
insert dm_List_sent(name, tel, zipCode, address,roadAddress, stat, wDate, platform, update_dt)
select name, tel, zipCode, address, roadAddress, 0, getdate(), 'mart_20180502', getdate() from tempZip_Mart  where  cateName1 is not null


--주소가 일반 도로 시작하지 않으면 삭제
select * from tempZip_Mart
where address not like '서울%'  and address not like '경기%'  and address not like '경남%'  and address not like '경북%'  and address not like '광주%' and address not like '대구%' 
and address not like '대전%' and address not like '인천%' and address not like '전북%' and address not like '전남%' and address not like '충북%' and address not like '충남%' and address not like '제주%'
and address not like '부산%' and address not like '울산%'  and address not like '세종%'  and address not like '강원%' 


 tempZip_Mart 테이블 이름을 검색 단어와 날짜를 붙여 이름을 바꿔줘라

select count(*) from [dbo].[tempZip_Mart_날짜_Naver]  -- 이건 샘플.. 아래를 지워라
select count(*) from tempZip_Mart_20180502_Naver

--아래 쿼리로 데이터 export 옵션 First row has column names 체크, 확장자는 쓰지말고 파일명만 입력

SELECT  name + ' 사장님' as name, tel, zipcode, address , cateName1 from tempZip_Mart_20180502_Naver 
order by  address


select left(address,2) , count(*) from tempZip_Mart_20180502_Naver
where cateName1 is not null
group by left(address,2)
order by count(*) desc


--********************************************************************************************************************


-- 거래처 리스트
select * from cur_members

-- 고객들의 지역을 함 따져보자
select left(address,2) as mainDo, count(*) as cnt from cur_members
group by left(address,2)
-- order by left(address,2)
order by count(*) desc

select * from cur_members where address like '포항%' -- 주소에 이상한 게 들어오면 확인



