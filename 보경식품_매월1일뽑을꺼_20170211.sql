select * from DM_List_Temp with(nolock)

--truncate table DM_List_Temp

select localName, count(*) from dm_List_temp with(nolock)
group by localName

select  count(*) from DM_List_Temp with(nolock)







select address, count(*) from DM_List_Temp with(nolock)
--where address like '��⵵%'
group by address
order by address

delete DM_List_Temp
where address in ('���� 127','�����2�� 30','�񵿼��� 280','�����19�� 15','��ȭ��234���� 102','���ֻ�� 216')

select * from dm_List_temp
 where 
address like '����%'


begin tran
delete DM_List_Temp
where 
address like '������ ������%' or address like '������ ���ؽ�%' or address like '������ ���ʽ�%' or address like '������ ��ô��%' or address like '������ ��õ��%'
or address like '������ ö����%' or address like '������ Ⱦ����%' or address like '������ ��â��%' or address like '������ �¹��%' or address like '������ ������%'
or address like '������ ��籺%' or address like '������ ����%' or address like '������ ������%' or address like '������ ȫõ��%' or address like '������ ������%'
or address like '������ �籸��%' or address like '������ ȭõ��%' 

commit tran

--rollback tran

select   *  from DM_List_Sent 
	where stat <> -1  and address not like '%����%' and name like '%�ϳ���%'
	order by update_DT,address, name

--stat ���� Ȯ��
select stat from [dbo].[DM_List_Sent]
group by stat

-- ���� �� ���� Ȯ��
select * from [dbo].[DM_List_Sent]
where stat >90

-- �̸��� �ּҷ� ���� Ȯ��
select top 100 * from DM_List_Sent
where name like '%������%' 
and
 name like '%������%' 
and
address like '%����%'




--�ű� �ֹ��� ���
	update DM_List_Sent
	set stat =99, tel = '062-385-8210', real_name='��õ���۸�����������', real_hp='010-5219-8307',  real_Address ='��� ��õ�� ������ ������ ������������ ��õ���۸�����������'
	where idx =141284


	select * from DM_List_Sent where stat <> -1 order by update_dt

	select * from DM_List_Sent where stat = -1 and update_Dt > ='2016-05-19' order by update_DT





-- �ݼ��� ���
update DM_List_Sent
set stat= -1, update_DT=getdate()
where idx in (148656)

-- ��ǰ�ּ� , ������ �ּ�
select idx,stat, name,address,roadAddress,real_address,zipcode,tel,real_name,real_hp,wDate, platform,update_DT,etc from DM_List_Sent
where  address like '%����%'
and name like '%ž��%'
order by idx desc



update DM_List_Sent
set stat = 100, tel='064-743-2272', update_DT=getdate(), etc='whdnr7000@naver.com'
where  idx = 100848


-- truncate table DM_List_Temp
select count(*) from DM_List_Temp with(nolock)  -- 196,693 -- ���� ��� ������(mart), 35,411(han)
select  *  from DM_List_Temp with(nolock) order by wDate desc

-- truncate table DM_List_Temp
--���̺� ����
DM_List_Temp : ������ ���̹� ������ ��ȣ���� �˻��Ͽ� �����Ѵ�.
DM_List_Temp_Working : 
						DM_List_Temp ���� 
											�ߺ� �����, 
											���͸� ������ �����,  

											����� �ּҿ� ��ü�ϴ°� �����, 
											�� �� DM_List_Sent �ݼ۵� �� �����,
											
											 �� �ִ� �����ʹ� 
											�����ȣ �۾��� ���� �����Ͽ� �� �۾� �� ���̺�


--[����]
���� ���� ��¥�� �������� Ȯ���� ����
use mart
select top 10 * from dm_list_sent  order by wdate desc; -- (2015-07-28  ~ 2015-08-06) 2���� ���� 1,418��


-- (����)���� ���� ���̺��� �ݼ� �ּҷ��� ���� ������Ʈ �Ѵ�. ���� 2,000�� ������ �� 400�� ���� 20%�� �ݼ�
update dm_list_sent
set stat = -1, update_DT=getdate()
where idx in (88712)


 select * from [dbo].dm_list_sent
 where
   (address like '%���%' 
and address like '%����%')
and name like '%����%' 



--[��](����)���� ���� ���̺��� �ݼ� �ּҷ��� ���� ������Ʈ �Ѵ�. ���� 2,000�� ������ �� 400�� ���� 20%�� �ݼ�

select * from DM_List_Sent where update_DT >'2015-10-27' and stat = -1 
select * from DM_List_Sent where stat = 0 -- �̳� �߿� ���� �ŷ� �ϴ� �� ���� ���̰� �Ǹ����� �� ���� ���̴�. stat ���� ó�� �ʿ� -- 2016�� 3��22�� ���� 28,817��

-- DM_List_Sent�� �ߺ��� �ּӷ� �� �ִ��� Ȯ�� -- max(stat) �� -1 �� �ƴѰ� ���̸� �ݼ�ó��
select address , count(*) , max(stat) from DM_List_Sent
group by address
having count(*) > 1
order by max(stat) desc

select * from DM_List_Sent where update_DT >'2015-10-26' and stat = -1 



--�߰��� ���� �Դ�.. ������ ó�� �Ǿ���
select  * from dm_list_sent  where update_DT > '2015-10-19' and stat = -1 order by name   
select  * from dm_list_sent  where wDate > '2015-03-15' and wDate < '2015-07-28'  and stat = -1 and  update_dt > '2015-08-24'  and stat = -1 order by update_DT desc 

select count(*) from dm_list_sent where stat = -1 and wDate > '2015-07-28' --xxx �� -- ���� �ݼ�ó���� ���� ����(�ߺ� �����̴�..�뷫 600�� ����)

-- ���� ���� ��¥�� ��� ���´��� Ȯ���� ����
select  * from dm_list_sent  where wDate > '2015-10-26' and stat <> -1 -- �Ѵ� �� 8�� 24�� ���� 1,418 ������   �ݼ� 77��... ��ȣ�ϱ�....
select  * from dm_list_sent  where update_DT > '2015-08-24' and stat <> -1


-- ���α׷��� ���� �ּҷ��� ��������.
-- ���� �Ǿ��ٸ� �����͸� Ȯ���Ѵ�.

--1. ���� dm_list_temp ���̺��� ������ Ȯ�� �Ѵ�.
select count(*) from dm_list_temp with(nolock) -- ���� ���� ���� ������ ����Ÿ�� 196,693�� ���� �����۾��� ����

select * from  dm_list_temp with(nolock) order by address

-- ���� �ּ� �� 4�ڸ� �ּҴ� 2�ڸ� �ּҷ� ������Ʈ
update  dm_list_temp 
	set 
	 address = case 
							when left(address,4) ='���ϵ�' then replace(address, '���ϵ�','���')
							when left(address,4) ='��󳲵�' then replace(address, '��󳲵�','�泲')
							when left(address,4) ='����ϵ�' then replace(address, '����ϵ�','����')
							when left(address,4) ='���󳲵�' then replace(address, '���󳲵�','����')
							when left(address,4) ='��û�ϵ�' then replace(address, '��û�ϵ�','���')
							when left(address,4) ='��û����' then replace(address, '��û����','�泲')

							when left(address,3) ='��⵵' then replace(address, '��⵵','���')
							when left(address,3) ='������' then replace(address, '������','����')
							when left(address,5) ='�λ걤����' then replace(address, '�λ걤����','�λ�')
							when left(address,5) ='����Ư����' then replace(address, '����Ư����','����')
							when left(address,5) ='��õ������' then replace(address, '��õ������','��õ')
							when left(address,5) ='��걤����' then replace(address, '��걤����','���')
							when left(address,5) ='���ֱ�����' then replace(address, '���ֱ�����','����')
							when left(address,5) ='�뱸������' then replace(address, '�뱸������','�뱸')
							when left(address,5) ='����������' then replace(address, '����������','����')
							when left(address,7) ='����Ư����ġ��' then replace(address, '����Ư����ġ��','����')
							when left(address,7) ='����Ư����ġ��' then replace(address, '����Ư����ġ��','����')
					
							else address
						end 

-- ���θ� �ּҵ�  4�ڸ� �ּҴ� 2�ڸ� �ּҷ� ������Ʈ
update  dm_list_temp 
	set 
	 roadAddress = case 
							when left(roadAddress,4) ='���ϵ�' then replace(roadAddress, '���ϵ�','���')
							when left(roadAddress,4) ='��󳲵�' then replace(roadAddress, '��󳲵�','�泲')
							when left(roadAddress,4) ='����ϵ�' then replace(roadAddress, '����ϵ�','����')
							when left(roadAddress,4) ='���󳲵�' then replace(roadAddress, '���󳲵�','����')
							when left(roadAddress,4) ='��û�ϵ�' then replace(roadAddress, '��û�ϵ�','���')
							when left(roadAddress,4) ='��û����' then replace(roadAddress, '��û����','�泲')

							when left(roadAddress,3) ='��⵵' then replace(roadAddress, '��⵵','���')
							when left(roadAddress,3) ='������' then replace(roadAddress, '������','����')
							when left(roadAddress,5) ='�λ걤����' then replace(roadAddress, '�λ걤����','�λ�')
							when left(roadAddress,5) ='����Ư����' then replace(roadAddress, '����Ư����','����')
							when left(roadAddress,5) ='��õ������' then replace(roadAddress, '��õ������','��õ')
							when left(roadAddress,5) ='��걤����' then replace(roadAddress, '��걤����','���')
							when left(roadAddress,5) ='���ֱ�����' then replace(roadAddress, '���ֱ�����','����')
							when left(roadAddress,5) ='�뱸������' then replace(roadAddress, '�뱸������','�뱸')
							when left(roadAddress,5) ='����������' then replace(roadAddress, '����������','����')
							when left(roadAddress,7) ='����Ư����ġ��' then replace(roadAddress, '����Ư����ġ��','����')
							when left(roadAddress,7) ='����Ư����ġ��' then replace(roadAddress, '����Ư����ġ��','����')
					
							else address
						end 

-- Ȥ�ó� ��ȯ �ȵȰ� �ִ��� Ȯ��
select * from dm_List_temp -- dm_List_temp
where address like '%���ϵ�%' or address like '%��󳲵�%' or address like '%����ϵ�%' or address like '%���󳲵�%' or address like '%��û�ϵ�%' or address like '%��û����%' or address like '%��⵵%'
or address like '%������%' or address like '%�λ걤����%' or address like '%����Ư����%' or address like '%��õ������%' or address like '%��걤����%' or address like '%���ֱ�����%' or address like '%�뱸������%'
or address like '%����������%' or address like '%����Ư����ġ��%' or address like '%����Ư����ġ��%' 
order by name desc

select * from dm_List_sent -- dm_List_sent 
where (address like '%���ϵ�%' or address like '%��󳲵�%' or address like '%����ϵ�%' or address like '%���󳲵�%' or address like '%��û�ϵ�%' or address like '%��û����%' or address like '%��⵵%'
or address like '%������%' or address like '%�λ걤����%' or address like '%����Ư����%' or address like '%��õ������%' or address like '%��걤����%' or address like '%���ֱ�����%' or address like '%�뱸������%'
or address like '%����������%' or address like '%����Ư����ġ��%' or address like '%����Ư����ġ��%' ) and stat  <> -1

-- �ּ� ���°� �ƴѰ͵� ��󳻼� �����
begin tran
delete dm_List_temp
where address not like '%���%' and address not like '%�泲%' and address not like '%����%' and address not like '%����%' and address not like '%���%' and address not like '%�泲%' 
and address not like '%���%' and address not like '%����%' and address not like '%�λ�%' and address not like '%����%' and address not like '%��õ%' and address not like '%���%' 
and address not like '%����%' and address not like '%�뱸%' and address not like '%����%' and address not like '%����%' and address not like '%����%'
commit tran



--�ߺ� ������ Ȯ�� 

--/////////////////////////////////////////////////////////////////////////////////////////////////////////
--/////////////////////////////////////////////////////////////////////////////////////////////////////////
--/////////////////////////////////////////////////////////////////////////////////////////////////////////

-- ������ ������....
-- temp �� ���ù��� �ּ� �߿� 

--1. ���� ���� ���� �̻��� �̸�, �̻��� ī�װ�,������ ���°��� �����ϰ� ���۶� �����Ǵ� �͵鸸 Select �Ͽ� ��ŷ���̺� ���� �����.  -- �ߺ������� 27,067  -- �ߺ� �Ǽ�
--2. ���� ���� ���� �ߺ��� ���� �����Ѵ�.

--3. �ݼ� �ּҷϿ� �ִ� ���� �����Ѵ�..
--4. �ŷ�ó �ּҷ��� �����Ѵ�
--5. ���ݱ��� �� �ѹ��� ������ ���� �ź� �ּҷ��� ���� �����Ѵ�. (5�� - ��������ũ)
--6. ���ݱ��� ������ �ִ� �� ��(5�� - ��������ũ) �õ����� �з��ؼ� 2õ���� ä���.
--/////////////////////////////////////////////////////////////////////////////////////////////////////////
--/////////////////////////////////////////////////////////////////////////////////////////////////////////
--/////////////////////////////////////////////////////////////////////////////////////////////////////////
--/////////////////////////////////////////////////////////////////////////////////////////////////////////
--/////////////////////////////////////////////////////////////////////////////////////////////////////////


-- *ī�װ�1 Ȯ�� --(���ο� ���� ������ ���� �Ǵ� ���� ���ƾ� �ҰͿ�  �߰��ϰ� �����.)
select max(name),cateName1 from DM_List_Temp
where 
cateName1  not in ('����,�','����','�����', '������Ʈ','�����μӽü�','��Ȱ��ǰ��','���۸���','��ǰ','��ǰ�Ǹ�','�ްԼ�','��Ȱ,����','����,����','����/����','�ܵ�','�����������')
and -- ���� ���ƾ� �Ұ�
cateName1 not in ('�ü�,�ǹ�','�ܵ�,����Ʈ','����������','����,���','���,����','�������','����,����,����','������','����,�׸�','����','ġ��','�ӽ�,���','��Ż��������','���ö�,�Ź�','�����ü�','����','�ͱݼ�,�ð�','����,ü��','����,����','�߰�,�˼�','�ع�,�����丮','Ű��ī��,�ǳ�������','ī���','ħ��,Ŀư','���ǻ�','����','����,������','��ȭ��Ȱ','����/ü��','����','����','����/���','����/����','�η°���,���˼�','���̾�Ʈ,��','�ұ�','��,����,�Ƶ�','�ϼ�,��⹰,ȯ��','�ܹ���','Care ������,����','��Ź��','���','�п�','�ε��꼭��','��������','�����Ǹ�','����','�ǰ���ǰ�Ǹ�','�Ǽ�,����','��ȥ','����','����,���','�������μӽü�','������ü','����ü�','��������','���ǰ�Ǹ�','���Ĵ�','���','����,�ɹ��','���','�����','��ü,��ȸ','�籸','����','������','�����,��쳪','������,�߰���','����','����,�繫��ǰ','��ȭ����','�̼�,����','�̿�',
'��ȭ��','����,����','����','����,����','����','�ε��꼭��','�н�','����','����','����','��,�����̵�','�����θ���','�������','��Ź��','����,����','����','����','��Ű,����캸��','�������ü�','��������ǰ','�ƽþ�����','�ֿϵ���','�౹','���','������','�����ü�','�����','��ȭ,����','�������','�䰡,�ʶ��׽�','�����','����','���Ʊ���','����ü�','����','�Ƿ����Ǹ�','�̹߼�','�̻�','�μ�,����','���ͳ�,IT','�Ͻ�','�Ӿ�','�ڵ���','������,����Ŭ','��������','������ǰ','�������','������','����','�ְŽü�','�߰��ǰ','�߽�','�����������','����','���','ģ��','ī��','����Ǹ�','�йи��������','�м�','�н�ƮǪ��','ǻ���丮','�б�','�б��μӽü�','�н�����','�н��ü�','�п�','�ѽ�','�������','ȭ���','ȯ��','�����ü���','��ü����','���','ġŲ','���','ġŲ','�౸',' ','����,����','������','�Ź�','������������','_welfare ��ȸ,����','����,���׸���','���ű�','�ǹ�','�Ǽ���','����','����,��ȸ���','����,����','����,������','����','����,����','���/����','���̵���','������','����ü�','�����п�','������','����','���νü�','���ö�','������,����','��ȭ,����','�ǰ�,�Ƿ�','��ȭ�ü�','����,����','�ݷ�����','����','����ȸ��','����,�ǿ�','����','�ε���','����/����Ŀ��','����,��Ʃ���','��ȸ,����','���','�������','����,�������','����,���','����,�й�','������ǰ','����,���','����,�����Ͼ','����','��Ź','����Ʈ�����','���غ����','����,AS','������,��ũ���̼��п�','������,����','����','�ķ�ǰ'
,'�Ź�','�ſ�','�ſ�����','�Ȱ��','�߱�','���п�','�������θ�Ʈ','����,ȭ�����','����,���','������','����,��ȥ','������ȹ��','����,�����,���','�����н�','����','������','�����п�','�Ƿ��ü','�Ƿ�ü�','�μ��','�Ӵ�,�뿩','�ڵ�������','�ڵ�������,����','���','��Ȱ��','����,����,�������','����,�������','����������','����,�Ǹ�','���յ��Ҹ�','������','����','����,��������','����,����','����,����п�','ö�ǿ丮','û��','���Ǿ�','���,������ǰ','����п�','ī����','ī��,����Ʈ','Ŀ������������','��ǻ�����α׷���,�������񽺾�','�ý�ȸ��'
,'���','�м���ȭ','��ȸ,��ü','ȣ��','ȭ�����','ȭ��ǰ','ȸ����','���ǽü�', '������,��������','����','�����ŵ���','LPG������','����,���丮','����','�޴���','���ں�ǰ','����','�ͱݼ�,����','���,�������','ĳ�־����'
)
group by cateName1 order by cateName1

-- *���� cateName1 ����Ÿ� �����Ͽ� not in �� in���� �ٲٰ� �����... 
-- *����� ���� ���� Ȯ��
select count(*) from DM_List_Temp
where 
cateName1 in ('�ü�,�ǹ�','�ܵ�,����Ʈ','����������','����,���','���,����','�������','����,����,����','������','����,�׸�','����','ġ��','�ӽ�,���','��Ż��������','���ö�,�Ź�','�����ü�','����','�ͱݼ�,�ð�','����,ü��','����,����','�߰�,�˼�','�ع�,�����丮','Ű��ī��,�ǳ�������','ī���','ħ��,Ŀư','���ǻ�','����','����,������','��ȭ��Ȱ','����/ü��','����','����','����/���','����/����','�η°���,���˼�','���̾�Ʈ,��','�ұ�','��,����,�Ƶ�','�ϼ�,��⹰,ȯ��','�ܹ���','Care ������,����','��Ź��','���','�п�','�ε��꼭��','��������','�����Ǹ�','����','�ǰ���ǰ�Ǹ�','�Ǽ�,����','��ȥ','����','����,���','�������μӽü�','������ü','����ü�','��������','���ǰ�Ǹ�','���Ĵ�','���','����,�ɹ��','���','�����','��ü,��ȸ','�籸','����','������','�����,��쳪','������,�߰���','����','����,�繫��ǰ','��ȭ����','�̼�,����','�̿�',
'��ȭ��','����,����','����','����,����','����','�ε��꼭��','�н�','����','����','����','��,�����̵�','�����θ���','�������','��Ź��','����,����','����','����','��Ű,����캸��','�������ü�','��������ǰ','�ƽþ�����','�ֿϵ���','�౹','���','������','�����ü�','�����','��ȭ,����','�������','�䰡,�ʶ��׽�','�����','����','���Ʊ���','����ü�','����','�Ƿ����Ǹ�','�̹߼�','�̻�','�μ�,����','���ͳ�,IT','�Ͻ�','�Ӿ�','�ڵ���','������,����Ŭ','��������','������ǰ','�������','������','����','�ְŽü�','�߰��ǰ','�߽�'
,'�����������','����','���','ģ��','ī��','����Ǹ�','�йи��������','�м�','�н�ƮǪ��','ǻ���丮','�б�','�б��μӽü�','�н�����','�н��ü�','�п�','�ѽ�','�������','ȭ���','ȯ��','�����ü���','��ü����','���','ġŲ','���','ġŲ','�౸',' ','����,����','������','�Ź�','������������','_welfare ��ȸ,����','����,���׸���','���ű�','�ǹ�','�Ǽ���','����','����,��ȸ���','����,����','����,������','����','����,����','���/����','���̵���','������','����ü�','�����п�','������','����','���νü�','���ö�','������,����','��ȭ,����','�ǰ�,�Ƿ�','��ȭ�ü�','����,����','�ݷ�����','����','����ȸ��','����,�ǿ�','����','�ε���','����/����Ŀ��','����,��Ʃ���','��ȸ,����','���','�������','����,�������','����,���','����,�й�','������ǰ','����,���','����,�����Ͼ','����','��Ź','����Ʈ�����','���غ����','����,AS','������,��ũ���̼��п�','������,����','����','�ķ�ǰ'
,'�Ź�','�ſ�','�ſ�����','�Ȱ��','�߱�','���п�','�������θ�Ʈ','����,ȭ�����','����,���','������','����,��ȥ','������ȹ��','����,�����,���','�����н�','����','������','�����п�','�Ƿ��ü','�Ƿ�ü�','�μ��','�Ӵ�,�뿩','�ڵ�������','�ڵ�������,����','���','��Ȱ��','����,����,�������','����,�������','����������','����,�Ǹ�','���յ��Ҹ�','������','����','����,��������','����,����','����,����п�','ö�ǿ丮','û��','���Ǿ�','���,������ǰ','����п�','ī����','ī��,����Ʈ','Ŀ������������','��ǻ�����α׷���,�������񽺾�','�ý�ȸ��'
,'���','�м���ȭ','��ȸ,��ü','ȣ��','ȭ�����','ȭ��ǰ','ȸ����','���ǽü�', '������,��������','����','�����ŵ���','LPG������','����,���丮','����','�޴���','���ں�ǰ','����','�ͱݼ�,����','���,�������','ĳ�־����'
)

-- *���� cateName1 ����Ÿ� �����Ͽ� �״�� cateName1�� in �ΰ� Ȯ���ϰ� �����...  ��� 5,500������ ������
begin tran
delete from DM_List_Temp
where 
cateName1 in ('�ü�,�ǹ�','�ܵ�,����Ʈ','����������','����,���','���,����','�������','����,����,����','������','����,�׸�','����','ġ��','�ӽ�,���','��Ż��������','���ö�,�Ź�','�����ü�','����','�ͱݼ�,�ð�','����,ü��','����,����','�߰�,�˼�','�ع�,�����丮','Ű��ī��,�ǳ�������','ī���','ħ��,Ŀư','���ǻ�','����','����,������','��ȭ��Ȱ','����/ü��','����','����','����/���','����/����','�η°���,���˼�','���̾�Ʈ,��','�ұ�','��,����,�Ƶ�','�ϼ�,��⹰,ȯ��','�ܹ���','Care ������,����','��Ź��','���','�п�','�ε��꼭��','��������','�����Ǹ�','����','�ǰ���ǰ�Ǹ�','�Ǽ�,����','��ȥ','����','����,���','�������μӽü�','������ü','����ü�','��������','���ǰ�Ǹ�','���Ĵ�','���','����,�ɹ��','���','�����','��ü,��ȸ','�籸','����','������','�����,��쳪','������,�߰���','����','����,�繫��ǰ','��ȭ����','�̼�,����','�̿�',
'��ȭ��','����,����','����','����,����','����','�ε��꼭��','�н�','����','����','����','��,�����̵�','�����θ���','�������','��Ź��','����,����','����','����','��Ű,����캸��','�������ü�','��������ǰ','�ƽþ�����','�ֿϵ���','�౹','���','������','�����ü�','�����','��ȭ,����','�������','�䰡,�ʶ��׽�','�����','����','���Ʊ���','����ü�','����','�Ƿ����Ǹ�','�̹߼�','�̻�','�μ�,����','���ͳ�,IT','�Ͻ�','�Ӿ�','�ڵ���','������,����Ŭ','��������','������ǰ','�������','������','����','�ְŽü�','�߰��ǰ','�߽�'
,'�����������','����','���','ģ��','ī��','����Ǹ�','�йи��������','�м�','�н�ƮǪ��','ǻ���丮','�б�','�б��μӽü�','�н�����','�н��ü�','�п�','�ѽ�','�������','ȭ���','ȯ��','�����ü���','��ü����','���','ġŲ','���','ġŲ','�౸',' ','����,����','������','�Ź�','������������','_welfare ��ȸ,����','����,���׸���','���ű�','�ǹ�','�Ǽ���','����','����,��ȸ���','����,����','����,������','����','����,����','���/����','���̵���','������','����ü�','�����п�','������','����','���νü�','���ö�','������,����','��ȭ,����','�ǰ�,�Ƿ�','��ȭ�ü�','����,����','�ݷ�����','����','����ȸ��','����,�ǿ�','����','�ε���','����/����Ŀ��','����,��Ʃ���','��ȸ,����','���','�������','����,�������','����,���','����,�й�','������ǰ','����,���','����,�����Ͼ','����','��Ź','����Ʈ�����','���غ����','����,AS','������,��ũ���̼��п�','������,����','����','�ķ�ǰ'
,'�Ź�','�ſ�','�ſ�����','�Ȱ��','�߱�','���п�','�������θ�Ʈ','����,ȭ�����','����,���','������','����,��ȥ','������ȹ��','����,�����,���','�����н�','����','������','�����п�','�Ƿ��ü','�Ƿ�ü�','�μ��','�Ӵ�,�뿩','�ڵ�������','�ڵ�������,����','���','��Ȱ��','����,����,�������','����,�������','����������','����,�Ǹ�','���յ��Ҹ�','������','����','����,��������','����,����','����,����п�','ö�ǿ丮','û��','���Ǿ�','���,������ǰ','����п�','ī����','ī��,����Ʈ','Ŀ������������','��ǻ�����α׷���,�������񽺾�','�ý�ȸ��'
,'���','�м���ȭ','��ȸ,��ü','ȣ��','ȭ�����','ȭ��ǰ','ȸ����','���ǽü�', '������,��������','����','�����ŵ���','LPG������','����,���丮','����','�޴���','���ں�ǰ','����','�ͱݼ�,����','���,�������','ĳ�־����'
)
commit tran

select @@TRANCOUNT

select * from DM_List_Temp -- 118410


-- ī�װ�2 Ȯ��--(���ο� ���� ������ ���� �Ǵ� ���� ���ƾ� �ҰͿ� �߰��ϰ� �����.)
select max(name), max(cateName1),cateName2 from DM_List_Temp
where 
cateName2 not in ('������','�����ǰ','�ո�ð�','�ǳ�����','�ڵ��Ǹű�','����','���,������ǰ',
'�������������','�ѽ�','�����������','ġŲ�ŴϾ�','ġŲ,�߰���','ġŲ','����,ȣ��','xxx','��','���̾�Ʈ,������','�뷡��','�׷��帶Ʈ','���ο�ǰ','����,����,���ڷ�','','������ǰ','����','���μ���,���θ���','����,��Ʈ','���۸���','����','�ķ�ǰ','�ƿ﷿','���յ��Ҹ�','������','�¸�Ʈ','���鰡��','�����ϳ��θ�Ʈ','������������','�α��θ�Ʈ','�Ե���Ʈ','�Ե�����','�ް���Ʈ','����Ʈ��','���θ���','�ѹ̸���Ʈ','IGA��Ʈ','JOYMART','OK��Ʈ'
,'��Ÿ��24','�����������-���������','�����ǰ','�����ϳ���Ŭ��','�Ե�����999','�Ե����̸�Ʈ','��ȭ����������','����','Ŵ��Ŭ��') --����
and  -- �Ʒ��� �����
cateName2  not in ('õ��ȭ��ǰ','���ڷ���21','�̸�ƮƮ���̴���','��Ű��Ż��','�ӽ�','��ÿ�,�����','�ǰ�����','�����뿬��','�̸�Ʈ','������̼���','��ǰ÷����','����,�ڼ�','����DVD�����','������ǰ','����','��������','���κ��սü�','�����Ƿ�','��ȭ��','�巯�׽����','�뿩����','��Ʈ','�߰���','������','���������Ƽ','������','����','���񰡱�','����,���Ⱑ��','���డ��','��̰���','��Ʈ��,�캮��','��Ű��,���庹','�̿�','��,â��','�����,��쳪','���㰡��','���������̿��','����,��Ȱ��ǰ','������,����','���̾�Ʈ��ǰ','�߰���','�����н�','KFC','����,��Ʈ','�����Ǹ�','ķ�ο�ǰ','�����ȳ�','��,����','ȭ���','����,����','�̿��','����,�ɹ��','�ݷ�����','����,�ζ�','����,��Ʃ���','����','����,AS','����','�,����','�ڵ�������,����','�ǰ�,�Ƿ��ǰ', '���ű���ǰ','�ǰ�������ǰ','�Ǿ', '����,���', '��������,��ǰ','����','��ȥ����','���','������ǰ','��������','����','���б��,���','����','����,���׸���','����,�ڵ��','����','�����Ƿ�'
 ,'�ͱݼ�,�ð�','�ٹ���,�۾���','�ݰ�','����ǰ����','��,���','������','��ɼ�ȭ��ǰ','��Ÿ��������','��Ÿ����','�����Ƿ�','��������','�ó����','�����ǰ','�ް�','��','�籸��ǰ' ,'���ڱ�','�������','�巰�����','���,�ƿ�����','����ǰ','����,�����ǰ','��������','����,�ҽÿ�ǰ','��,����','�̴����Ǳ�','�̼�,����ǰ','�̿���,���','��Ѱ�','�����Ͽ�ǰ','����,����','��������','���Ϸ�','��û��','�ұ���ǰ','�繫���','�繫�밡��','��,�����̵�','��ǰ���Ǹ�','��Ȱ��ǰ','����','����,�ؿ����','����,�ޱ�','��Ź','�Ұ��','�ӿ�','�������׼�����','���깰','������ǰ','���԰���','���Խ�ǰ','�������ƿ�ǰ','�����Ƿ�','����','��Ÿŷ','��������ǰ','�������Ƿ�','�ð�','�ø�Ʈ','�ķ�ǰ�ַ�����'
 ,'�Ź�','���ڼ�','������Ʈ������','�Ǳ�','�Ȱ��','�ֿϵ���','����,ǥ��','�߱���ǰ','�縻','����','���ҿ밡��','������','�����Ƿ�','��������','������,������','����,�����','�������','��ǿ�ǰ','����,����ǰ','����,����,����','����,ȭ�ѳ��','�����깰','������,��ü��','����,�Ƶ�����','����,�Ƶ���ǰ','���Ƶ���','����','����,CD','�̺�Ʈ,��Ƽ','�̺�,���','��ȸ��ǰ','�ڵ���','�ڵ�����ǰ','�ڵ�����ƼĿ','�ڵ�����ǰ,�׼�����','�ڵ�������','������,����Ŭ','�尩','�峭��','��Ȱ��','���Ʋ,�̽�','��Ȱ�뼾Ÿ ����','����,����','���ں�ǰ','����,���͸�','����','������','����','����,���÷���','���̷�,��ŷ�','���հ���','���ջ�Ȱ��ǰ','���ջ繫��ǰ','�����м�','����,����,�¿�','�ַ�','�ֹ氡��'
 ,'�ֹ氡��','�ֹ��ǰ','�߰�,������ȯ','�߰���','������Ȱ�뼾��','��,Ŀ��','ä��','ö����','���,����,����','ħ��,Ŀư','ħ����,����','ħ��','ī������̼�,GPS','ī�����','ĳ�־����','ķ�ڴ�,ī�޶�','Ŀ�����Ǳ�','��ǻ��','��ǻ��,�����','��Ʈ','Ÿ��,����','Ź����ǰ','Ʈ����,����','Ư�깰,�����ο�ǰ','����,���ǰ','�м�','�м���ȭ','����Ʈ','�Ѻ�','�ｺ��ǰ','ȭ�嵵��','ȭ����,Ƽ��','ȭ��ǰ,���','�޴���','�޴����׼�����','CCTV','����깰','������ǰ','�������׸������','������','���׽��丮','�ǰ���','�����߰���','��������','���ǰ����','�ɹ�޲ɳ��','���̼�','����','�����','������','�̴Ͻ���','���̴�����','������','�μӽü�','�귣�彺����','�귣��Ź߸���','�귣���Ƿ�����'
 ,'����DVD�뿩','������','�Ｚ������������','�����Ϸ���','�Ʊ��Ƿ�����','���Ĺ���','�ְ߹̿�','�����','����/����','���ȭ��','����','�Ƿ����Ǹ�','�Ƿ��Ź߸���','�Ƿ�������','�̸�Ʈ���긮����','�̻�����Ÿ','���׸������','�����Ŵ븮��','������ǰ','������ǰAS','������','���ջ�','��������','������','�������쳪','��º�������','���Ư�깰 ����','��ű��','������Ʈ','��','ȭ��ǰ','CU','GS25','GS��Ʈ','KT�븮��','LG����Ʈ��','LGU+�븮��','PC��'
 ,'SK�븮��','SKT�븮��','�ݸŸ�','���뺹','���ڽ�','��ƽ����','�����ǰ','�����','���','û�ҿ�ǰ','�Ǻι̿�','���̸�Ʈ','���Ǽ�����','Ȩ�÷����ͽ�������','��������','����','��ī�޶�','����','�Ӻκ�','�౸��ǰ','����,����,����','CJ�ø��꿵'
 ,'������,Ż����','�����ÿ�ǰ','����','����������ǰ','ħ��������','�ڽ���Ȧ����','Ȩ�÷���'
 )
group by cateName2 order by cateName2

-- ���� cateName2 ����Ÿ� �����Ͽ� not in �� in���� �ٲٰ� �����...  -- �뷫 7,500�� ���� ���� ��
delete from DM_List_Temp
where 
cateName2  in ('������','�����ǰ','�ո�ð�','�ǳ�����','�ڵ��Ǹű�','����','���,������ǰ',
'õ��ȭ��ǰ','���ڷ���21','�̸�ƮƮ���̴���','��Ű��Ż��','�ӽ�','��ÿ�,�����','�ǰ�����','�����뿬��','�̸�Ʈ','������̼���','��ǰ÷����','����,�ڼ�','����DVD�����','������ǰ','����','��������','���κ��սü�','�����Ƿ�','��ȭ��','�巯�׽����','�뿩����','��Ʈ','�߰���','������','���������Ƽ','������','����','���񰡱�','����,���Ⱑ��','���డ��','��̰���','��Ʈ��,�캮��','��Ű��,���庹','�̿�','��,â��','�����,��쳪','���㰡��','���������̿��','����,��Ȱ��ǰ','������,����','���̾�Ʈ��ǰ','�߰���','�����н�','KFC','����,��Ʈ','�����Ǹ�','ķ�ο�ǰ','�����ȳ�','��,����','ȭ���','����,����','�̿��','����,�ɹ��','�ݷ�����','����,�ζ�','����,��Ʃ���','����','����,AS','����','�,����','�ڵ�������,����','�ǰ�,�Ƿ��ǰ', '���ű���ǰ','�ǰ�������ǰ','�Ǿ', '����,���', '��������,��ǰ','����','��ȥ����','���','������ǰ','��������','����','���б��,���','����','����,���׸���','����,�ڵ��','����','�����Ƿ�'
 ,'�ͱݼ�,�ð�','�ٹ���,�۾���','�ݰ�','����ǰ����','��,���','������','��ɼ�ȭ��ǰ','��Ÿ��������','��Ÿ����','�����Ƿ�','��������','�ó����','�����ǰ','�ް�','��','�籸��ǰ' ,'���ڱ�','�������','�巰�����','���,�ƿ�����','����ǰ','����,�����ǰ','��������','����,�ҽÿ�ǰ','��,����','�̴����Ǳ�','�̼�,����ǰ','�̿���,���','��Ѱ�','�����Ͽ�ǰ','����,����','��������','���Ϸ�','��û��','�ұ���ǰ','�繫���','�繫�밡��','��,�����̵�','��ǰ���Ǹ�','��Ȱ��ǰ','����','����,�ؿ����','����,�ޱ�','��Ź','�Ұ��','�ӿ�','�������׼�����','���깰','������ǰ','���԰���','���Խ�ǰ','�������ƿ�ǰ','�����Ƿ�','����','��Ÿŷ','��������ǰ','�������Ƿ�','�ð�','�ø�Ʈ','�ķ�ǰ�ַ�����'
 ,'�Ź�','���ڼ�','������Ʈ������','�Ǳ�','�Ȱ��','�ֿϵ���','����,ǥ��','�߱���ǰ','�縻','����','���ҿ밡��','������','�����Ƿ�','��������','������,������','����,�����','�������','��ǿ�ǰ','����,����ǰ','����,����,����','����,ȭ�ѳ��','�����깰','������,��ü��','����,�Ƶ�����','����,�Ƶ���ǰ','���Ƶ���','����','����,CD','�̺�Ʈ,��Ƽ','�̺�,���','��ȸ��ǰ','�ڵ���','�ڵ�����ǰ','�ڵ�����ƼĿ','�ڵ�����ǰ,�׼�����','�ڵ�������','������,����Ŭ','�尩','�峭��','��Ȱ��','���Ʋ,�̽�','��Ȱ�뼾Ÿ ����','����,����','���ں�ǰ','����,���͸�','����','������','����','����,���÷���','���̷�,��ŷ�','���հ���','���ջ�Ȱ��ǰ','���ջ繫��ǰ','�����м�','����,����,�¿�','�ַ�','�ֹ氡��'
 ,'�ֹ氡��','�ֹ��ǰ','�߰�,������ȯ','�߰���','������Ȱ�뼾��','��,Ŀ��','ä��','ö����','���,����,����','ħ��,Ŀư','ħ����,����','ħ��','ī������̼�,GPS','ī�����','ĳ�־����','ķ�ڴ�,ī�޶�','Ŀ�����Ǳ�','��ǻ��','��ǻ��,�����','��Ʈ','Ÿ��,����','Ź����ǰ','Ʈ����,����','Ư�깰,�����ο�ǰ','����,���ǰ','�м�','�м���ȭ','����Ʈ','�Ѻ�','�ｺ��ǰ','ȭ�嵵��','ȭ����,Ƽ��','ȭ��ǰ,���','�޴���','�޴����׼�����','CCTV','����깰','������ǰ','�������׸������','������','���׽��丮','�ǰ���','�����߰���','��������','���ǰ����','�ɹ�޲ɳ��','���̼�','����','�����','������','�̴Ͻ���','���̴�����','������','�μӽü�','�귣�彺����','�귣��Ź߸���','�귣���Ƿ�����'
 ,'����DVD�뿩','������','�Ｚ������������','�����Ϸ���','�Ʊ��Ƿ�����','���Ĺ���','�ְ߹̿�','�����','����/����','���ȭ��','����','�Ƿ����Ǹ�','�Ƿ��Ź߸���','�Ƿ�������','�̸�Ʈ���긮����','�̻�����Ÿ','���׸������','�����Ŵ븮��','������ǰ','������ǰAS','������','���ջ�','��������','������','�������쳪','��º�������','���Ư�깰 ����','��ű��','������Ʈ','��','ȭ��ǰ','CU','GS25','GS��Ʈ','KT�븮��','LG����Ʈ��','LGU+�븮��','PC��'
 ,'SK�븮��','SKT�븮��','�ݸŸ�','���뺹','���ڽ�','��ƽ����','�����ǰ','�����','���','û�ҿ�ǰ','�Ǻι̿�','���̸�Ʈ','���Ǽ�����','Ȩ�÷����ͽ�������','��������','����','��ī�޶�','����','�Ӻκ�','�౸��ǰ','����,����,����','CJ�ø��꿵'
 ,'������,Ż����','�����ÿ�ǰ','����','����������ǰ','ħ��������','�ڽ���Ȧ����','Ȩ�÷���'
 )
select @@TRANCOUNT

select count(*) from DM_List_Temp  -- 183,659



-- �̸� �߿� �̻��� �͵� �����ϰ� Ȯ�� -- 12,709 ����
delete from DM_List_Temp 
where 
--010-2915-8450 ������Ʈ��� ������ �ٽô� ������ ������... �ٵ� ����������� ��.. ���߿� ��ȭ�ؼ� �̳� 1�� ����� �ɵ�
name like '%����%' or 
name like '%����%' or name like '%���̿ð�%'or name like '%Ȧ����%' or name like '%�Ȱ�%' or name like '%����%' or name like '%����%' or name  like '%����%' or name like '%���̼�%' or name like '%����%' or name like '%����%' or name like '%���%' or name like '%��������%' or name like '%����%' or name like '%�뵿%' or name like '%��ǰ%' or name like '%������%' or name like '%���%' or name like '%����%' or name like '%������%' or name like '%ȭ��%' or name like '%����%' or name like '%Ű�����%' or name like '%�ڿ��帲%' or name like '%����%' or name like '%����������%' or name like '%�ƿ�%' or name like '%����Ǫ��%' or name like '%����Ʈ����%' or name like '%���%' or name like '%�߱�%' or name like '%����ȭ%' or name like '%�����÷���%' or name like '%����%' or name like '%����������%' or name like '%������%' or name like '%��������%' or name like '%Ȩ����%' or name like '%��ȭ����%' or name like '%����%' or name like '%��%' or name like '%ȫ��%' or name like '%Ŀ��%' or name like '%�߰�%' or name like '%����%' or name like '%����%' or name like '%����%' or name like '%ö��%' or name like 'cu%'
or name like '%cu%'or name like '%����%'or name like '%����������%'or name like 'cu%' or name like '%gs%'or name like '%Ȩ�÷���%'or name like '�̸�Ʈ%'or name like '%�����Ϸ���%'or name like '���� �Ϸ���%'
or name like '�̴Ͻ���%'or name like '%������%'or name like '%ȣ��%'or name like '%ġŲ%'or name like '%Ȱ��ȸ%'or name like '%Ƚ��%'or name like '%ABC%'or name like '%�ǿ�%'or name like '%�ѿ�%'
or name like '%�ε���%'or name like '%��Ż%'or name like '%����Ʈ%'or name like '%�ι�%'or name like '%����ȭ��%'or name like '%����%'or name like '%�Ĵ�%'or name like '%�δ��%'or name like '%�н�%'
or name like '%����%' or name like '%�̿븶Ʈ%' or name like '%Ŀư%' or name like '%����%' or name like '%����%' or name like '%��ũ��%' or name like '%���Ǵ�%' or name like '%�ٹ���%' or name like '%����%' or name like '%�̺�%'
or name like '%����%' or name like '%��õ��%' or name like '%����%' or name like '%�ֹ�%' or name like '%ȯ��%' or name like '%���͸�%' or name like '%Ŀ��%' or name like '%������%' or name like '%�г�%' or name like '%Űģ%'
or name like '%�ƿ﷿%' or name like '%Ű��Ʈ%' or name like '%���̽�%' or name like '%�޴���%' or name like '%ħ��%' or name like '%����%' or name like '%����%' or name like '%����%'
or name like '%����%' or name like '%õ��%' or name like '%õ��%' or name like '%����%' or name like '%��Ȱ��ǰ%' or name like '%�׸�%' or name like '%������%' or name like '%�������%' or name like '%����%' or name like '%����%' or name like '%����%' or name like '%���%' or name like '%�絷%' or name like '%�繫%'or name like '%��Ȱ��%'or name like '%��Ʈ��%'or name like '%��ȣ��%'
or name like '%���̽�ũ��%' or name like '%�ý�%' or name like '%����%' or name like '%��ũ��%' or name like '%����%' or name like '%�鼼%'
or name like '%foreign mart%' or name like '%KK��Ʈ%' or name like '%�ǰ�%'or name like '%ũ������%'or name like '%�⵶%'or name like '%�Ƿ�%'or name like '%���̿�%'



-- �ּ��� ���� ������ ���� ���� ����  -- 107,517  ���� ���⼭ ���� ������
delete DM_List_Temp
where  address like '%��' or address like '%��' or address like '%��' or address like '%��'  or address like '%������' or address like '%�Ա�' 
or address like '%����' or address like '%����' or address like '%����' or address like '%�ϱ�'
or address like '%1��' or address like '%2��' or address like '%3��' or address like '%4��' or address like '%5��' or address like '%6��' or address like '%7��' or address like '%8��' or address like '%9��' 


select @@TRANCOUNT

select count(*) from DM_List_Temp  -- 61,549

-- �ߺ��Ȱ� �ִ��� Ȯ�� -- ��û ���� ���´�.
SELECT min(idx) as idx , address, count(*) AS cnt FROM DM_List_Temp  with(nolock) 
	GROUP BY address HAVING count(*) > 1   
	order by cnt

SELECT min(idx) as idx , roadAddress, count(*) AS cnt FROM DM_List_Temp  with(nolock) 
	where roadAddress  <> '' -- is not null
	GROUP BY roadAddress HAVING count(*) > 1   
	order by cnt



-- �ߺ� ������ ���� �� �ּ�-- 39,523�� ����
begin tran
	delete from DM_List_Temp
	where idx in (
	select a.idx as idx
	from DM_List_Temp a join ( SELECT min(idx) as idx , address, count(*) AS cnt FROM DM_List_Temp GROUP BY address HAVING count(*) > 1) b
	on a.address = b.address and a.idx <> b.idx);  

commit tran

select @@TRANCOUNT

-- �ߺ� ������ ���� ���θ� �ּ�-- 124�� ����
begin tran
	delete from DM_List_Temp
	where idx in (
	select a.idx as idx
	from DM_List_Temp a join ( SELECT min(idx) as idx , roadAddress, count(*) AS cnt FROM DM_List_Temp where roadAddress <> '' GROUP BY roadAddress HAVING count(*) > 1) b
	on a.roadAddress = b.roadAddress and a.idx <> b.idx);  

commit tran


select @@TRANCOUNT


--  ���� �ߺ� ������ �ߴٸ�.. �ߺ� ����Ÿ�� �ִ��� �ѹ� �� Ȯ��
select isnull(sum(a.cnt),0)
from
	(
	SELECT min(idx) as idx , address, count(*) AS cnt FROM DM_List_Temp  with(nolock) 
	GROUP BY address HAVING count(*) > 1   --  �ּ� ���� �ߺ� ������ 0��
	) a

--���θ��ּ� �ߺ� Ȯ��
select isnull(sum(a.cnt),0)
from
	(
	SELECT min(idx) as idx , roadAddress, count(*) AS cnt FROM DM_List_Temp  with(nolock)  where roadAddress <> ''
	GROUP BY roadAddress HAVING count(*) > 1   --  �ּ� ���� �ߺ� ������ 0��
	) a

-- 0. ���� ���� �ּӷ��ε� ���� ���� �ּҷ��� �ּ� �� �� �ּҿ� ���� ���� �� �ּҰ� ���� ����Ÿ�� ����.
select a.name as Aname, a.address as Aaddress, b.address as xxx  from dm_list_temp a join dm_list_sent b on a.address = b.address where b.address <> '' -- 9427
begin tran
	delete from DM_List_Temp where address in (	 SELECT  address from DM_List_Sent where address <> '' )	

commit tran
select @@TRANCOUNT


-- 1. ���� ���� �ּӷ��ε� ���� ���� �ּҷ��� �ּ� �� ���θ� �ּҿ� ���� ���� ���θ� �ּҰ� ���� ����Ÿ�� ����.
begin tran
	delete from DM_List_Temp where roadAddress in (	 SELECT  roadAddress from DM_List_Sent where roadAddress <> '' )	
commit tran

-- 2. ���ι��� �ּҷ��ε� ���� �ּҷ��� �ּ� �� ���θ� �ּҿ� ���� ���� ���� �ּҰ� ���� ����Ÿ�� ����.
begin tran
	delete from DM_List_Temp where Address in (	 SELECT  roadAddress from DM_List_Sent where roadAddress <> '' )	
commit tran
-- 3. ���ι��� �ּҷ��ε� ���� �ּҷ��� �ּ� �� ���� �ּҿ� ���� ���� ���θ� �ּҰ� ���� ����Ÿ�� ����.
begin tran
	delete from DM_List_Temp where roadAddress in (	 SELECT  Address from DM_List_Sent )	
commit tran


--a. ���� �ּҷ��� ��ȭ��ȣ �� ���� ���� ��ȭ��ȣ�� ���� ����Ÿ�� ����
begin tran
	delete from DM_List_Temp where tel in ( select tel from dm_list_sent  where tel <> '' or tel is not null) -- 142
commit tran


--b. �ݼ۵� �ּҷ��� ���⼭ ��������
select a.name, a.address, a.tel, b.idx, b.tel, b.name, b.address from dm_list_sent a join DM_List_Temp b on a.tel = b.tel
where a.stat =-1  and a.tel <> ''
order by a.address -- ���� Ȯ���ϰ�




--���� �ּҷ� �� �ߺ��� �ִ��� Ȯ��

-- �����ε� ��¥ �����ΰ� �������� �ɷ����� ��������
select * from dm_list_temp where name not like '%�ϳ���%' and name  like '%����%'

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
select * from dm_list_temp -- ������ Ȯ�� -- 833��

select * from dm_list_temp where name like '%�ϳ���%' -- ������ Ȯ��
-- ������ Ȯ��


-- ���ι��� �ּ�
select * from DM_List_Temp  --7427��

select localName, count(*) from dm_List_temp with(nolock)
group by localName

-- 2018.05.01 ���� ������... ������ �߿��� �ѱ����� �����...����� ����� ����  ���� ���̴�.

drop table DM_List_Temp_20180502
select * into DM_List_Temp_20180502 from DM_List_Temp 

-- 7427�� ���



--���ι��� �ּҸ� mart_��¥ ���̺�� ����
drop table mart_20180502
--���ο� ���̺� ����Ÿ�� ������ ���� --
select idx,name, tel, address, roadAddress, cateName1, cateName2, wDate
	into mart_20180502 
from DM_List_Temp 	where localName not like '%������%'
	order by address DESC	
	
	
--

-- �ϳ��δ� 500���� �����.
select * from mart_20180502 where name like '%�ϳ���%' order by address  -- (select 500-209  = 291�� ����)
select 500 - 209

--1. �ϳ��� ���� �ְ� -- 2,000���� �ȵɰ��
insert into chicken_20161018 ( name, tel, [address], roadAddress, wDate) 
	select top 291  name, tel, [address], roadAddress, getdate()  from DM_List_Sent 
	where stat <> -1  and address not like '%����%' and name like '%�ϳ���%'
	order by update_DT,address, name



select * from mart_20160903 where name not like '%�ϳ���%' order by address  -- (select 1500-624  = 876 �� ����)

--2. �������� ��Ʈ�� �ִ´�.
insert into chicken_20161018 ( name, tel, [address], roadAddress, wDate) 
	select top 1000  name, tel, [address], roadAddress,  getdate()   from DM_List_Sent 
	where stat <> -1  and address not like '%����%'  and name not like '%�ϳ���%'
	order by update_DT,address, name
	
		

--���� mart_��¥ ���̺� ����
select * from mart_20180502 order by wDate

-- Ȥ�ó� �ߺ� ����Ÿ�� �ִ��� Ȯ�� ����� ��.
SELECT min(idx) as idx , address, count(*) AS cnt FROM mart_20180502  with(nolock) 
	GROUP BY address HAVING count(*) > 1   --  �ּ� ���� �ߺ� ������ 0��


--���ο� �ּҰ� 2õ���� �ȵǾ� ���� �ּҷϿ��� ���� �Դٸ�...
select count(*) from  DM_List_Sent a join mart_20180502 b on a.address = b.address -- ���� �ּҷ� Loop ���� 


-- ���ڶ� ����ġ�� �� �ּҷ��� ���� ���̺��� update_DT �� ����  mart_20160322  ���̺�� Ȯ�� (�߿�)

begin tran
	update DM_List_Sent 
	set update_DT = getdate()
	from DM_List_Sent a join mart_20160322 b on a.address = b.address

commit tran

select @@TRANCOUNT




-- ����Ÿ�� �ٽ� ����.
select count(*) from mart_20180502 -- 2,000��
select *  from mart_20180502  order by wDate -- �����ּ�, ���θ� �ּҰ� ����, ���, �泲�� ���� �� �ڸ��� �ٲ�� �Ѵ�.
select * from mart_20180502  where name like '%�ϳ���%' -- �ϳ��δ� �츮�� ����


--mart_��¥ ���̺�
select * from mart_20180502 a join dm_list_sent b on a.address = b.address where a.address <> '' and a.cateName1 is not null  -- �ű� ���� ������ �ּҰ� ���� �ּҿ� ���ٸ� ���� �̻�.
select * from mart_20180502 a join dm_list_sent b on a.roadAddress = b.address where a.address <> '' and a.cateName1 is not null  -- �ű� ���� ������ �ּҰ� ���� �ּҿ� ���ٸ� ���� �̻�.
select * from mart_20180502 a join dm_list_sent b on a.address = b.roadAddress where a.address <> '' and a.cateName1 is not null  -- �ű� ���� ������ �ּҰ� ���� �ּҿ� ���ٸ� ���� �̻�.
--���� �ּҷϿ� �ְ� �ּҰ� ���� ���̵� ������. (��¥ ���̺��� delete �� select 2�� ��)
begin tran
	delete from mart_20180502
	where idx in (select a.idx from mart_20180502 a join dm_list_sent b on a.address = b.address where a.address <> '' and a.cateName1 is not null)
commit tran

begin tran
	delete from mart_20180502
	where idx in (select a.idx from mart_20180502 a join dm_list_sent b on a.roadAddress = b.address where a.address <> '' and a.cateName1 is not null)
commit tran

select @@TRANCOUNT


select * ,b.update_DT from mart_20180502 a join dm_list_sent b on a.tel = b.tel where a.tel <> ''  and a.cateName1 is not null -- �ű� ���� ������ ������ ���� ������ ���ٸ� ���� �̻�.

--���� �ּҷϿ� �ְ� ��ȭ��ȣ�� ���� ���̵� ������ (���� ���̺��� 2����)
begin tran
	delete from mart_20180502
	where idx in (select a.idx from mart_20180502 a join dm_list_sent b on a.tel = b.tel where a.tel <> '' and a.cateName1 is not null)
commit tran

select @@TRANCOUNT




select * from DM_List_Temp_Working
select * from mart_20180502  
drop table DM_List_Temp_Working -- �����͸� �����... ���� ����� ��鸸 ���� ����(������ ��ȣ�� �����ȣ ������ ����)

select * into DM_List_Temp_Working from mart_20180502  -- ������ insert




select * from DM_List_Temp_Working  -- UVW_DM_LIST_MART ���� DM_List_Temp_Working �� �����Ͽ� tempZip_Mart �� �����ȣ�� �Բ� �ִ´�.



select * from tempZip_Mart -- ������ ����� ����
drop table tempZip_Mart;

sp_helptext UVW_DM_LIST_MART

sp_helptext FN_GetzipCodeFromAddr

select * into tempZip_Mart from UVW_DM_LIST_MART 



select * from tempZip_Mart


SELECT  count(*)  FROM     tempZip_Mart
WHERE  (zipCode IS NULL) -- 0 �� �ɶ� ���� ����.. ���� -- 2���� �߿� 8,132���� �����ȣ�� ����... ���θ����� �н�

*************************************************
******************tempZip_Mart �� idx (identity) �� �־��ش�.
*************************************************
--*1��°****************************************************************************************************************
SELECT *  FROM     tempZip_Mart
WHERE  (zipCode IS NULL) -- 0 �� �ɶ� ���� ����
--*****************************************************************************************************************

-- [1��° �̰� ������ �д籸 ó�� ������� �׸��� 5�ڸ� �����ȣ] - ����
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
	--Ŀ�� ���� ��		

set nocount off
-- [1��° �̰� ������ �д籸 ó�� ������� �׸��� 5�ڸ� �����ȣ] - ��

--*4��°****************************************************************************************************************
SELECT *  FROM     tempZip_Mart
WHERE  (zipCode IS NULL) -- 0 �� �ɶ� ���� ����
--*****************************************************************************************************************

-- [2��° �̰� ������ �д籸 ���� �Ϲ� ���ÿ��� ��ȣã��׸��� 5�ڸ� �����ȣ] - ����
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
	--Ŀ�� ���� ��		

set nocount off
-- [2��° �̰� ������ �д籸 ó�� ������� �׸��� 5�ڸ� �����ȣ] - ��
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------





-- 3��° Ȥ�ó� �� �ּҿ� �ֳ� Ȯ��  8.1232 �� Ŀ�� ���� Ȯ���ϴµ� �ɸ��ð� (============2�� 30��)
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
	--Ŀ�� ���� ��		

set nocount off
-- Ȥ�ó� ���θ� �ּҿ� �ֳ� Ȯ�� ��
--*****************************************************************************************************************
SELECT *  FROM     tempZip_Mart
WHERE  (zipCode IS NULL) -- 0 �� �ɶ� ���� ����
--*****************************************************************************************************************

-- Ȥ�ó� ���θ� �ּҿ� �ֳ� Ȯ��  [4��° �̰� roadName�̾ƴ϶� ri �� �˻�]
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
	--Ŀ�� ���� ��		

set nocount off
-- Ȥ�ó� ���θ� �ּҿ� �ֳ� [4��°] Ȯ�� ��


SELECT  *  FROM     tempZip_Mart
WHERE  (zipCode IS NULL) -- 0 �� �ɶ� ���� ����.. 



select @@TRANCOUNT



-- ������ �� �������
begin tran
	delete tempZip_Mart WHERE  (zipCode IS NULL) 

commit tran
select @@TRANCOUNT



-- ��ǰ ���� �ش�.(����)
select a.name, a.address, a.tel, b.idx, b.tel, b.name, b.address from dm_list_sent a join tempZip_Mart b on a.tel = b.tel
where a.stat =-1  and a.tel <> ''
order by a.address -- ���� Ȯ���ϰ�


-- �����(��ǰ- ����)
begin tran 
	delete tempZip_Mart
	from dm_list_sent a join tempZip_Mart b on a.tel = b.tel -- null �� �񱳰� �ȵǾ�.��ȭ��ȣ �ѹ�, �ּҷ� �ѹ���
	where stat =-1   and a.tel <> ''

commit tran
select @@TRANCOUNT

-- ��ǰ ���� �ش�.(�ּ�)
select a.name, a.address, a.tel, b.idx, b.tel, b.name, b.address from dm_list_sent a join tempZip_Mart b on a.address = b.address -- null �� �񱳰� �ȵǾ�.��ȭ��ȣ �ѹ�, �ּҷ� �ѹ���
where stat =-1  
order by a.address -- ���� Ȯ���ϰ�

-- �����.(��ǰ - �ּ�)
begin tran 
	delete tempZip_Mart
	from dm_list_sent a join tempZip_Mart b on a.address = b.address -- null �� �񱳰� �ȵǾ�.��ȭ��ȣ �ѹ�, �ּҷ� �ѹ���
	where stat =-1 
commit tran



--================================
-- �̹��� ���� �ּҷ�
--================================
select count(*) from tempZip_Mart;
select * from tempZip_Mart

-- 2,000�� �̻��� ��� ������ �����. -- ������ �� �ȵ�
--delete tempZip_Mart
select * from tempZip_Mart -- Ȯ�� �� �ּ�., delete �� ����
where 
address like '���� ������%' or address like '���� ���ؽ�%' or address like '���� ���ʽ�%' or address like '���� ��ô��%' or address like '���� ��õ��%'
or address like '���� ö����%' or address like '���� Ⱦ����%' or address like '���� ��â��%' or address like '���� �¹��%' or address like '���� ������%'
or address like '���� ��籺%' or address like '���� ����%' or address like '���� ������%' or address like '���� ȫõ��%' or address like '���� ������%'
or address like '���� �籸��%' or address like '���� ȭõ��%'  --or address like '����%'  



--����� �����ʹ� DM �߼� ����Ʈ�� ���� ��¥�� �ؼ� �־� �ش�.(���� ������ ��¥ ������Ʈ ������ ���� �ذŸ� �־� �ָ� �ȴ�.)
insert dm_List_sent(name, tel, zipCode, address,roadAddress, stat, wDate, platform, update_dt)
select name, tel, zipCode, address, roadAddress, 0, getdate(), 'mart_20180502', getdate() from tempZip_Mart  where  cateName1 is not null


--�ּҰ� �Ϲ� ���� �������� ������ ����
select * from tempZip_Mart
where address not like '����%'  and address not like '���%'  and address not like '�泲%'  and address not like '���%'  and address not like '����%' and address not like '�뱸%' 
and address not like '����%' and address not like '��õ%' and address not like '����%' and address not like '����%' and address not like '���%' and address not like '�泲%' and address not like '����%'
and address not like '�λ�%' and address not like '���%'  and address not like '����%'  and address not like '����%' 


 tempZip_Mart ���̺� �̸��� �˻� �ܾ�� ��¥�� �ٿ� �̸��� �ٲ����

select count(*) from [dbo].[tempZip_Mart_��¥_Naver]  -- �̰� ����.. �Ʒ��� ������
select count(*) from tempZip_Mart_20180502_Naver

--�Ʒ� ������ ������ export �ɼ� First row has column names üũ, Ȯ���ڴ� �������� ���ϸ� �Է�

SELECT  name + ' �����' as name, tel, zipcode, address , cateName1 from tempZip_Mart_20180502_Naver 
order by  address


select left(address,2) , count(*) from tempZip_Mart_20180502_Naver
where cateName1 is not null
group by left(address,2)
order by count(*) desc


--********************************************************************************************************************


-- �ŷ�ó ����Ʈ
select * from cur_members

-- ������ ������ �� ��������
select left(address,2) as mainDo, count(*) as cnt from cur_members
group by left(address,2)
-- order by left(address,2)
order by count(*) desc

select * from cur_members where address like '����%' -- �ּҿ� �̻��� �� ������ Ȯ��



