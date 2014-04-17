define(function(require){
	var	utilObj	= require("./utility");
	var tmpl_h = require("text!../html/vac_details.html");
	var vacDetails = function() {};
	vacDetails.prototype = {
			vacInfo : [],
			init : function (){
				this.render();
			},
			render : function (){
				var self = this;
				$.when(self.getVacDetails()).then(function(){self.renderUser.apply(self)});
			},
			renderUser : function (){
				var self = this; 
				var template = Handlebars.compile(tmpl_h)(self.vacInfo);
				$(".util-container").html(template);
				//$(".js-user-name a").text("Welcome "+self.userInfo.mobile);
		    //self.registerEvents();
			},
			getVacDetails : function(){
				var self =this;
				var url = "http://10.90.18.174/vac/json/child.php?mode=vac";
				return utilObj.exchangeDataFromServer('GET',url,getStorage('userInfo'),function(json) {
				       if(json.status=="1"){
				          self.vacInfo = json.data;
				          console.log(self.vacInfo);
					       }else{
					    	   showPopup("Error Occoured!");
					       }
					    }
				);
			}
	};
	return new vacDetails();
});