prompt PL/SQL Developer import file
prompt Created on 2017年11月3日 by Administrator
set feedback off
set define off
prompt Dropping PRODUCT_CATEGORY...
drop table PRODUCT_CATEGORY cascade constraints;
prompt Dropping PRODUCT...
drop table PRODUCT cascade constraints;
prompt Dropping CART...
drop table CART cascade constraints;
prompt Dropping CUSTOMER...
drop table CUSTOMER cascade constraints;
prompt Dropping PRODUCT_VERSION...
drop table PRODUCT_VERSION cascade constraints;
prompt Dropping USERINFO...
drop table USERINFO cascade constraints;
prompt Creating PRODUCT_CATEGORY...
create table PRODUCT_CATEGORY
(
  cate_id   NUMBER not null,
  cate_name NVARCHAR2(80) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PRODUCT_CATEGORY
  add constraint PK_PRODUCT_CATEGORY primary key (CATE_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PRODUCT_CATEGORY
  add constraint UQ_PRODUCT_CATEGORY_CATE_NAME unique (CATE_NAME)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating PRODUCT...
create table PRODUCT
(
  product_id       NUMBER not null,
  product_name     NVARCHAR2(200) not null,
  produce_date     DATE default sysdate,
  price            NUMBER(7,2) default 0 not null,
  product_category NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PRODUCT
  add constraint PK_PRODUCT primary key (PRODUCT_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PRODUCT
  add constraint FK_PRODUCT_PRODUCT_CATEGROY foreign key (PRODUCT_CATEGORY)
  references PRODUCT_CATEGORY (CATE_ID);

prompt Creating CART...
create table CART
(
  cart_id     NUMBER not null,
  customer_id NUMBER,
  product_id  NUMBER,
  buy_time    DATE default sysdate,
  buy_count   NUMBER default 0
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CART
  add constraint PK_CART primary key (CART_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CART
  add constraint FK_CART_PRODUCT foreign key (PRODUCT_ID)
  references PRODUCT (PRODUCT_ID);

prompt Creating CUSTOMER...
create table CUSTOMER
(
  customer_id       NUMBER not null,
  customer_name     NVARCHAR2(80),
  customer_account  NVARCHAR2(20) not null,
  sex               CHAR(4),
  customer_password NVARCHAR2(32) not null,
  phone             NVARCHAR2(20),
  credits           NUMBER(7,2) default 200,
  email             NVARCHAR2(20),
  head_url          NVARCHAR2(255)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CUSTOMER
  add constraint PK_CUSTOMER primary key (CUSTOMER_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating PRODUCT_VERSION...
create table PRODUCT_VERSION
(
  version_no   NVARCHAR2(20) not null,
  produce_date DATE not null,
  product_desc NVARCHAR2(1000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PRODUCT_VERSION
  add constraint PK_PRODUCT_VERSION primary key (VERSION_NO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating USERINFO...
create table USERINFO
(
  user_id   NUMBER not null,
  user_name NVARCHAR2(50),
  birthday  DATE,
  headurl   NVARCHAR2(255),
  hobby     NVARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table USERINFO
  add constraint PK_USERINFO primary key (USER_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Disabling triggers for PRODUCT_CATEGORY...
alter table PRODUCT_CATEGORY disable all triggers;
prompt Disabling triggers for PRODUCT...
alter table PRODUCT disable all triggers;
prompt Disabling triggers for CART...
alter table CART disable all triggers;
prompt Disabling triggers for CUSTOMER...
alter table CUSTOMER disable all triggers;
prompt Disabling triggers for PRODUCT_VERSION...
alter table PRODUCT_VERSION disable all triggers;
prompt Disabling triggers for USERINFO...
alter table USERINFO disable all triggers;
prompt Disabling foreign key constraints for PRODUCT...
alter table PRODUCT disable constraint FK_PRODUCT_PRODUCT_CATEGROY;
prompt Disabling foreign key constraints for CART...
alter table CART disable constraint FK_CART_PRODUCT;
prompt Loading PRODUCT_CATEGORY...
insert into PRODUCT_CATEGORY (cate_id, cate_name)
values (5, 'QQ会员');
insert into PRODUCT_CATEGORY (cate_id, cate_name)
values (1, 'pptv会员');
insert into PRODUCT_CATEGORY (cate_id, cate_name)
values (2, '爱奇艺会员');
insert into PRODUCT_CATEGORY (cate_id, cate_name)
values (3, '百度云会员');
insert into PRODUCT_CATEGORY (cate_id, cate_name)
values (4, '百度文库会员');
commit;
prompt 5 records loaded
prompt Loading PRODUCT...
insert into PRODUCT (product_id, product_name, produce_date, price, product_category)
values (4, 'pptv7天会员', to_date('12-09-2017 10:34:40', 'dd-mm-yyyy hh24:mi:ss'), 500, 1);
insert into PRODUCT (product_id, product_name, produce_date, price, product_category)
values (5, 'pptv月卡', to_date('12-09-2017 10:35:37', 'dd-mm-yyyy hh24:mi:ss'), 1500, 1);
insert into PRODUCT (product_id, product_name, produce_date, price, product_category)
values (6, '爱奇艺1天卡', to_date('12-09-2017 10:40:25', 'dd-mm-yyyy hh24:mi:ss'), 500, 2);
insert into PRODUCT (product_id, product_name, produce_date, price, product_category)
values (7, '爱奇艺月卡', to_date('12-09-2017 10:40:25', 'dd-mm-yyyy hh24:mi:ss'), 10000, 2);
insert into PRODUCT (product_id, product_name, produce_date, price, product_category)
values (8, '百度云周卡', to_date('12-09-2017 10:41:31', 'dd-mm-yyyy hh24:mi:ss'), 4000, 3);
insert into PRODUCT (product_id, product_name, produce_date, price, product_category)
values (9, '百度文库1天卡', to_date('12-09-2017 10:41:36', 'dd-mm-yyyy hh24:mi:ss'), 800, 4);
insert into PRODUCT (product_id, product_name, produce_date, price, product_category)
values (10, '百度文库月卡', to_date('12-09-2017 10:41:36', 'dd-mm-yyyy hh24:mi:ss'), 4000, 4);
commit;
prompt 7 records loaded
prompt Loading CART...
insert into CART (cart_id, customer_id, product_id, buy_time, buy_count)
values (2, 3, 4, to_date('12-09-2017 14:22:40', 'dd-mm-yyyy hh24:mi:ss'), 2);
insert into CART (cart_id, customer_id, product_id, buy_time, buy_count)
values (3, 4, 7, to_date('12-09-2017 14:22:40', 'dd-mm-yyyy hh24:mi:ss'), 1);
commit;
prompt 2 records loaded
prompt Loading CUSTOMER...
insert into CUSTOMER (customer_id, customer_name, customer_account, sex, customer_password, phone, credits, email, head_url)
values (3, null, 'Tom', '男 ', 'e10adc3949ba59abbe56e057f20f883e', null, 200, null, null);
insert into CUSTOMER (customer_id, customer_name, customer_account, sex, customer_password, phone, credits, email, head_url)
values (4, null, 'anny', '女 ', 'e10adc3949ba59abbe56e057f20f883e', null, 200, null, null);
insert into CUSTOMER (customer_id, customer_name, customer_account, sex, customer_password, phone, credits, email, head_url)
values (5, null, 'jack', '男 ', 'e10adc3949ba59abbe56e057f20f883e', null, 200, null, null);
insert into CUSTOMER (customer_id, customer_name, customer_account, sex, customer_password, phone, credits, email, head_url)
values (21, '千寻用户', 'zhangsan', '无 ', 'e10adc3949ba59abbe56e057f20f883e', '13688889999', 500, '未填', null);
insert into CUSTOMER (customer_id, customer_name, customer_account, sex, customer_password, phone, credits, email, head_url)
values (22, '千寻用户', 'lisi', '无 ', 'e10adc3949ba59abbe56e057f20f883e', null, 2000, '未填', null);
insert into CUSTOMER (customer_id, customer_name, customer_account, sex, customer_password, phone, credits, email, head_url)
values (42, 'hello ketty', 'ketty', '无 ', 'e10adc3949ba59abbe56e057f20f883e', '12345674567', 500, 'ketty@sina.com', null);
insert into CUSTOMER (customer_id, customer_name, customer_account, sex, customer_password, phone, credits, email, head_url)
values (43, 'littleketty', 'littleketty', '无 ', 'e10adc3949ba59abbe56e057f20f883e', '1234567899', 500, 'littleketty', null);
insert into CUSTOMER (customer_id, customer_name, customer_account, sex, customer_password, phone, credits, email, head_url)
values (63, 'Tom333', 'Tom333', '无 ', 'e10adc3949ba59abbe56e057f20f883e', '13612341234', 500, 'Tom333@sina.com', null);
insert into CUSTOMER (customer_id, customer_name, customer_account, sex, customer_password, phone, credits, email, head_url)
values (65, 'Tom123', 'Tom123', '无 ', 'e10adc3949ba59abbe56e057f20f883e', '13612341234', 500, 'Tom333@sina.com', null);
insert into CUSTOMER (customer_id, customer_name, customer_account, sex, customer_password, phone, credits, email, head_url)
values (66, 'Tom222', 'Tom222', '无 ', 'e10adc3949ba59abbe56e057f20f883e', '13612341234', 500, 'Tom222@qq.com', null);
insert into CUSTOMER (customer_id, customer_name, customer_account, sex, customer_password, phone, credits, email, head_url)
values (67, 'Tom444', 'Tom444', '无 ', 'e10adc3949ba59abbe56e057f20f883e', '13612341234', 500, 'Tom444@qq.com', null);
insert into CUSTOMER (customer_id, customer_name, customer_account, sex, customer_password, phone, credits, email, head_url)
values (68, 'æ±¤å§345', 'Tom345', '无 ', 'e10adc3949ba59abbe56e057f20f883e', '13612341234', 500, 'Tom345@qq.com', null);
insert into CUSTOMER (customer_id, customer_name, customer_account, sex, customer_password, phone, credits, email, head_url)
values (69, 'Tom666æµè¯', 'Tom666', '无 ', 'e10adc3949ba59abbe56e057f20f883e', '13612341234', 500, 'Tom666@qq.com', null);
insert into CUSTOMER (customer_id, customer_name, customer_account, sex, customer_password, phone, credits, email, head_url)
values (70, 'Tom555', 'Tom555', '无 ', 'e10adc3949ba59abbe56e057f20f883e', '13612341234', 500, 'Tom555@sina.com', '1506495153512.jpg');
insert into CUSTOMER (customer_id, customer_name, customer_account, sex, customer_password, phone, credits, email, head_url)
values (71, 'Tom888测试', 'Tom888', '无 ', 'e10adc3949ba59abbe56e057f20f883e', '13612341234', 500, 'Tom888@sina.com', '1506497262920.jpg');
insert into CUSTOMER (customer_id, customer_name, customer_account, sex, customer_password, phone, credits, email, head_url)
values (81, 'Tomxxx', 'Tomxxx', '无 ', 'e10adc3949ba59abbe56e057f20f883e', '13612341234', 500, 'Tom333@sina.com', '1506568529310.jpg');
commit;
prompt 16 records loaded
prompt Loading PRODUCT_VERSION...
insert into PRODUCT_VERSION (version_no, produce_date, product_desc)
values ('2.0 版', to_date('28-02-2012', 'dd-mm-yyyy'), 'Test');
insert into PRODUCT_VERSION (version_no, produce_date, product_desc)
values ('3.0版', to_date('21-12-2012', 'dd-mm-yyyy'), null);
insert into PRODUCT_VERSION (version_no, produce_date, product_desc)
values ('4.0版', to_date('06-01-2013', 'dd-mm-yyyy'), null);
insert into PRODUCT_VERSION (version_no, produce_date, product_desc)
values ('5.0版', to_date('02-09-2013', 'dd-mm-yyyy'), null);
insert into PRODUCT_VERSION (version_no, produce_date, product_desc)
values ('V5.1 版', to_date('30-10-2013', 'dd-mm-yyyy'), null);
insert into PRODUCT_VERSION (version_no, produce_date, product_desc)
values ('V6.0 Beta版', to_date('10-12-2013', 'dd-mm-yyyy'), '1.界面全新改版，简而不简，“一?简?轻?新” 2.全新logo，快、极简、安全 3.界面优化：取消侧边栏、简化新标签页、调整菜单栏布局 4.打通了搜索栏、新标签页、地址栏的搜索引擎，搜索更方便');
insert into PRODUCT_VERSION (version_no, produce_date, product_desc)
values ('V6.1版', to_date('20-01-2014', 'dd-mm-yyyy'), '1.支持自定义网址拨号' || chr(10) || '     2.内置拦广告、比价、夜间模式等应用' || chr(10) || '     3.支持导入更多浏览器收藏，Chrome、猎豹浏览器、360极速浏览器、QQ浏览器、火狐浏览器全支持' || chr(10) || '     4.更强大的广告过滤功能，页面更干净' || chr(10) || '     5.划词翻译、搜索等功能都放入右键菜单，无干扰、更简洁' || chr(10) || '     6.支持将新标签页拖拽为独立窗口' || chr(10) || '     7.新增一套全新皮肤，祝您开开心心过大年' || chr(10) || '     ');
insert into PRODUCT_VERSION (version_no, produce_date, product_desc)
values ('V6.2版', to_date('20-03-2014', 'dd-mm-yyyy'), '1.支持应用商店' || chr(10) || '      2.新增“最常访问”列表，打开方便，还可随时隐藏' || chr(10) || '      3.地址栏和搜索框可所以随意拖动改变大小' || chr(10) || '      4.增强贴吧助手、视频弹窗、截图、安全网银等内置工具' || chr(10) || '      5.下载文件新增预计完成时间，耗时一目了然' || chr(10) || '     ');
insert into PRODUCT_VERSION (version_no, produce_date, product_desc)
values ('V6.3版', to_date('08-05-2014', 'dd-mm-yyyy'), '1.更智能：网页云修复' || chr(10) || '      2.更易用：新标签页直通百度风云榜' || chr(10) || '      3.更好玩：应用中心新增宝石迷阵、黄金矿工等一大波经典游戏' || chr(10) || '      4.更人性：应用中心新增30秒脖子健康操、PM2.5实时播送等高度人性化应用，让你远离劲椎病和肺部疾患' || chr(10) || '     ');
insert into PRODUCT_VERSION (version_no, produce_date, product_desc)
values ('V6.4版', to_date('09-06-2014', 'dd-mm-yyyy'), '1.在线视频双倍加速' || chr(10) || '      2.直达世界杯' || chr(10) || '      3.世界杯赛事预测' || chr(10) || '     ');
insert into PRODUCT_VERSION (version_no, produce_date, product_desc)
values ('V6.5墙专版', to_date('05-09-2014', 'dd-mm-yyyy'), '1.新增抢火车票功能' || chr(10) || '      2.优化抢小米应用' || chr(10) || '     ');
insert into PRODUCT_VERSION (version_no, produce_date, product_desc)
values ('V6.5版', to_date('18-07-2014', 'dd-mm-yyyy'), '1.开启海外高速通道' || chr(10) || '      2.精彩内容运营' || chr(10) || '     ');
insert into PRODUCT_VERSION (version_no, produce_date, product_desc)
values ('V7.0版', to_date('04-11-2014', 'dd-mm-yyyy'), '1.全新视觉风格，更精致更扁平' || chr(10) || '      2.世界领先的Chromium38极速内核，性能更好、加载更快' || chr(10) || '      3.六重加速：海淘、购物、看视频、刷网页不用等，引领极速上网新时代' || chr(10) || '      4.三抢齐发：应用中心新增百度浏览器自主研发抢小米、双十一秒杀王、抢火车票应用，抢购成功率业界第一' || chr(10) || '      5.有内容：打造全新首页2.0，更多精彩内容一键直达' || chr(10) || '      6.有发现：借助百度大数据倾力打造发现功能，每天都有好网站' || chr(10) || '      7.云体验：下载百度云加速、网页访问云安全、失效网页云修复' || chr(10) || '     ');
insert into PRODUCT_VERSION (version_no, produce_date, product_desc)
values ('V7.0 增强版', to_date('04-12-2014', 'dd-mm-yyyy'), '1.视频加速、海外加速、GPU加速在IE核下也可使用' || chr(10) || '      2.极速内核升级至Chromium V38.0.2125.122' || chr(10) || '      3.优化了极速内核渲染进程CPU占用率' || chr(10) || '      4.优化了变色龙换肤特效' || chr(10) || '      5.修复了字体发虚的问题' || chr(10) || '      6.修复了断点续传导致下载失败的问题' || chr(10) || '      7.修复了部分机器每次启动浏览器都弹出欢迎页的问题' || chr(10) || '     ');
insert into PRODUCT_VERSION (version_no, produce_date, product_desc)
values ('V7.1 微信专版', to_date('26-01-2015', 'dd-mm-yyyy'), '1.新增桌面微信畅聊功能，上网聊天两不误 ，QQ般聊天体验' || chr(10) || '      2.新增划词搜索，用百度浏览器，“百度一下”更方便' || chr(10) || '      3.支持鼠标的侧键功能，前进后退更便捷' || chr(10) || '      4.支持右键单击直接关闭标签页' || chr(10) || '      5.支持保存网页缩放比例' || chr(10) || '      6.支持拖拽应用，可将应用收入应用盒子' || chr(10) || '      7.优化了记住密码功能，知乎、新浪微博等网站均可记住密码' || chr(10) || '      8.优化了404等异常页面的显示逻辑' || chr(10) || '     ');
insert into PRODUCT_VERSION (version_no, produce_date, product_desc)
values ('V7.2版', to_date('05-02-2015', 'dd-mm-yyyy'), '1.电脑和手机百度浏览器收藏双向同步，随时随地访问收藏' || chr(10) || '      2.新增工具栏搜索框，随手一搜更方便' || chr(10) || '      3.新增武媚娘、何以笙箫默、霍比特人等多款明星皮肤，并不断更新中' || chr(10) || '      4.优化了下载性能，下载更快更稳定' || chr(10) || '      5.开放字体定制功能，支持通过mactype等工具自定义页面文字' || chr(10) || '     ');
insert into PRODUCT_VERSION (version_no, produce_date, product_desc)
values ('V7.3版', to_date('26-03-2015', 'dd-mm-yyyy'), '1.新增积分特权，用百度浏览器免费送爱奇艺黄金VIP，看爱奇艺视频无广告' || chr(10) || '      2.新增对高清屏的支持' || chr(10) || '      3.新增老板键功能，Alt+~一键隐藏主界面，并支持自定义' || chr(10) || '      4.新增标签栏位置自定义，可置顶或下置标签栏' || chr(10) || '      5.新增支持双击关闭未激活标签页' || chr(10) || '      6.新增搜索栏热门搜索列表，实时掌握全网热搜内容' || chr(10) || '      7.修复在部分场景下网址状态条遮挡页面操作的问题' || chr(10) || '     ');
insert into PRODUCT_VERSION (version_no, produce_date, product_desc)
values ('V7.4版', to_date('05-05-2015', 'dd-mm-yyyy'), '1.全新首页，搜索热词，劲爆新闻一键直达，并支持内容个性化定制' || chr(10) || '      2.新增地址栏下拉菜单，常用网址一键直达' || chr(10) || '      3.性能提升，降低CPU和内存占用，提升冷热启动速度、页面切换速度' || chr(10) || '      4.支持地址栏输入网址在新标签页打开' || chr(10) || '      5.优化了收藏夹体验，收藏列表可平铺展示，收藏管理器内支持多选拖拽、删除等操作' || chr(10) || '      6.优化了下载性能，提升各类文件下载成功率' || chr(10) || '     ');
insert into PRODUCT_VERSION (version_no, produce_date, product_desc)
values ('V7.5版', to_date('11-06-2015', 'dd-mm-yyyy'), '1.新首页增加更多内容卡片，有趣，有料' || chr(10) || '      2.浏览器积分中心新增特权，积分可免费下载百度文库资源' || chr(10) || '      3.极速内核下页面支持平滑滚动，页面浏览更流畅' || chr(10) || '      4.支持复制链接或文本后，在新建按钮“+”上右击即可打开该链接或搜索该文本' || chr(10) || '      5.优化收藏的产品设计，收藏栏支持显示更多收藏' || chr(10) || '      6.优化了浏览器性能，内存占用更低' || chr(10) || '     ');
insert into PRODUCT_VERSION (version_no, produce_date, product_desc)
values ('V7.6版', to_date('17-07-2015', 'dd-mm-yyyy'), '1.首创“超级截图”，浏览器可识别图片中文字（OCR），以及截取视频为GIF' || chr(10) || '      2.特权中心再升级，免费兑换爱奇艺，还可免费下载文库资源' || chr(10) || '      3.新增异常网页智能纠错，网页无法访问时将自动搜索正确的网址' || chr(10) || '      4.极速内核升级至Chromium 42，网页流畅度大幅提升' || chr(10) || '      5.支持新建标签页设置为新首页（0.baidu.com）' || chr(10) || '     ');
insert into PRODUCT_VERSION (version_no, produce_date, product_desc)
values ('V8.0版', to_date('22-09-2015', 'dd-mm-yyyy'), '1.8.0全新版本，更极速、更好看、更易用' || chr(10) || '      2.速度提升：在7系列基础上，安装、启动、打开网页全面提速' || chr(10) || '      3.性能提升：全面提升浏览性能，更稳定、更流畅' || chr(10) || '      4.多彩皮肤：一键换色领略丰富极地色彩' || chr(10) || '      5.全新截图体验：新增截图贴贴功能，让心情跃然屏上' || chr(10) || '      6.全新搜索体验：新增搜索框即时搜索功能，即搜即得更智能' || chr(10) || '      7.全新特权体验：积分可兑换糯米电影抵用券、京东全场满减券、百度文库VIP、爱奇艺VIP' || chr(10) || '      8.全新高校支持：完美兼容超过一千所高等学校内部网站，大学生必备浏览器' || chr(10) || '     ');
insert into PRODUCT_VERSION (version_no, produce_date, product_desc)
values ('V8.1版', to_date('19-11-2015', 'dd-mm-yyyy'), '1.图片加速支持所有购物网站，购物更爽快' || chr(13) || '' || chr(10) || '2.特权中心新增0积分福利券，海量现金券等你来拿' || chr(13) || '' || chr(10) || '3.支持Ctrl+Shift+Delete调起清除浏览数据窗口' || chr(13) || '' || chr(10) || '4.支持手动修改缓存目录' || chr(13) || '' || chr(10) || '5.可设置开启或关闭懒人标签功能' || chr(13) || '' || chr(10) || '6.可设置开启或关闭鼠标中键关闭标签页功能');
insert into PRODUCT_VERSION (version_no, produce_date, product_desc)
values ('V8.2版', to_date('21-01-2016', 'dd-mm-yyyy'), '1.更稳定，极速内核升级至Chromium 47---' || chr(13) || '' || chr(10) || '2.更轻快，全面优化UI内存占用' || chr(13) || '' || chr(10) || '3.更安全，提升首页防其他软件篡改能力' || chr(13) || '' || chr(10) || '4.更准确，提升网页图标拉取成功率' || chr(13) || '' || chr(10) || '5.新增智能记忆上次收藏保存路径功能' || chr(13) || '' || chr(10) || '6.新增鼠标手势自定义功能');
insert into PRODUCT_VERSION (version_no, produce_date, product_desc)
values ('V8.3版', to_date('12-04-2016', 'dd-mm-yyyy'), '1.特权中心新增百度云会员，免费享受超大文件上传' || chr(10) || '2.新增单标签页静音，声音播放随心控制' || chr(10) || '3.添加多个常用快捷键，键盘操作更方便' || chr(10) || '4.历史记录增加时间筛选功能' || chr(10) || '5.搜索框对时事支持智能推送');
insert into PRODUCT_VERSION (version_no, produce_date, product_desc)
values ('V8.4版', to_date('30-12-2017', 'dd-mm-yyyy'), '1.专项修复网页打开问题000' || chr(13) || '' || chr(10) || '2.特权中心新增中粮我买网优惠券，0积分限时兑换' || chr(13) || '' || chr(10) || '3.支持一次性收藏当前所有页面，收藏管理更方便' || chr(13) || '' || chr(10) || '4.优化扩展平台，对开发者更友好');
insert into PRODUCT_VERSION (version_no, produce_date, product_desc)
values ('V8.5版', to_date('01-08-2015', 'dd-mm-yyyy'), '1.专项修复账号登录接口问题' || chr(10) || '2.积分商城2.0上线，更多玩法、更多福利、更少积分兑换' || chr(10) || '3.浏览器状态栏，热点新闻不再错过' || chr(10) || '4.常用快捷键补齐，增加快捷键标识，修复F2、F3功能键失效问题' || chr(10) || '5.号同步二期优化完成，新增部分设置项同步' || chr(10) || '6.极速内核丢失后，重启浏览器可自动修复');
insert into PRODUCT_VERSION (version_no, produce_date, product_desc)
values ('V8.x版', to_date('12-12-2016', 'dd-mm-yyyy'), '2016-12-12 发布8.x版本');
commit;
prompt 27 records loaded
prompt Loading USERINFO...
insert into USERINFO (user_id, user_name, birthday, headurl, hobby)
values (1, 'zhangsan', to_date('03-11-2017 10:08:58', 'dd-mm-yyyy hh24:mi:ss'), null, '读书,写字,玩游戏');
insert into USERINFO (user_id, user_name, birthday, headurl, hobby)
values (2, 'zhangsan', to_date('03-11-2017 10:13:28', 'dd-mm-yyyy hh24:mi:ss'), null, '读书,写字,玩游戏');
insert into USERINFO (user_id, user_name, birthday, headurl, hobby)
values (3, 'zhangsan', to_date('03-11-2017 10:21:55', 'dd-mm-yyyy hh24:mi:ss'), null, '读书,写字,玩游戏');
insert into USERINFO (user_id, user_name, birthday, headurl, hobby)
values (4, 'zhangsan', to_date('03-11-2017 10:27:49', 'dd-mm-yyyy hh24:mi:ss'), null, '读书,写字,玩游戏');
insert into USERINFO (user_id, user_name, birthday, headurl, hobby)
values (5, 'zhansan', to_date('01-01-2017', 'dd-mm-yyyy'), 'uploads/fe7ac2d1-73e2-4ec0-967a-46e241b7ed16.jpg', 'music');
insert into USERINFO (user_id, user_name, birthday, headurl, hobby)
values (6, 'zhansan2', to_date('01-01-2017', 'dd-mm-yyyy'), 'uploads/ef82281a-5092-4c3e-b085-43265310dcf4.jpg', 'music');
insert into USERINFO (user_id, user_name, birthday, headurl, hobby)
values (7, 'zhansan', to_date('01-01-2017', 'dd-mm-yyyy'), 'uploads/aaf4e1a7-f1cb-4652-ac86-f99c9e213239.jpg', 'music,movie,read');
commit;
prompt 7 records loaded
prompt Enabling foreign key constraints for PRODUCT...
alter table PRODUCT enable constraint FK_PRODUCT_PRODUCT_CATEGROY;
prompt Enabling foreign key constraints for CART...
alter table CART enable constraint FK_CART_PRODUCT;
prompt Enabling triggers for PRODUCT_CATEGORY...
alter table PRODUCT_CATEGORY enable all triggers;
prompt Enabling triggers for PRODUCT...
alter table PRODUCT enable all triggers;
prompt Enabling triggers for CART...
alter table CART enable all triggers;
prompt Enabling triggers for CUSTOMER...
alter table CUSTOMER enable all triggers;
prompt Enabling triggers for PRODUCT_VERSION...
alter table PRODUCT_VERSION enable all triggers;
prompt Enabling triggers for USERINFO...
alter table USERINFO enable all triggers;
set feedback on
set define on
prompt Done.
