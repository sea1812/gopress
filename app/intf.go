package app

import (
	"github.com/gogf/gf/frame/g"
)

//全局变量
var G_App_Setting g.Map = make(g.Map) //应用设置

//加载settings表
func LoadSettings() {
	res, err := g.DB().GetAll("select * from configuration")
	//fmt.Println(err)
	if err == nil {
		for _, item := range res {
			key := item["key"].String()
			value := item["value"].String()
			G_App_Setting[key] = value
		}
	}
}

//加载Tags表
func LoadTags() g.Map {
	var G_Tags g.Map = make(g.Map) //TAG标签列表

	res, err := g.DB().GetAll("select * from tags")
	if err == nil {
		for _, item := range res {
			key := item["id"].String()
			value := item["caption"].String()
			G_Tags[key] = value
		}
	}
	return G_Tags
}
