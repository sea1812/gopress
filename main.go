package main

import (
	"github.com/gogf/gf/frame/g"
	"gogopress/app"
)

func main() {
	s := g.Server()
	GroupRoot := s.Group("/")
	GroupRoot.GET("/", app.PageIndex)
	s.Run()
}
