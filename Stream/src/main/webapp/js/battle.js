var LW201310_Battle = {
	dUserId : 0,
	dArea : 0,
	dPage : 1,
	dGid : 0,
	dAreaSelected: 1,
	dAreaOpened: [1,6],
	dUserTierinfo : {},
	dUserGamelist : {},
	dUserGameinfo : {},
	dUserChartinfo: {},
	dUserBaseinfo: {},
	dUserShareWB : '',
	dUserGameDate: '2013-12-15',
	dCurGameDateTime : '',//����ս�������� add by 996
	dLastGame : '',
	dPageURI : "http://lol.qq.com/web201310/",
	dAppsAPIURI : "http://apps.game.qq.com/lol/api/v2013/",
	dNewBattleApiUrl : "http://apps.game.qq.com/lol/api/battle/",//��ս��flashLD�ӿ���� add by 996
	dCookieKey : "LOL_API_W2013_USER_",
	dCookieTime : 3600,
	dCurBattleNum : 3,
	dShowCustomTabFlag : true,
	dErrMsg01 : "�ٻ�ʦ���ã�δ��ȡ������ս����Ϣ���������µ�¼�����ԡ�",
	init : function() {
		var self = LW201310_Battle;
		self.userParamsbyRequest(function(){
			self.userLoginedPage();
			self.userInfo();
			self.areaSelectorChange(self.dArea);
		});
//		self.userParamsbyRequest(function(){
//			var submitURI = self.dAppsAPIURI+"userlimit.php?p1="+self.dUserId+"&p2="+self.dArea+"&d1=retLimit&r="+Math.random();
//			$.getScript(submitURI, function(){
//				if(retLimit.status<0){
//					window.location.href = "http://lol.qq.com/v2/";
//				}
//			});
//			self.userLoginedPage();
//			self.userInfo();
//			self.areaSelectorChange(self.dArea);
//		});
	},
	areaSelector : function() {
		var self = LW201310_Battle;
		if("object"==typeof(LOLServerSelect)) {
			var retHTML = '';
			for(var i=0;i<LOLServerSelect.STD_DATA.length;i++) {
				var areaId = LOLServerSelect.STD_DATA[i].v;
				var areaName = LOLServerSelect.STD_DATA[i].t;
				if(self.areaOpenedChecked(areaId)) {
					retHTML += '<li><a href="javascript:LW201310_Battle.areaSelectorChange(\''+areaId+'\', \''+areaName+'\');">'+areaName+'</a></li>';
				}
			}
			$("#jAreaSelector").html(retHTML).toggle();
		}
	},
	areaSelectorChange : function(areaId) {
		var self = LW201310_Battle;
		self.dAreaSelected = areaId;
		var areaName = LOLServerSelect.zoneToName(areaId);
		$("#jAreaSelectorSpan").html(areaName);
		$("#jAreaSelector").hide();
	},
	userInfo : function() {
		var self = LW201310_Battle;
		need(["biz.login"], function(LoginManager){
			LoginManager.checkLogin(function(){
				self.dPage = 1;
				self.reloadPersonStyle(1);
				self.userBaseinfo(function(info){
					$("#jPersonBody").show();
					if("string"==typeof(info)) {
						$("#jPersonBody").html('<p class="loading">'+info+'</p>');
					}else{
						$("#jPersonHead").show();
						self.formatMonthSelector();	
						self.userGameinfo();
						self.userTierinfo();
						self.userGameList(3);
						self.userComment(20);
						//����ѯ�����ٻ�ʦʱ�������ҵ�Ӣ�ۺ�Ƥ��
						self.checkMyHeroSkin();
					}
				});
			}, function(){
				LW201310_Userinfo.userLogin();
			});
		});	
	},
	//����Ƿ��ǲ鿴�Լ������鿴�����ٻ�ʦ��Ϣ���������ҵ�Ӣ�ۺ�Ƥ��
	checkMyHeroSkin : function(){
		var self = LW201310_Battle;
		need(["biz.login"], function(LoginManager){
			LoginManager.checkLogin(function(){
				var cookieKey = self.dCookieKey+LoginManager.getUserUin();
				var tmp = milo.cookie.get(cookieKey);
				if(tmp){
					var cookieValue = tmp.split(",");
					//�����ҵ�Ӣ�ۺ�Ƥ��ҳ
					if(cookieValue[0] != self.dUserId){
						$('#jPersonDiv5').hide();
						$('#jPersonTab5').hide();
						$('#pagetab_list').removeClass('pagetablist-five');
						$('#pagetab_list').addClass('pagetablist-four');
					}
				}else{
					LW201310_Userinfo.userLogin();
				}
			}, function(){
				LW201310_Userinfo.userLogin();
			});
		});
	},
	userGame : function() {
		var self = LW201310_Battle;
		need(["biz.login"], function(LoginManager){
			LoginManager.checkLogin(function(){
				self.dPage = 1;
				self.reloadPersonStyle(2);
				self.formatMonthSelector();	
				self.userGameList(5);
			}, function(){
				LW201310_Userinfo.userLogin();
			});
		});		
	},
	userFrid : function() {
		var self = LW201310_Battle;
		need(["biz.login"], function(LoginManager){
			LoginManager.checkLogin(function(){
				self.reloadPersonStyle(3);
				self.userComment(50);
			}, function(){
				LW201310_Userinfo.userLogin();
			});
		});
	},
	userTier : function() {
		var self = LW201310_Battle;
		need(["biz.login"], function(LoginManager){
			LoginManager.checkLogin(function(){
				self.reloadPersonStyle(4);
				self.userTierDetail(6);//edit by 996 s6������������   2016-11-16
			}, function(){
				LW201310_Userinfo.userLogin();
			});
		});
	},
	userParamsbyRequest : function(callback) {
		var self = LW201310_Battle;
		need(["biz.login"], function(LoginManager){
			LoginManager.checkLogin(function(){
				var url = window.location.search;
				var re = /id=(\d+)&area=(\d+)/ig;
				var p = re.exec(url);
				if(p) {
					self.dUserId = p[1];
					self.dArea = p[2];
					if(self.areaOpenedChecked(self.dArea)) {
						callback();
						return;
					}else{
						$("#jPersonBody").html('<p class="loading">�ǳ���Ǹ������Ŀǰ�������˰�ŷ����������������������ġ��ٻ�ʦ���ϡ���ѯ���ܡ��������Ҫ��ѯ���������Ĳ�ѯ���ܣ���������ٷ����档</p>').show();
					return;
					}
				}else{			
					var cookieKey = self.dCookieKey+LoginManager.getUserUin();
					var tmp = milo.cookie.get(cookieKey);
					if(tmp){
						var cookieValue = tmp.split(",");
						window.location.href = self.dPageURI+"personal.shtml?id="+cookieValue[0]+"&area="+cookieValue[1]+"&showDiv=1";
					}else{
						LW201310_Userinfo.userLogin();
					}
				}
			}, function(){
				LW201310_Userinfo.userLogin();
			});
		});
	},	
	userTierinfo : function() {
		var self = LW201310_Battle;
		var submitURI = self.dAppsAPIURI+"tier.php?p1="+self.dUserId+"&p2="+self.dArea+"&d1=tierObj";
		$.getScript(submitURI, function(){
			var retHTML = '';
			var cn=['��','һ','��','��','��','��','��','��','��','��'];
			if(0==tierObj.status) {
				for(x in tierObj.msg) {
					for(y in tierObj.msg[x]) {
						if('RankedSolo5x5' == y) {
							var name = UserTierValue[x][tierObj.msg[x][y]].name;
							var award = UserTierValue[x][tierObj.msg[x][y]].award.split(",").join("</p><p>");
							retHTML += '<li class="honor-list-nape"><div class="tit"><p class="fl">��'+cn[x]+'����</p><p class="fr"><span class="cred">'+name+'</span></p></div><div class="cont"><img width="86" alt="" src="http://ossweb-img.qq.com/images/lol/img/rank/'+tierObj.msg[x][y].toLowerCase()+'-logo.png"><h5>��������</h5><p>'+award+'</p></div></li>';
						}						
					}
					self.dUserTierinfo = tierObj.msg;
				}
				
			}else{
				retHTML = '<li class="noresult"><p class="loading">'+tierObj.msg+'</p></li>';
			}
			$("#jPersonTier").html(retHTML);
			self.showCustomTab();
		});
	},
	/**
	 * ������������ڣ�id������ID��4����2014����
	 */
	userTierDetail : function(id) {
		var self = LW201310_Battle;
		$("#jPersonDiv4UL li").attr('class', '');
		$("#jPersonLi"+id).attr('class', 'current');
		$(".season4").hide();
		if(id>=5 && !self.dUserTierinfo[id]){
			var goUrl = self.dAppsAPIURI+"tierAfterS4.php?p1="+self.dUserId+"&p2="+self.dArea+"&sid="+id+"&d1=tierObj";
			$.getScript(goUrl,function(){
				if(tierObj.status==0){
					self.dUserTierinfo[id]=tierObj.msg;
					self.initAllAwardsHtml(id);
				}else{
					var retHTML = '<p class="loading">ϵͳδ��ѯ��������λ��������ȷ�����Ѿ������λ������δ��ϵͳ��š���<a href="http://lol.qq.com/act/a20120605lb/"><strong>����˴�</strong></a><strong>&gt;&gt;&gt;</strong>��ѯ���״̬��</p>';
					$("#jPersonTierDetail"+id).html(retHTML).show();
				}
			});
		}else{
			self.initAllAwardsHtml(id);
		}
	},
	/**
	 * add by 996 S5��������
	 * ��Ⱦ���š�ս��3V3��ս��5V5�������ݵ�html�����
	 */
	initAllAwardsHtml : function(id){
		var self = LW201310_Battle;
		var retHTML = '';
		if(self.dUserTierinfo[id]) {
			if("object"==typeof(self.dUserTierinfo[id].tier)) {
				var retHTMLObj = {};
				for(x in self.dUserTierinfo[id].tier) {
					switch(x) {
						case 'RankedSolo5x5':
						case 'RankedTeam3x3':
						case 'RankedTeam5x5':
							retHTMLObj[x] = self.getTierAward(id, x);
							//retHTML += self.getTierAward(id, x);
							break;
						default:;
					}
				}
				if(retHTMLObj['RankedSolo5x5']) {
					retHTML += self.getTierAward(id, 'RankedSolo5x5');
				}
				if(retHTMLObj['RankedTeam3x3']) {
					retHTML += self.getTierAward(id, 'RankedTeam3x3');
				}
				if(retHTMLObj['RankedTeam5x5']) {
					retHTML += self.getTierAward(id, 'RankedTeam5x5');
				}
			}
		}
		if(''==retHTML){
			retHTML = '<p class="loading">δ��ѯ��������ݣ����Ժ����ԡ�</p>';
		}
		$("#jPersonTierDetail"+id).html(retHTML).show();
	},
	/**
	 * ������������HTML����
	 */
	getTierAward : function(id, x) {
		var self = LW201310_Battle;
		//add by 996 S5��������  start
		if(id>=5){
			var tier = self.dUserTierinfo[id].tier[x][0];//��λ
			var level = self.dUserTierinfo[id].tier[x][1];//�ȼ�
		}else{
			var tier = self.dUserTierinfo[id].tier[x];
		}
		//end
		var name = UserTierValue[id][tier].name;
		var award = UserTierValue[id][tier].award.split(",");
		var eyeskin = self.dUserTierinfo[id].eyeskin;
		var awardHTML = '';
		var title = "";
		var retHTML = "";
		switch(x) {
			case 'RankedSolo5x5':
				title = "��/˫��λ������";
				break;
			case 'RankedTeam3x3':
				title = "3v3ս����λ������";
				break;
			case 'RankedTeam5x5':
				title = "5v5ս����λ������";
				break;
			default:
				return title;
		}
		retHTML = '<h3 class="person-detail-title">'+title+'</h3>';		
		
		// Logo
		if(name) {
			retHTML += '<div class="fl ranks-logo"><img width="135" src="http://ossweb-img.qq.com/images/lol/img/rank/'+tier.toLowerCase()+'-logo.png" alt="'+name+'"><p class="cred">'+name+'</p></div>';
		}

		// Title
		var awardHTML = self.getTierAwardTitle(id, x, tier, name);
		
		//�߿���+��Ƥ������
		if('BRONZE' != tier) {
			// Frame
			retHTML += '<div class="fl ranks-frame"><p class="ranks-title">'+name+'�߿�</p><img src="http://ossweb-img.qq.com/images/lol/img/rank/'+tier.toLowerCase()+'-frame.png" alt="'+name+'�߿�"></div>';			
			
			// EyeSkin
			awardHTML += self.getTierAwardEyeskin(id, x, eyeskin);
		}
		
		//����ҳ�߿���   add by 996 S5���½���   
		if(id<=4){
			if('BRONZE' != tier && 'SILVER' != tier) {
				awardHTML += '<li><p class="ranks-title">'+name+'����ҳ�߿���</p><img src="http://ossweb-img.qq.com/images/lol/img/rank/'+tier.toLowerCase()+'-page.jpg" alt="'+name+'����ҳ�߿���"></li>';
			}
		}else{
			if('BRONZE' != tier){
				//������ʦ����ǿ���߲��ֵȼ�
				if('MASTER' == tier || 'CHALLENGER' == tier){
					awardHTML += '<li><p class="ranks-title">'
					       + name +'����ҳ�߿���</p><img src="http://ossweb-img.qq.com/images/lol/img/rank/'
					       + tier.toLowerCase()+'-loading-page-'+1+'.png" alt="'+name+'����ҳ�߿���"></li>';
				}else{
					awardHTML += '<li><p class="ranks-title">'
					       + name+' '+level+' ����ҳ�߿���</p><img src="http://ossweb-img.qq.com/images/lol/img/rank/'
					       + tier.toLowerCase()+'-loading-page-'+level+'.png" alt="'+name+' '+level+' ����ҳ�߿���"></li>';
				}
			}
		}
		
		//Ӣ��Ƥ������
		if('BRONZE' != tier && 'SILVER' != tier) {			
			// Page  delete by 996 S5���½���
			//awardHTML += '<li><p class="ranks-title">'+name+'����ҳ�߿���</p><img src="http://ossweb-img.qq.com/images/lol/img/rank/'+tier.toLowerCase()+'-page.jpg" alt="'+name+'����ҳ�߿���"></li>';
			
			// HeroSkin
			var awardSkin = '';
			switch(id) {
				case 2:
					awardSkin = 'http://ossweb-img.qq.com/images/lol/img/rank/skin-janna.jpg';
					break;
				case 3:
					awardSkin = 'http://ossweb-img.qq.com/images/lol/img/rank/skin-ellis.jpg';
					break;
				case 4:
					awardSkin = 'http://ossweb-img.qq.com/images/lol/img/rank/skin-morgana.jpg';
					break;
				//add by 996 S5���½���
				case 5:
				    awardSkin = 'http://ossweb-img.qq.com/images/lol/wh176x320/15008.jpg';
				    break;
				//add by 996 S6��������
				case 6:
					awardSkin = 'http://ossweb-img.qq.com/images/lol/wh176x320/57007.jpg';
				    break;
			}
			awardHTML += '<li><p class="ranks-title">'+name+'Ӣ��Ƥ������</p><img src="'+awardSkin+'" alt="'+name+'Ӣ��Ƥ������"></li>';
		}					
		retHTML += '<div class="fl ranks-other"><ul class="clearfix">'+awardHTML+'</ul></div>';
		return retHTML;
	},
	/**
	 *ͷ����
	 */
	getTierAwardTitle : function(id, x, tier, name) {
		var self = LW201310_Battle;
		var title = "";
		tier = tier.toLowerCase();
		if(4==id) {
			if('challenger'==tier) {
				var iconid = 0;
				switch(x) {
					case 'RankedSolo5x5':
						iconid = self.dUserTierinfo[id].challenger.s41;
						break;
					case 'RankedTeam3x3':
						iconid = self.dUserTierinfo[id].challenger.s42;
						break;
					case 'RankedTeam5x5':
						iconid = self.dUserTierinfo[id].challenger.s43;
						break;
					default:
						return "";
				}
				if(0==iconid) {
					return "";
				}
				title = tier+"-profileicon-s4-"+iconid+".jpg";
			}else{
				switch(x) {
					case 'RankedSolo5x5':
						title = tier+"-profileicon-s41.jpg";
						break;
					case 'RankedTeam3x3':
						title = tier+"-profileicon-s42.jpg";
						break;
					case 'RankedTeam5x5':
						title = tier+"-profileicon-s43.jpg";
						break;
					default:
						return title;
				}
			}
		}
		//add by 996 S5���½��� start
		else if(id>=5){
			if('challenger'==tier) {
				var iconid = 0;
				switch(x) {
					case 'RankedSolo5x5':
						iconid = self.dUserTierinfo[id].challenger.icon1;
						break;
					case 'RankedTeam3x3':
						iconid = self.dUserTierinfo[id].challenger.icon2;
						break;
					case 'RankedTeam5x5':
						iconid = self.dUserTierinfo[id].challenger.icon3;
						break;
					default:
						return "";
				}
				if(0==iconid) {
					return "";
				}
				title = tier+"-icon-s"+id+"-"+iconid+".jpg";
			}else{
				switch(x) {
					case 'RankedSolo5x5':
						title = tier+"-icon-s"+id+"1.jpg";
						break;
					case 'RankedTeam3x3':
						title = tier+"-icon-s"+id+"2.jpg";
						break;
					case 'RankedTeam5x5':
						title = tier+"-icon-s"+id+"3.jpg";
						break;
					default:
						return title;
				}
			}
		}
		//end 
		else{
			title = tier+"-profileicon-s"+id+".jpg";
		}
		return '<li><p class="ranks-title">'+name+'ͷ��</p><img src="http://ossweb-img.qq.com/images/lol/img/rank/'+title+'" alt="'+name+'ͷ��"></li>';
	},
	/**
	 * ��Ƥ������
	 */
	getTierAwardEyeskin : function(id, x, eyeskin) {
		if(3==id) {
			if(''!=eyeskin) {
				return '<li><p class="ranks-title">��Ƥ������</p><img src="'+eyeskin+'" alt="��Ƥ������"></li>';
			}
		}
		//edit by 996 S5������������
		if(id>=4) {
			if(''!=eyeskin && ('RankedTeam3x3'==x || 'RankedTeam5x5'==x)) {
				return '<li><p class="ranks-title">��Ƥ������</p><img src="'+eyeskin+'" alt="��Ƥ������"></li>';
			}
		}
		return '';
	},
	userSearch : function(id) {
		var self = LW201310_Battle;
        //ͳһ��Ȩ����  add by 996 2017-03-10
		//var goURL = "http://apps.game.qq.com/lol/Go/Entrance/auth?ua1=5&ua2=1&p2="+self.dAreaSelected+"&c1="+id+"&ra1=retSNameObj&r="+Math.random();
		//$.getScript(goURL,function(){
			//console.log(retSNameObj);
		//});
		//var submitURI = self.dAppsAPIURI+"name.php?p2="+self.dAreaSelected+"&c1="+id+"&d1=retSNameObj&r="+Math.random();
		var submitURI = "http://apps.game.qq.com/lol/Go/Entrance/auth?ua1=5&ua2=1&p2="+self.dAreaSelected+"&c1="+id+"&ra1=retSNameObj&r="+Math.random();
		$.getScript(submitURI, function(){
			if(0==retSNameObj.status) {
				window.location.href = self.dPageURI+"personal.shtml?id="+retSNameObj.msg+"&area="+self.dAreaSelected;
				return;
			}else{
				alert(retSNameObj.msg);
			}
		});
	},
	userComment : function(num) {
		var self = LW201310_Battle;
		var submitURI = self.dAppsAPIURI+"comment.php?p1="+self.dUserId+"&p2="+self.dArea+"&d1=retComment&r="+Math.random();
		$.getScript(submitURI, function(){
			if(0==retComment.status) {
				var j=0;
				var retHTML = frdHTML = '';
				var data = retComment.msg;
				for(x in retComment.msg) {
					if(j<num) {
						var strtime = self.reloadCommentDate(retComment.msg[x].date);
						retHTML += '<li class="bgcolor1"><a title="��'+retComment.msg[x].digg+'���˾��ú���" href="javascript:LW201310_Battle.userCommentDigg('+retComment.msg[x].id+');">'+retComment.msg[x].comment+'</a></li>';
						frdHTML += '<li><span class="fl cgray">'+strtime+'�յ����ۣ�</span><p class="fl w50">'+retComment.msg[x].comment+'</p></li>';
						j++;
					}
				}
				if(num<50) {
					$("#jIndexComment").html(retHTML);
				}else{
					$("#jPersonComment").html(retHTML);
					$("#jFrdComment").html(frdHTML);
				}
			}else{
				var retHTML = '<li class="noresult bgcolor4">'+retComment.msg+'</li>';
				if(num<50) {
					$("#jIndexComment").html(retHTML);
				}else{
					$("#jPersonComment").html(retHTML);
				}
			}
		});
	},
	reloadCommentDate : function(string) {
		var re = /^(\d{2,4})-(\d{1,2})-(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/;
		if( re.test(string) ) {
			var t = string.match(re);
			var d = new Date(t[1], t[2]-1, t[3], t[4], t[5], t[6]);
			var c = new Date();
			var s = (c.getTime() - d.getTime())/1000;
			var m = Math.floor(s/60);
			var h = Math.floor(s/3600);
			var d = Math.floor(s/86400);
			var n = Math.floor(s/(86400*30));
			var y = Math.floor(s/(86400*365));
			if(y>0) return y+"����ǰ"; 
			if(n>0) return n+"������ǰ";
			if(d>0) return d+"����ǰ";
			if(h>0) return h+"Сʱ��ǰ";
			if(m>0) return m+"������ǰ";
		}
		return "�ո�";
	},
	userCommentPost : function(word) {
		if(word.length<1||word.length>10) {
			alert("��������Ժ��ѵ����ۣ����10���֡�");
			return;
		}
		var re = /[\x00-\x2f]/ig;
		if(re.exec(word)) {
			alert("��Ч�����ۣ����޸ĺ������ύ��");
			return;
		}
		var self = LW201310_Battle;
		var submitURI = self.dAppsAPIURI+"digg.php?p0=word&p1="+self.dUserId+"&p2="+self.dArea+"&c1="+word+"&d1=retCPostObj&r="+Math.random();
		$.getScript(submitURI, function(){
			alert(retCPostObj.msg);
			return;
		});
	},
	userCommentDigg : function(id) {
		var self = LW201310_Battle;
		var submitURI = self.dAppsAPIURI+"digg.php?p0=digg&p1="+self.dUserId+"&p2="+self.dArea+"&c1="+id+"&d1=retCDiggObj&r="+Math.random();
		$.getScript(submitURI, function(){
			alert(retCDiggObj.msg);
			return;
		});
	},
	userBaseinfo : function(callback) {
		var self = LW201310_Battle;
		var submitURI = self.dAppsAPIURI+"userinfo.php?p1="+self.dUserId+"&p2="+self.dArea+"&d1=retBaseinfo&r="+Math.random();
		$.getScript(submitURI, function(){
			if(0==retBaseinfo.status) {
				var iconHTML = '<img width="100" height="100" alt="" src="http://ossweb-img.qq.com/images/lol/img/profileicon2/profileicon'+retBaseinfo.msg.icon+'.jpg"></p>';
				var areaName = LOLServerSelect.zoneToName(retBaseinfo.msg.area);
				$("#jPersonIcon").html(iconHTML);
				$("#jPersonName").html(decodeURI(retBaseinfo.msg.name));
				$("#jPersonTitle").html(decodeURI(retBaseinfo.msg.name)+"["+areaName+"]");
				if(""==$("#jPersonArea").html()) {
					var areaHTML = '<li class="current"><img width="50" height="50" alt="" src="http://ossweb-img.qq.com/images/lol/img/server/server'+retBaseinfo.msg.area+'.jpg"><p>'+areaName+'</p></li>';
					$("#jPersonArea").html(areaHTML);
				}
				self.dUserBaseinfo = retBaseinfo.msg;
				callback(retBaseinfo);
				
				if(retBaseinfo.msg.tier) {
					var tierName = UserTierValue[4][retBaseinfo.msg.tier].name;
					var tierIcon = "http://ossweb-img.qq.com/images/lol/img/rank/";
					if('CHALLENGER' != retBaseinfo.msg.tier) {
						tierName += retBaseinfo.msg.rank+"��";
						tierIcon += retBaseinfo.msg.tier.toLocaleLowerCase()+"_"+self.reloadTierRanktoNum(retBaseinfo.msg.rank)+".jpg";
					}else{
						tierIcon += retBaseinfo.msg.tier.toLocaleLowerCase()+".jpg";
					}
					$("#jUserTierRank").html(tierName);
					$("#jUserTierIcon").attr('src', tierIcon);
				}else{
					$("#jUserTierRank").html('������λ����λ��Ϣ');
					$("#jUserTierIcon").attr('src', 'http://ossweb-img.qq.com/images/lol/img/rank/rank_none.jpg');
				}				
			}else{
				callback(retBaseinfo.msg);
			}
		});
	},
	reloadTierRanktoNum : function(n) {
		var rNum = ['I','II','III','IV','V','VI','VII','VIII','IX'];
		for(x in rNum) {
			if(n == rNum[x]) {
				return parseInt(x)+1;
			}
		}
		return 0;
	},
	userGameinfo : function() {
		var self = LW201310_Battle;
		//var submitURI = self.dAppsAPIURI+"personal.php?p1="+self.dUserId+"&p2="+self.dArea+"&d1=gameObj&r="+Math.random();
		//var submitURI = self.dAppsAPIURI+"qxt.php?p1="+self.dUserId+"&p2="+self.dArea+"&d1=gameObj&type=1&r="+Math.random();//add by 996 ����ͼ�л�
        var submitURI = "http://apps.game.qq.com/lol/Go/battle/qxt?p1="+self.dUserId+"&p2="+self.dArea+"&type=jsonp&r1=gameObj&source=1&r="+Math.random();
		$.getScript(submitURI, function(){
			var retHTML = '';
			if(0==gameObj.status) {
				var data = gameObj.msg;
				self.dLastGame = data.l;
				if(data.b){					
					// ��������
					var scoreHTML = '';
					scoreHTML += '<li><span class="lab">��ɱ</span><span title="������ɱӢ������" class="loadbar"><i class="up" style="width:'+data.b.p1.k+'%"></i></span></li>';
					scoreHTML += '<li><span class="lab">����</span><span title="������������" class="loadbar"><i class="up" style="width:'+data.b.p1.a+'%"></i></span></li>';
					scoreHTML += '<li><span class="lab">����</span><span title="������������" class="loadbar"><i class="up" style="width:'+data.b.p1.d+'%"></i></span></li>';
					scoreHTML += '<li><span class="lab">����</span><span title="������������" class="loadbar"><i class="up" style="width:'+data.b.p1.m+'%"></i></span></li>';					
					scoreHTML += '<li><span class="lab">��Ǯ</span><span title="������ȡ�Ľ�Ǯ����" class="loadbar"><i class="up" style="width:'+data.b.p1.g+'%"></i></span></li>';					
					scoreHTML += '<li><span class="lab">����</span><span title="������������" class="loadbar"><i class="up" style="width:'+data.b.p1.t+'%"></i></span></li>';
					self.setUserBattleinfo(data.b.p2);
					$("#jPersonScore").html(scoreHTML);					
		
				}
				self.userGameWin();
				/*if(data.h){
					var retHTML = '';
					var j=0;
					for(x in data.h) {
						if(j<8){
							var imgsrc='http://ossweb-img.qq.com/images/lol/img/champion/'+LOLherojs.champion.data[LOLherojs.champion.keys[data.h[x]]].image.full;
							var id=LOLherojs.champion.keys[data.h[x]];
							var name=LOLherojs.champion.data[id].name;
							var title=LOLherojs.champion.data[id].title;
							retHTML += '<li><a href="/web201310/info-defail.shtml?id='+id+'" target="_blank"><img width="74" alt="'+name+' '+title+'" src="'+imgsrc+'"><p>'+name+'</p></a></li>';
							j++;
						}
					}
					$("#jPersonHeros").html(retHTML);
				}
				//WIN
				$("#jGameWin").html(data.w);
				var winp = Math.floor((data.w/data.t)*100);
				var winHTML = '<em class="fl">'+winp+'</em><sup>%</sup>';
				$("#jGameWinP").html(winHTML);*/
			}else{
				$("#jGameBody").html(gameObj.msg);
			}
		});
		//add by 996 20170330 golang ��֤IDIP�ϱ�
//		var goUrl = "http://apps.game.qq.com/lol/Go/battle/qxt?p1="+self.dUserId+"&p2="+self.dArea+"&type=jsonp&r1=gameObj&r="+Math.random();
//		$.getScript(goUrl, function(){
//			//todo
//		});
	},
	userGameWin : function() {
		var self = LW201310_Battle;
		var submitURI = self.dAppsAPIURI+"battlewin.php?p1="+self.dUserId+"&p2="+self.dArea+"&d1=gameWinObj&r="+Math.random();
		$.getScript(submitURI, function(){
			var retHTML = '';
			if(0==gameWinObj.status) {
				var data = gameWinObj.msg;
				$("#jGameWin").html(data.w);
				var winp = Math.floor((data.w/data.t)*100);
				var winHTML = '<em class="fl">'+winp+'</em><sup>%</sup>';
				$("#jGameWinP").html(winHTML);
			}
			if(data.h){
				var retHTML = '';
				var j=0;
				for(x in data.h) {
					if(j<8){
						if(LOLherojs.champion.data[LOLherojs.champion.keys[data.h[x]]]) {
							var imgsrc='http://ossweb-img.qq.com/images/lol/img/champion/'+LOLherojs.champion.data[LOLherojs.champion.keys[data.h[x]]].image.full;
							var id=LOLherojs.champion.keys[data.h[x]];
							var name=LOLherojs.champion.data[id].name;
							var title=LOLherojs.champion.data[id].title;
							retHTML += '<li><a href="/web201310/info-defail.shtml?id='+id+'" target="_blank"><img width="74" alt="'+name+' '+title+'" src="'+imgsrc+'"><p>'+name+'</p></a></li>';
							j++;
						}
					}
				}
				$("#jPersonHeros").html(retHTML);
			}
		});
	},
	userGameList : function(num) {		
		var self = LW201310_Battle;
		if(1==self.dPage){$("#jPrevPage").hide();}else{$("#jPrevPage").show();}
		$("#jIndexBattleDetail").html('');
		$("#jPersonBattleDetail").html('');
		self.reloadBattleList(function(battleObj){
			var retHTML = '';
			if("string"==typeof(battleObj)) {
				if(num<5) {
					self.userGameListIndexFixed(3, retHTML);
				}else{
					$("#jPersonBattleList").html('<li class="noresult">'+battleObj+'</li>');
				}
				$("#jNextPage").hide();				
				return;
			}
			var i=flag=0;
			for(x in battleObj.result) {
				if(i<num) {
					var obj=battleObj.result[x];
					var classname=(0==i)?' class="Gid'+obj.gid+' current"':' class="Gid'+obj.gid+'"';
					var winclass=('ʧ��'==obj.win)?'cred':'cgreen';
					retHTML += '<li'+classname+'><a href="javascript:LW201310_Battle.loadGame(\''+obj.gid+'\',\''+num+'\',\''+obj.date+'\');" class="pagetab-list-lnk"><div class="smallmod"><img width="40" height="40" alt="" src="'+obj.src+'"><p><span class="'+winclass+' cresult">'+obj.win+'</span>&nbsp;<em>'+obj.kda+'</em></p><p class="carea">'+obj.gamemode+'</p><p class="cdate">'+obj.date+'</p></div></a></li>';				
					if(0==flag){
						self.dGid=obj.gid;
						self.loadGame(self.dGid, num, obj.date);
						flag=1;
					}
					i++;
				}
			}			
			if(battleObj.total<5){$("#jNextPage").hide();}else{$("#jNextPage").show();}
			if(num<5) {
				self.userGameListIndexFixed(3-parseInt(battleObj.total), retHTML);
			}else{
				$("#jPersonBattleList").html(retHTML);
			}
		});
	},
	reloadBattleList : function(callback) {
		var self = LW201310_Battle;
		var keys = self.dUserId +'z'+self.dArea+'z'+self.dPage+'z'+self.dUserGameDate.replace(/-/g, "");
		if('object'==typeof(self.dUserGamelist[keys])) {
			callback(self.dUserGamelist[keys]);
			return;
		}
		var title = 'ret'+keys;
		//var submitURI = self.dAppsAPIURI+"battle.php?p1="+self.dUserId+"&p2="+self.dArea+"&p4="+self.dUserGameDate+"&page="+self.dPage+"&d1="+title+"&r="+Math.random();
        var submitURI = "http://apps.game.qq.com/lol/Go/Entrance/auth?ua1=4&ua2=1&p1="+self.dUserId+"&p2="+self.dArea+"&p4="+self.dUserGameDate+"&page="+self.dPage+"&ra1="+title+"&r="+Math.random();			
		$.getScript(submitURI, function(){	
			eval('var battleObj='+title+';');
			if(0==battleObj.status && battleObj.msg.total>0) {
				var retObj = {'total':battleObj.msg.total, 'result':[]};
				for(x in battleObj.msg.result) {
					var obj=battleObj.msg.result[x];
					if(LOLherojs.champion.data[LOLherojs.champion.keys[obj.champion]]) {
						obj.src='http://ossweb-img.qq.com/images/lol/img/champion/'+LOLherojs.champion.data[LOLherojs.champion.keys[obj.champion]].image.full;
					}
					obj.win=(obj.win==1)?"ʤ��":"ʧ��";
					obj.kda=(''==obj.killed && ''==obj.death && ''==obj.assists)?"":(obj.killed+'ɱ'+obj.death+'��'+obj.assists+'����');
					obj.date=obj.datetime.substr(0,16).replace(/-/g, "/");
					obj.gamedate=obj.datetime.substr(0,10);
					retObj.result.push(obj);
				}
				self.dUserGamelist[keys] = retObj;
				callback(retObj);
			}else{
				callback(battleObj.msg);
			}
		});
		//ͳһ��Ȩ����  ս���б�  add by 996 2017-03-09
//		var goUrl = "http://apps.game.qq.com/lol/Go/Entrance/auth?ua1=4&ua2=1&p1="+self.dUserId+"&p2="+self.dArea+"&p4="+self.dUserGameDate+"&page="+self.dPage+"&ra1="+title+"&r="+Math.random();		
//		$.getScript(goUrl, function(){
//			console.log(title);
//		});
	},
	userGameListIndexFixed : function(num, tmpHTML) {
		var self = LW201310_Battle;
		var retHTML = '';
		if(num>0) {
			var dateObj = new Date(self.dUserGameDate.replace(/-/g, '/'));
			dateObj.setDate(1);
			dateObj.setMonth(dateObj.getMonth()-1);
			var y = dateObj.getFullYear();
			var m = dateObj. getMonth() + 1;
			LW201310_Battle.dUserGameDate=y +"-"+ m+"-15";
			self.reloadBattleList(function(battleObj){
				if("object"==typeof(battleObj)) {
					var i=0;
					var flag=(num==3)?0:1;
					for(x in battleObj.result) {
						if(i<num) {
							var obj=battleObj.result[x];
							var classname=(0==i && 0==flag)?' class="Gid'+obj.gid+' current"':' class="Gid'+obj.gid+'"';
							var winclass=('ʧ��'==obj.win)?'cred':'cgreen';
							retHTML += '<li'+classname+'><a href="javascript:LW201310_Battle.loadGame(\''+obj.gid+'\',\''+num+'\',\''+obj.date+'\');" class="pagetab-list-lnk"><div class="smallmod"><img width="40" height="40" alt="" src="'+obj.src+'"><p><span class="'+winclass+' cresult">'+obj.win+'</span>&nbsp;<em>'+obj.kda+'</em></p><p class="carea">'+obj.gamemode+'</p><p class="cdate">'+obj.date+'</p></div></a></li>';				
							if(0==flag){
								self.dGid=obj.gid;
								self.loadGame(self.dGid, num, obj.date);
								flag=1;					
							}
							i++;
						}
					}
				}else{
					if(''==tmpHTML) {
						retHTML = '<li class="noresult">'+battleObj+'</li>';
					}
				}
				$("#jIndexBattleList").html(tmpHTML+retHTML);			
			});
		}else{
			$("#jIndexBattleList").html(tmpHTML);
		}
	},
	reloadPersonStyle : function(a){
		for(i=1;i<=5;i++) {
			if(i==a) {
				$("#jPersonDiv"+i).show();
				$("#jPersonTab"+i).attr('class', 'current');
			}else{
				$("#jPersonDiv"+i).hide();
				$("#jPersonTab"+i).attr('class', '');
			}
		}
	},
	userBattlePrevPage : function() {
		var self = LW201310_Battle;
		if(self.dPage > 1) {
			self.dPage --;
			self.userGameList(5);
		}
	},
	userBattleNextPage : function() {
		var self = LW201310_Battle;
		if(self.dPage < 20) {
			self.dPage ++;
			self.userGameList(5);
		}
	},
	loadGame : function(g, n, d) {
		var self = LW201310_Battle;	
		if(g>0) {
			self.dUserGameDate = d.substr(0,7).replace("/","-")+"-15";
			self.dCurGameDateTime = d.replace(/\//g,"-");//add by 996
			$("#jIndexBattleList li").removeClass('current');
			$("#jPersonBattleList li").removeClass('current');
			$(".Gid"+g).addClass('current');
			self.dGid = g;
			self.dCurBattleNum = n;
			self.userBattleinfo(n);
		}
	},
	userBattleinfo : function(n) {
		var self = LW201310_Battle;
		if(n<5) {
			$("#jIndexBattleDetail").html("���ݼ�����...");
		}else{
			$("#jPersonBattleDetail").html("���ݼ�����...");
		}
		self.reloadBattleinfo(function(gameObj){
			var retHTML = '';
			retHTML += '<p class="myhis-id">����ID:'+self.dGid+'</p>';
			if(gameObj['w']) {
				retHTML += '<h4 class="cgreen"><i class="cgreen"></i>ʤ������</h4>';
				var liHTML = '';
				for(y in gameObj['w']) {
					liHTML += self.reloadBattleHTML(gameObj['w'][y]);
				}
				retHTML += '<ul class="clearfix">'+liHTML+'</ul>';
			}else{
				retHTML += '<h4 class="cgreen"><i class="cgreen"></i>ʤ������</h4>';
				var liHTML = '<li>�ǳ���Ǹ��������Ϊ����ʱ���޷���ʾ���ս��Ϣ��</li>';
				retHTML += '<ul class="clearfix">'+liHTML+'</ul>';
			}
			if(gameObj['l']) {
				retHTML += '<h4 class="cred"><i class="cred"></i>ʧ�ܶ���</h4>';
				var liHTML2 = '';
				for(y in gameObj['l']) {
					liHTML2 += self.reloadBattleHTML(gameObj['l'][y]);
				}
				retHTML += '<ul class="clearfix">'+liHTML2+'</ul>';
			}else{
				retHTML += '<h4 class="cred"><i class="cred"></i>ʧ�ܶ���</h4>';
				var liHTML = '<li>�ǳ���Ǹ��������Ϊ����ʱ���޷���ʾ���ս��Ϣ��</li>';
				retHTML += '<ul class="clearfix">'+liHTML+'</ul>';
			}
			if(n<5) {
				$("#jIndexBattleDetail").html(retHTML);
				showPopup("jIndexBattleDetail","img");
			}else{
				$("#jPersonBattleDetail").html(retHTML);
				showPopup("jPersonBattleDetail","img");
			}
		});
	},	
	reloadBattleHTML : function(obj) {
		var self = LW201310_Battle;
		var item='';
		for(var i=1; i<=7; i++){if(obj['item'+i]>0) {item += '<li><img data-title="'+obj['item'+i]+'" src="http://ossweb-img.qq.com/images/lol/img/item/'+obj['item'+i]+'.png" width="24" height="24" /></li>';}};
		if(self.dUserId==obj.id) {
			var name='<b>'+decodeURI(obj.name)+'</b>';
		}else{
			var name=decodeURI(obj.name);
		}
		var retHTML = '<li class="myhis-list-item"><img width="26" height="26" alt="" src="'+obj.src+'"><p class="name"><a href="javascript:LW201310_Battle.userAreaChange('+obj.id+','+self.dArea+');">'+name+'</a></p><p class="mony">��Ǯ��<em>'+Math.floor(obj.money/100)/10+'k'+'</em></p><p class="rline"><b>'+obj.killed+'</b>ɱ</p><p class="rline"><b>'+obj.death+'</b>��</p><p class="helps"><b>'+obj.assists+'</b>����</p><ul class="myitem">'+item+'</ul></li>';
		return retHTML;
	},	
	reloadBattleinfo : function(callback) {
		var self = LW201310_Battle;
		if('object'==typeof(self.dUserGameinfo[self.dGid])) {
			callback(self.dUserGameinfo[self.dGid]);
			return;
		}
		var title = 'retGid'+self.dGid;		
		//var submitURI = self.dAppsAPIURI+"battle.php?p1="+self.dUserId+"&p2="+self.dArea+"&p4="+self.dUserGameDate+"&p5="+self.dGid+"&d1="+title+"&r="+Math.random();
		//var submitURI = self.dAppsAPIURI+"battle.php?p1="+self.dUserId+"&p2="+self.dArea+"&p4="+self.dUserGameDate+"&p5="+self.dGid+"&d1="+title+"&mdate="+self.dCurGameDateTime+"&r="+Math.random();//add by 996
		var submitURI = "http://apps.game.qq.com/lol/Go/Entrance/auth?ua1=3&ua2=1&p1="+self.dUserId+"&p2="+self.dArea+"&p4="+self.dUserGameDate+"&p5="+self.dGid+"&ra1="+title+"&mdate="+self.dCurGameDateTime+"&r="+Math.random();
		$.getScript(submitURI, function(){	
			eval('var gameObj='+title+';');
			if(0==gameObj.status && gameObj.msg.total>0) {
				var retObj = new Array();
				for(x in gameObj.msg.result) {
					retObj[x] = new Array();
					if(gameObj.msg.result[x]) {						
						for(y in gameObj.msg.result[x]) {	
							var obj=gameObj.msg.result[x][y];
							if(LOLherojs.champion.data[LOLherojs.champion.keys[obj.champion]]) {
								obj.src = 'http://ossweb-img.qq.com/images/lol/img/champion/'+LOLherojs.champion.data[LOLherojs.champion.keys[obj.champion]].image.full;
							}
							obj.win = (obj.win==1)?"ʤ��":"ʧ��";
							obj.kda = obj.killed+'/'+obj.death+'/'+obj.assists;
							obj.date = obj.datetime.substr(5,5).replace(/-/, "/");
							retObj[x].push(obj);
						}
					}
				}
				self.dUserGameinfo[self.dGid] = retObj;
				callback(retObj);
			}else{
				if(self.dCurBattleNum<5) {
					$("#jIndexBattleDetail").html(gameObj.msg);
				}else{
					$("#jPersonBattleDetail").html(gameObj.msg);
				}
			}
		});
		//ͳһ��Ȩ����  ս������  add by 996 2017-03-09
//		var goUrl = "http://apps.game.qq.com/lol/Go/Entrance/auth?ua1=3&ua2=1&p1="+self.dUserId+"&p2="+self.dArea+"&p4="+self.dUserGameDate+"&p5="+self.dGid+"&ra1="+title+"&mdate="+self.dCurGameDateTime+"&r="+Math.random();
//		$.getScript(goUrl, function(){
//			//todo
//			console.log(title);
//		});
	},
	formatMonthSelector : function() {
		var self = LW201310_Battle;
		var retHTML = '';
		for(var i=0; i<3; i++) {
			var dateObj = new Date();
			dateObj = new Date(dateObj.setDate(15));
			var newDateObj = new Date(dateObj.setMonth(dateObj.getMonth()-i));
			var y = newDateObj.getFullYear();
			var m = newDateObj. getMonth() + 1;
			var classname="";
			var d = y+"-"+m+"-15";
			if(0==i) {
				classname="current";
				self.dUserGameDate=d;
			}
			retHTML += '<li id="GameDate'+d.replace(/-/g,'_')+'" onclick="LW201310_Battle.changeGameDate(\''+d.replace(/-/g,'_')+'\');" class="'+classname+'"><span class="nr">'+y+'/'+m+'</span></li>';
		}
		$("#jGameDate").html(retHTML);
	},
	changeGameDate : function(sDate) {
		var self = LW201310_Battle;
		self.dPage = 1;
		self.dUserGameDate = sDate.replace(/_/g, "-");
		self.userGameList(5);
		$("#jGameDate li").removeClass('current');
		$("#GameDate"+sDate).addClass('current');
	},
	userLoginedPage : function() {
		var self = LW201310_Battle;
		need(["biz.login"], function(LoginManager){
			LoginManager.checkLogin(function(){
				var submitURI = self.dAppsAPIURI+"myarea.php?d1=myAreaObj&r="+Math.random();
				$.getScript(submitURI, function(){
					if(0==myAreaObj.status) {
						var flag=true;
						for(x in myAreaObj.msg) {
							if(myAreaObj.msg[x].id == self.dUserId && myAreaObj.msg[x].area == self.dArea) {
								flag=false;
							}
						}					
						if(flag) return;						
						var areaHTML = '';
						var defaultAreaHTML = '';						
						var cookieKey = self.dCookieKey+LoginManager.getUserUin();
						var tmp = milo.cookie.get(cookieKey);
						if(tmp) {
							var cookieValue = tmp.split(",");
							var cookieUserId = cookieValue[0];
							var cookieAreaId = cookieValue[1];
						}else{
							var cookieUserId = cookieAreaId = 0;
						}
						for(x in myAreaObj.msg) {							
							var userId = myAreaObj.msg[x].id;
							var areaId = myAreaObj.msg[x].area;
							var areaName = LOLServerSelect.zoneToName(areaId);					
							if(areaId == self.dArea) {
								defaultAreaHTML = '<li class="current" onclick="LW201310_Battle.userAreaChange('+userId+', '+areaId+');"><img width="50" height="50" alt="" src="http://ossweb-img.qq.com/images/lol/img/server/server'+areaId+'.jpg"><p>'+areaName+'</p></li>';								
								if(cookieUserId>0 && cookieAreaId>0) {
									if(userId==cookieUserId && areaId==cookieAreaId) {
										$("#jPersonRP").html(cookieValue[6]).show();
										$("#jPersonIP").html(cookieValue[7]).show();
										$("#jPersonRS").html(cookieValue[8]).show();
										$("#jPersonRSP").show();
										$("#jPersonBank").show();
									}
								}								
							}else{
								areaHTML += '<li onclick="LW201310_Battle.userAreaChange('+userId+', '+areaId+');"><img width="50" height="50" alt="" src="http://ossweb-img.qq.com/images/lol/img/server/server'+areaId+'.jpg"><p>'+areaName+'</p></li>';
								$("#jShowMoreArea").show();
							}						
						}
						$("#jPersonArea").html(defaultAreaHTML);
						$("#jPersonOtherArea").html(areaHTML);
					}
				});
				return;
			});
		});
	},
	userAreaChange : function(id, area) {
		var self = LW201310_Battle;
		window.location.href = self.dPageURI+"personal.shtml?id="+id+"&area="+area;
	},
	setUserBattleinfo : function(value) {
		var self = LW201310_Battle;
		if(!value) return;
		if(value.split(",").length!=7) return;
		self.dUserChartinfo = value.split(",");
		return;
	},	
	areaOpenedChecked : function(area) {
		return true;
		var self = LW201310_Battle;
		for(x in self.dAreaOpened) {
			if(self.dAreaOpened[x] == area) {
				return true;
			}
		}
		return false;
	},
	userBattleDiff : function() {		
		var self = LW201310_Battle;
		need(["biz.login"], function(LoginManager){
			LoginManager.checkLogin(function(){
				if(0==LW201310_Userinfo.dUserId) {
					alert("δ��ȡ�����Ľ���ս����Ϣ�������µ�¼���ԡ�");
					return;
				}
				if(self.dUserId==LW201310_Userinfo.dUserId && self.dArea==LW201310_Userinfo.dArea) {
					alert("���ܺ��Լ���ս���Ա��ء�");
					return;
				}
				var submitURI = self.dAppsAPIURI+"personal.php?p1="+LW201310_Userinfo.dUserId+"&p2="+LW201310_Userinfo.dArea+"&d1=pinfoObj&r="+Math.random();
				$.getScript(submitURI, function(){
					if(0==pinfoObj.status) {						
						var myBattle = pinfoObj.msg.b.p2.split(",");
						var userBattle = self.dUserChartinfo;
						self.userBattleDiffShow(myBattle, userBattle);
					}else{
						alert("δ��ȡ�������ڵ�ս����Ϣ���뻻���������ԡ�");
					}
				});
			}, function(){
				LW201310_Userinfo.userLogin();
			});
		});
	},
	userBattleDiffShow : function(myBattle, userBattle) {
		var self = LW201310_Battle;		
		var j=k=0;
		var retHTML = '';
		var chartItem = ['��ɱ','����','����','����','ħ��','����','��Ǯ'];
		var chartColor= ['popbar-sl','popbar-pws','popbar-scs', 'popbar-dld'];
		var cookieLoginKey = self.dCookieKey+LoginManager.getUserUin();
		var cookieLoginVal = milo.cookie.get(cookieLoginKey);
		if(cookieLoginVal) {
			var id = cookieLoginVal.split(",")[0];
			var area = cookieLoginVal.split(",")[1];
			var icon = cookieLoginVal.split(",")[4];
			var name = decodeURI(cookieLoginVal.split(",")[2]);
			for(var i=0;i<7;i++) {
				retHTML += '<li class="fl w100 '+chartColor[i%4]+'"><p class="popnums popnums-left">'+myBattle[i]+'</p><p class="popbar-line popbar-left"><span class="up" style="width:'+myBattle[i]+'%"></span></p><p class="popbar-title">'+chartItem[i]+'</p><p class="popbar-line popbar-right"><span class="up" style="width:'+userBattle[i]+'%"></span></p><p class="popnums popnums-right">'+userBattle[i]+'</p></li>';
				if(parseInt(userBattle[i])<parseInt(myBattle[i])) {
					j++;
				}
				if(parseInt(userBattle[i])>parseInt(myBattle[i])){
					k++;
				}
			}
			$("#jDiffItem").html(retHTML);
			$("#jDiff1").html('<img width="80" height="80" src="http://ossweb-img.qq.com/images/lol/img/profileicon2/profileicon'+icon+'.jpg" alt=""><h2>'+name+'</h2><p class="popnum"><b>'+j+'��</b>ʤ��</p>');
			$("#jDiff2").html('<img width="80" height="80" src="http://ossweb-img.qq.com/images/lol/img/profileicon2/profileicon'+self.dUserBaseinfo.icon+'.jpg" alt=""><h2 id="jDiff1Name">'+self.dUserBaseinfo.name+'</h2><p class="popnum"><b id="jDiff1Win">'+k+'��</b>ʤ��</p>');
			showDialogs('popupBoxZJ');
			var wbMsg = "";
			var wbUser = self.dUserBaseinfo.name+"["+LOLServerSelect.zoneToName(self.dUserBaseinfo.area)+"]";
			var wbURI = self.dPageURI+"personal.shtml?id="+id+"&area="+area;
			if(j>k) {
				wbMsg = '#LOLս���Ա�# ̫�����ˣ����ں�'+wbUser+' ��ս���Ա���ʤ��'+j+'���ȫ��ѹ��'+wbURI;
			}else if(j==k) {			
				wbMsg = '#LOLս���Ա�# �һ��һᣡ���ں�'+wbUser+'��ս���Ա��д��˸�ƽ�֣�Ӣ��ϧϧ��ϧѽ��'+wbURI;
			}else{
				wbMsg = '#LOLս���Ա�# ������Ҫ��Ŭ�������ں�'+wbUser+' ��ս���Ա������'+k+'�Ҫ�ӰѾ��ˣ�'+wbURI;
			}
			$("#jShareWBContent").val(wbMsg);
		}
	},
	//��ʾ�Զ����ǩ
	showCustomTab : function() {
		var self = LW201310_Battle;
		if(self.dShowCustomTabFlag) {
			var url = window.location.search;
			var re = /showDiv=(\d+)/ig;
			var p = re.exec(url);
			if(!p) return;
			switch(p[1]) {
			    //��������
				case '2':
					self.dShowCustomTabFlag = false;
					self.userTier();
					break;
				//��ʷս��
				case '3':
					self.dShowCustomTabFlag = false;
					self.userGame();
					break;
				//�ҵ�Ӣ�ۺ�Ƥ��
				case '4':
					self.dShowCustomTabFlag = false;
					LOL_PERSONAL_HEROSKIN.init();
					break;
				//����ӡ��
				case '5':
					self.dShowCustomTabFlag = false;
					self.userFrid();
					break;
			}
			return;
		}
	}
}
LW201310_Battle.init();/*  |xGv00|4ecf11215044e81d23b3435d74b87931 */