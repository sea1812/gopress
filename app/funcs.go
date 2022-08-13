package app

import (
	"fmt"
	"github.com/gogf/gf/frame/g"
	"strconv"
	"strings"
)

func LoadNavLinks() g.List {
	res, _ := g.DB().GetAll("select * from navlinks order by position asc")
	return res.List()
}

func LoadPage(pageid int) g.Map {
	res, _ := g.DB().GetOne("select * from pages where id=?", pageid)
	return res.Map()
}

func LoadPostsWithTag(page int, tagid int) g.List {
	mLines, _ := strconv.Atoi(fmt.Sprint(G_App_Setting["linesperpage"]))
	mFrom := (page - 1) * mLines
	mLimits := mLines
	res, _ := g.DB().GetAll("select * from posts where visible=1 and tags like ? order by pubdate desc limit ? offset ?", "%"+fmt.Sprint(tagid)+",%", mLimits, mFrom)
	//循环数据库，主要是处理Tag
	var mList g.List
	for _, v := range res {
		m := g.Map{
			"id":        v["id"],
			"title":     v["title"],
			"pubdate":   v["pubdate"],
			"titleimg":  v["titleimg"],
			"shortdesc": v["shortdesc"],
			"ctype":     v["ctype"],
			"tags":      ProcessPostTags(fmt.Sprint(v["tags"])),
		}
		mList = append(mList, m)
	}
	fmt.Println(mList)
	return mList
}

func LoadPost(postid int) g.Map {
	res, _ := g.DB().GetOne("select * from posts where id=?", postid)
	m := g.Map{
		"id":        res["id"],
		"title":     res["title"],
		"pubdate":   res["pubdate"],
		"titleimg":  res["titleimg"],
		"shortdesc": res["shortdesc"],
		"ctype":     res["ctype"],
		"content":   res["content"],
		"tags":      ProcessPostTags(fmt.Sprint(res["tags"])),
	}
	return m
}

func LoadPosts(page int) g.List {
	mLines, _ := strconv.Atoi(fmt.Sprint(G_App_Setting["linesperpage"]))
	mFrom := (page - 1) * mLines
	mLimits := mLines
	res, _ := g.DB().GetAll("select * from posts where visible=1 order by pubdate desc limit ? offset ?", mLimits, mFrom)
	//循环数据库，主要是处理Tag
	var mList g.List
	for _, v := range res {
		m := g.Map{
			"id":        v["id"],
			"title":     v["title"],
			"pubdate":   v["pubdate"],
			"titleimg":  v["titleimg"],
			"shortdesc": v["shortdesc"],
			"ctype":     v["ctype"],
			"tags":      ProcessPostTags(fmt.Sprint(v["tags"])),
		}
		mList = append(mList, m)
	}
	//fmt.Println(mList)
	return mList
}

func ProcessPostTags(avalue string) g.List {
	G_Tags := LoadTags()
	var mList g.List
	var mTags = strings.Split(avalue, ",")
	for _, v := range mTags {
		m := g.Map{
			"id":      v,
			"caption": G_Tags[fmt.Sprint(v)],
		}
		mList = append(mList, m)
	}
	return mList
}

//查询最大页码数，tagid=0表示查询全部
func QueryTotalPage(tagid int) int {
	mLines, err := strconv.Atoi(fmt.Sprint(G_App_Setting["linesperpage"]))
	if err != nil {
		mLines = 20
	}
	if mLines == 0 {
		mLines = 20
	}
	var mTotalPage int
	if tagid == 0 {
		//查询全部的页码
		res, _ := g.DB().GetOne("select count(*) as aa from posts where visible=1")

		mTotalPage = res["aa"].Int() / mLines
		if res["aa"].Int()%mLines > 0 {
			mTotalPage = mTotalPage + 1
		}
	} else {
		//查询包含指定tag的页码
		res, _ := g.DB().GetOne("select count(*) as aa from posts where visible=1 and tags like ?", "%"+fmt.Sprint(tagid)+",%")
		mTotalPage = res["aa"].Int() / mLines
		if res["aa"].Int()%mLines > 0 {
			mTotalPage = mTotalPage + 1
		}
	}
	return mTotalPage
}
