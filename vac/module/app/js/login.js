define(function(require){
	var	menuObj	= require("./menu");
	var	utilObj	= require("./utility");
	var tmpl_h 	= require("text!../html/login.html");
	var tmpl_r 	= require("text!../html/register.html");
	var logObj = function() {};
	logObj.prototype = {
			userInfo : {},
			pagetoLoad : "",
			init : function (page){
				this.pagetoLoad = page;
				this.render();
				this.registerEvents();
			},
			render : function (){
				if(this.pagetoLoad=="login"){
					$(".util-container").html(Handlebars.compile(tmpl_h));
				}else{
					$(".util-container").html(Handlebars.compile(tmpl_r));
				}
				
			},
			registerEvents : function (){
				var self = this;
				$(".js_log_details .btn-primary").on("click", function(e) {
					return self.validateHandler.call(this,e,self);
				});
			},
			validateHandler  :function(e,self){
				var url,inputArr;
				if(self.pagetoLoad=="login"){
					inputArr = $("#log_frm").serializeArray();
					url = "http://10.90.18.174/vac/json/authUser.php?mode=log&"+Math.random();
				}else{
					inputArr = $("#reg_frm").serializeArray();
					url = "http://10.90.18.174/vac/json/authUser.php?mode=reg"+Math.random();
				}	
				if(utilObj.validateInputs(inputArr)){
					/*utilObj.exchangeDataFromServer('GET',url,inputArr,function(json) {
					       if(json.status!==0){
					    	   self.userInfo.mobile = $("#mobile_num").val();
					    	   self.userInfo.gId 	= json.status;
					    	   setStorage('mobile',self.userInfo);
					    	   menuObj.init();
					       }else{
					    	   showPopup("Invalid Credentials !");
					       }
					    }
				   );*/
					if(utilObj.validateInputs(inputArr)){
						$.ajax({
						   	type: 'GET',
						   	data : inputArr,
						   	crossDomain: false,
						    url: url,
						    async: false,
						    contentType: "application/json",
						    dataType: 'json',
						    success: function(json) {
						       if(json.status!==0){
						    	   self.userInfo.mobile = $("#mobile_num").val();
						    	   self.userInfo.gId 	= json.status;
						    	   self.userInfo.token 	= json.authToken;
						    	   setStorage('mobile',self.userInfo);
						    	   menuObj.init();
						       }else{
						    	   showPopup("Invalid Credentials !");
						       }   
						    },
						    error: function(jqXHR, textStatus, errorThrown) {
						    	showPopup("Failed!!!!!!!!!!"+jqXHR+ textStatus+ errorThrown);
						   	}
						});
						
					}
				}
			}
	};
	return new logObj();
});
