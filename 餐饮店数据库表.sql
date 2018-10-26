create table tb_emp(
  e_usercode varchar2(20) primary key, --员工账号  主键
  e_password varchar2(20),  --员工密码
  e_type  varchar2(20),  --员工类型   前台管理员、服务员、后厨
  e_authority varchar2(50),  --员工权限
  e_trueName varchar2(10), --员工本名
  e_gender  varchar2(5),  --员工性别
  e_tel  varchar2(20),  --员工电话
  e_remark  varchar2(50)  --员工备注
);

--开始插入数据  插入成功1
insert into tb_emp values('zc97','123456','前台管理员','管理菜品及员工信息、确认订单收款、查看销售额','张城','男','17873677345','我是等你吃饭餐厅的店长');
insert into tb_emp values('pl97','123456','服务员','点餐、发送买单请求','盘龙','男','15211784587','我是等你吃饭餐厅的服务员');
insert into tb_emp values('zzf97','123456','服务员','点餐、发送买单请求','曾子繁','男','15211786645','我是等你吃饭餐厅的服务员');
insert into tb_emp values('lm97','123456','后厨','查看点餐信息、发送传菜请求','李敏','女','15874268874','我是等你吃饭餐厅的后厨');
insert into tb_emp values('myy97','123456','后厨','查看点餐信息、发送传菜请求','莫银银','女','15874264458','我是等你吃饭餐厅的后厨');


-------------------------------------------------------------------------------------

create table tb_vip(
  v_id  number(20) primary key,  --会员卡号（id）主键
  v_name varchar2(10), --会员姓名
  v_password  varchar2(20),--会员密码
  vt_num number(10),  --会员等级编号 外键
  v_gender  varchar2(10),--会员性别
  v_tel varchar2(20) unique,  --会员电话
  v_balance  number(10,1),  --会员余额
  v_allCost  number(10,1),  --会员消费总额
  v_loginDay date, --会员注册日期
  
  --会员和会员级别存在着多对一的关系，比如很多个会员都是打九折
  --constraint vip_vipType_fk foreign key(vt_num) references t_vipType(vt_num) on delete cascade --级联删除
  constraint vip_vipType_fkk foreign key(vt_num) references tb_vipType(vt_num)
);

create sequence vip_seq
  increment by 1 --每次加一
  start with 1000  --从1000开始
  nomaxvalue --不设置最大值 也就是1000到正无穷
  nocycle ; --一直累加 

--开始插入数据 插入成功3 
insert into tb_vip values(vip_seq.nextval,'曾小贤','zxx123',1,'男','17873677344','200','58',date '2018-06-01');
insert into tb_vip values(vip_seq.nextval,'胡一菲','hyf123',1,'女','17873677123','500','100',date '2018-03-01');
insert into tb_vip values(vip_seq.nextval,'吕小布','lxb123',2,'男','17873677789','2000','800',date '2018-01-01');
insert into tb_vip values(vip_seq.nextval,'陈美嘉','cmj123',2,'女','15807332529','1000','200',date '2018-02-02');
insert into tb_vip values(vip_seq.nextval,'关谷','gg123',1,'男','15807442528','500','9',date '2018-04-02');
insert into tb_vip values(vip_seq.nextval,'唐悠悠','tyy123',2,'女','15807442527','2000','150',date '2018-04-02');
insert into tb_vip values(vip_seq.nextval,'Lisa榕','lisa123',1,'女','15974399788','800','200',date '2018-03-01');
insert into tb_vip values(vip_seq.nextval,'张伟','zw123',1,'男','15874399766','500','55',date '2018-06-01');
insert into tb_vip values(vip_seq.nextval,'陆展博','lzb123',1,'男','17873567452','500','50',date '2018-05-02');

select * from tb_vip;
-------------------------------------------------------------------------------------

create table tb_vipType(
  vt_num  number(10) primary key,  --会员等级编号 主键
  vt_level varchar2(10), --会员等级
  vt_discount decimal(2, 1) --会员折扣  0.9    0.8    0.7     --总消费1000以下0.9    1000-3000 0.8     3000以上0.7
);

--开始插入数据 插入成功2
insert into tb_vipType values(1,'普通会员','0.9');
insert into tb_vipType values(2,'中级会员','0.8');
insert into tb_vipType values(3,'高级会员','0.7');

-------------------------------------------------------------------------------------
create table tb_meal(  --菜品表
  m_id number(20) primary key,  --菜品（id）主键
  m_name varchar2(20),--菜名
  m_classify varchar2(20),--菜品分类
  m_price number(20,1),  --菜品单价
  m_ramark varchar2(255),  --菜品描述
  m_sellCount number(20),  --菜品销售量
  m_addTime date,   --菜品添加时间
  e_usercode varchar2(20), --外键 连表  代表是哪个员工添加的
  m_imgUrl varchar2(255),  --图片路径
  m_isHotSell varchar2(20), --是否热销 （0为不热销，1为热销）

  --一个员工可以添加多个菜品
  constraint meal_emp_fk foreign key(e_usercode) references tb_emp(e_usercode) 
);

--drop table tb_meal;
--drop sequence meal_seq;
 create sequence meal_seq 
  increment by 1   --每次加一
  start with 100    --从10这个数字开始 
  nomaxvalue    --不设置最大值 
  nocycle;      --一直累加，不循环  

select * from tb_meal;

--饮料
insert into tb_meal values(meal_seq.nextval,'怡宝','饮料','2.0','水','50',sysdate,'zc97','images/yinliao/yibao','1');
insert into tb_meal values(meal_seq.nextval,'雪碧','饮料','3.0','碳酸饮料','70',sysdate,'zc97','images/yinliao/xuebi','1');
insert into tb_meal values(meal_seq.nextval,'旺仔','饮料','6.0','牛奶','70',sysdate,'zc97','images/yinliao/wangzai','1');
insert into tb_meal values(meal_seq.nextval,'王老吉','饮料','6.0','凉茶','70',sysdate,'zc97','images/yinliao/wanglaoji','1');
insert into tb_meal values(meal_seq.nextval,'天地一号','饮料','20.0','苹果醋','70',sysdate,'zc97','images/yinliao/pingguocu','1');
insert into tb_meal values(meal_seq.nextval,'美年达','饮料','3.0','碳酸饮料','70',sysdate,'zc97','images/yinliao/meinianda','1');
insert into tb_meal values(meal_seq.nextval,'可乐','饮料','3.0','碳酸饮料','70',sysdate,'zc97','images/yinliao/kele','1');
insert into tb_meal values(meal_seq.nextval,'劲酒','饮料','10.0','药酒','70',sysdate,'zc97','images/yinliao/jingjiu','0');
insert into tb_meal values(meal_seq.nextval,'江小白','饮料','20.0','白酒','70',sysdate,'zc97','images/yinliao/jiangxiaobai','0');
insert into tb_meal values(meal_seq.nextval,'果粒橙','饮料','5.0','果汁饮料','70',sysdate,'zc97','images/yinliao/guolicheng','1');
insert into tb_meal values(meal_seq.nextval,'重庆啤酒','饮料','5.0','啤酒','70',sysdate,'zc97','images/yinliao/chongqinpijiu','1');
--家常小炒
insert into tb_meal values(meal_seq.nextval,'爆炒田鸡','家常小炒','58.0','以田鸡作为主要食材，以葱、蒜、花雕酒、鸡精作为辅料制作而成的美食','30',sysdate,'zc97','images/jiachangxiaochao/baochaotianji','1');
insert into tb_meal values(meal_seq.nextval,'大蒜炒腊肉','家常小炒','48.0','以大蒜，腊肉为主要材料的菜品，口味咸鲜。','30',sysdate,'zc97','images/jiachangxiaochao/dasuanchaolarou','1');
insert into tb_meal values(meal_seq.nextval,'干煸鳝鱼','家常小炒','48.0','色泽红亮，皮脆肉嫩，鲜香微辣，滋味浓郁','30',sysdate,'zc97','images/jiachangxiaochao/ganbianshanyu','1');
insert into tb_meal values(meal_seq.nextval,'花菜炒肉','家常小炒','28.0','脆嫩爽口，鲜甜美味，营养价值高','30',sysdate,'','images/jiachangxiaochao/huacaichaorou','1');
insert into tb_meal values(meal_seq.nextval,'小炒黄牛肉','家常小炒','48.0','是以牛肉、青尖椒、红尖椒等食材制成的一道菜品，香味浓郁，味道鲜美，十分诱人','30',sysdate,'zc97','images/jiachangxiaochao/huangniurou','1');
insert into tb_meal values(meal_seq.nextval,'青椒回锅肉','家常小炒','35.0','以青椒、猪肉（五花肉）、酱油、郫县豆瓣酱等为原材料制作，香气浓郁，肥而不腻。','30',sysdate,'zc97','images/jiachangxiaochao/huiguorou','1');
insert into tb_meal values(meal_seq.nextval,'韭菜炒蛋','家常小炒','28.0','本地土鸡蛋，含有大量的维生素和矿物质，美味又营养','30',sysdate,'zc97','images/jiachangxiaochao/jiucaichaodan','1');
insert into tb_meal values(meal_seq.nextval,'辣椒炒捆鸡','家常小炒','28.0','开胃下饭，富含蛋白质','30',sysdate,'zc97','images/jiachangxiaochao/lajiaochaokunji','0');
insert into tb_meal values(meal_seq.nextval,'螺蛳肉外婆菜','家常小炒','38.0','香辣，下饭拌饭极好，口感美味，品之逾香','30',sysdate,'zc97','images/jiachangxiaochao/luosirouwaipocai','1');
insert into tb_meal values(meal_seq.nextval,'千叶豆腐','家常小炒','20.0','又烫又滑，口感鲜美，富有嚼劲','30',sysdate,'zc97','images/jiachangxiaochao/qianyediufu','0');
insert into tb_meal values(meal_seq.nextval,'三味茄子','家常小炒','30.0','蒜香、香菜、肉末三味，香味浓郁','30',sysdate,'zc97','images/jiachangxiaochao/sanweiqiezi','1');
insert into tb_meal values(meal_seq.nextval,'酸辣鸡杂','家常小炒','35.0','鲜美可口，且有多样营养素，家常开胃小菜','30',sysdate,'zc97','images/jiachangxiaochao/suanlajiza','1');
insert into tb_meal values(meal_seq.nextval,'酸萝卜牛肚','家常小炒','38.0','萝卜酸甜爽口，牛肚脆爽，下饭良品','30',sysdate,'zc97','images/jiachangxiaochao/suanluoboniudu','1');
insert into tb_meal values(meal_seq.nextval,'铁板牛肉','家常小炒','38.0','营养价值高,富含蛋白质，氨基酸，口味独特，吃法新颖。','30',sysdate,'zc97','images/jiachangxiaochao/tiebanniurou','0');
insert into tb_meal values(meal_seq.nextval,'蒜香排骨','家常小炒','38.0','上海菜。其口感蒜香浓郁，质嫩味美，健脾开胃','30',sysdate,'zc97','images/jiachangxiaochao/suanxiangpaigu','1');
insert into tb_meal values(meal_seq.nextval,'香干炒肉','家常小炒','22.0','经典湘菜，制作原料主要有香干、猪肉等，是一道开胃下饭的家常好菜。','30',sysdate,'zc97','images/jiachangxiaochao/xiangganchaorou','0');
insert into tb_meal values(meal_seq.nextval,'小炒肉','家常小炒','28.0','湘菜，此菜肉质细嫩，麻辣鲜香，滑嫩适口，别有一番风味','30',sysdate,'zc97','images/jiachangxiaochao/xiaochaorou','1');
insert into tb_meal values(meal_seq.nextval,'西红柿炒蛋','家常小炒','28.0','营养搭配合理。鲜艳，口味宜人，爽口、开胃','30',sysdate,'zc97','images/jiachangxiaochao/xihongshichaodan','1');

--家禽
insert into tb_meal values(meal_seq.nextval,'钱粮湖谷鸭','家禽','58.0','选用两至三岁的老水鸭，经过十多道工序处理，然后加入20多种调料及中药配料，肉而却不塞牙，咬一口，汤汁四溅，美食入肚，回味无穷','30',sysdate,'zc97','images/jiaqin/guya','1');
insert into tb_meal values(meal_seq.nextval,'黄焖鸭杂','家禽','48.0','口味香酥, 肥而不腻，色彩鲜艳,麻辣味浓,有别于其它风味黄焖','40',sysdate,'zc97','images/jiaqin/huangmenyaza','1');
insert into tb_meal values(meal_seq.nextval,'尖椒仔鸡','家禽','48.0','味道鲜美纯正，香气浓郁，且营养丰富','40',sysdate,'zc97','images/jiaqin/jianjiaoziji','1');
insert into tb_meal values(meal_seq.nextval,'口水鸡','家禽','45.0','佐料丰富，集麻辣鲜香嫩爽于一身','40',sysdate,'zc97','images/jiaqin/koushuiji','0');
insert into tb_meal values(meal_seq.nextval,'手撕鸭','家禽','45.0','香味浓郁，香而不腻，脆嫩爽口','40',sysdate,'zc97','images/jiaqin/shousiya','0');

--鱼类
insert into tb_meal values(meal_seq.nextval,'剁椒黄鸭叫','鱼类','48.0','它既保留了鱼的鲜甜，又融入剁椒的酸辣，非常的鲜美可口。','40',sysdate,'zc97','images/yulei/duojiaohuangyajiao','1');
insert into tb_meal values(meal_seq.nextval,'剁椒鱼头','鱼类','38.0','菜品色泽红亮、味浓、肉质细嫩。肥而不腻、口感软糯、鲜辣适口。','40',sysdate,'zc97','images/yulei/duojiaoyutou','1');
insert into tb_meal values(meal_seq.nextval,'红烧鲫鱼','鱼类','32.0','以香菜、红辣椒一起烧制的美味私房菜，口味香辣可口，美容抗皱，营养价值丰富。','40',sysdate,'zc97','images/yulei/hongshaojiyu','1');
insert into tb_meal values(meal_seq.nextval,'青椒焖草鱼','鱼类','42.0','青椒草鱼，是一种炒菜类美食，所需食材有草鱼、青椒等','40',sysdate,'zc97','images/yulei/qingjiaomencaoyu','1');
insert into tb_meal values(meal_seq.nextval,'清蒸鲈鱼','鱼类','58.0','选用一斤左右的鲈鱼，蒸的时间恰到火候，鱼肉刚熟，细嫩爽滑，鱼肉的鲜美完全的呈现。汤汁带着米酒的甜，豉油的香','40',sysdate,'zc97','images/yulei/qingzhengluyu','1');
insert into tb_meal values(meal_seq.nextval,'酸菜鱼','鱼类','48.0','酸菜鱼以草鱼为主料，配以泡菜等食材煮制而成，口味酸辣可口；鱼含丰富优质蛋白，能提供人丰富的蛋白质、矿物质等营养','40',sysdate,'zc97','images/yulei/suancaiyu','0');
insert into tb_meal values(meal_seq.nextval,'糖醋鱼','鱼类','42.0','鲜嫩无比、酸甜可口 ，外焦里嫩。','40',sysdate,'zc97','images/yulei/tangcuyu','0');

--时令蔬菜
insert into tb_meal values(meal_seq.nextval,'白灼芥蓝','时令蔬菜','32.0',' 白灼芥蓝是以芥蓝、红彩椒等食材制成的一道美食。','40',sysdate,'zc97','images/shilingshucai/baizhuojielan','1');
insert into tb_meal values(meal_seq.nextval,'刀拍黄瓜','时令蔬菜','22.0','把洗好的黄瓜用刀直接拍碎，放上调味料凉拌的黄瓜','40',sysdate,'zc97','images/shilingshucai/daopaihuanggua','0');
insert into tb_meal values(meal_seq.nextval,'大片莴笋','时令蔬菜','25.0','炒莴笋是一道美味的菜肴。','40',sysdate,'zc97','images/shilingshucai/dapianwosun','0');
insert into tb_meal values(meal_seq.nextval,'红烧冬瓜','时令蔬菜','28.0','将冬瓜削去皮，切成长方块。将香菜洗净，切成小段。','40',sysdate,'zc97','images/shilingshucai/shaodonggua','1');
insert into tb_meal values(meal_seq.nextval,'手撕包菜','时令蔬菜','22.0','此菜红白相间，麻辣鲜香，爽脆清甜，可开胃增食','40',sysdate,'zc97','images/shilingshucai/shousibaocai','1');
insert into tb_meal values(meal_seq.nextval,'酸辣土豆丝','时令蔬菜','22.0','是一道人见人爱的家常菜，制作原料有土豆、辣椒、白醋等。','40',sysdate,'zc97','images/shilingshucai/suanlatudousi','1');
insert into tb_meal values(meal_seq.nextval,'香菇烩菜心','时令蔬菜','28.0','主料有香菇、菜心、青菜配合作料进行煸炒。此次清晰可口，对补气血，降血脂，抗癌有一定的帮助。','40',sysdate,'zc97','images/shilingshucai/xiangguhuicaixin','1');
insert into tb_meal values(meal_seq.nextval,'小炒空心菜','时令蔬菜','25.0','清炒空心菜是一道菜品，制作原料主要有空心菜、葱、蒜末、精盐等，空心菜不可炒得太烂，以免营养损失过多。','40',sysdate,'zc97','images/shilingshucai/xiaochaokongxincai','1');

--靓汤
insert into tb_meal values(meal_seq.nextval,'冬瓜文蛤汤','靓汤','32.0',' 汤色清澈，清香鲜美。','40',sysdate,'zc97','images/liangtang/dongguawengetang','1');
insert into tb_meal values(meal_seq.nextval,'鲫鱼豆腐汤','靓汤','38.0','口味咸鲜可口，鲫鱼具有很好的催乳作用，配用豆腐，益气养血、健脾宽中，豆腐亦富有营养，含蛋白质较高，对于产后康复及乳汁分泌有很好的促进作用。','40',sysdate,'zc97','images/liangtang/jiyudoufutang','1');
insert into tb_meal values(meal_seq.nextval,'排骨玉米汤','靓汤','38.0','主要食材是玉米和排骨，主要烹饪工艺是炖。玉米可降低血液胆固醇浓度并防止其沉积于血管壁，营养丰富，促进人们对维生素和钙的吸收','40',sysdate,'zc97','images/liangtang/paiguyumitang','1');
insert into tb_meal values(meal_seq.nextval,'汽锅肉丸汤','靓汤','36.0','浓郁的肉香味混和着葱香与胡椒的芳香味儿，伴着缓缓升腾的热气儿，实在让人心驰神往欲罢不能！','40',sysdate,'zc97','images/liangtang/qiguorouwantang','0');
insert into tb_meal values(meal_seq.nextval,'青菜肉末汤','靓汤','22.0',' 青菜为低脂肪蔬菜，有降血脂、解毒消肿、防癌排毒、宽肠通便、美容保健的功效。青菜和香菇同食可预防癌症。','40',sysdate,'zc97','images/liangtang/qingcairoumotang','1');
insert into tb_meal values(meal_seq.nextval,'酸辣猪血汤','靓汤','28.0',' 猪血，虽被人们视为屠宰下脚料，但却是最理想的养血之物，尤其适宜于爱美的女性食用。','40',sysdate,'zc97','images/liangtang/suanlazhuxuetang','0');
insert into tb_meal values(meal_seq.nextval,'芋头娃娃菜汤','靓汤','28.0',' 带着芋头的粉腻与甜香，没水气味，有股自然的爽口。','40',sysdate,'zc97','images/liangtang/yutouwawacaitang','1');

--主食
insert into tb_meal values(meal_seq.nextval,'蘑菇包','主食','18.0',' 内陷为豆沙','40',sysdate,'zc97','images/zhushi/baozi','1');
insert into tb_meal values(meal_seq.nextval,'长寿面','主食','28.0',' 荷包蛋配以挂面青菜','40',sysdate,'zc97','images/zhushi/changshoumian','1');
insert into tb_meal values(meal_seq.nextval,'红糖糍粑','主食','18.0',' 四川特色小食','40',sysdate,'zc97','images/zhushi/ciba','1');
insert into tb_meal values(meal_seq.nextval,'米饭','主食','2.0','主食','40',sysdate,'zc97','images/zhushi/mifan','1');
insert into tb_meal values(meal_seq.nextval,'香芋小丸子','主食','18.0',' 香芋内陷，外表酥脆','40',sysdate,'zc97','images/zhushi/xiangyuwan','1');

-------------------------------------------------------------------------------------
create table tb_deal(  --订单表
  d_id number(20) primary key,  --订单（id）主键
  d_dealTime date,  --下单时间
  desk_id varchar2(20),  -- 餐桌id 外键 连表
  v_id  number(20),--会员id    外键                                                        
  d_lastPrice number(20,1),--最后的付款价格
  d_mealState number(5), --菜品状态   0:正在烹饪   1：烹饪完成
  d_isPay number(5),  --是否付款了  0：付款     1：已付款
  e_usercode varchar2(20), --外键 连表  代表是哪个员工添加的
  
  --一个员工可以生成多次订单
  constraint deal_emp_fk foreign key(e_usercode) references tb_emp(e_usercode),
  --一个会员可以生成多次订单
  constraint deal_meal_fk foreign key(v_id) references tb_vip(v_id),
  --一个餐桌可以生成多次订单
  constraint deal_desk_fk foreign key(desk_id) references tb_desk(desk_id)
);
--drop table tb_deal;

 create sequence deal_sequ 
  increment by 1   --每次加一
  start with 66666    --从10这个数字开始 
  nomaxvalue    --不设置最大值 
  nocycle;      --一直累加，不循环  

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
  d_id number(20) , --订单id 外键 连表
  m_id number(20) , --菜品id 外键 连表    这两个外键作为联合主键 
  a_count number(3), --每个菜的数量
  a_remark varchar2(50),   --每个菜的备注  加辣 加葱
  
  --联合主键
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

insert into tb_allMeal values(66679,100,1,'无');
insert into tb_allMeal values(66679,120,1,'无');
insert into tb_allMeal values(66679,159,1,'无');

insert into tb_allMeal values(66680,100,1,'无');
insert into tb_allMeal values(66680,120,1,'无');
insert into tb_allMeal values(66680,160,1,'无');

insert into tb_allMeal values(66681,100,1,'无');
insert into tb_allMeal values(66681,120,1,'无');
insert into tb_allMeal values(66681,161,1,'无');

insert into tb_allMeal values(66682,100,1,'无');
insert into tb_allMeal values(66682,120,1,'无');
insert into tb_allMeal values(66682,162,1,'无');

insert into tb_allMeal values(66683,100,1,'无');
insert into tb_allMeal values(66683,120,1,'无');
insert into tb_allMeal values(66683,163,1,'无');

insert into tb_allMeal values(66684,100,1,'无');
insert into tb_allMeal values(66684,120,1,'无');
insert into tb_allMeal values(66684,164,1,'无');

insert into tb_allMeal values(66685,100,1,'无');
insert into tb_allMeal values(66685,120,1,'无');
insert into tb_allMeal values(66685,165,1,'无');

insert into tb_allMeal values(66686,100,1,'无');
insert into tb_allMeal values(66686,120,1,'无');
insert into tb_allMeal values(66686,166,1,'无');

insert into tb_allMeal values(66687,100,1,'无');
insert into tb_allMeal values(66687,120,1,'无');
insert into tb_allMeal values(66687,167,1,'无');

select * from tb_allMeal;

-------------------------------------------------------------------------------------
create table tb_desk(
  desk_id varchar2(20) primary key,--餐桌id
  desk_state varchar2(20),--餐桌状态 空闲 点菜 清桌 
  desk_isReq number(5)  --0：无请求 1：下单  2：买单
);

--插入数据成功4
insert into tb_desk values('A1','空闲',0);
insert into tb_desk values('A2','空闲',0);
insert into tb_desk values('A3','空闲',0);
insert into tb_desk values('A4','空闲',0);
insert into tb_desk values('B1','空闲',0);
insert into tb_desk values('B2','空闲',0);
insert into tb_desk values('B3','空闲',0);
insert into tb_desk values('B4','空闲',0);
insert into tb_desk values('c1','空闲',0);
insert into tb_desk values('c2','空闲',0);
insert into tb_desk values('c3','空闲',0);
insert into tb_desk values('c4','空闲',0);

select * from tb_desk;

-------------------------------------------------------------------------------------
create table tb_notice(
  n_id number(20) primary key,--公告id
  n_content varchar2(50),  --公告内容
  e_usercode varchar2(20),  --发布者 外键
  n_publishTIme date,   --发布时间

  --前台管理员可以发布很多次公告
  constraint notice_emp_fk  foreign key(e_usercode) references tb_emp(e_usercode)
);

 create sequence notice_seq 
  increment by 1   --每次加一
  start with 66666    --从10这个数字开始 
  nomaxvalue    --不设置最大值 
  nocycle;      --一直累加，不循环  

--插入数据成功5
insert into tb_notice values(notice_seq.nextval,'今天也要好好奋斗！','zc97',date '2018-08-18');
insert into tb_notice values(notice_seq.nextval,'今天继续加油吧！','zc97',date '2018-08-19');

select * from tb_notice;

-------------------------------------------------------------------------------------
create table tb_performance(
  p_id number(20) primary key,--业绩id
  p_marketing  number(20) ,--业绩营销额  每天的营销额
  p_time date --时间

);

 create sequence performance_seq 
  increment by 1   --每次加一
  start with 8888    --从10这个数字开始 
  nomaxvalue    --不设置最大值 
  nocycle;      --一直累加，不循环  

--drop sequence performance_seq ;
select performance_seq.nextval from dual;

--插入数据成功6
insert into tb_performance values(performance_seq.nextval,2000,date '2018-08-15');
insert into tb_performance values(performance_seq.nextval,2200,date '2018-08-16');

select * from tb_performance;
-------------------------------------------------------------------------------------















