package main

import (
	"fmt"
	"github.com/gogf/gf/frame/g"
	_ "github.com/lib/pq"
	"gogopress/app"
)

func main() {
	s := g.Server()
	//加载全局设置
	app.LoadSettings()
	fmt.Println(app.G_App_Setting)
	//绑定静态目录
	s.AddStaticPath("/static", "./static")

	GroupRoot := s.Group("/")
	GroupRoot.GET("/", app.PageIndex)         //前台首页和内容列表
	GroupRoot.GET("/about", app.PageIndex)    //关于
	GroupRoot.GET("/category", app.PageIndex) //内容分类导航

	GroupAdmin := s.Group("/admin")
	GroupAdmin.ALL("/", app.PageIndex)                   //后台首页和登录页
	GroupAdmin.GET("/setting", app.PageIndex)            //系统设置页
	GroupAdmin.GET("/api/allcategory", app.PageIndex)    //返回全部分类列表
	GroupAdmin.GET("/api/getcategory", app.PageIndex)    //返回分类信息
	GroupAdmin.GET("/api/putcategory", app.PageIndex)    //更新分类信息
	GroupAdmin.GET("/api/deletecategory", app.PageIndex) //删除分类
	GroupAdmin.GET("/api/allposts", app.PageIndex)       //返回全部帖子列表
	GroupAdmin.GET("/api/getpost", app.PageIndex)        //返回帖子内容
	GroupAdmin.GET("/api/putpost", app.PageIndex)        //更新帖子内容
	GroupAdmin.GET("/api/deletepost", app.PageIndex)     //删除帖子

	s.Run()
}
