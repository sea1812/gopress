package app

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

func PagePage(r *ghttp.Request) {
	//获取页面ID
	pageid := r.GetInt("id")
	if pageid == 0 {
		r.Response.RedirectTo("/")
	} else {
		//输出页面
		_ = r.Response.WriteTpl("fbase.html", g.Map{
			"app":        G_App_Setting,
			"contentTpl": "front_page.html",
			"navlinks":   LoadNavLinks(),
			"page":       LoadPage(pageid),
		})
	}
}

func PageTags(r *ghttp.Request) {
	//查询所有TAGS
	tags := LoadTags()
	//输出页面
	_ = r.Response.WriteTpl("fbase.html", g.Map{
		"app":        G_App_Setting,
		"contentTpl": "front_tags.html",
		"navlinks":   LoadNavLinks(),
		"tags":       tags,
	})
}

func PageArticle(r *ghttp.Request) {
	//获取文章ID
	postid := r.GetInt("id")
	if postid == 0 {
		r.Response.RedirectTo("/") //如果文章ID=0则转向首页
	} else {
		//查询文件内容
		mPost := LoadPost(postid)
		//输出页面
		_ = r.Response.WriteTpl("fbase.html", g.Map{
			"app":        G_App_Setting,
			"contentTpl": "front_post.html",
			"navlinks":   LoadNavLinks(),
			"post":       mPost,
		})
	}
}

func PageIndex(r *ghttp.Request) {
	//获取页码
	mPageNo := r.GetInt("p")
	if mPageNo <= 0 {
		mPageNo = 1
	}
	//获取最大页码
	mTotal := QueryTotalPage(0)
	//输出页面
	_ = r.Response.WriteTpl("fbase.html", g.Map{
		"app":         G_App_Setting,
		"contentTpl":  "front_index.html",
		"bottomJs":    "front_index_js.html",
		"navlinks":    LoadNavLinks(),
		"posts":       LoadPosts(mPageNo),
		"totalpage":   mTotal,
		"currentpage": mPageNo,
	})
}

func PageTag(r *ghttp.Request) {
	//获取Tag
	mTagId := r.GetInt("id")
	if mTagId == 0 {
		r.Response.RedirectTo("/") //没有指定Tag则返回到首页
	} else {
		//获取页码
		mPageNo := r.GetInt("p")
		if mPageNo <= 0 {
			mPageNo = 1
		}
		//获取最大页码
		mTotal := QueryTotalPage(mTagId)
		//输出页面
		_ = r.Response.WriteTpl("fbase.html", g.Map{
			"app":         G_App_Setting,
			"contentTpl":  "front_tag.html",
			"bottomJs":    "front_tag_js.html",
			"navlinks":    LoadNavLinks(),
			"posts":       LoadPostsWithTag(mPageNo, mTagId),
			"totalpage":   mTotal,
			"currentpage": mPageNo,
			"tagid":       mTagId,
		})
	}
}
