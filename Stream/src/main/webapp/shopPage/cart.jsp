<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!--购物车-->
<!DOCTYPE>
<html>
<head>
     <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta content="英雄联盟,LOL,英雄联盟周边商城, 英雄联盟周边,英雄联盟商城, 英雄周边,英雄联盟手办,英雄联盟毛绒,英雄联盟公仔,英雄联盟海报,英雄联盟连帽衫,英雄联盟鼠标垫,LOL周边商城, LOL周边,LOL商城,LOL手办,LOL毛绒,LOL公仔,LOL海报,LOL连帽衫,LOL鼠标垫,卡牌大师,吉格斯手办,盖伦手办,金克丝手办,娜美手办,卡特琳娜手办,锤石,提莫帽子,英雄原型,男女服饰,海报艺术,手办毛绒,LOL,法师,刺客,坦克,射手,辅助,游戏周边,周边商城,游戏周边商城,腾讯周边商城腾讯互动娱乐周边商城"
          name="Keywords">
    <meta name="description"
          content="英雄联盟周边商城--打造你的英雄联盟生活方式！这是英雄联盟游戏团队服务于玩家，给到玩家更多更优质体验的地方，我们根据玩家喜爱的英雄原型，设计并制作很多好玩的实物周边，让英雄联盟走入你的生活，而不仅仅在电脑前。英雄联盟周边商城由腾讯公司搭建并服务于玩家，深圳市合泰文化发展有限公司为周边商城提供客服及物流等服务支持。"/>
    <title>购物车-英雄联盟周边商城</title>
    <link rel="icon" href="./images/favicon.ico" type="image/x-icon"/>
    <link href="./css/buy.css" rel="stylesheet" type="text/css">
    <!--[if !IE]>支付<![endif]-->
    <link href="./css/usabase.css" rel="stylesheet" type="text/css">
    <!--[if !IE]>共用样式表<![endif]-->
    <link href="./css/member.css" rel="stylesheet" type="text/css">
    <style>
        .topbar {
            height: 80px;
        }

        .menubar {
            display: none;
        }
    </style>

<body>
<!--顶部-->
<div class="topbar wfull">
<div class="top clearfix">
    <div class="logobar fl">
        <a class="logo" href="/index.shtml?CLICKTAG=lolriotmall.pc.index.logo" title="英雄联盟周边商城"></a>
    </div>
    <div class="top_mem fr" id="topHead">
        <!-- 登录状态 -->
        <div class="login-bar">
            <div id="logined" class="fl logined-box clearfix" style="display: none;">
                <span>欢迎您 ,</span>
                <div class="fl login-user clearfix">
                    <span style="display:none" id="login_userFace_span"></span>
                    <span style="display:none" id="login_qq_span"></span>
                    <b id="login_nickname_span"></b>
                    <i class="fl ico-menu marrl"></i>
                    <div class="menu-downbox">
                        <div class="downbox-bg"></div>
                        <ul class="menu-downlist clearfix">
                            <li class="first">
                                <a href="/user/orderlist.shtml" class="downlist-link" title="我的订单">我的订单</a>
                            </li>
                            <li>
                                <a href="/user/favorlist.shtml" class="downlist-link" title="我的收藏">我的收藏</a>
                            </li>
                            <li>
                                <a href="/user/userinfo.shtml" class="downlist-link" title="个人信息">个人信息</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <a href="javascript:logout();">退出</a>
            </div>
            <!-- 未登录状态 -->
            <a id="unlogin" href="javascript:login();" class="qqlogin">
                <i class="fl ico-menu mqq"></i>
                <span class="mtxt">用QQ账号登录</span>
            </a>
            <a href="/cart.shtml?CLICKTAG=lolriotmall.pc.index.cart" class="menu-cart clearfix">
                <i class="fl ico-menu mcart"></i>
                <span class="mtxt">购物车</span>
                <span id="headerCartNum" class="ico-menu mpoint">0</span>
            </a>
            <div href="javascript:;" class="fl menu-ser clearfix">
                <i class="fl ico-menu mser"></i>
                <span class="mtxt">客服咨询</span>
                <i class="fl ico-menu marrl"></i>
                <div class="menu-downbox">
                    <div class="downbox-bg"></div>
                    <ul class="menu-downlist">
                        <li class="first">
                            <a id="qq_qian" href="javascript:;" class="downlist-link" title="售前咨询">售前咨询</a>
                        </li>
                        <li>
                            <a id="qq_hou" href="javascript:;" class="downlist-link" title="售后咨询">售后咨询</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="fl lolweixin clearfix">
                <i class="fl ico-menu mwxin"></i>
                <span class="mtxt">微信商城</span>
                <i class="fl ico-menu marrl"></i>
                <div class="mwx-code">
                    <div class="mwx-codebg"></div>
                    <div class="mwx-codeimg">
                        <img src="./images/wxcode.png" width="83" height="82" alt="微信二维码">
                    </div>
                    <p class="mwx-txt">扫码手机购买</p>
                </div>
            </div>
        </div>
        <div class="top_qqtip">
            QQ登录中<font>...</font>
        </div>
    </div>
</div>
<!--[if !IE]>导航栏<![endif]-->
<div class="menubar clearfix">
    <!--主导航栏-->
    <ul id="blk_nav" class="menu_zhong fl">          <li class="menu_zhongli">
        <a id="menu_45" href="/index.shtml?CLICKTAG=lolriotmall.pc.index.nav45">商城首页</a>
    </li>
        <li class="menu_zhongli">
            <a id="menu_46" href="/list.shtml?catid=101&amp;CLICKTAG=lolriotmall.pc.index.nav46">雕塑手办</a>
            <div class="submenu clearfix">
                <ul class="fl submenu-list">
                    <li>
                        <a href="/list.shtml?catid=121&amp;CLICKTAG=lolriotmall.pc.index.nav46_subNav51" class="submenu-link" parentid="menu_46">大型雕塑</a>
                    </li>
                    <li>
                        <a href="/list.shtml?catid=122&amp;CLICKTAG=lolriotmall.pc.index.nav46_subNav52" class="submenu-link" parentid="menu_46">中型雕塑</a>
                    </li>
                    <li>
                        <a href="/list.shtml?catid=208&amp;CLICKTAG=lolriotmall.pc.index.nav46_subNav66" class="submenu-link" parentid="menu_46">限定款手办</a>
                    </li>
                    <li>
                        <a href="/list.shtml?catid=209&amp;CLICKTAG=lolriotmall.pc.index.nav46_subNav67" class="submenu-link" parentid="menu_46">手办</a>
                    </li>
                </ul>
                <a class="fr subm-img" href="/list.shtml?catid=101&amp;CLICKTAG=lolriotmall.pc.index.nav46_navIcon46">
                    <img src="./images/20170622170047_844267.jpg" width="81" height="81" alt="雕塑手办">
                </a>
            </div>
        </li>
        <li class="menu_zhongli">
            <a id="menu_47" href="/list.shtml?catid=119&amp;CLICKTAG=lolriotmall.pc.index.nav47">毛绒玩偶</a>
            <div class="submenu clearfix">
                <ul class="fl submenu-list">
                    <li>
                        <a href="/list.shtml?catid=125&amp;CLICKTAG=lolriotmall.pc.index.nav47_subNav54" class="submenu-link" parentid="menu_47">玩偶</a>
                    </li>
                    <li>
                        <a href="/list.shtml?catid=126&amp;CLICKTAG=lolriotmall.pc.index.nav47_subNav55" class="submenu-link" parentid="menu_47">帽子</a>
                    </li>
                </ul>
                <a class="fr subm-img" href="/list.shtml?catid=119&amp;CLICKTAG=lolriotmall.pc.index.nav47_navIcon47">
                    <img src="./images/20170622162123_179921.png" width="81" height="81" alt="毛绒玩偶">
                </a>
            </div>
        </li>
        <li class="menu_zhongli">
            <a id="menu_48" href="/list.shtml?catid=120&amp;CLICKTAG=lolriotmall.pc.index.nav48">男女服饰</a>
            <div class="submenu clearfix">
                <ul class="fl submenu-list">
                    <li>
                        <a href="/list.shtml?catid=127&amp;CLICKTAG=lolriotmall.pc.index.nav48_subNav59" class="submenu-link" parentid="menu_48">卫衣&amp;夹克</a>
                    </li>
                    <li>
                        <a href="/list.shtml?catid=128&amp;CLICKTAG=lolriotmall.pc.index.nav48_subNav60" class="submenu-link" parentid="menu_48">T恤</a>
                    </li>
                </ul>
                <a class="fr subm-img" href="/list.shtml?catid=120&amp;CLICKTAG=lolriotmall.pc.index.nav48_navIcon48">
                    <img src="http://ossweb-img.qq.com/images/daojushop/zb/navigation/201706/20170622165956_696740.jpg" width="81" height="81" alt="男女服饰">
                </a>
            </div>
        </li>
        <li class="menu_zhongli">
            <a id="menu_49" href="/list.shtml?catid=117&amp;CLICKTAG=lolriotmall.pc.index.nav49">海报艺术</a>
            <div class="submenu clearfix">
                <ul class="fl submenu-list">
                    <li>
                        <a href="/list.shtml?catid=129&amp;CLICKTAG=lolriotmall.pc.index.nav49_subNav70" class="submenu-link" parentid="menu_49">英雄海报</a>
                    </li>
                    <li>
                        <a href="/list.shtml?catid=214&amp;CLICKTAG=lolriotmall.pc.index.nav49_subNav72" class="submenu-link" parentid="menu_49">画册</a>
                    </li>
                </ul>
                <a class="fr subm-img" href="/list.shtml?catid=117&amp;CLICKTAG=lolriotmall.pc.index.nav49_navIcon49">
                    <img src="http://ossweb-img.qq.com/images/daojushop/zb/navigation/201706/20170622170007_999128.jpg" width="81" height="81" alt="海报艺术">
                </a>
            </div>
        </li>
        <li class="menu_zhongli">
            <a id="menu_74" href="/list.shtml?catid=215&amp;CLICKTAG=lolriotmall.pc.index.nav74">LPL队服</a>
            <div class="submenu clearfix">
                <ul class="fl submenu-list">
                    <li>
                        <a href="/list.shtml?catid=218&amp;CLICKTAG=lolriotmall.pc.index.nav74_subNav76" class="submenu-link" parentid="menu_74">队服T恤</a>
                    </li>
                    <li>
                        <a href="/list.shtml?catid=219&amp;CLICKTAG=lolriotmall.pc.index.nav74_subNav77" class="submenu-link" parentid="menu_74">队服裤子</a>
                    </li>
                </ul>
                <a class="fr subm-img" href="/list.shtml?catid=215&amp;CLICKTAG=lolriotmall.pc.index.nav74_navIcon74">
                    <img src="http://ossweb-img.qq.com/images/daojushop/zb/navigation/201706/20170628162725_524866.jpg" width="81" height="81" alt="LPL队服">
                </a>
            </div>
        </li>
        <li class="menu_zhongli">
            <a id="menu_57" href="/list.shtml?catid=116&amp;CLICKTAG=lolriotmall.pc.index.nav57">更多</a>
            <div class="submenu clearfix">
                <ul class="fl submenu-list">
                    <li>
                        <a href="/list.shtml?catid=131&amp;CLICKTAG=lolriotmall.pc.index.nav57_subNav68" class="submenu-link" parentid="menu_57">鼠标垫</a>
                    </li>
                    <li>
                        <a href="/list.shtml?catid=210&amp;CLICKTAG=lolriotmall.pc.index.nav57_subNav69" class="submenu-link" parentid="menu_57">其他</a>
                    </li>
                </ul>
                <a class="fr subm-img" href="/list.shtml?catid=116&amp;CLICKTAG=lolriotmall.pc.index.nav57_navIcon57">
                    <img src="http://ossweb-img.qq.com/images/daojushop/zb/navigation/201706/20170626164713_396902.jpg" width="81" height="81" alt="更多">
                </a>
            </div>
        </li>
    </ul>
    <script id="tmpl_nav" type="text/html">
        {if list && list.length}
        {for item in list}
        <li class="menu_zhongli" >
            <a id="menu_${item.iSeqId}" href="${item.sUrl}{if item.sUrl.indexOf('?') == -1 }?{else}&{/if}CLICKTAG=lolriotmall.pc.index.nav${item.iSeqId}">${item.sName}</a>
            <i class="menu-ico{if item.iTag == 1} ico-hot{elseif item.iTag == 2} ico-new{/if}"></i>
            {if item.subs && item.subs.length}
            <div class="submenu clearfix">
                <ul class="fl submenu-list">
                    {for subItem in item.subs}
                    <li>
                        <a href="${subItem.sUrl}{if subItem.sUrl.indexOf('?') > -1 }&{/if}CLICKTAG=lolriotmall.pc.index.nav${item.iSeqId}_subNav${subItem.iSeqId}" class="submenu-link" parentid="menu_${item.iSeqId}">${subItem.sName}</a>
                    </li>
                    {/for}
                </ul>
                <a class="fr subm-img" href="${item.sUrl}{if item.sUrl.indexOf('?') > -1 }&{/if}CLICKTAG=lolriotmall.pc.index.nav${item.iSeqId}_navIcon${item.iSeqId}">
                    <img src="${item.sIcon}" width="81" height="81" alt="${item.sName}">
                </a>
            </div>
            {/if}
        </li>
        {/for}
        {/if}
    </script>
    <!--[if !IE]>搜索栏<![endif]-->
    <div class="fr sosobar">
        <div class="soso">
            <input name="textfield" type="" class="sosoinp yahei" id="soinp" value="" onfocus="if(this.value==''){this.value='';}"  onblur="if(this.value==''){this.value='';}" />
            <div class="keyword-list">
                <a href="/list.shtml?keyword=卡特琳娜&CLICKTAG=lolriotmall.pc.index.search" title="卡特琳娜">卡特琳娜</a>
                <a href="/list.shtml?keyword=提莫&CLICKTAG=lolriotmall.pc.index.search" title="提莫">提莫</a>
            </div>
            <a href="javascript:searchKeyWord();" class="sosobot"><i class="ico-menu mseach"></i></a>
        </div>
    </div>
    <form id="keyWordSearchForm">
        <input type="hidden" name="keyWord" id="keyWord" value="" />
        <input type="hidden" name="keyType" id="keyType" value="" />
        <input name="start" type="hidden" value="0" id="keyWordStart"/>
    </form>
</div>
</div>

<!--[if !IE]>中部主体<![endif]-->
<div class="mainbar w980 clearf pb30">
    <!--[if !IE]>浏览目录<![endif]-->
    <a id="maintop"></a>
    <div class="mulu">
        <div class="buytopml">
        </div>
    </div>
    <!--登录提示-->
    <div class="buy_qqtit" id="cartLoginDiv" style="display:none;">
        您还没有登录！登录后购物车的商品将保存到您账号中&nbsp;&nbsp;<a href="javascript:qq_login();">QQ登录</a>
    </div>

    <!--[if !IE]>购物车主区域<![endif]-->
    <div class="buybar clearf">
        <div class="buyleft fl">
            <div id="blk_cart_list">
            <div class="buyshop">
                    <!--标头-->
                    <ul class="buyli buytop clearf">
                        <li class="li_inp">
                            <div class="buy_xuanhover">全选</div>
                        </li>
                        <li class="li_sp">商品数量</li>
                        <li class="li_dj">单价(元)</li>
                        <li class="li_sl">数量</li>
                        <li class="li_jg">小计</li>
                        <li class="li_zz">操作</li>
                    </ul>
                    <ul acttype="" class="j-cart-item buyli buylist {if cart.sActType && item_index == cart.sales.length-1 } buylistbr{/if} clearf">
                        <li class="li_inp" acttype="${cart.sActType}" cart-id="${cart.iCartId}" goods-id="${item.goodsInfo.iMallId}">
                                <div class="j-radio {if item.selected} buy_dianhover{else} buy_dian{/if}" cartid="${cart.iCartId}" scartid="${item.iCartId}" {if !item.isMainGood}style="visibility:hidden;"{/if}></div>
                                <div class="j-radio {if item.selected} buy_radiohover {else} buy_radio {/if}" forcart="${cart.iCartId}" saleid="${cart.goodsInfo.iSaleId}" mallid="${item.goodsInfo.iMallId}" stock="${item.goodsInfo.stock}" {if !cart.passLimit}disabled="disabled"{/if}></div>
                                <div class="j-radio">0</div>
                        </li>
                        <li class="li_sp">
                            <div class="buysp clearf">
                                <a href="/detail.shtml?id=1" target="_blank">
                                    <img class="j-img" src="./images/20170622165956_696740.jpg">
                                </a>
                                <div class="buysp_wen fl">
                                    <a class="j-name" href="/detail.shtml?id=1" target="_blank">
                                     
                                       【赠品】
                                        <span class="j-name-text" style="display: inline;"></span>
                                    </a>
                                   
                                            <div class="mycart-item-sel" mallid="1">
                                                <span class="c999 j-attr"><span class="j-attr-name" style="display: inline;">hahah</span>：<span class="j-attr-value" style="display: inline;">6666</span></span>
                                                <i class="ico-menu ico-xg"></i>
                                            </div>
                                </div>
                            </div>
                        </li>
                        <li class="li_dj f14">
                            <span>&yen;<span class="j-price">100</span></span>
                        <br/><span class="cff0">组合价: &yen;100 </span>
                        </li>
                        <li class="li_sl">
                            <div class="buysl">
                              
                                    <a id="jian_cart_1" href="javascript:;">
                                        <img src="./images/buy_jian.jpg">
                                    </a>
                                    <input type="text" name="cartNum" class="buy_inp" id="cartNum2" old_value="1" value="8" maxlength="2" );" disabled="disabled" >
                                    <a id="jia_cart_" href="javascript:;" onclick="upCartNum('7, );" class="sum0" >
                                        <img src="./images/buy_jia.jpg">
                                    </a>
                                    <input type="hidden" id="goodsNo1" value="1">
                                    <input type="hidden" id="canSaleNum_1" value="8">
                              <input type="hidden" name="cartNum" value="8">
                           <span class="cfb6">库存8</span>
                            </div>
                        </li>
                        <li class="li_jg">
                            <span class="f14">&yen;</span>
                            <span class="f14" name="cartFinalPrice">100</span>
                        </li>
                        <li class="li_zz">
                          
                                <a href="javascript:delHandler({if cart.sActType == 3}'1'{else}'1'{/if});" class="c666">删除</a>&nbsp;&nbsp;
                                <a href="javascript:favor(1);" class="c666 j-favor">收藏</a>
                        </li>
                </div>
              </div>
              </div>
                <div class="loadingbox" style="display:none;">
                    <img class="loadingbox-img" src="./images/loading.png" width="167" height="87" alt="loading">
                    <div class="loading-bar">
                        <span class="loading-barbg"></span>
                        <i class="loading-barimg"></i>
                    </div>
                    <p class="loadingbox-msg">loading...</p>
                </div>
            </div>
            <a id="shophot"></a>
            
                    </div>
                </div>
                <!--[if !IE]>热销商品<![endif]-->
                <div id="mod_hot_list" style="display: none;">
                    <div class="buyxgbar">
                        热销商品
                    </div>
                    <div class="buyxgshop">
                        <ul id="blk_hot_list" class="hotshopxg clearf "></ul>
                    </div>
                </div>
            </div>
        </div>

        <!--[if !IE]>购物车右侧<![endif]-->
      
<!-- 活动赠品详细弹窗 -->
<div id="blk_award_panel" class="zpoverlay">

 <a href="javascript:;" class="ico-menu zpol-btn-close">x</a>
    <p class="zpol-tit">赠品</p>
    <div class="zpoverlay-main">
        <div class="zpoverlay-list">
            <p class="zpol-list-tip">满100}元可获得以下赠品</p>
            <ul class="zpol-listul">
               
                <li class="clearfix">
                    <div class="fl zpol-djimg">
                        <img src="./images/20170626170837_17637.jpg" width="50" height="50" alt="道具图">
                    </div>
                    <div class="fl zpol-djinfo">
                        <p class="zpol-djname">5555</p>
                        <p class="zpol-djpri">￥50</p>
                    </div>
                </li>
               
            </ul>
        </div>
      
    </div>

</div>
<script type="text/html" id="tmpl_award_panel">
    <a href="javascript:;" class="ico-menu zpol-btn-close">x</a>
    <p class="zpol-tit">${sActRule.sActionName}赠品</p>
    <div class="zpoverlay-main">
        {if sActRule.sActionRule.sRuleList}
        {for rule in sActRule.sActionRule.sRuleList}
        <div class="zpoverlay-list">
            <p class="zpol-list-tip">满{if sActRule.sActionRule.iLimitType==1}${rule.limit/100}元{else}${rule.limit}件{/if}可获得以下赠品{if rule.iMax >0}（之一）{/if}：</p>
            <ul class="zpol-listul">
                {if rule.sAwardGoodsInfo && rule.sAwardGoodsInfo.length}
                {for award in rule.sAwardGoodsInfo}
                <li class="clearfix">
                    <div class="fl zpol-djimg">
                        <img src="${award.sProfileImg}" width="50" height="50" alt="道具图">
                    </div>
                    <div class="fl zpol-djinfo">
                        <p class="zpol-djname">${award.sMallName}</p>
                        <p class="zpol-djpri">￥ ${award.iPrice/100}</p>
                    </div>
                </li>
                {/for}
                {/if}
            </ul>
        </div>
        {/for}
        {/if}
    </div>
</script>

<!-- 赠品修改颜色尺码弹窗 -->
<div class="overlay" id="blk_awardattr_panel"></div>
<script type="text/html" id="tmpl_awardattr_panel">
    <i class="overlay-arrow"></i>
    <ul class="overlay-selist">
        {if attrs && attrs.length > 0}
            {for attr in attrs}
            <li>
                <b>${attr.name}：</b>
                {for value in attr.defaults}
                    <span {if attr.selected == value} class="on"{/if} data-level="${attr_index}" data-key="${value}" >${value}</span>
                {/for}
            </li>
            {/for}
        {/if}
    </ul>
    <div class="overlay-btnbox">
        <a href="javascript:;" class="overlay-btn-sure">确定</a>
        <a href="javascript:;" class="overlay-btn-cancel">取消</a>
    </div>
</script>


<!--[if !IE]>底部<![endif]-->
<div class="bottom">
    <div class="bottomshop">
        <div id="bottomshop">
            <div class="fuwubar w980">
                <ul class="fuwu">
                    <li><span class="fw1"></span><a class="fu1">7天无理由退换货</a></li>
                    <li><span class="fw2"></span><a class="fu2">100%官方正品</a></li>
                    <!--<li><span class="fw3"></span><a class="fu3">购物送游戏礼包</a></li>-->
                    <li><span class="fw4"></span><a class="fu4">全场每单满199元包邮</a></li>
                </ul>
            </div>
            <div class="helpbar w980">
                <ul class="help clearf">
                    <li class="he_w1">
                        <h3><a href="/help/helpAfterSale.shtml#help1" target="_blank">购物指南</a></h3>
                        <a href="/help/helpAfterSale.shtml#help1" target="_blank">帐号注册与登录</a>
                        <a href="/help/helpAfterSale.shtml#help2" target="_blank">购买流程介绍</a>
                        <a href="/help/helpAfterSale.shtml#help3" target="_blank">支付方式</a>
                        <a href="/help/helpAfterSale.shtml#help4" target="_blank">常见问题</a>
                    </li>
                    <li class="he_w2">
                        <h3><a href="/help/helpShopping.shtml#help1" target="_blank">配送服务</a></h3>
                        <a href="/help/helpShopping.shtml#help1" target="_blank">全场满199元免运费</a>
                        <a href="/help/helpShopping.shtml#help2" target="_blank">配送范围及运费</a>
                        <a href="/help/helpShopping.shtml#help3" target="_blank">配送进度查询</a>
                        <!--<a href="#" target="_blank">微信配速查询</a>-->
                    </li>
                    <li class="he_w3">
                        <h3><a href="/help/helpExpress.shtml#help1" target="_blank">售后服务</a></h3>
                        <a href="/help/helpExpress.shtml#help1" target="_blank">7天无理由退换货</a>
                        <a href="/help/helpExpress.shtml#help5" target="_blank">退换货流程</a>
                        <a href="/help/helpExpress.shtml#help3" target="_blank">商品送错的处理方案</a>
                        <a href="/help/helpExpress.shtml#help4" target="_blank">售后服务及投诉</a>

                    </li>
                    <li class="he_w4">
                        <h3><a href="/help/helpIndex.shtml" target="_blank">服务中心</a></h3>
                        <div class="fuwu_qq"><a id="qq_qianfw">售前咨询</a>&nbsp;&nbsp;<a id="qq_houfw">售后咨询</a></div>
                        <span>客服热线：0755-25727866</span>
                        <!--<span>客服热线：0755-82112581</span>-->
                        <a href="mailto:service@lolriotmall.qq.com">售后：service@lolriotmall.qq.com</a>
                    </li>
                </ul>
            </div>
            <div class="bottomlink w980">
                <a href="/help/helpabouts.shtml#help5">关于商城</a>
                <a href="/help/helpabouts.shtml#help4">服务条款</a>
                <a href="/help/helpabouts.shtml#help3">合作伙伴</a>
                <a href="/help/helpabouts.shtml#help2">法律声明</a>
                <!--<a href="/help/helpabouts.shtml#help1">商务合作</a-->
            </div>
            <div class="foot clearf">
                <div class="bqlogo fl"></div>
                <div class="copyright fl">
                    深圳市合泰文化发展有限公司提供客服支持 |  客服邮箱：
                    <a href="mailto:service@lolmall.qq.com">service@lolriotmall.qq.com</a>
                    <br>
                    Copyright (C) 1998 – 2015 Tencent. All Rights Reserved.腾讯公司 版权所有
                </div>
            </div>
        </div>
    </div>
</div>
<!--[if !IE]>大背景<![endif]-->
<div class="bodyBG">
    <div class="bg01"></div>
    <div class="bg02"></div>
    <div class="bg03"></div>
    <div class="bg04"></div>
    <div class="bg05"></div>
</div>
<!--badjs-->
<script type=text/javascript src=./js/bj-report.min.js></script><script>!function(){BJ_REPORT.init({id:1178,combo:1,delay:100,url:"//badjs2.qq.com/badjs",ignore:[/(Script Error)|(getHtml)|(gamehelper)|(WeixinJSBridge)/i],level:4})}()</script>
<script type="text/javascript" src="./js/jquery1.8-min.js"></script>
<script type="text/javascript" src="./js/milo.js" charset="gbk"></script>
<script type="text/javascript" src="./js/template.js" charset="gbk"></script>
<script type="text/javascript" src="./js/lol.js"></script>
<script type="text/javascript" src="./js/actual_index_nav.js"></script>

<script type="text/javascript">

    var bizCode = 'lolriotmall';

    // console 兼容性处理
    try{
        console.log('test console');
    } catch(e){
        window.console = {log :function () {}};
    }

    milo.loader.loadByTag([
        {
            name: 'util.jquery-min',
            value:$
        },
        {
            name: 'util.template',
            value: TrimPath
        }
    ]);

    // 绑定事件
    function bindEvents() {
        $(".gotop").click(function(){
            $("html,body").stop().animate({ scrollTop:0},500);
        });

        $(".rightbot").toggle(function() {
            $(".rightqq_bar").animate({right:'-104',opacity:'0'},"slow");
            $(".rightbot").addClass("rightbot_close");
        }, function() {
            $(".rightbot").removeClass("rightbot_close");
            $(".rightqq_bar").animate({right:'14',opacity:'1'},"slow");
        });


        $(".top_mem a.lolweixin").hover(function(){
                $(this).children().show();
            }
            ,function(){
                $(this).children().hide();
            });

        $('#soinp').bind('keypress',function(event){
            if(event.keyCode == "13")
            {
                searchKeyWord();
            }
        });

        $(".sosoinp").focus(function(){
            $(".keyword-list").hide();
        });
        $(".sosoinp").blur(function(){
            if($(this).val() == ''){
                $(".keyword-list").show();
            }
        });
    }

    // 渲染导航条
    function renderNav() {
        var data = window.actual_index_nav,
            navs = [], idxs = {};

        // 因为父节点不一定不在子节点前面，所以分了2次for循环处理
        for(var i in data){
            if(data[i].iParentId == 0){
                idxs[data[i].iSeqId] = navs.length;
                data[i].subs = [];
                navs.push(data[i]);
            }
        }
        for(var i in data){
            if(data[i].iParentId != 0){
                try {
                    navs[idxs[data[i].iParentId]].subs.push(data[i]);
                } catch(e){}
            }
        }

        need(['util.template'], function (template) {
            $('#blk_nav').html(template.parseDOMTemplate('tmpl_nav').process(navs, 'list')).fadeIn();

            try {
                $curNavMenu = $('#blk_nav a[href="' + location.pathname + location.search + '"]');

                // 如果二级菜单单独设置为一级菜单的问题
                $curNavMenu.each(function () {
                   if(!$(this).hasClass('submenu-link')){
                       $curNavMenu = $(this);
                       return false;
                   }
                });

                if ($curNavMenu.attr('parentid')) {
                    $curNavMenu = $('#' + $curNavMenu.attr('parentid'));
                }

                $curNavMenu.addClass('click');
            } catch(e){}
        });
    }
    
    function logout() {
        need(['biz.login'], function (loginManager) {
            loginManager.logout(function () {
                window.location.reload();
            });
        });
    }

    function login() {
        need(['biz.login'], function (loginManager) {
            loginManager.login();
        });
    }
    
    function renderUserInfo(loginedCallback, unlonginCallback) {
        need(['biz.login'], function (loginManager) {
            loginManager.checkLogin(function () {
                $("#login_qq_span").html(loginManager.getUserUin());
                loginManager.getNickName(function (loginInfo) {
                    if (loginInfo.isLogin) {
                        $("#login_nickname_span").text(loginInfo.nickName);
                    }
                });
                loginManager.getUserFace(function (loginInfo) {
                    if (loginInfo.isLogin) {
                        $("#login_userFace_span").html(loginInfo.userFace);
                    }
                });

                loginedCallback && loginedCallback();
            }, function () {
                unlonginCallback && unlonginCallback();
            });
        });
    }

    //查询购物车信息
    function renderCartNum(){

        if($('#headerCartNum').length == 0) return false;

        var url = "./js/cart.php?";

        var params = {
            Act: 'list',
            _biz_code: bizCode,
            supplier_id: '',
            _output_var: 'CartGoodsList'
        };

        //alert(pars)
        $.getScript(url + $.param(params), function () {
            var rsp = window.CartGoodsList;

            if(rsp.result == 0 && rsp.data && rsp.data.list){
                var item, total = 0;
                for(var i in rsp.data.list){
                    item = rsp.data.list[i];
                    if(item.sales){
                        for(var j in item.sales){
                            total += parseInt(item.sales[j].iTotal);
                        }
                    } else{
                        total += parseInt(item.iTotal);
                    }

                }

                $('#headerCartNum').html(total);
            }
        });
    }

    function searchKeyWord(){
        var keyWord = $('#soinp').val();

        if(keyWord!='' && keyWord!='搜索你喜欢的英雄周边'){
            window.location.href="/list.shtml?keyword="+keyWord+'&CLICKTAG=lolriotmall.pc.index.search';
        }
    }


    /**
     * 渲染翻页
     */
    function renderPager(curPage, totalPage) {
        var page = {},
            $pageBlock = $('#blk_page_bar'),
            $pageBlockBottom = $('#blk_page_bar_bottom');

        if (totalPage < 2) {
            return $pageBlock.hide();
        }
        console.log(curPage, totalPage);
        page.total = totalPage;
        page.number = parseInt(curPage, 10);
        page.prev = Math.max(page.number - 1, 1);
        page.next = Math.min(page.number + 1, page.total);
        // 每次只显示各5个页码
        tmpPage = page.number >= 3 ? (page.total - page.number >= 3 ? page.number : page.total - 2) : 3;
        page.showFrom = Math.max((tmpPage - 2), 1);
        page.showTo = Math.min((tmpPage + 2), page.total);
        page.list = [];

        for (var i = page.showFrom; i <= page.showTo; i++) {
            page.list.push(i);
        }

        need(['util.template'], function (template) {

            $pageBlock.html(template.parseDOMTemplate('tmpl_page_bar').process(page, 'page')).fadeIn();

            if($pageBlockBottom.length > 0) $pageBlockBottom.html($pageBlock.html());
//            $pageBlock.on('click', 'a', function () {
//                var number = $(this).attr('data-number');
//                if (number != page.number) {
//                    doPagination(number);
//                }
//                return false;
//            });
        });
    }

    /**
     * 添加购物车
     * @param mall_id 商品id，多个用逗号分隔
     * @param mall_num 数量
     * @param callback 回调
     */
    function addCart(mall_id, mall_num, callback) {
        var url = "./js/cart.php?";

        var params = {
            Act:'add',
            type:'add',
            biz_code:bizCode,
            mall_id: mall_id,
            mall_num:mall_num,
            _output_var: 'CartModel_addCart'
        };

        //alert(pars)
        $.getScript(url + $.param(params), function () {
            var rsp = window.CartModel_addCart;

            console.log('addCart', rsp);

            warning(rsp.result == 0 ? '已成功添加购物车！' : rsp.msg);
            callback && callback(rsp.result == 0, rsp);
        });
    }


    // 获取指定id的商品信息，id数组传入
    function ajaxGoodsByIds(goodsIds, callback) {

        var url =  './js/GoodsApp.php?',
            params = {
                opt_type:'goods_list_by_ids',
                from:'lolriotmall-PC',
                biz: bizCode,
                mall_ids:goodsIds.join(','),
                page_size:100,
                page_no:1,
                plat:'pc',
                output_format:'jsonp'
            };

        $.getScript(url + $.param(params), function () {
            var rsp = window.ogoods_app;

            console.log('ajaxGoodsByIds', rsp);

            if (rsp.ret == 0) {
                if (rsp.data.total > 0) {
                    var result = {}, list = rsp.data.list;

                    $.each(list, function () {
                        result[this.iMallId] = this;
                    });

                    callback && callback(result);
                }
            }
        });
    }


    function isWxLogin() {
        return milo.cookie.get('openid') && milo.cookie.get('access_token');
    }
    
    function wxLoginGuide() {
        warning('购买周边商品，请退出后用QQ账号登录！');
    }

    milo.ready(function () {
        if (!!milo.request('ADTAG')) { // 记录ADTAG，用于订单统计
            milo.cookie.set('ADTAG', milo.request('ADTAG'), 259200, location.host, "/");
        }

        // 微信登录给退出提示
        if(isWxLogin()) {
            wxLoginGuide();
        }

        bindEvents();
        renderNav();
        renderUserInfo(function () {
            renderCartNum();
        }, function () {
            // 个人中心，未登录，直接弹出登录框
            if(/\/user\//.test(location.href)){
                login();
            }
        });
    });

</script>
<!--右侧营销右侧营销QQend-->
</body>
<script type="text/javascript">
	
	//活动内容
	$(function () {
        //获取要定位元素距离浏览器顶部的距离
        //滚动条的滑动距离大于等于定位元素距离浏览器顶部的距离，就固定，反之就不固定
        var navH = $("#topBox").offset().top;
        var clientHeight =$(window).height()  
        //滚动条事件
        $(window).scroll(function () {
            //获取滚动条的滑动距离
            var scroH = $(this).scrollTop();
            //滚动条的滑动距离大于等于定位元素距离浏览器顶部的距离，就固定，反之就不固定
            if (scroH > navH) {//翻页
                $("#topBox").attr("class", "navBox_2");
                $("#topBox").css("top", "75px");
                if ($.browser.msie && ($.browser.version == "6.0")) {
                    $("#topBox").css("top", "78px")
                }
            } else {
                $("#topBox").attr("class", "navBox_1")
                $("#topBox").css("top", "0px")
            }
        })
    });
		//滚动条的滑动距离大于等于定位元素距离浏览器顶部的距离，就固定，反之就不固定
    var url = "./js/cart.php?";

//    var userLevel = milo.cookie.get("userLevel");
    // 自动删除赠品
    var autoDelte = false;

    var cartOriginalList = null; // 后台接口返回原始数据缓存
    var cartGoodsList = null; //购物车商品列表 以商品id为key，形如：{id:{}, id:{}}
    var cartSelectList = null; //购物车商品列表选择缓存 以cartid和goodsId组合为key，形如：{id:{}, id:{}}
    var cartGoodsTotal = null; // 每个商品对应的总数量（包括单独购买和营销组合）形如：{id:3, id:5}
    var cartItemList = null; // 购物车列表，以购物车id为key
    var cartAwardList = {}; // 阶梯满赠的赠品列表，按活动id为key
    var cartSelectedAward = {}; // 可选择属性的赠品，缓存已选择的赠品信息，方便刷新后的默认选择

    function setFinalPrice(cart, isActPrice) {
        var goodsInfo = cart.goodsInfo ? cart.goodsInfo : cart;

        isActPrice = typeof isActPrice == 'boolean' ? isActPrice : false;

        if (isActPrice) {
            cart.iFinalPrice = goodsInfo.iPrice;
        } else {
            if (new Date().getTime() > new Date(goodsInfo.dtPromoteStart).getTime() && new Date().getTime() < new Date(goodsInfo.dtPromoteEnd).getTime()) {
                cart.iFinalPrice = goodsInfo.iPromotePrice;
            } else {
                cart.iFinalPrice = goodsInfo.iPrice;
            }
        }

        return cart;
    }
    console.log(12);
    /**
     * 获取订单列表
     *  @param status 订单状态
     *  @param page 页码
     */
    function ajaxCartGoodsRecord(callback) {


        var params = {
            Act: 'list',
            _biz_code: bizCode,
            supplier_id: '',
            _output_var: 'CartGoodsList'
        };

        //alert(pars)
        $.getScript(url + $.param(params), function () {
            var rsp = window.CartGoodsList;

            console.log('cartGoodsList', rsp);
            console.log('3',new Date().getTime()-st);

            if(rsp.result == '-1022'){ // 加载速度优化处理，不先判断登录，而是直接拉接口，如果返回未登录，再提示用户登录
                need(['biz.login','biz.dialog'], function (login, dialog) {
                    login.login();
                });
                return false;
            }

            need(['util.template'], function (template) {
                if (rsp.result == 0) {
                    if (rsp.data.total > 0) {
                        var list = rsp.data.list;

                        cartOriginalList = list;

                        cartGoodsList = {}; // 商品id为key的列表\
                        cartSelectList = {};
                        cartItemList = {}; // cartid为key的类别

                        // 排序，不然每次改变购物车数量的试试，商品顺序会变
                        list.sort(function (a, b) {
                            return parseInt(a.iCartId.split(',')[0]) - parseInt(b.iCartId.split(',')[0]) > 0 ? -1: 1;
                        });

                        renderCartList(formatCartList(cartOriginalList));


                    } else {
                        $('#blk_cart_list').html(template.parseDOMTemplate('tmpl_cart_error').process({msg: '您的购物车中还没有商品， <a href="/list.shtml">去逛逛吧</a>'}, 'data')).fadeIn();
                    }

                } else {
                    if(rsp.result != -2001) {
//                      console.log('list error', template.parseDOMTemplate('tmpl_cart_error').process(rsp, 'data'));
                        $('#blk_cart_list').html(template.parseDOMTemplate('tmpl_cart_error').process(rsp, 'data')).fadeIn();
                    }
                }
                refreshPayInfo();
                callback && callback();
            });
        });
    }

    // 读取指定满赠规则的赠品的详情信息
    function ajaxAwardGoodsList(actRuleList, callback) {
        var goodsIds = [];
//        actRuleList[2].sAwardInfo = [1775];
//        actRuleList[4].sAwardInfo = [531,1742];
        $.each(actRuleList, function () {
            goodsIds = goodsIds.concat(this.sAwardInfo);
        });

        ajaxGoodsByIds(goodsIds, function (goodsList) {
            $.each(actRuleList, function (k,v) {
                v.limit = k;
                v.sAwardGoodsInfo = [];

                $.each(v.sAwardInfo, function (index, goodsId) {
                    if(goodsList[goodsId]){
                        v.sAwardGoodsInfo.push(goodsList[goodsId]);
                    }
                });
            });

            callback && callback(actRuleList);
        });
    }

    // 获取阶梯满赠赠品的详细信息，处理了缓存信息
    function getAwardGoodsList(iActId, actRuleList, callback) {
        if(cartAwardList['item_'+iActId]) {
            callback && callback(cartAwardList['item_'+iActId]);
        } else{
            ajaxAwardGoodsList(actRuleList, function (result) {
                cartAwardList['item_'+iActId] = result;
                callback && callback(result);
            });
        }
    }

    // 渲染购物车列表
    function renderCartList(list) {
        console.log('renderCartList', list);
        need(['util.template'], function (template) {
//            console.log(template.parseDOMTemplate('tmpl_cart_list').process(list, 'list'));
            $('#blk_cart_list').html(template.parseDOMTemplate('tmpl_cart_list').process(list, 'list')).fadeIn();
            bindEvents();
            setUnvaliableGoods();
            refreshPayInfo();
        });
    }

    // 获取阶梯满赠的最低限制条件
    function getCurLimitRule(total, ruleList) {
        var limits = [], valid = 0, next = 0;

        $.each(ruleList, function (k, v) {
            limits.push(parseInt(k));
        });

        limits.sort(function (a,b) {
            return a-b;
        });

        for(var i=0 , len = limits.length; i < len; i++){
            if(total < limits[i]){
                valid = i == 0 ? 0 : limits[i-1];
                next = limits[i];
                break;
            } else{
                valid = limits[i];
            }
        }

        return [valid, next];
    }


    // 格式化购物车数据，主要是处理促销类商品信息（买赠，满增，组合购买）
    function formatCartList(originalList) {
        var list = $.extend(true, [], originalList); // 复制副本，便于后面利用

        cartGoodsTotal = {}; // 每个商品对应的总数量（包括单独购买和营销组合）,主要用于购物车更新数量使用

        // 下面主要是把多种组合营销的商品格式化为统一的list.sales的格式，便于模板统一循环处理
        for (var i = 0, ilen = list.length; i < ilen; i++) {
            var cart, mallId, total, slctKey;

            list[i].index = i;

            if (list[i].sales) { // 组合购买和满减满额赠处理(这两种情况会存在多个商品，所以放到了sales数组里)
                var totalNum = 0, totalFinalPrice = 0;

                for (var j = 0, jlen = list[i].sales.length; j < jlen; j++) {
                    cart = list[i].sales[j];

                    mallId = cart.goodsInfo.iMallId;
                    total = parseInt(cart.iTotal);

                    cart.isMainGood = j == 0 ? true : false; // 组合第一个商品
                    cart.goodsInfo.stock = cart.goodsInfo.iMallQty - cart.goodsInfo.iSoldNum; // 库存处理

                    // 处理是否选中的问题
                    slctKey = list[i].iCartId+'_'+mallId;
                    if(typeof cartSelectList[slctKey] == 'undefined'){
                        cart.selected = true;
                        cartSelectList[slctKey] = {iMallId: mallId,isAward: false, selected: cart.selected};
                    } else{
                        cart.selected = cartSelectList[slctKey].selected;
                    }

                    setFinalPrice(cart, list[i].sActType != 3 ? false : true);
                    totalFinalPrice += (cart.selected ? parseInt(cart.iFinalPrice) * total : 0);
                    totalNum += (cart.selected ? total:0);

                    cartGoodsList[mallId] = cart.goodsInfo;
                    cartGoodsTotal[slctKey] = cartGoodsTotal[slctKey] ? cartGoodsTotal[slctKey] + total : total;
                    cartItemList[cart.iCartId] = cart;
                }

                list[i].iTotal = totalNum;
                list[i].iFinalPrice = totalFinalPrice; // 组合优化合计价格

                var sActionRule = list[i].sActRule.sActionRule;

                // 满赠是否达到赠送条件判断

                if(list[i].sActType == 1) {

                    list[i].iLimitType = sActionRule.iLimitType; // 值为1表示满额赠，2满件赠

                    if(list[i].iLimitType == 1){
                        list[i].passLimit = list[i].iFinalPrice >= parseInt(sActionRule.iLimit);
                    } else if(list[i].iLimitType == 2){
                        list[i].passLimit = list[i].iTotal >= parseInt(sActionRule.iLimit);
                    }
                    // 只能选一个赠品
                    list[i].awardOnlyone = sActionRule.iMax > 0;// 目前只有2中情况，0或者n，0标识全送，n标识n选1
                    // 展示赠品选择提示
                    list[i].awardSelectTip =  !list[i].passLimit; //&& list[i].maxAwards == 0

                } else if(list[i].sActType == 5) { // 阶梯满赠

                    list[i].iLimitType = sActionRule.iLimitType; // 值为1表示满额赠，2满件赠

                    var curRule =  getCurLimitRule(list[i].iLimitType == 1 ? list[i].iFinalPrice : list[i].iTotal, sActionRule.sRuleList);

                    list[i].valid = curRule[0];
                    list[i].next  = curRule[1];

                    // valid和next各自为0 分别代表 未满足第一级满赠 和已满足最高级满赠

                    if(list[i].valid > 0){
                        list[i].passLimit = true;
                        // 只能选一个赠品
                        list[i].awardOnlyone = sActionRule.sRuleList[list[i].valid].iMax > 0;
                    } else{
                        list[i].passLimit = false;
                        list[i].awardOnlyone = sActionRule.sRuleList[list[i].next].iMax > 0;
                    }

                    // 展示赠品选择提示
                    list[i].awardSelectTip =  !list[i].passLimit; //&& list[i].maxAwards == 0
                }
            } else { // 买赠和普通商品处理
                cart = list[i];

                mallId = cart.goodsInfo.iMallId;

                // 处理是否选中的问题
                slctKey = list[i].iCartId+'_'+mallId;
                if(typeof cartSelectList[slctKey] == 'undefined'){
                    cart.selected = true;
                    cartSelectList[slctKey] = {iMallId: mallId,isAward: false, selected: cart.selected};
                } else{
                    cart.selected = cartSelectList[slctKey].selected;
                }

                if(cart.sActType == 2){//买赠
                    cart.passLimit = cart.selected ? true : false;// 获取条件
                    cart.awardOnlyone = cart.maxAwards > 0;// n选1时，maxAwards=n，否则等于0
                    cart.awardSelectTip =  !cart.passLimit;
                }

                cart.iFinalPrice = cart.iFinalPrice;
                cart.goodsInfo.stock = cart.goodsInfo.iMallQty - cart.goodsInfo.iSoldNum;
                cart.sales = [ // 兼容处理组合商品的情况
                    setFinalPrice(cart)
                ]

                cartGoodsList[mallId] = cart.goodsInfo;
                cartGoodsTotal[slctKey] = cartGoodsTotal[slctKey] ? cartGoodsTotal[slctKey] + parseInt(cart.iTotal) : parseInt(cart.iTotal);
            }

            if (list[i].awards) { // 买赠和满赠的赠品处理

                var selectedFirstAward = false, hasDefaultSelected = false; saleIndex = list[i].sales.length;



                for (var j = 0, jlen = list[i].awards.length; j < jlen; j++) {
                    // 赠品信息
                    var goodsInfo = list[i].awards[j], mallId =  goodsInfo.iMallId;


                    slctKey = list[i].iCartId+'_'+mallId;

                    // 阶梯满赠的时候，前端选中与取消选中时，设置满足条件的赠品可见，
                    // TODO: 如果当前赠品不包含上一级赠品的话，就蛋疼了，后台可以输出全部赠品列表，前端控制显示与隐藏
                    if(list[i].sActType == 5) {
                        var sRuleList = list[i].sActRule.sActionRule.sRuleList, curValidAwards = [];

                        curValidAwards = sRuleList[list[i].valid > 0 ? list[i].valid : list[i].next].sAwardInfo;

                        if(cartSelectList[slctKey]) {
                            cartSelectList[slctKey].selected = false;
                        }

                        if($.inArray(mallId, curValidAwards) == -1) {
                            continue;
                        }
                    }

                    goodsInfo.isAward = true;
                    goodsInfo.iFinalPrice = 0;

                    goodsInfo.iSoldNum = goodsInfo.iMallId == 1845 ? goodsInfo.iMallQty: goodsInfo.iSoldNum;
                    goodsInfo.stock = goodsInfo.iMallQty - goodsInfo.iSoldNum;
                    goodsInfo.soldOut = goodsInfo.stock <= 0;

                    if(goodsInfo.related && goodsInfo.related.length > 0){
                        goodsInfo.relatedByGoodsId = {};
                        $.each(goodsInfo.related, function () {
                            goodsInfo.relatedByGoodsId[this.iMallId] = this;
                        });
                    }

                    if(list[i].passLimit) { // 是否满足赠品条件
                        if (!goodsInfo.soldOut) { // 处理是否选中的问题
                            if (list[i].awardOnlyone) { // N选1的情况，默认选中第一个有库存的赠品
//                                goodsInfo.selected = false; // 阶梯满赠的时候，要取消上一级的选中状态，这里每次都重置
                                if(typeof cartSelectList[slctKey] == 'undefined'){
                                    if (!selectedFirstAward) {
                                        goodsInfo.selected = true;
                                        selectedFirstAward = true;
                                    } else{
                                        goodsInfo.selected = false;
                                    }
                                } else{
                                    goodsInfo.selected = cartSelectList[slctKey].selected;
                                }

                                if(goodsInfo.selected) {
                                    hasDefaultSelected = true;
                                }

                            } else { // 赠品是礼包全部选中
                                goodsInfo.selected = true;
                                hasDefaultSelected = true;
                            }
                        } else{
                            goodsInfo.selected = false;
                        }
                    } else {
                        goodsInfo.selected = false;
                    }
                    cartSelectList[slctKey] = {iMallId: mallId, isAward: true, selected: goodsInfo.selected};

                    console.log('goodsInfo.stock', goodsInfo.stock, goodsInfo.soldOut, goodsInfo.selected);
                    cart = {
                        goodsInfo: goodsInfo,
                        isAward: true,
                        iFinalPrice: 0,
                        iTotal: list[i].sActType == 2 ? list[i].iTotal : 1,
                        selected: goodsInfo.selected
                    };
                    list[i].sales.push(cart);
                    cartGoodsList[mallId] = goodsInfo;
                }

                // 处理没有默认选中赠品的情况

                if((list[i].sActType == 1 || list[i].sActType == 2 || list[i].sActType == 5) && !hasDefaultSelected){
                    for(var j = saleIndex , len = list[i].sales.length; j < len ; j++){
                        if(list[i].passLimit && list[i].sales[j].goodsInfo.stock > 0){
                            list[i].sales[j].selected = true;
                            break;
                        }
                    }
                }
            }
            cartItemList[list[i].iCartId] = list[i]; // iCartId 会存在多个的情况，以逗号,分隔
        }
        console.log('cartSelectList', cartSelectList);

        return list;
    }


    function setUnvaliableGoods() {
        $goods = $('[data-unvaliable]').parents('ul.buyli');
        $goods.addClass('buy_disable');
        $goods.find('.buy_dianhover').prop('unvaliable', true).trigger('click');
    }

    /**
     * 事件绑定
     */
    function bindEvents() {
        // 取消全选
        $('.buy_xuanhover').click(function () {
            checkAllGoods($(this).hasClass('buy_xuanhover') ? false : true); // 兼容处理
        });

        // 全选
        $('.buy_xuan').click(function () {
            checkAllGoods($(this).hasClass('buy_xuan') ? false : true); // 兼容处理
        });

        $('.buy_dianhover').click(function () {
            checkGoods($(this), false);
        });

        $('.buy_dian').click(function () {
            checkGoods($(this), true);
        });

        // 赠品选中操作，赠品不能手动取消选中，只能改变选择商品后，系统自动处理
        $('.buy_radio').click(function () {
            checkAward($(this));
        });

        $('.buy_radiohover').click(function () {
            checkAward($(this));
        });

        //买赠浮层
        $('.zuhe-ask').on('mouseenter', function (e) {
            showAwardPanel($(this), $(e.target).attr('cart-id'));
        });

        // 赠品属性选择
        $('.mycart-item-sel').click(function (e) {
            showAttrSelector($(this), $(this).attr('mallid'))
        });
    }

    // 显示阶梯满赠的赠品
    function showAwardPanel($el, cartId) {
        var cartItem = cartItemList[cartId];
            z = $('.zpoverlay'),
            x = $el.offset().left,
            y = $el.offset().top,
            h = z.outerHeight() + y - $(window).scrollTop() + 72,
            w = $(window).height();
        y = y + (h > w ? w - h : 0);

        getAwardGoodsList(cartItem.sActRule.iActionId, cartItem.sActRule.sActionRule.sRuleList, function (formatedRuleList) {

            cartItem.sActRule.sActionRule.sRuleList = formatedRuleList;

            need('util.template', function (template) {
                $('#blk_award_panel').html(template.parseDOMTemplate('tmpl_award_panel').process(cartItem.sActRule, 'sActRule')).fadeIn();

                $('.zpoverlay').css({ left: x, top: y }).fadeIn();
                $('.zpoverlay').on('mouseleave', function () {
                    $(this).fadeOut();
                });
                $(".zpol-btn-close").on('click', function () {
                    $(this).parent().fadeOut();
                });
            });
        });
    }

    // 显示赠品属性选择层
    function showAttrSelector($el, goodsId) {
        var award =  cartGoodsList[goodsId];

        if(award && award.related && award.related.length > 1){
            var attrs = formatGoodsAttrs(award.related);

            var $panel = $(".overlay"),
                $curAttrs = $el.find('.j-attr-value');

            // 选中当前选项
            $curAttrs.each(function (i, v) {
                attrs = selectGoodsAttr({level: i, key: $(v).text()}, attrs);
            });

            renderAttrSelector($el, attrs, function () {
                var x = $el.offset().left,
                    y = $el.offset().top,
                    h = $el.height(),
                    topset = y + h + 5;

                //选中
                $el.addClass('mycart-item-ed');

                $panel.css({"left": x + "px","top": topset + "px"}).fadeIn();
                $panel.prop('selectedGoodsId', null);
            });
        }
    }

    /**
     * 选择一个属性，实际上每一种属性组合就是一条独立的商品记录
     * @param e
     */
    function selectGoodsAttr($sel, attrs) {

        var ds = (typeof $sel.level != 'undefined' && typeof $sel.key != 'undefined') ? $sel : {level: parseInt($sel.attr('data-level')), key: $sel.attr('data-key')};

        // 如果是选中最后一级的属性，主要是获取对应的商品id
        if(ds.level ==  attrs.length -1 ){
            var mkey = '';

            if(attrs.length == 1){
                mkey = ds.key;
            } else {
                // 前N级选中的属性值组合而成的值，比如：黑色XL
                for (var i = 0, len = attrs.length - 1; i < len; i++) {
                    mkey += attrs[i].selected;
                }
            }


            // 找到最后一级选中属性值，并获取商品id

            for(var i=0, len = attrs[ds.level].config[mkey].values.length; i < len; i++ ){
                var v = attrs[ds.level].config[mkey].values[i];

                if(v.value == ds.key){
                    $('.overlay').prop('selectedGoodsId', v.goodsId);
                    break;
                }
            }
        } else{ // 不是最后一级，主要是处理下一级应该展示的属性数组

            attrs[ds.level+1].defaults = [];

            if(ds.level+1 ==  attrs.length -1 ){ // 处理最后一层的值
                for(var i=0, len = attrs[ds.level+1].config[ds.key].values.length; i < len; i++ ){
                    attrs[ds.level+1].defaults.push(attrs[ds.level+1].config[ds.key].values[i].value);
                }
            } else{
                attrs[ds.level+1].defaults =  attrs[ds.level+1].config[ds.key].values;
            }
        }

        attrs[ds.level].selected = ds.key; // 设置选中状态

        return attrs;
    }
    
    function renderAttrSelector($el, attrs, callback) {
        need('util.template', function (template) {

            $('#blk_awardattr_panel').html(template.parseDOMTemplate('tmpl_awardattr_panel').process(attrs, 'attrs')).fadeIn();

            var $panel = $(".overlay"),
                $attrs = $('.overlay-selist li span'),
                $okBtn = $(".overlay-btn-sure"),
                $cancelBtn =  $(".overlay-btn-cancel");

            $(document.body).off('mousedown').on('mousedown', function (e) {
                var $target = $(e.target);
                if (!$target.hasClass('overlay') && !$target.parents('.overlay').length) {
                    $cancelBtn.trigger('click');
                }
            });

            $attrs.on('click', function (e) {
//                    $(this).siblings('span').removeClass('on');
//                    $(this).addClass('on');
                renderAttrSelector($el, selectGoodsAttr($(e.target), attrs));
            });

            //颜色尺码确定或者取消
            $okBtn.on('click', function () {
                $cancelBtn.trigger('click');

                showSelectedAward($el, $panel.prop('selectedGoodsId'));
            });

            //颜色尺码确定或者取消
            $cancelBtn.on('click', function () {
                $panel.fadeOut();
                $el.removeClass('mycart-item-ed');
            });

            callback && callback();
        });
    }

    function showSelectedAward($el, goodsId) {
        ajaxGoodsByIds([goodsId], function (goodsList) {
            var goodsInfo = goodsList[goodsId];

            var $ul = $el.parents('.j-cart-item');

            cartSelectedAward[$el.attr('mallid')] = goodsInfo;

            $ul.find('.j-radio').attr('mallid', goodsInfo.iMallId).attr('stock', goodsInfo.iMallQty-goodsInfo.iSoldNum);
            $ul.find('.j-img').attr('src', goodsInfo.sProfileImg);
            $ul.find('.j-name').attr('href', '/detail.shtml?id=' + goodsInfo.iMallId).find('.j-name-text').text(goodsInfo.sMallName);
            $ul.find('.j-price').text(goodsInfo.iPrice/100);

            goodsInfo.attr =  cartGoodsList[$el.attr('mallid')].relatedByGoodsId[goodsId].attr;

            // list_by_ids接口返回的字段不带attrs，需要从related去取
            if(goodsInfo.attr){
                var $attrs = $ul.find('.j-attr');

                $.each(goodsInfo.attr, function (i, v) {
                    $attrs.eq(i).find('.j-attr-name').text(v.sAttrName);
                    $attrs.eq(i).find('.j-attr-value').text(v.sAttrValue);
                });
            }
        });
    }

    // 格式化商品属性
    function formatGoodsAttrs(related) {
        var attrs = [];

        for (var i = 0, ilen = related.length; i < ilen; i++) {

            var key = '', mvalue = '';

            // 部分商品的attr属性为空，直接忽略，不是个完整的商品
            if (!related[i].attr || related[i].attr.length == 0) continue;

            // 循环搜有属性，所有属性确定一个商品
            for (var j = 0, jlen = related[i].attr.length; j < jlen; j++) {
                var attr = related[i].attr[j];

                if (!attrs[j]) {
                    attrs[j] = {
                        name: attr.sAttrName,
                        defaults: [],
                        config: {}
                    }
                }

                if (!attrs[j].defaults.includes(attr.sAttrValue)) {
                    attrs[j].defaults.push(attr.sAttrValue);
                }

                if (jlen == 1) {
                    attrs[j].config[attr.sAttrValue] = {
                        key: attr.sAttrValue,
                        values: [{
                            goodsId: attr.iMallId,
                            value: attr.sAttrValue,
                            stock: related[i].iMallQty - related[i].iSoldNum,
                        }]
                    }
                } else if (j > 0) {
                    var existed = attrs[j].config[key];

                    if (!existed) {
                        existed = {
                            key: key,
                            values: []
                        };
                        attrs[j].config[key] = existed;
                    }

                    if (j == jlen - 1) {
                        // 如果是最后一项，那就记录完整的信息，包括id和库存，便于下单

                        if (!existed.values.find(function (v, i, a) {
                                return v.value == attr.sAttrValue;
                            })) {
                            existed.values.push({
                                goodsId: attr.iMallId,
                                value: attr.sAttrValue,
                                stock: related[i].iMallQty - related[i].iSoldNum,

                            })
                        }
                    } else {
                        mvalue = attr.sAttrValue;

                        if (!existed.values.includes(mvalue)) {
                            existed.values.push(mvalue);
                        }
                    }
                }

                key += attr.sAttrValue;

            }
        }
        return attrs;
    }

    /**
     * 全选处理
     */
    function checkAllGoods(checked) {
        $.each(cartSelectList, function (k, v) {
            if(!v.isAward) {
                v.selected = checked;
            }
        });
        renderCartList(formatCartList(cartOriginalList));
        // 全选处理
        if (checked) {
            $('.buy_xuan').removeClass('buy_xuan').addClass('buy_xuanhover');
        } else{
            $('.buy_xuanhover').removeClass('buy_xuanhover').addClass('buy_xuan');
        }
    }

    /**
     * 选中商品处理
     */
    function checkGoods($check, checked) {
        var $li = $check.parents('li');

        //组合购买处理，同步组合商品选中取消状态，因为组合是一个整体
        if($li.attr('acttype') == 3){
            $li = $('[cart-id="'+$check.attr('cartid')+'"]');
        }

        $li.each(function () {
            cartSelectList[$(this).attr('cart-id')+'_'+$(this).attr('goods-id')].selected = checked;
        });

        renderCartList(formatCartList(cartOriginalList));

        // 全选处理
        if (($('.buy_dian').length == 0)) {
            $('.buy_xuan').removeClass('buy_xuan').addClass('buy_xuanhover');
        } else{
            $('.buy_xuanhover').removeClass('buy_xuanhover').addClass('buy_xuan');
        }
    }

    /**
     * 选中赠品
     */
    function checkAward($radio) {
        var $li = $radio.parents('li');

        if($radio.hasClass('buy_radiohover')) { // 已选中的不处理
            return false;
        }

        if($radio.attr('stock') <= 0){
            warning('亲爱的召唤师：该赠品库存不足，请选择其它赠品！');
        } else if ($radio.attr('disabled') == 'disabled') {
            warning('亲爱的召唤师：要获得赠品，请先凑单满足活动条件~~');
        } else {
            // N选1的时候，需要先取消别的赠品的选中状态
            $('[forcart="' + $radio.attr('forcart') + '"]').each(function () {
                var $radio = $(this), $li = $radio.parents('li');
                $radio.removeClass('buy_radiohover').addClass('buy_radio');
                cartSelectList[$li.attr('cart-id')+'_'+$li.attr('goods-id')].selected = false;
            });

            cartSelectList[$li.attr('cart-id')+'_'+$li.attr('goods-id')].selected = true;
            $radio.removeClass('buy_radio').addClass('buy_radiohover');
            console.log('cartSelectList', cartSelectList);
        }
    }

    /**
     * 根据商品变化实时刷新支付信息，数量，总价和优惠折扣等
     */
    function refreshPayInfo() {
        var totalNum = 0, totalPrice = 0;

        $('input[name="cartNum"]').each(function () {
            var $num = $(this), $check = $num.parents('ul').find('.buy_dianhover');

            if($check.length > 0) { // 判断是否选中 buy_dianhover 表示选中的样式,组合需要特殊判断
                totalNum += parseInt($num.val());
            }
        });

        $('span[name="cartFinalPrice"]').each(function () {
            var $price = $(this), $check = $price.parents('ul').find('.buy_dianhover');
            if($check.length > 0) {
                totalPrice += $price.html()*100; // 避免js里小数加减不精确的问题
            }
        });
        totalPrice /= 100;

        $('#tota').html(totalPrice);
        $('#numcount').html(totalNum);
        $('#headerCartNum').html(totalNum);

//        if (totalNum < 15) {
//            $('#confirm_order').hide();
//            $('#continue_buy').show();
//        } else {
//            $('#continue_buy').hide();
//            $('#confirm_order').show();
//        }

        if (totalNum == 0) {
            $('#cartPay').removeClass('buy_bot');
            $('#cartPay').addClass('buy_bothui');
        } else {
            $('#cartPay').removeClass('buy_bothui');
            $('#cartPay').addClass('buy_bot');
            isFreeCarriage(totalPrice);
        }
    }

    //数量
    function updateCartNum(cartId, goodsId, step) {
        var tkey = cartId + '_' + goodsId,
            $input = $("#cartNum" + goodsId),
            initval = parseInt($input.attr('old_value')),
            nowval = parseInt($input.val()),
            goods = cartGoodsList[goodsId],
            singleBuyLimit = 0,
            singleUserLimit = 0;

        var amount = cartGoodsTotal[tkey]-initval + nowval + step;

        if(goods){
            singleBuyLimit = goods.sBuyLimit.iSingleBuyLimit;

            if(goods.sBuyLimit.list){
                for(var i in goods.sBuyLimit.list){
                    if(goods.sBuyLimit.list[i].type == "action_goods_user"){
                        singleUserLimit = goods.sBuyLimit.list[i].limitnum;
                        break;
                    }
                }
            }
        }

        if (amount < 1) {
            $input.val(initval);
            return warning('亲~商品数量至少1件~');
        } else if (singleBuyLimit > 0 && amount > singleBuyLimit) {
            $input.val(singleBuyLimit);
            return warning('亲~本商品单次限购'+singleBuyLimit+'件哦~');
        }  else if (singleUserLimit > 0 && amount > singleUserLimit) {
            $input.val(singleUserLimit);
            return warning('亲~本商品单用户限购'+singleUserLimit+'件哦~');
        }

        // 查询是否已添加过满赠商品,是的话就不允许删减购物车商品数量信息,除了删除赠品操作及新增非满赠商品操作,其他操作均禁止
//        var type9count = $("#type9count").val();
        /**if((type9count >= 1 && oldCartNum > amount) || type9count > 1){
			warning("购物车中存在满赠商品,请删除满赠商品后再执行当前操作!");
			$("#cartNum"+goodsId).val(oldCartNum);
			return;
		}*/

        checkCartUpperLimit(goodsId, amount, function (outLimit, stock) {


            if (outLimit) {
                $input.val($input.attr('old_value'));
                return warning("亲，此商品库存不足，你最多可购买" + stock + "件");
            }

            var params = {
                _biz_code: bizCode,
                mall_id: goodsId,
                mall_num: amount,
                type: 'update',
                Act: 'add'
            };

            //alert(pars)
            $.getScript(url + $.param(params), function () {
                var rsp = window.cart;

                console.log('update cart goods num', rsp);

                if (rsp.result == 0) {
                    ajaxCartGoodsRecord();
                } else {
                    warning(rsp.msg);
                }
            });
        })
    }

    // 实时校验单品单用户总限量
    function checkCartUpperLimit(goodsId, amount, callback) {

        var params = {
            appid: '1005',
            iActionId: '0',
            biz: bizCode,
            propids: goodsId
        };

        $.ajax({
            url: 'http://apps.game.qq.com/cgi-bin/daoju/api/hx/limit/limit_goods_batch_search.cgi?' + $.param(params),
            dataType: 'script',
            scriptCharset: 'utf-8',
            success: function () {
                var rsp = window.limitinfo_goods_batch, list = {};
                rsp.list || (rsp.list = {});
                if (rsp.ret == 0 && rsp.list) {
                    $.each(rsp.list, function () {
                        list[this.iGoodsId] = this;
                    });
                }
                console.log('limit json ', list);
                if (list[goodsId] && list[goodsId].left < amount) {
                    callback(true, list[goodsId].left);
                } else {
                    callback(false, 0);
                }
            }
        });


//        return result;
    }

    //减少购物车商品数量
    function downCartNum(cartId, goodsId) {
        updateCartNum(cartId, goodsId, -1);
    }

    //增加购物车数量
    function upCartNum(cartId, goodsId) {
        updateCartNum(cartId, goodsId, 1);
    }

    //增加购物车数量
    function inputCartNum(cartId, goodsId) {
        var $input = $("#cartNum" + goodsId),
            amount = $input.val();

        if (!isInteger(amount)) {
            $input.val($input.attr('old_value'));
            return warning('请输入整数');
        }

        updateCartNum(cartId, goodsId, 0);
    }

    //满199包邮
    function isFreeCarriage(totalPrice) {
        if (totalPrice < 199) {
            $('#isFreeSpan').show();
            $('.buy_you1').show();
            $('.buy_you2').hide();
        } else {
            $('#isFreeSpan').hide();
            $('.buy_you1').hide();
            $('.buy_you2').show();
        }
    }

    /**
     * 删除商品
     * @param goodsId
     */
    function delHandler(cartId) {
        var goods = cartItemList[cartId];

        $.prompt('您确定要删除 ' + goods.goodsInfo.sMallName + ' 吗?', {
            buttons: [{title: '确定', value: true}, {title: '取消', value: false}],
            submit: function (result, m, f) {
                if (result) {
                    del(cartId);
                }
            }
        })
    }

    /**
     * 删除商品请求
     */
    function del(cartIds) {
        var params = {
            _biz_code: bizCode,
            cart_id: cartIds,
            Act: 'delcart'
        };

        //alert(pars)
        $.getScript(url + $.param(params), function () {
            var rsp = window.cart;

            console.log('del cart goods', rsp);

            if (rsp.result == 0) {
                ajaxCartGoodsRecord();
            } else {
                warning(rsp.msg);
            }
        });
    }

    /**
     * 收藏商品
     * @param goodsId
     */
    function favor(goodsId) {

        var url = 'https://apps.game.qq.com/daoju/v3/zb/client/notice/AttendGoods.php?';

        var goods = cartGoodsList[goodsId];

        var params = {
            Act: 'active',
            _biz_code: bizCode,
            goodid: goodsId,
            ps: 10,
            goodname: goods.sMallName,
            price: goods.iPrice,
            goodpic: goods.sProfileImg
        };

        //alert(pars)
        $.getScript(url + $.param(params), function () {
            var rsp = window.AttendGoods;

            console.log('favor goods rsp', rsp);

            if (rsp.result == 0) {
                warning('亲，商品 ' + params.goodname + ' 收藏成功！');
            } else {
                warning(rsp.msg);
            }
        });
    }

    /**
     * 清空购物车
     */
    function cleanCart() {
        // 如果满赠商品个数大于等于1的情况下,且当前删除的商品非满赠商品时候后续操作不执行
        $.prompt('您确定要清空购物车吗?', {
            buttons: [{title: '确定', value: true}, {title: '取消', value: false}],
            submit: function (result, m, f) {
                if (result) {
                    var cartIds = [];

                    $("[cart-id]").each(function (index) {
                        cartIds.push($(this).attr('cart-id').split(','));
                    });
                    del($.unique(cartIds).join(','))
                }
            }
        })
    }

    /**
     * 获取订单列表
     *  @param status 订单状态
     *  @param page 页码
     */
    function ajaxHotGoodsRecord() {

        var url = "./js/GoodsApp.php?";

        var params = {
            opt_type: 'goods_list',
            biz: bizCode,
            output_format: 'jsonp',
            page_no: 1,
            page_size: 6,
            order_by: 'iSoldNum',
            sort: 'desc',
            jsonpName: 'hotrank',
            cat_tag_id: 1,
            cat_tag_type: 'all'
        };
        //alert(pars)
        $.getScript(url + $.param(params), function () {
            var rsp = window.ohotrank;

            console.log('hotGoodsList', rsp);

            need(['util.template'], function (template) {
                if (rsp.ret == 0) {
                    if (rsp.data.total > 0) {
                        var list = rsp.data.list;
                        for (var i = 0, len = list.length; i < len; i++) {
                            list[i] = setFinalPrice(list[i]);
                        }
                        $('#mod_hot_list').show();
                        $('#blk_hot_list').html(template.parseDOMTemplate('tmpl_goods_list').process(list, 'list')).fadeIn();
                    } else {
                        $('#mod_hot_list').hide();
                    }
                } else {
                    $('#mod_hot_list').hide();
                }
            });
        });
    }

    /**
     * 获取订单列表
     *  @param status 订单状态
     *  @param page 页码
     */
    function ajaxNewGoodsRecord(callback) {

        var url = "./js/GoodsApp.php?";

        var params = {
            opt_type: 'goods_list',
            biz: bizCode,
            output_format: 'jsonp',
            page_no: 1,
            page_size: 6,
            order_by: 'dtLastUpdate',
            sort: 'desc',
            jsonpName: 'newgoods',
            cat_tag_id: 1,
            cat_tag_type: 'all'
        };
        //alert(pars)
        $.getScript(url + $.param(params), function () {
            var rsp = window.onewgoods;

            console.log('newGoodsList', rsp);

            need(['util.template'], function (template) {
                if (rsp.ret == 0) {
                    if (rsp.data.total > 0) {
                        var list = rsp.data.list;
                        for (var i = 0, len = list.length; i < len; i++) {
                            list[i] = setFinalPrice(list[i]);
                        }
                        $('#mod_new_list').show();
                        $('#blk_new_list').html(template.parseDOMTemplate('tmpl_goods_list').process(list, 'list')).fadeIn();
                    } else {
                        $('#mod_new_list').hide();
                    }
                } else {
                    $('#mod_new_list').hide();
                }
            });
        });
    }

    /**
     * 去支付按钮处理
     */
    function pay() {
        var cardIds = [], existAwards = {}, awards = [];

        $('.buy_dianhover[scartid]').each(function () {
            cardIds.push($(this).attr('scartid'));
        });
        cardIds = $.unique(cardIds);

        // 没选中任何商品
        if(cardIds.length == 0) return false;

        // 选择的赠品处理，已格式saleId1:mallId1,mallId2|saleId2:mallId3的格式透传到支付页，再传递到下单接口
        $('.buy_radiohover').each(function () {
            var $radio = $(this), saleId = $radio.attr('saleid');

            if (!existAwards[saleId]) {
                existAwards[saleId] = [];
            }
            existAwards[saleId].push($radio.attr('mallid'));
        });

        for (var saleId in existAwards) {
            awards.push(saleId + ':' + existAwards[saleId].join(','))
        }

        window.location.href = 'payment.shtml?cartids=' + cardIds.join(',') + '&awards=' + awards.join('|');
    }

    // 底部热门和最新商品购买
    function buyRecGoods(id) {
        addCart(id, 1, function () {
            ajaxCartGoodsRecord();
        });
    }
    window.st = Math.ceil(new Date().getTime());
    console.log('1~', st);
    milo.ready(function () {
        console.log('2',new Date().getTime()-st);
        ajaxCartGoodsRecord(function () {
            console.log('5',new Date().getTime()-st);
        });
        ajaxHotGoodsRecord();
        ajaxNewGoodsRecord();
    });
</script>
<script language="javascript">
    milo.ready(function () {

        window.pingOptions = {'biz': 'lolriotmall','appid': 1005, 'area':2, 'ec':milo.request('ADTAG') || milo.request('CLICKTAG')};

        if(!window.customPing) { 
            need(["daoju.ping"],function(ping){
                ping.report(window.pingOptions);
            });
        }
    });
</script>
<script type="text/javascript" src="./js/stats.js" charset="UTF-8"></script><!-- ��Ѷ����--PCר�� -->

<!--企业QQ-->
<script language="javascript">
    milo.ready(function () {
        setTimeout(function () {
            milo.loader.loadScript('http://wpa.b.qq.com/cgi/wpa.php', function () {
                BizQQWPA.addCustom({aty: '2', a: '2', nameAccount: 800016781, selector: 'qq_qian'});
                BizQQWPA.addCustom({aty: '2', a: '4', nameAccount: 800053395, selector: 'qq_hou'});
                BizQQWPA.addCustom({aty: '2', a: '2', nameAccount: 800016781, selector: 'qq_qianfw'});
                BizQQWPA.addCustom({aty: '2', a: '4', nameAccount: 800016781, selector: 'qq_houfw'});
                BizQQWPA.addCustom({aty: '2', a: '2', nameAccount: 800016781, selector: 'qq_qianhelp'});
                BizQQWPA.addCustom({aty: '2', a: '4', nameAccount: 800016781, selector: 'qq_houhelp'});
            });
        },1500)
    });
</script>
<!--企业QQ end-->
</html>