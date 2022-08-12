package main

import (
	"github.com/gogf/gf/frame/g"
	"gogopress/app"
)

func main() {
	s := g.Server()
	//绑定静态目录
	s.AddStaticPath("/static", "./static")

	GroupRoot := s.Group("/")
	GroupRoot.GET("/", app.PageIndex) //首页

	s.Run()
}
