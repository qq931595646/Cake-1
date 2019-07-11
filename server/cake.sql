SET NAMES UTF8;
DROP DATABASE IF EXISTS cake;
CREATE DATABASE cake CHARSET=UTF8;
USE cake;

/** 用户表 **/
CREATE TABLE cake_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(50),                                          #用户名
  phone VARCHAR(16),                                          #手机号(登陆的账号)
  upwd VARCHAR(32),                                           #登陆密码
  avatar VARCHAR(128) DEFAULT "默认一张登陆后的头像",           #头像
  integral INT DEFAULT 0                                      #积分(默认开始为0)
);

/** 商家用户表 **/
CREATE TABLE cake_merchant(
  mid INT PRIMARY KEY AUTO_INCREMENT,
  mname VARCHAR(50),                                          #用户名
  phone VARCHAR(16),                                          #手机号(登陆的账号)
  mpwd VARCHAR(32),                                           #登陆密码
  avatar VARCHAR(128) DEFAULT "默认一张登陆后的头像",           #头像
  merchant_name VARCHAR(32),                                  #真实姓名
  gender INT,                                                 #性别  0-女  1-男
  shop VARCHAR(128)                                           #店铺
);

/** 商品表 **/
CREATE TABLE cake_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  cid INT,                                                   #商品分类
  pname VARCHAR(128),                                        #商品名称
  price DECIMAL(10,2),                                       #价格
  pic VARCHAR(128),                                          #商品图片
  sales_volume INT,                                          #销售量
  read_num INT DEFAULT 0,                                    #用户阅览数
  shelf_time BIGINT,                                         #上架时间
  sold_out_time BIGINT,                                      #下架时间
  is_Sell_well BOOLEAN,                                      #是否热销(是为1,否为0)
  seq_state BOOLEAN                                          #销售状态(在销:1,下架:0)
);

/** 商品家族(分类) **/
CREATE TABLE cake_catalogue(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  cname VARCHAR(32),                                        #分类的名称
  series VARCHAR(32)                                        #属于的系列
);

/** 商品规格 **/
CREATE TABLE cake_spec(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  pid INT,                                                 #商品的id
  size VARCHAR(16),                                        #尺寸
  is_state BOOLEAN,                                        #状态(预定:0,现货:1)
  style VARCHAR(32),                                       #商品款式
  fruit VARCHAR(32),                                       #水果
  else_message VARCHAR(36),                                #其他的信息(其他无法归类的)
  repertory INT DEFAULT 0                                  #商品库存(默认0)
);

/** 图片表 **/
CREATE TABLE cake_pic(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  pid INT,                                                 #商品的id
  pic VARCHAR(128)                                         #图片
);

/** 购物车表 **/
CREATE TABLE cake_cart(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                                             #用户编号
  product_id INT,                                          #商品编号
  count INT,                                               #购买数量
  is_state BOOLEAN                                         #购买商品时的状态(预定:0,现货:1)
);

/**用户订单**/
CREATE TABLE cake_order(
  oid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                                            #用户编号
  address_id INT,                                         #收货地址id
  status INT,                                             #订单状态(1等待付款,2等待发货,3运输中,4已签收,5已取消)
  order_time BIGINT,                                      #下单时间
  pay_time BIGINT,                                        #付款时间
  deliver_time BIGINT,                                    #发货时间
  received_time BIGINT                                    #签收时间
)AUTO_INCREMENT=10000000;                                 #从10000000开始自增

/**用户订单**/
CREATE TABLE cake_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,                                           #订单编号
  product_id INT,                                         #产品编号
  count INT                                               #购买数量
);

/**收货地址信息**/
CREATE TABLE cake_receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                                            #用户编号
  receiver VARCHAR(16),                                   #接收人姓名
  province VARCHAR(16),                                   #省
  city VARCHAR(16),                                       #市
  county VARCHAR(16),                                     #县
  address VARCHAR(128),                                   #详细地址
  cellphone VARCHAR(16),                                  #手机
  fixedphone VARCHAR(16),                                 #固定电话
  postcode CHAR(6),                                       #邮编
  tag VARCHAR(16),                                        #标签名
  is_default BOOLEAN                                      #是否为当前用户的默认收货地址
);