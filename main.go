package main

import "github.com/gogf/gf/frame/g"

func main() {
	s := g.Server()
	GroupRoot := s.Group("/")
	GroupRoot.GET("/", app.PageIndex)
	s.Run()
}
