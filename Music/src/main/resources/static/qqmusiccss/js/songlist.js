define("js/common/html/songlist.js", function (t, n, s) {
    var a = t("js/common/music.js"), o = a.$, e = a.statistics;
    a.jQueryAjax;

    function l(t, n, s) {
        var i = [], a = u.specilData;
        o.each(t, function (t, n) {
            o.each(a, function (t, s) {
                s.id == n.id && i.push(s)
            })
        }), s && s(null, i)
    }

    var c, r = a.user, u = {
        dir: 0,
        container: o("#songlist"),
        tag: "div",
        isAppend: !1,
        specilData: null,
        byPaging: null,
        specialTpl: null,
        notJumpSingerDetail: !1,
        notJumpAlbumDetail: !1,
        removeModels: !1
    }, d = {
        initSongListenCount: function (t, n, s, i) {
            !function (t, n, s, i) {
                var e = [], l = [];
                if (n = n || {}, s = s || 0, o.each(t, function (t, n) {
                    e.push(n.songmid)
                }), e.length <= 0) return void (i && i({}));
                !function (t, n) {
                    var s = {songmidlist: t.join("|"), utf8: 1}, i = {};
                    a.jQueryAjax.jsonp({
                        url: "//c.y.qq.com/splcloud/fcgi-bin/fcg_getsonglistenstatistic.fcg",
                        data: s,
                        charset: "utf-8",
                        success: function (t) {
                            t && "code" in t && !t.code && o(t.songlist).each(function (t, n) {
                                i[n.songmid] = n.count
                            }), n && n(i)
                        },
                        error: function () {
                            n && n(i)
                        }
                    })
                }(e, function (a) {
                    o.extend(n, a), o.each(n, function (t, n) {
                        s = Math.max(s, n)
                    }), o.each(t, function (t, i) {
                        l.push(o.extend(i, {counts: parseInt(5 * n[i.songmid] / s, 10)}))
                    }), i && i(l)
                })
            }(t, n, s, i)
        }, init: function (t, n) {
            o.extend(u, t), c = t.reportType || a.reportMap.songlist, r.getUin(), p.show(), n && n()
        }, getSongInfo: l, initNoShow: function (t) {
            o.extend(u, t), c = t.reportType || a.reportMap.songlist, r.getUin(), p.initNoShow()
        }
    };
    var p = function () {
        var n = [], s = {}, d = function (t) {
            var n, s = "";
            Array.prototype.join;
            s += '\r\n<div class="mod_songlist_toolbar">\r\n\t<a href="javascript:;" class="mod_btn js_all_play"><i class="mod_btn__icon_play"></i>播放全部</a>\r\n\t<a href="javascript:;" class="mod_btn js_all_fav"><i class="mod_btn__icon_add"></i>添加到</a>\r\n\t<a href="javascript:;" class="mod_btn js_all_down"><i class="mod_btn__icon_down"></i>下载</a>\r\n\t<a href="javascript:;" class="mod_btn js_batch"><i class="mod_btn__icon_batch"></i>批量操作</a>\r\n</div>\r\n<div class="mod_songlist">\r\n\t<ul class="songlist__header">\r\n\t\t<li class="songlist__header_name">歌曲</li>\r\n\t\t<li class="songlist__header_author">歌手</li>\r\n\t\t<li class="songlist__header_album">专辑</li>\r\n\t\t<li class="songlist__header_time">时长</li>\r\n\t</ul>\r\n\t<ul class="songlist__list">\r\n';
            var o = t.list;
            for (i = 0; i < o.length; i++) {
                s += '\r\n\t<li class="', o[i].grp && o[i].grp.length > 0 && (s += "songlist__child"), s += '" mid="' + (null == (n = o[i].songid) ? "" : n) + '" ix="' + (null == (n = o[i].ix) ? "" : n) + '">\r\n\t\t\x3c!-- \r\n\t\thover : songlist__item--hover\r\n\t\t偶数行：songlist__item--even \r\n\t\t--\x3e\r\n\t\t<div class="songlist__item', o[i].disabled && (s += " songlist__item--disable "), s += '" onmouseover="this.className=\'songlist__item songlist__item--hover\'" onmouseout="this.className=\'songlist__item\'">\r\n\t\t    <div class="songlist__edit songlist__edit--check sprite">\r\n\t\t\t<input type="checkbox" class="songlist__checkbox"/>\r\n\t\t    </div>\r\n\t\t    <div class="songlist__songname">\r\n\t\t\t<span class="songlist__songname_txt"><a href="javascript:;" title="' + (null == (n = o[i].songname) ? "" : _.escape(n)) + '">' + (null == (n = o[i].songname) ? "" : _.escape(n)) + "</a></span>\r\n\t\t\t\t\t    ", 1 == o[i].isonly && (s += '\r\n\t\t\t\t\t\t<i class="songlist__icon songlist__icon_exclusive sprite" title="独家"></i>\r\n\t\t\t\t\t    '), s += "\r\n\t\t\t\t\t    ", o[i].vid && (s += ' \r\n\t\t\t\t\t\t<a href="' + (null == (n = a.util.getMvUrl(o[i].vid)) ? "" : n) + '" class="songlist__icon songlist__icon_mv sprite" rel="noopener" target="_blank" title="MV"><span class="icon_txt">MV</span></a>\r\n\t\t\t\t\t    '), s += ' \r\n\t\t\t<div class="mod_list_menu">\r\n\t\t\t    <a href="javascript:;" class="list_menu__item list_menu__play js_play" title="播放">\r\n\t\t\t\t<i class="list_menu__icon_play"></i>\r\n\t\t\t\t<span class="icon_txt">播放</span>\r\n\t\t\t    </a>\r\n\t\t\t    <a href="javascript:;" class="list_menu__item list_menu__add js_fav" title="添加到歌单" aria-haspopup="true">\r\n\t\t\t\t<i class="list_menu__icon_add"></i>\r\n\t\t\t\t<span class="icon_txt">添加到歌单</span>\r\n\t\t\t    </a>\r\n\t\t\t\t', o[i].pay.pay_month && o[i].pay.pay_month > 0 && o[i].pay.pay_down > 0 ? s += '\r\n\t\t\t\t<a href="javascript:;" class="list_menu__item list_menu__down js_down" title="VIP下载" aria-haspopup="true" data-target="menu_down">\r\n\t\t\t\t\t<i class="list_menu__icon_down_vip"></i>\r\n\t\t\t\t\t<span class="icon_txt">VIP下载</span>\r\n\t\t\t\t</a>\r\n\t\t\t\t' : s += '\r\n\t\t\t\t<a href="javascript:;" class="list_menu__item list_menu__down js_down" title="下载" aria-haspopup="true" data-target="menu_down">\r\n\t\t\t\t    <i class="list_menu__icon_down"></i>\r\n\t\t\t\t    <span class="icon_txt">下载</span>\r\n\t\t\t\t</a>\r\n\t\t\t\t', s += '\r\n\t\t\t    <a href="javascript:;" class="list_menu__item list_menu__share js_share" title="分享" aria-haspopup="true">\r\n\t\t\t\t<i class="list_menu__icon_share"></i>\r\n\t\t\t\t<span class="icon_txt">分享</span>\r\n\t\t\t    </a>\r\n\t\t\t</div>\r\n\t\t    </div>\r\n\t\t    <div class="songlist__artist">\r\n\t\t\t';
                for (var e = 0, l = o[i].singer.length; e < l; e++) {
                    var c = o[i].singer[e];
                    s += "\r\n\t\t\t", e > 0 && (s += "/"), s += '\r\n\t\t\t<a href="javascript:;" data-singermid="' + (null == (n = c.mid) ? "" : n) + '" data-singerid="' + (null == (n = c.id) ? "" : n) + '" title="' + (null == (n = c.name) ? "" : _.escape(n)) + '" class="singer_name">' + (null == (n = c.name) ? "" : _.escape(n)) + "</a>\r\n\t\t\t"
                }
                if (s += '\r\n\t\t    </div>\r\n\t\t    <div class="songlist__album">\r\n\t\t\t<a data-albummid="' + (null == (n = o[i].albummid) ? "" : n) + '" data-albumid="' + (null == (n = o[i].albumid) ? "" : n) + '" href="javascript:;" title="' + (null == (n = o[i].albumname) ? "" : _.escape(n)) + '" class="album_name">' + (null == (n = o[i].albumname) ? "" : _.escape(n)) + '</a>\r\n\t\t    </div>\r\n\t\t    <div class="songlist__time">' + (null == (n = o[i].playTime) ? "" : n) + '</div>\r\n\t\t    <div class="songlist__other">\r\n\t\t\t', 1 == o[i].action.soso && (s += '\r\n\t\t\t<a href="javascript:;" class="icon_sosomusic sprite">无版权</a>\r\n\t\t\t'), s += "\r\n\t\t\t", o[i].grp && o[i].grp.length > 0 && (s += '\r\n\t\t\t<button class="icon_song_group icon_song_group--up sprite"><span class="icon_txt" title="(' + (null == (n = o[i].grp.length) ? "" : n) + ')">展开</span></button>\r\n\t\t\t'), s += "\r\n\t\t    </div>\r\n\t\t</div>\r\n\t\t", o[i].grp && o[i].grp.length > 0) {
                    s += '\r\n\t\t<ul class="songlist__list" style="display:none;">\r\n\t\t';
                    for (var r = 0, u = o[i].grp.length; r < u; r++) {
                        var d = o[i].grp[r];
                        s += '\t\t    <li mid="' + (null == (n = d.songid) ? "" : n) + '" ix="' + (null == (n = d.ix) ? "" : n) + '">\r\n\t\t\t<div class="songlist__item', d.disabled && (s += " songlist__item--disable "), s += '" onmouseover="this.className=\'songlist__item songlist__item--hover\'" onmouseout="this.className=\'songlist__item\'">\r\n\t\t\t    <div class="songlist__edit sprite">\r\n\t\t\t\t<input type="checkbox" class="songlist__checkbox"/>\r\n\t\t\t    </div>\r\n\r\n\t\t\t    <div class="songlist__songname">\r\n\t\t\t\t<span class="songlist__songname_txt"><a href="javascript:;" title="' + (null == (n = d.songname) ? "" : _.escape(n)) + '">' + (null == (n = d.songname) ? "" : _.escape(n)) + '</a></span>\r\n\t\t\t\t<div class="mod_list_menu">\r\n\t\t\t\t    <a href="javascript:;" class="list_menu__item list_menu__play js_play" title="播放">\r\n\t\t\t\t\t<i class="list_menu__icon_play"></i>\r\n\t\t\t\t\t<span class="icon_txt">播放</span>\r\n\t\t\t\t    </a>\r\n\t\t\t\t    <a href="javascript:;" class="list_menu__item list_menu__add js_fav" title="添加到歌单" aria-haspopup="true">\r\n\t\t\t\t\t<i class="list_menu__icon_add"></i>\r\n\t\t\t\t\t<span class="icon_txt">添加到歌单</span>\r\n\t\t\t\t    </a>\r\n\t\t\t\t', d.pay.pay_month && d.pay.pay_month > 0 && d.pay.pay_down > 0 ? s += '\r\n\t\t\t\t<a href="javascript:;" class="list_menu__item list_menu__down js_down" title="VIP下载" aria-haspopup="true" data-target="menu_down">\r\n\t\t\t\t\t<i class="list_menu__icon_down_vip"></i>\r\n\t\t\t\t\t<span class="icon_txt">VIP下载</span>\r\n\t\t\t\t</a>\r\n\t\t\t\t' : s += '\r\n\t\t\t\t<a href="javascript:;" class="list_menu__item list_menu__down js_down" title="下载" aria-haspopup="true" data-target="menu_down">\r\n\t\t\t\t    <i class="list_menu__icon_down"></i>\r\n\t\t\t\t    <span class="icon_txt">下载</span>\r\n\t\t\t\t</a>\r\n\t\t\t\t', s += '\r\n\t\t\t\t    <a href="javascript:;" class="list_menu__item list_menu__share js_share" title="分享" aria-haspopup="true">\r\n\t\t\t\t\t<i class="list_menu__icon_share"></i>\r\n\t\t\t\t\t<span class="icon_txt">分享</span>\r\n\t\t\t\t    </a>\r\n\t\t\t\t</div>\r\n\t\t\t    </div>\r\n\t\t\t    <div class="songlist__artist">\r\n\t\t\t\t';
                        for (e = 0, l = d.singer.length; e < l; e++) {
                            c = d.singer[e];
                            s += "\r\n\t\t\t\t", e > 0 && (s += "/"), s += '\r\n\t\t\t\t<a href="javascript:;" data-singermid="' + (null == (n = c.mid) ? "" : n) + '" data-singerid="' + (null == (n = c.id) ? "" : n) + '" title="' + (null == (n = c.name) ? "" : _.escape(n)) + '" class="singer_name">' + (null == (n = c.name) ? "" : _.escape(n)) + "</a>\r\n\t\t\t\t"
                        }
                        s += '\r\n\t\t\t    </div>\r\n\t\t\t    <div class="songlist__album">\r\n\t\t\t<a data-albummid="' + (null == (n = d.albummid) ? "" : n) + '" data-albumid="' + (null == (n = d.albumid) ? "" : n) + '" href="javascript:;" title="' + (null == (n = d.albumname) ? "" : _.escape(n)) + '" class="album_name">' + (null == (n = d.albumname) ? "" : _.escape(n)) + '</a>\r\n\t\t\t    </div>\r\n\t\t\t    <div class="songlist__time">' + (null == (n = o[i].playTime) ? "" : n) + '</div>\r\n\t\t\t    <div class="songlist__other">\r\n\t\t\t\t', 1 == d.action.soso && (s += '\r\n\t\t\t\t<a href="javascript:;" class="icon_sosomusic sprite">无版权</a>\r\n\t\t\t\t'), s += "\r\n\t\t\t    </div>\r\n\t\t\t</div>\r\n\t\t    </li>\r\n\t\t    "
                    }
                    s += "\r\n\t\t</ul>\r\n\t\t"
                }
                s += "\r\n\t\t</li>\r\n\t"
            }
            return s += "\r\n\t</ul>\r\n</div>"
        }, p = {}, g = function () {
            function s(t) {
                var n = [];
                if (t instanceof Array) return o.each(t, function (t, s) {
                    if (p[s] && p[s].songid > 0) {
                        var i = p[s];
                        i.ix = parseInt(o('li[mid="' + i.songid + '"]', u.container).attr("ix")), n.push(i)
                    }
                }), n;
                if (p[t] && p[t].songid > 0) {
                    var s = p[t];
                    s.ix = parseInt(o('li[mid="' + s.songid + '"]', u.container).attr("ix")), n.push(s)
                }
                return n
            }

            function i() {
                var t = o("div.songlist__edit--check", u.container), n = [];
                return o.each(t, function (t, s) {
                    n.push(o(s).parents("li").attr("mid"))
                }), s(n)
            }

            function e(t, n, i) {
                l(s(t), 0, function (t, s) {
                    i && "player" == i ? u.actions.play(s, n, function () {
                    }) : a.player.play(s, 1, null, null, c)
                })
            }

            function r(t, s) {
                var i = [], e = {}, l = {};
                o.each(t, function (t, n) {
                    l[n.songid] = n.songid
                });
                for (var c = 0, r = n.length; c < r; c++) {
                    var _ = n[c];
                    _.songid in l || (i.push(_), e[_.songid] = _)
                }
                i = a.player.formatMusics(i), n = i, p = e;
                var g = (u.specialTpl || d)({list: i});
                u.container.html(g), s && s()
            }

            return {
                setCurrentSongs: function (t, n) {
                    t.hasClass("js_child") && (n.preventDefault(), n.stopPropagation()), o(".songlist__item").removeClass("songlist__item--current"), t.addClass("songlist__item--current")
                }, cutSong: e, gotoSong: function (t, n) {
                    if (parseInt(t) > 2e13) return e(t), !1;
                    var i = s(t)[0], o = {mid: i.songmid ? i.songmid : i.songid};
                    i.songtype && (o.songtype = i.songtype), i.songid && (o.id = i.songid), i.shareuin && (o.shareuin = i.shareuin), i.disstid && (o.disstid = i.disstid), n && (o.stat = n), a.util.gotoSongdetail(o)
                }, share: function (n, i) {
                    l(s(i), 0, function (s, i) {
                        i[0].action.share && 5 != i[0].songtype ? t.async("js/common/share.js", function (t) {
                            t.show({
                                sharetype: 0,
                                mid: i[0].songtype > 0 ? i[0].songid : i[0].songmid,
                                songtype: i[0].songtype
                            }, n)
                        }) : t.async("js/common/showMsg.js", function (t) {
                            t(i[0])
                        })
                    })
                }, downloadSong: function (n) {
                    l(s(n), 0, function (n, s) {
                        t.async("js/common/download.js", function (t) {
                            t.show(s)
                        })
                    })
                }, deleteSong: function (t, n) {
                    var i = s(t);
                    if (i.length > 0) if (n) m("确定要删除该歌曲？ ", null, null, function () {
                        var t = i;
                        r(t, function () {
                            o(document).trigger("delete", {data: t})
                        })
                    }); else {
                        var e = i;
                        r(e, function () {
                            o(document).trigger("delete", {data: e})
                        })
                    } else a.popup.show("请选择操作的单曲", 3e3, 1)
                }, setFav: function (n, i) {
                    l(s(i), 0, function (s, i) {
                        t.async("js/common/fav.js", function (t) {
                            t.show({sharetype: 0, songs: i}, n)
                        })
                    })
                }, chooseSong: function (t) {
                    alert("chooseSong" + JSON.stringify(s(t)))
                }, gotoSinger: function (t, n) {
                    a.util.gotoSinger({singermid: t, stat: n})
                }, gotoAlbum: function (t, n) {
                    a.util.gotoAlbum({albummid: t, stat: n})
                }, playall: function (t) {
                    l(i(), 0, function (t, n) {
                        a.player.play(n, 1, null, null, c)
                    })
                }, downloadall: function (n) {
                    i().length > 0 ? l(i(), 0, function (n, s) {
                        t.async("js/common/download.js", function (t) {
                            t.show(s)
                        })
                    }) : a.popup.show("请选择操作的单曲", 3e3, 1)
                }, favall: function (n) {
                    i().length > 0 ? l(i(), 0, function (s, i) {
                        t.async("js/common/fav.js", function (t) {
                            t.show({sharetype: 0, songs: i}, n)
                        })
                    }) : a.popup.show("请选择操作的单曲", 3e3, 1)
                }, likeall: function (n) {
                    i().length > 0 ? l(i(), 0, function (n, s) {
                        t.async("js/common/fav.js", function (t) {
                            t.favToTaoge(s, 201, function () {
                            })
                        })
                    }) : a.popup.show("请选择操作的单曲", 3e3, 1)
                }, deleteall: function (t, n) {
                    if (i().length > 0 || n) {
                        t.preventDefault(), t.stopPropagation();
                        var e = i(), l = "确定要删除歌曲？";
                        n && (e = function () {
                            var t = o("li", u.container), n = [];
                            return o.each(t, function (t, s) {
                                n.push(o(s).attr("mid"))
                            }), s(n)
                        }(), l = "确定要清空列表？"), e.length > 0 && m(l, null, null, function () {
                            r(e, function () {
                                o(document).trigger("delete", {data: e})
                            })
                        })
                    } else a.popup.show("请选择操作的单曲", 3e3, 1)
                }, getsongInfo: function (t) {
                    return s(t)
                }
            }
        }();

        function h(t) {
            u.isAppend && o(u.tag, u.container).length;
            var n = (u.specialTpl || d)({list: t});
            u.isAppend ? u.container.append(n) : u.isPreAppend ? u.container.prepend(n) : (u.specilData && u.byPaging, u.container.html(n)), u.callback && u.callback()
        }

        function m(n, s, i, a) {
            t.async("js/common/dialog.js", function (t) {
                t.show({
                    mode: "common",
                    title: "QQ音乐",
                    icon_type: 2,
                    sub_title: n,
                    desc: s,
                    button_info1: {
                        highlight: 1, title: i || "确定", fn: function () {
                            t.hide(), a && a()
                        }
                    },
                    button_info2: {
                        highlight: 0, title: "取消", fn: function (n) {
                            t.hide()
                        }
                    }
                })
            })
        }

        function f() {
            o(".mod_songname_menu__like").length;
            u.container;
            u.container.on("cut", "", function () {
                return !1
            }).on("copy", "", function () {
            }).off("dblclick", "li").on("dblclick", "li", function (t) {
                a.player.checkPlayerWindow();
                var n = a.util.getTarget(t);
                if (o(n).parents(".mod_list_menu").length > 0) return !1;
                var s = o(this).data("page"), i = o(this).attr("mid");
                s && "player" == s ? g.cutSong(i, 0, s) : g.cutSong(i);
                var l = o(this).data("stat") || "";
                return l && e.pgvClickStat(l), !1
            }).off("click", ".js_play").on("click", ".js_play", function (t) {
                a.player.checkPlayerWindow();
                var n = o(this).parents("li").attr("mid"), s = o(this).data("page");
                if (g.setCurrentSongs(o(this).parents("div.songlist__item"), t), s && "player" == s) {
                    var i = o(".list_menu__icon_pause", o(this)).length > 0;
                    g.cutSong(n, i ? 1 : 0, s)
                } else g.cutSong(n);
                var l = o(this).data("stat") || "";
                return l && e.pgvClickStat(l), !1
            }).off("click", ".js_song").on("click", ".js_song", function (t) {
                var n = o(this).parents("li").attr("mid"), s = o(this).attr("data-stat"), i = o(this).data("page");
                return (!i || "player" != i) && (g.setCurrentSongs(o(this).parents("div.songlist__item"), t), g.gotoSong(n, s), !1)
            }).off("click", ".js_share").on("click", ".js_share", function (t) {
                t.preventDefault(), t.stopPropagation(), g.setCurrentSongs(o(this).parents("div.songlist__item"), t);
                var n = o(this).parents("li").attr("mid");
                g.share(t, n);
                var s = o(this).data("stat") || "";
                return s && e.pgvClickStat(s), !1
            }).off("click", ".js_song_li").on("click", ".js_song_li", function (t) {
                return g.setCurrentSongs(o(this), t), !1
            }).off("click", ".js_down").on("click", ".js_down", function (t) {
                var n = o(this).parents("li").attr("mid");
                g.setCurrentSongs(o(this).parents("div.songlist__item"), t), g.downloadSong(n);
                var s = o(this).data("stat") || "";
                return s && e.pgvClickStat(s), !1
            }).off("click", ".js_delete").on("click", ".js_delete", function (t) {
                var n = o(this).parents("li").attr("mid");
                g.setCurrentSongs(o(this).parents("div.songlist__item"), t);
                var s = o(this).data("confirm") || "";
                g.deleteSong(n, s);
                var i = o(this).data("stat") || "";
                return i && e.pgvClickStat(i), !1
            }).off("click", ".js_fav").on("click", ".js_fav", function (t) {
                var n = o(this).parents("li").attr("mid");
                g.setCurrentSongs(o(this).parents("div.songlist__item"), t), g.setFav(t, n);
                var s = o(this).data("stat") || "";
                return s && e.pgvClickStat(s), !1
            }).off("click", ".album_name").on("click", ".album_name", function (t) {
                var n = o(this).data("albummid"), s = o(this).data("albumid"), i = o(this).data("stat");
                return g.setCurrentSongs(o(this).parents("div.songlist__item"), t), s > 0 && g.gotoAlbum(n, i), !1
            }).off("click", "input.songlist__checkbox").on("click", "input.songlist__checkbox", function (t) {
                if (o(this).parents(".songlist__edit").toggleClass("songlist__edit--check"), o(this).hasClass("js_check_all")) {
                    var n = o(this).data("stat") || "";
                    n && e.pgvClickStat(n), o(this).parents(".songlist__edit").hasClass("songlist__edit--check") ? o("input.songlist__checkbox").parents(".songlist__edit").addClass("songlist__edit--check") : o("input.songlist__checkbox").parents(".songlist__edit").removeClass("songlist__edit--check")
                } else o(this).parents(".songlist__edit").hasClass("songlist__edit--check") || o("input.js_check_all").parents(".songlist__edit").removeClass("songlist__edit--check");
                return !1
            }), o(document).on("cut", "", function () {
                return !1
            }).on("copy", "", function (t) {
            }).off("click", ".js_all_play").on("click", ".js_all_play", function (t) {
                a.player.checkPlayerWindow(), g.playall(t);
                var n = o(this).data("stat") || "";
                return n && e.pgvClickStat(n), !1
            }).off("click", ".js_all_down").on("click", ".js_all_down", function (t) {
                g.downloadall(t);
                var n = o(this).data("stat") || "";
                return n && e.pgvClickStat(n), !1
            }).off("click", ".js_all_fav").on("click", ".js_all_fav", function (t) {
                g.favall(t);
                var n = o(this).data("stat") || "";
                return n && e.pgvClickStat(n), !1
            }).off("click", ".js_all_like").on("click", ".js_all_like", function (t) {
                g.likeall(t);
                var n = o(this).data("stat") || "";
                return n && e.pgvClickStat(n), !1
            }).off("click", ".js_all_delete").on("click", ".js_all_delete", function (t) {
                g.deleteall(t);
                var n = o(this).data("stat") || "";
                return n && e.pgvClickStat(n), !1
            }).off("click", ".js_all_deleted").on("click", ".js_all_deleted", function (t) {
                g.deleteall(t, !0);
                var n = o(this).data("stat") || "";
                return n && e.pgvClickStat(n), !1
            }).off("click", ".js_batch").on("click", ".js_batch", function (t) {
                var n = o(this).data("stat") || "";
                n && e.pgvClickStat(n);
                var s = o(".mod_songlist", u.container);
                return s.length <= 0 && (s = u.container.parents(".mod_songlist")), s.toggleClass("mod_songlist--edit"), s.hasClass("mod_songlist--edit") ? (o(".songlist__edit").addClass("songlist__edit--check"), o(".songlist__edit").show(), o(".js_foot_batch").show(), o(this).html('<i class="mod_btn__icon_batch"></i>取消批量操作')) : (o(".songlist__edit").hide(), o(".js_foot_batch").hide(), o(this).html('<i class="mod_btn__icon_batch"></i>批量操作'), o("div.songlist__edit").addClass("songlist__edit--check"), o("li.js_songlist__child ul.songlist__list div.songlist__edit", u.container).removeClass("songlist__edit--check")), !1
            }).off("click", "input.songlist__checkbox").on("click", "input.songlist__checkbox", function (t) {
                if (t.preventDefault(), t.stopPropagation(), o(this).parents(".songlist__edit").toggleClass("songlist__edit--check"), o(this).hasClass("js_check_all")) {
                    var n = o(this).data("stat") || "";
                    n && e.pgvClickStat(n), o(this).parents(".songlist__edit").hasClass("songlist__edit--check") ? o("input.songlist__checkbox").parents(".songlist__edit").addClass("songlist__edit--check") : o("input.songlist__checkbox").parents(".songlist__edit").removeClass("songlist__edit--check")
                } else o(this).parents(".songlist__edit").hasClass("songlist__edit--check") || o("input.js_check_all").parents(".songlist__edit").removeClass("songlist__edit--check");
                return !1
            }).off("click", ".icon_sosomusic").on("click", ".icon_sosomusic", function (n) {
                var s = o(this).parents("li").attr("mid"), i = g.getsongInfo(s)[0];

                function e(t) {
                    o("#js_sosopopup").length <= 0 && o("body").append('<div class="popup_data_detail songlist_tips" id="js_sosopopup" style="display:none;position:absolute;"></div>'), o("#js_sosopopup").html('   <div class="popup_data_detail__cont">       <p>' + i.songname.HtmlEncode() + "</p>" + t + '   </div>   <i class="popup_data_detail__arrow"></i>').css({
                        top: n.pageY + 15,
                        left: n.pageX - 255
                    }).show(), o(document).on("click", function (t) {
                        var n = a.util.getTarget(t);
                        if (o(n).parents("div.popup_data_detail__cont").length > 0 || o(n).hasClass("popup_data_detail__cont") || o(n).hasClass("icon_sosomusic")) return !1;
                        o("#js_sosopopup").hide()
                    })
                }

                if (26 == i.msgid) {
                    var l = {};
                    o.extend(l, i), l.alertid = 0, t.async("js/common/showMsg.js", function (t) {
                        t(l, null, null, function (t) {
                            e('       <p class="c_tx_thin">来源：' + t + "</p>")
                        })
                    })
                } else a.jQueryAjax.jsonp({
                    url: "//c.y.qq.com/soso/fcgi-bin/music_geturl.fcg?n=1&w=" + encodeURIComponent(i.songname + " " + i.singer[0].name),
                    data: {},
                    charset: "utf-8",
                    success: function (t) {
                        var n;
                        e('<p class="c_tx_thin">来源：' + (1644649 == parseInt(i.songid) || 1644638 == parseInt(i.songid) ? "http://play.baidu.com/?__m=mboxCtrl.playSong&__a=" + {
                            1644649: 20752568,
                            1644638: 20752505
                        }[i.songid] + "&__o=/||newIcon" : t.data && t.data.url || (n = i, n.stream || (n.stream = 0), n.stream = parseInt(n.stream, 10), n.stream - 1 < 0 && !/\.weiyun\./.test(n.mshowurl) ? n.mshowurl : "http://" + ["116.28.66.253", "116.28.63.250", "116.28.63.250", "116.28.66.253", "121.9.210.27", "121.9.210.27", "121.9.210.102", "121.9.210.102", "121.9.210.27", "121.9.210.102"][n.stream] + "/" + (parseInt(n.songid) + 3e7) + ".mp3")) + '</p>       <p class="c_tx_thin">该歌曲来自第三方网站</p>')
                    },
                    error: function () {
                    }
                })
            }), setTimeout(function () {
                o(document).off("click", ".icon_song_group").on("click", ".icon_song_group", function (t) {
                    return t.preventDefault(), t.stopPropagation(), o(this).hasClass("icon_song_group--up") ? (o(this).removeClass("icon_song_group--up"), o(this).addClass("icon_song_group--down"), o(this).parents("li").addClass("songlist__child"), o("ul.songlist__list", o(this).parents("li")).show()) : (o(this).addClass("icon_song_group--up"), o(this).removeClass("icon_song_group--down"), o(this).parents("li").removeClass("songlist__child"), o("ul.songlist__list", o(this).parents("li")).hide()), !1
                }), window.song_group = function (t, n) {
                    try {
                        n.preventDefault(), n.stopPropagation()
                    } catch (t) {
                    }
                    return o(t).hasClass("icon_song_group--up") ? (o(t).removeClass("icon_song_group--up"), o(t).addClass("icon_song_group--down"), o(t).parents("li").addClass("songlist__child"), o("ul.songlist__list", o(t).parents("li")).show()) : (o(t).addClass("icon_song_group--up"), o(t).removeClass("icon_song_group--down"), o(t).parents("li").removeClass("songlist__child"), o("ul.songlist__list", o(t).parents("li")).hide()), !1
                }
            }, 800)
        }

        return {
            show: function () {
                f(), function () {
                    if (u.specilData) {
                        u.specilData = a.player.formatMusics(u.specilData, 0 == u.from ? 0 : u.from || n.length), setTimeout(function () {
                            o.each(u.specilData, function (t, n) {
                                (n.songid || n.data.songid) && (p[n.songid || n.data.songid] = n.data || n, o.each(n.grp, function (t, n) {
                                    p[n.songid] = n
                                }))
                            })
                        }, 0);
                        var i = a.player.formatMusics(u.specilData, 0 == u.from ? 0 : u.from || n.length);
                        r.getUin() > 1e4 ? t.async("js/common/fav.js", function (t) {
                            t.combineData(i, function (t) {
                                n = u.isAppend ? n.concat(t) : t, o.each(n, function (t, n) {
                                    s[n.songid] = n
                                }), h(t)
                            })
                        }) : (n = u.isAppend ? n.concat(data) : i, o.each(n, function (t, n) {
                            s[n.songid] = n
                        }), h(i))
                    }
                }()
            }, initNoShow: function () {
                f(), u.specilData && (u.specilData = a.player.formatMusics(u.specilData, 0 == u.from ? 0 : u.from || n.length), o.each(u.specilData, function (t, n) {
                    (n.songid || n.data.songid) && (p[n.songid || n.data.songid] = n.data || n, o.each(n.grp, function (t, n) {
                        p[n.songid] = n
                    }))
                }))
            }
        }
    }();
    return d
});