// 引入express
const express = require("express");
// 引入连接池
const pool = require("../pool");
// 创建路由器
var router = express.Router();

router.get("/", (req, res) => {
  res.send("成功");
})



module.exports = router;