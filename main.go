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
	GroupRoot.GET("/", app.PageIndex)          //前台首页和内容列表
	GroupRoot.GET("/about", app.PageIndex)     //关于
	GroupRoot.GET("/tag", app.PageTag)         //按标签检索显示内容列表
	GroupRoot.GET("/article", app.PageArticle) //显示具体文章内容
	GroupRoot.GET("/tags", app.PageTags)       //显示所有tag用于导航
	GroupRoot.GET("/page", app.PagePage)       //显示Page页面

	GroupAdmin := s.Group("/admin")
	GroupAdmin.GET("/api/allconfig", app.PageIndex)      //返回全部设置项
	GroupAdmin.GET("/api/allcategory", app.PageIndex)    //返回全部分类列表
	GroupAdmin.GET("/api/getcategory", app.PageIndex)    //返回分类信息
	GroupAdmin.GET("/api/putcategory", app.PageIndex)    //更新分类信息
	GroupAdmin.GET("/api/deletecategory", app.PageIndex) //删除分类
	GroupAdmin.GET("/api/allposts", app.PageIndex)       //返回全部帖子列表
	GroupAdmin.GET("/api/getpost", app.PageIndex)        //返回帖子内容
	GroupAdmin.GET("/api/putpost", app.PageIndex)        //更新帖子内容

	s.Run()
}
