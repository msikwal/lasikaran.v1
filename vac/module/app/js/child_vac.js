define(function(require){
	var tmpl_cvac = require("text!../html/child_vac.html");
	var childVac = function() {};
	childVac.prototype = {
			init : function (dashBoard){
				this.panel = dashBoard;
				this.render();
				this.registerEvents();
			},
			render : function (){
				var self = this;
				$(".sub-dash-container").html(Handlebars.compile(tmpl_cvac)(self.panel.docDetails));
			},
			registerEvents : function (){
				var self = this;
				$(".child-details .btn-primary").on("click", function(e) {
					return self.validateHandler.call(this,e,self);
				});
			},	
			validateHandler  :function(e,self){
				var inputArr = $("#c_frm").serializeArray();
				if(self.panel.util.validateInputs(inputArr)){
					var url = "http://10.90.18.174/vac/json/child.php?mode=save";
					self.panel.util.exchangeDataFromServer('GET',url,inputArr,function(json) {
					       if(json.status==1){
					    	   showPopup("Record Added successfully!");
					       }else if(json.status==2){
					    	   showPopup("Already Added!");
					       }else{
					    	   showPopup("Error occoured!");
					       }
					    }
					);
				}
			}
	};
	return new childVac();
});