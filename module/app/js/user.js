define(function(require){
	var	utilObj	= require("./utility");
	var tmpl_h = require("text!../html/user.html");
	var userDetails = function() {};
	userDetails.prototype = {
			userInfo : {},
			init : function (){
				this.render();
			},
			render : function (){
				var self = this;
				$.when(self.getUserDetails()).then(function(){self.renderUser.apply(self)});
			},
			renderUser : function (){
				var self = this; 
				$(".util-container").html(Handlebars.compile(tmpl_h)(self.userInfo));
				$(".js-user-name a").text("Welcome "+self.userInfo.mobile);
		    	self.registerEvents();
			},
			registerEvents : function (){
				var self = this;
				$(".js_user_details .btn-primary").on("click", function(e) {
					return self.validateHandler.call(this,e,self);
				});
			},
			validateHandler  :function(e,self){
				var inputArr = $("#user_frm").serializeArray();
				if(utilObj.validateInputs(inputArr)){
					var url = "http://localhost/vac/json/user.php?mode=update";
					utilObj.exchangeDataFromServer('GET',url,inputArr,function(json) {
					       if(json.status==1){
					    	   showPopup("Updated successfully!");
					       }else if(json.status==0){
					    	   showPopup("Already Updated!");
					       }else{
					    	   showPopup("Error Occoured!");
					       }
					    }
					);
				}
			},
			getUserDetails : function(){
				var self =this;
				var url = "http://localhost/vac/json/user.php";
				return utilObj.exchangeDataFromServer('GET',url,getStorage('mobile'),function(json) {
				       if(json.status=="1"){
					    	  self.userInfo = json.data[0];
					       }else{
					    	   showPopup("Error Occoured!");
					       }
					    }
				);
			}
	};
	return new userDetails();
});