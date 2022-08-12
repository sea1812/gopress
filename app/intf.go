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
