create table tb_emp(
  e_usercode varchar2(20) primary key, --Ա���˺�  ����
  e_password varchar2(20),  --Ա������
  e_type  varchar2(20),  --Ա������   ǰ̨����Ա������Ա�����
  e_authority varchar2(50),  --Ա��Ȩ��
  e_trueName varchar2(10), --Ա������
  e_gender  varchar2(5),  --Ա���Ա�
  e_tel  varchar2(20),  --Ա���绰
  e_remark  varchar2(50)  --Ա����ע
);

--��ʼ��������  ����ɹ�1
insert into tb_emp values('zc97','123456','ǰ̨����Ա','�����Ʒ��Ա����Ϣ��ȷ�϶����տ�鿴���۶�','�ų�','��','17873677345','���ǵ���Է������ĵ곤');
insert into tb_emp values('pl97','123456','����Ա','��͡�����������','����','��','15211784587','���ǵ���Է������ķ���Ա');
insert into tb_emp values('zzf97','123456','����Ա','��͡�����������','���ӷ�','��','15211786645','���ǵ���Է������ķ���Ա');
insert into tb_emp values('lm97','123456','���','�鿴�����Ϣ�����ʹ�������','����','Ů','15874268874','���ǵ���Է������ĺ��');
insert into tb_emp values('myy97','123456','���','�鿴�����Ϣ�����ʹ�������','Ī����','Ů','15874264458','���ǵ���Է������ĺ��');


-------------------------------------------------------------------------------------

create table tb_vip(
  v_id  number(20) primary key,  --��Ա���ţ�id������
  v_name varchar2(10), --��Ա����
  v_password  varchar2(20),--��Ա����
  vt_num number(10),  --��Ա�ȼ���� ���
  v_gender  varchar2(10),--��Ա�Ա�
  v_tel varchar2(20) unique,  --��Ա�绰
  v_balance  number(10,1),  --��Ա���
  v_allCost  number(10,1),  --��Ա�����ܶ�
  v_loginDay date, --��Աע������
  
  --��Ա�ͻ�Ա��������Ŷ��һ�Ĺ�ϵ������ܶ����Ա���Ǵ����
  --constraint vip_vipType_fk foreign key(vt_num) references t_vipType(vt_num) on delete cascade --����ɾ��
  constraint vip_vipType_fkk foreign key(vt_num) references tb_vipType(vt_num)
);

create sequence vip_seq
  increment by 1 --ÿ�μ�һ
  start with 1000  --��1000��ʼ
  nomaxvalue --���������ֵ Ҳ����1000��������
  nocycle ; --һֱ�ۼ� 

--��ʼ�������� ����ɹ�3 
insert into tb_vip values(vip_seq.nextval,'��С��','zxx123',1,'��','17873677344','200','58',date '2018-06-01');
insert into tb_vip values(vip_seq.nextval,'��һ��','hyf123',1,'Ů','17873677123','500','100',date '2018-03-01');
insert into tb_vip values(vip_seq.nextval,'��С��','lxb123',2,'��','17873677789','2000','800',date '2018-01-01');
insert into tb_vip values(vip_seq.nextval,'������','cmj123',2,'Ů','15807332529','1000','200',date '2018-02-02');
insert into tb_vip values(vip_seq.nextval,'�ع�','gg123',1,'��','15807442528','500','9',date '2018-04-02');
insert into tb_vip values(vip_seq.nextval,'������','tyy123',2,'Ů','15807442527','2000','150',date '2018-04-02');
insert into tb_vip values(vip_seq.nextval,'Lisa��','lisa123',1,'Ů','15974399788','800','200',date '2018-03-01');
insert into tb_vip values(vip_seq.nextval,'��ΰ','zw123',1,'��','15874399766','500','55',date '2018-06-01');
insert into tb_vip values(vip_seq.nextval,'½չ��','lzb123',1,'��','17873567452','500','50',date '2018-05-02');

select * from tb_vip;
-------------------------------------------------------------------------------------

create table tb_vipType(
  vt_num  number(10) primary key,  --��Ա�ȼ���� ����
  vt_level varchar2(10), --��Ա�ȼ�
  vt_discount decimal(2, 1) --��Ա�ۿ�  0.9    0.8    0.7     --������1000����0.9    1000-3000 0.8     3000����0.7
);

--��ʼ�������� ����ɹ�2
insert into tb_vipType values(1,'��ͨ��Ա','0.9');
insert into tb_vipType values(2,'�м���Ա','0.8');
insert into tb_vipType values(3,'�߼���Ա','0.7');

-------------------------------------------------------------------------------------
create table tb_meal(  --��Ʒ��
  m_id number(20) primary key,  --��Ʒ��id������
  m_name varchar2(20),--����
  m_classify varchar2(20),--��Ʒ����
  m_price number(20,1),  --��Ʒ����
  m_ramark varchar2(255),  --��Ʒ����
  m_sellCount number(20),  --��Ʒ������
  m_addTime date,   --��Ʒ���ʱ��
  e_usercode varchar2(20), --��� ����  �������ĸ�Ա����ӵ�
  m_imgUrl varchar2(255),  --ͼƬ·��
  m_isHotSell varchar2(20), --�Ƿ����� ��0Ϊ��������1Ϊ������

  --һ��Ա��������Ӷ����Ʒ
  constraint meal_emp_fk foreign key(e_usercode) references tb_emp(e_usercode) 
);

--drop table tb_meal;
--drop sequence meal_seq;
 create sequence meal_seq 
  increment by 1   --ÿ�μ�һ
  start with 100    --��10������ֿ�ʼ 
  nomaxvalue    --���������ֵ 
  nocycle;      --һֱ�ۼӣ���ѭ��  

select * from tb_meal;

--����
insert into tb_meal values(meal_seq.nextval,'����','����','2.0','ˮ','50',sysdate,'zc97','images/yinliao/yibao','1');
insert into tb_meal values(meal_seq.nextval,'ѩ��','����','3.0','̼������','70',sysdate,'zc97','images/yinliao/xuebi','1');
insert into tb_meal values(meal_seq.nextval,'����','����','6.0','ţ��','70',sysdate,'zc97','images/yinliao/wangzai','1');
insert into tb_meal values(meal_seq.nextval,'���ϼ�','����','6.0','����','70',sysdate,'zc97','images/yinliao/wanglaoji','1');
insert into tb_meal values(meal_seq.nextval,'���һ��','����','20.0','ƻ����','70',sysdate,'zc97','images/yinliao/pingguocu','1');
insert into tb_meal values(meal_seq.nextval,'�����','����','3.0','̼������','70',sysdate,'zc97','images/yinliao/meinianda','1');
insert into tb_meal values(meal_seq.nextval,'����','����','3.0','̼������','70',sysdate,'zc97','images/yinliao/kele','1');
insert into tb_meal values(meal_seq.nextval,'����','����','10.0','ҩ��','70',sysdate,'zc97','images/yinliao/jingjiu','0');
insert into tb_meal values(meal_seq.nextval,'��С��','����','20.0','�׾�','70',sysdate,'zc97','images/yinliao/jiangxiaobai','0');
insert into tb_meal values(meal_seq.nextval,'������','����','5.0','��֭����','70',sysdate,'zc97','images/yinliao/guolicheng','1');
insert into tb_meal values(meal_seq.nextval,'����ơ��','����','5.0','ơ��','70',sysdate,'zc97','images/yinliao/chongqinpijiu','1');
--�ҳ�С��
insert into tb_meal values(meal_seq.nextval,'�����Ｆ','�ҳ�С��','58.0','���Ｆ��Ϊ��Ҫʳ�ģ��ԴС��⡢����ơ�������Ϊ�����������ɵ���ʳ','30',sysdate,'zc97','images/jiachangxiaochao/baochaotianji','1');
insert into tb_meal values(meal_seq.nextval,'���⳴����','�ҳ�С��','48.0','�Դ��⣬����Ϊ��Ҫ���ϵĲ�Ʒ����ζ���ʡ�','30',sysdate,'zc97','images/jiachangxiaochao/dasuanchaolarou','1');
insert into tb_meal values(meal_seq.nextval,'��������','�ҳ�С��','48.0','ɫ�������Ƥ�����ۣ�����΢������ζŨ��','30',sysdate,'zc97','images/jiachangxiaochao/ganbianshanyu','1');
insert into tb_meal values(meal_seq.nextval,'���˳���','�ҳ�С��','28.0','����ˬ�ڣ�������ζ��Ӫ����ֵ��','30',sysdate,'','images/jiachangxiaochao/huacaichaorou','1');
insert into tb_meal values(meal_seq.nextval,'С����ţ��','�ҳ�С��','48.0','����ţ�⡢��⽷����⽷��ʳ���Ƴɵ�һ����Ʒ����ζŨ����ζ��������ʮ������','30',sysdate,'zc97','images/jiachangxiaochao/huangniurou','1');
insert into tb_meal values(meal_seq.nextval,'�ཷ�ع���','�ҳ�С��','35.0','���ཷ�����⣨�廨�⣩�����͡�ۯ�ض��꽴��Ϊԭ��������������Ũ�����ʶ����塣','30',sysdate,'zc97','images/jiachangxiaochao/huiguorou','1');
insert into tb_meal values(meal_seq.nextval,'�²˳���','�ҳ�С��','28.0','���������������д�����ά���غͿ����ʣ���ζ��Ӫ��','30',sysdate,'zc97','images/jiachangxiaochao/jiucaichaodan','1');
insert into tb_meal values(meal_seq.nextval,'����������','�ҳ�С��','28.0','��θ�·�������������','30',sysdate,'zc97','images/jiachangxiaochao/lajiaochaokunji','0');
insert into tb_meal values(meal_seq.nextval,'���������Ų�','�ҳ�С��','38.0','�������·��跹���ã��ڸ���ζ��Ʒ֮����','30',sysdate,'zc97','images/jiachangxiaochao/luosirouwaipocai','1');
insert into tb_meal values(meal_seq.nextval,'ǧҶ����','�ҳ�С��','20.0','�����ֻ����ڸ����������н���','30',sysdate,'zc97','images/jiachangxiaochao/qianyediufu','0');
insert into tb_meal values(meal_seq.nextval,'��ζ����','�ҳ�С��','30.0','���㡢��ˡ���ĩ��ζ����ζŨ��','30',sysdate,'zc97','images/jiachangxiaochao/sanweiqiezi','1');
insert into tb_meal values(meal_seq.nextval,'��������','�ҳ�С��','35.0','�����ɿڣ����ж���Ӫ���أ��ҳ���θС��','30',sysdate,'zc97','images/jiachangxiaochao/suanlajiza','1');
insert into tb_meal values(meal_seq.nextval,'���ܲ�ţ��','�ҳ�С��','38.0','�ܲ�����ˬ�ڣ�ţ�Ǵ�ˬ���·���Ʒ','30',sysdate,'zc97','images/jiachangxiaochao/suanluoboniudu','1');
insert into tb_meal values(meal_seq.nextval,'����ţ��','�ҳ�С��','38.0','Ӫ����ֵ��,���������ʣ������ᣬ��ζ���أ��Է���ӱ��','30',sysdate,'zc97','images/jiachangxiaochao/tiebanniurou','0');
insert into tb_meal values(meal_seq.nextval,'�����Ź�','�ҳ�С��','38.0','�Ϻ��ˡ���ڸ�����Ũ��������ζ������Ƣ��θ','30',sysdate,'zc97','images/jiachangxiaochao/suanxiangpaigu','1');
insert into tb_meal values(meal_seq.nextval,'��ɳ���','�ҳ�С��','22.0','������ˣ�����ԭ����Ҫ����ɡ�����ȣ���һ����θ�·��ļҳ��òˡ�','30',sysdate,'zc97','images/jiachangxiaochao/xiangganchaorou','0');
insert into tb_meal values(meal_seq.nextval,'С����','�ҳ�С��','28.0','��ˣ��˲�����ϸ�ۣ��������㣬�����ʿڣ�����һ����ζ','30',sysdate,'zc97','images/jiachangxiaochao/xiaochaorou','1');
insert into tb_meal values(meal_seq.nextval,'����������','�ҳ�С��','28.0','Ӫ������������ޣ���ζ���ˣ�ˬ�ڡ���θ','30',sysdate,'zc97','images/jiachangxiaochao/xihongshichaodan','1');

--����
insert into tb_meal values(meal_seq.nextval,'Ǯ������Ѽ','����','58.0','ѡ�������������ˮѼ������ʮ���������Ȼ�����20���ֵ��ϼ���ҩ���ϣ����ȴ��������ҧһ�ڣ���֭�Ľ�����ʳ��ǣ���ζ����','30',sysdate,'zc97','images/jiaqin/guya','1');
insert into tb_meal values(meal_seq.nextval,'����Ѽ��','����','48.0','��ζ����, �ʶ����壬ɫ������,����ζŨ,�б���������ζ����','40',sysdate,'zc97','images/jiaqin/huangmenyaza','1');
insert into tb_meal values(meal_seq.nextval,'�⽷�м�','����','48.0','ζ����������������Ũ������Ӫ���ḻ','40',sysdate,'zc97','images/jiaqin/jianjiaoziji','1');
insert into tb_meal values(meal_seq.nextval,'��ˮ��','����','45.0','���Ϸḻ��������������ˬ��һ��','40',sysdate,'zc97','images/jiaqin/koushuiji','0');
insert into tb_meal values(meal_seq.nextval,'��˺Ѽ','����','45.0','��ζŨ����������壬����ˬ��','40',sysdate,'zc97','images/jiaqin/shousiya','0');

--����
insert into tb_meal values(meal_seq.nextval,'�罷��Ѽ��','����','48.0','���ȱ������������������罷���������ǳ��������ɿڡ�','40',sysdate,'zc97','images/yulei/duojiaohuangyajiao','1');
insert into tb_meal values(meal_seq.nextval,'�罷��ͷ','����','38.0','��Ʒɫ�������ζŨ������ϸ�ۡ��ʶ����塢�ڸ���Ŵ�������ʿڡ�','40',sysdate,'zc97','images/yulei/duojiaoyutou','1');
insert into tb_meal values(meal_seq.nextval,'��������','����','32.0','����ˡ�������һ�����Ƶ���ζ˽���ˣ���ζ�����ɿڣ����ݿ��壬Ӫ����ֵ�ḻ��','40',sysdate,'zc97','images/yulei/hongshaojiyu','1');
insert into tb_meal values(meal_seq.nextval,'�ཷ�˲���','����','42.0','�ཷ���㣬��һ�ֳ�������ʳ������ʳ���в��㡢�ཷ��','40',sysdate,'zc97','images/yulei/qingjiaomencaoyu','1');
insert into tb_meal values(meal_seq.nextval,'��������','����','58.0','ѡ��һ�����ҵ����㣬����ʱ��ǡ�����������죬ϸ��ˬ���������������ȫ�ĳ��֡���֭�����׾Ƶ������͵���','40',sysdate,'zc97','images/yulei/qingzhengluyu','1');
insert into tb_meal values(meal_seq.nextval,'�����','����','48.0','������Բ���Ϊ���ϣ������ݲ˵�ʳ�����ƶ��ɣ���ζ�����ɿڣ��㺬�ḻ���ʵ��ף����ṩ�˷ḻ�ĵ����ʡ������ʵ�Ӫ��','40',sysdate,'zc97','images/yulei/suancaiyu','0');
insert into tb_meal values(meal_seq.nextval,'�Ǵ���','����','42.0','�����ޱȡ�����ɿ� ���⽹���ۡ�','40',sysdate,'zc97','images/yulei/tangcuyu','0');

--ʱ���߲�
insert into tb_meal values(meal_seq.nextval,'���ƽ���','ʱ���߲�','32.0',' ���ƽ������Խ�������ʽ���ʳ���Ƴɵ�һ����ʳ��','40',sysdate,'zc97','images/shilingshucai/baizhuojielan','1');
insert into tb_meal values(meal_seq.nextval,'���Ļƹ�','ʱ���߲�','22.0','��ϴ�õĻƹ��õ�ֱ�����飬���ϵ�ζ������Ļƹ�','40',sysdate,'zc97','images/shilingshucai/daopaihuanggua','0');
insert into tb_meal values(meal_seq.nextval,'��Ƭݫ��','ʱ���߲�','25.0','��ݫ����һ����ζ�Ĳ��ȡ�','40',sysdate,'zc97','images/shilingshucai/dapianwosun','0');
insert into tb_meal values(meal_seq.nextval,'���ն���','ʱ���߲�','28.0','��������ȥƤ���гɳ����顣�����ϴ�����г�С�Ρ�','40',sysdate,'zc97','images/shilingshucai/shaodonggua','1');
insert into tb_meal values(meal_seq.nextval,'��˺����','ʱ���߲�','22.0','�˲˺����䣬�������㣬ˬ�����𣬿ɿ�θ��ʳ','40',sysdate,'zc97','images/shilingshucai/shousibaocai','1');
insert into tb_meal values(meal_seq.nextval,'��������˿','ʱ���߲�','22.0','��һ���˼��˰��ļҳ��ˣ�����ԭ�����������������״׵ȡ�','40',sysdate,'zc97','images/shilingshucai/suanlatudousi','1');
insert into tb_meal values(meal_seq.nextval,'�㹽�����','ʱ���߲�','28.0','�������㹽�����ġ����������Ͻ����Գ����˴������ɿڣ��Բ���Ѫ����Ѫ֬��������һ���İ�����','40',sysdate,'zc97','images/shilingshucai/xiangguhuicaixin','1');
insert into tb_meal values(meal_seq.nextval,'С�����Ĳ�','ʱ���߲�','25.0','�峴���Ĳ���һ����Ʒ������ԭ����Ҫ�п��Ĳˡ��С���ĩ�����εȣ����Ĳ˲��ɳ���̫�ã�����Ӫ����ʧ���ࡣ','40',sysdate,'zc97','images/shilingshucai/xiaochaokongxincai','1');

--����
insert into tb_meal values(meal_seq.nextval,'�����ĸ���','����','32.0',' ��ɫ�峺������������','40',sysdate,'zc97','images/liangtang/dongguawengetang','1');
insert into tb_meal values(meal_seq.nextval,'���㶹����','����','38.0','��ζ���ʿɿڣ�������кܺõĴ������ã����ö�����������Ѫ����Ƣ���У������฻��Ӫ�����������ʽϸߣ����ڲ��󿵸�����֭�����кܺõĴٽ����á�','40',sysdate,'zc97','images/liangtang/jiyudoufutang','1');
insert into tb_meal values(meal_seq.nextval,'�Ź�������','����','38.0','��Ҫʳ�������׺��Źǣ���Ҫ��⿹������������׿ɽ���ѪҺ���̴�Ũ�Ȳ���ֹ�������Ѫ�ܱڣ�Ӫ���ḻ���ٽ����Ƕ�ά���غ͸Ƶ�����','40',sysdate,'zc97','images/liangtang/paiguyumitang','1');
insert into tb_meal values(meal_seq.nextval,'����������','����','36.0','Ũ��������ζ����Ŵ���������ķ���ζ�������Ż������ڵ���������ʵ�������ĳ��������ղ��ܣ�','40',sysdate,'zc97','images/liangtang/qiguorouwantang','0');
insert into tb_meal values(meal_seq.nextval,'�����ĩ��','����','22.0',' ���Ϊ��֬���߲ˣ��н�Ѫ֬���ⶾ���ס������Ŷ�����ͨ�㡢���ݱ����Ĺ�Ч����˺��㹽ͬʳ��Ԥ����֢��','40',sysdate,'zc97','images/liangtang/qingcairoumotang','1');
insert into tb_meal values(meal_seq.nextval,'������Ѫ��','����','28.0',' ��Ѫ���䱻������Ϊ�����½��ϣ���ȴ�����������Ѫ֮����������ڰ�����Ů��ʳ�á�','40',sysdate,'zc97','images/liangtang/suanlazhuxuetang','0');
insert into tb_meal values(meal_seq.nextval,'��ͷ���޲���','����','28.0',' ������ͷ�ķ��������㣬ûˮ��ζ���й���Ȼ��ˬ�ڡ�','40',sysdate,'zc97','images/liangtang/yutouwawacaitang','1');

--��ʳ
insert into tb_meal values(meal_seq.nextval,'Ģ����','��ʳ','18.0',' ����Ϊ��ɳ','40',sysdate,'zc97','images/zhushi/baozi','1');
insert into tb_meal values(meal_seq.nextval,'������','��ʳ','28.0',' �ɰ������Թ������','40',sysdate,'zc97','images/zhushi/changshoumian','1');
insert into tb_meal values(meal_seq.nextval,'��������','��ʳ','18.0',' �Ĵ���ɫСʳ','40',sysdate,'zc97','images/zhushi/ciba','1');
insert into tb_meal values(meal_seq.nextval,'�׷�','��ʳ','2.0','��ʳ','40',sysdate,'zc97','images/zhushi/mifan','1');
insert into tb_meal values(meal_seq.nextval,'����С����','��ʳ','18.0',' �������ݣ�����ִ�','40',sysdate,'zc97','images/zhushi/xiangyuwan','1');

-------------------------------------------------------------------------------------
create table tb_deal(  --������
  d_id number(20) primary key,  --������id������
  d_dealTime date,  --�µ�ʱ��
  desk_id varchar2(20),  -- ����id ��� ����
  v_id  number(20),--��Աid    ���                                                        
  d_lastPrice number(20,1),--���ĸ���۸�
  d_mealState number(5), --��Ʒ״̬   0:�������   1��������
  d_isPay number(5),  --�Ƿ񸶿���  0������     1���Ѹ���
  e_usercode varchar2(20), --��� ����  �������ĸ�Ա����ӵ�
  
  --һ��Ա���������ɶ�ζ���
  constraint deal_emp_fk foreign key(e_usercode) references tb_emp(e_usercode),
  --һ����Ա�������ɶ�ζ���
  constraint deal_meal_fk foreign key(v_id) references tb_vip(v_id),
  --һ�������������ɶ�ζ���
  constraint deal_desk_fk foreign key(desk_id) references tb_desk(desk_id)
);
--drop table tb_deal;

 create sequence deal_sequ 
  increment by 1   --ÿ�μ�һ
  start with 66666    --��10������ֿ�ʼ 
  nomaxvalue    --���������ֵ 
  nocycle;      --һֱ�ۼӣ���ѭ��  

insert into tb_deal values(deal_sequ.nextval,sysdate,'A1',1000,20,1,1,'zzf97');
insert into tb_deal values(deal_sequ.nextval,sysdate,'c1',1001,25,1,1,'pl97');
insert into tb_deal values(deal_sequ.nextval,sysdate,'B2',1002,30,1,1,'zzf97');
insert into tb_deal values(deal_sequ.nextval,sysdate,'A3',1003,20,1,1,'zzf97');
insert into tb_deal values(deal_sequ.nextval,sysdate,'A4',1004,15,1,1,'pl97');
insert into tb_deal values(deal_sequ.nextval,sysdate,'B1',1005,15,1,1,'zzf97');
insert into tb_deal values(deal_sequ.nextval,sysdate,'B2',1006,20,1,1,'pl97');
insert into tb_deal values(deal_sequ.nextval,sysdate,'B4',1007,30,1,1,'zzf97');
insert into tb_deal values(deal_sequ.nextval,sysdate,'c4',1008,40,1,1,'pl97');

select * from tb_deal;
-------------------------------------------------------------------------------------
create table tb_allMeal(
  d_id number(20) , --����id ��� ����
  m_id number(20) , --��Ʒid ��� ����    �����������Ϊ�������� 
  a_count number(3), --ÿ���˵�����
  a_remark varchar2(50),   --ÿ���˵ı�ע  ���� �Ӵ�
  
  --��������
  constraint allMeal_pk primary key(d_id,m_id)
);
--drop table tb_allMeal;
--select seqxxxx.nextval from dual
--
--select seqxxxx.next from dual
--insert tb_deal
--insert tb_allMeal
--
--select count(*) from tb_vip

insert into tb_allMeal values(66679,100,1,'��');
insert into tb_allMeal values(66679,120,1,'��');
insert into tb_allMeal values(66679,159,1,'��');

insert into tb_allMeal values(66680,100,1,'��');
insert into tb_allMeal values(66680,120,1,'��');
insert into tb_allMeal values(66680,160,1,'��');

insert into tb_allMeal values(66681,100,1,'��');
insert into tb_allMeal values(66681,120,1,'��');
insert into tb_allMeal values(66681,161,1,'��');

insert into tb_allMeal values(66682,100,1,'��');
insert into tb_allMeal values(66682,120,1,'��');
insert into tb_allMeal values(66682,162,1,'��');

insert into tb_allMeal values(66683,100,1,'��');
insert into tb_allMeal values(66683,120,1,'��');
insert into tb_allMeal values(66683,163,1,'��');

insert into tb_allMeal values(66684,100,1,'��');
insert into tb_allMeal values(66684,120,1,'��');
insert into tb_allMeal values(66684,164,1,'��');

insert into tb_allMeal values(66685,100,1,'��');
insert into tb_allMeal values(66685,120,1,'��');
insert into tb_allMeal values(66685,165,1,'��');

insert into tb_allMeal values(66686,100,1,'��');
insert into tb_allMeal values(66686,120,1,'��');
insert into tb_allMeal values(66686,166,1,'��');

insert into tb_allMeal values(66687,100,1,'��');
insert into tb_allMeal values(66687,120,1,'��');
insert into tb_allMeal values(66687,167,1,'��');

select * from tb_allMeal;

-------------------------------------------------------------------------------------
create table tb_desk(
  desk_id varchar2(20) primary key,--����id
  desk_state varchar2(20),--����״̬ ���� ��� ���� 
  desk_isReq number(5)  --0�������� 1���µ�  2����
);

--�������ݳɹ�4
insert into tb_desk values('A1','����',0);
insert into tb_desk values('A2','����',0);
insert into tb_desk values('A3','����',0);
insert into tb_desk values('A4','����',0);
insert into tb_desk values('B1','����',0);
insert into tb_desk values('B2','����',0);
insert into tb_desk values('B3','����',0);
insert into tb_desk values('B4','����',0);
insert into tb_desk values('c1','����',0);
insert into tb_desk values('c2','����',0);
insert into tb_desk values('c3','����',0);
insert into tb_desk values('c4','����',0);

select * from tb_desk;

-------------------------------------------------------------------------------------
create table tb_notice(
  n_id number(20) primary key,--����id
  n_content varchar2(50),  --��������
  e_usercode varchar2(20),  --������ ���
  n_publishTIme date,   --����ʱ��

  --ǰ̨����Ա���Է����ܶ�ι���
  constraint notice_emp_fk  foreign key(e_usercode) references tb_emp(e_usercode)
);

 create sequence notice_seq 
  increment by 1   --ÿ�μ�һ
  start with 66666    --��10������ֿ�ʼ 
  nomaxvalue    --���������ֵ 
  nocycle;      --һֱ�ۼӣ���ѭ��  

--�������ݳɹ�5
insert into tb_notice values(notice_seq.nextval,'����ҲҪ�ú÷ܶ���','zc97',date '2018-08-18');
insert into tb_notice values(notice_seq.nextval,'����������Ͱɣ�','zc97',date '2018-08-19');

select * from tb_notice;

-------------------------------------------------------------------------------------
create table tb_performance(
  p_id number(20) primary key,--ҵ��id
  p_marketing  number(20) ,--ҵ��Ӫ����  ÿ���Ӫ����
  p_time date --ʱ��

);

 create sequence performance_seq 
  increment by 1   --ÿ�μ�һ
  start with 8888    --��10������ֿ�ʼ 
  nomaxvalue    --���������ֵ 
  nocycle;      --һֱ�ۼӣ���ѭ��  

--drop sequence performance_seq ;
select performance_seq.nextval from dual;

--�������ݳɹ�6
insert into tb_performance values(performance_seq.nextval,2000,date '2018-08-15');
insert into tb_performance values(performance_seq.nextval,2200,date '2018-08-16');

select * from tb_performance;
-------------------------------------------------------------------------------------















