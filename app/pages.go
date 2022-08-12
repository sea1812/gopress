package app

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

func PageIndex(r *ghttp.Request) {
	_ = r.Response.WriteTpl("fbase.html", g.Map{
		//"app":           G_App_Setting,
		"contentTpl": "front_index.html",
		"bottomJs":   "front_index_js.html",
		"activeband": "dashboard",
		//"category"	:	 category,
		//"catdict"	:	 catdict,
		//"articles"	:	 articles,
		//"page" 		:	 mpage,
		//"pages"		:	 pagelist,
		//"headlines"	:	 headlines,
	})

}
