// 引入express
const express = require("express");
// 引入连接池
const pool = require("../pool");
// 创建路由器
var router = express.Router();

router.post("/login", (req, res) => {
  var phone = req.query.phone;
  var upwd = req.query.upwd;

  if (!phone) {
    res.send({ code: -400, msg: "手机号不能为空" });
    return;
  }
  if (!upwd) {
    res.send({ code: -400, msg: "密码不能为空" });
    return;
  }

  var sql = "SELECT uid,uname,phone FROM cake_user WHERE phone upwd";
  pool.query(sql, [phone, upwd], (err, result) => {
    if (err) throw err;
    if (result.length > 0) {
      // session 的登陆id
      req.session.uid = result[0].uid;
      res.send({ code: 200, msg: "登陆成功" });
    } else {
      res.send({ code: -400, msg: "用户名或密码错误" });
    }
  })
})



module.exports = router;