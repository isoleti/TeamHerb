	    	
	   		var n11 = document.getElementById("n11");
		    var n12 = document.getElementById("n12");
			var n13 = document.getElementById("n13");
			
			var n21 = document.getElementById("n21");
			var n22 = document.getElementById("n22");
			var n23 = document.getElementById("n23");
			
			var coun = document.getElementById("counseling");
			var couns = document.getElementById("couns");
			var date = document.getElementById("resdate");
			var count = document.getElementById("rescount");
			
			
	    	function click11(obj){
	    		
	    		var val = $(obj).parent().prev();
	    		var valText = val.text();
	    		alert(val);
	    		alert(valText);
	    		alert(coun);
	    		
	    		
	    		n12.style.display = "none";
	    		n13.style.display = "none";
	    		
	    		$(obj).parent().html("<button class='btn btn-outline-success' onclick='fix11(this)'>수정</button>");	
	    		
	    		
	    		coun.html("<input type='text' value='"+valText+"' readonly>");
	    		
	    	}
	    	
			function click12(obj){    	
			
				var val = $(obj).parent().prev();
				var valText = val.text();
	    		
	    		n11.style.display = "none";
	    		n13.style.display = "none";
	    		
	    		$(obj).parent().html("<button class='btn btn-outline-success' onclick='fix12(this)'>수정</button>");	
	    		
	    		coun.html("<input type='text' value='"+valText+"' readonly>");
	    	}
			
			function click13(obj){
				
				var val = $(obj).parent().prev();
				var valText = val.text();
	    		
	    		n11.style.display = "none";
	    		n12.style.display = "none";	
	    		
	    		$(obj).parent().html("<button class='btn btn-outline-success' onclick='fix13(this)'>수정</button>");	
	    		
	    		coun.html("<input type='text' value='"+valText+"' readonly>");
	    	}
			
			function fix11(obj) {
					
				n11.style.display = "table-row";
				n12.style.display = "table-row";
	    		n13.style.display = "table-row";
	    		$(obj).parent().html("<button class='btn btn-outline-success' onclick='click11(this)'>선택</button>");
			}
	    	
			function fix12(obj) {
				
				n11.style.display = "table-row";
				n12.style.display = "table-row";
	    		n13.style.display = "table-row";
	    		$(obj).parent().html("<button class='btn btn-outline-success' onclick='click12(this)'>선택</button>");
			}
			
			function fix13(obj) {
				
				n11.style.display = "table-row";
				n12.style.display = "table-row";
	    		n13.style.display = "table-row";
	    		$(obj).parent().html("<button class='btn btn-outline-success' onclick='click13(this)'>선택</button>");
			}
			
			function click21(obj){
				
				var val = $(obj).parent().prev();
	    		
	    		n22.style.display = "none";
	    		n23.style.display = "none";
	    		$(obj).parent().html("<button class='btn btn-outline-success' onclick='fix21(this)'>수정</button>");	
	    	}
	    	
			function click22(obj){    		
	    		
	    		var val = $(obj).parent().prev();
	    		
	    		n21.style.display = "none";
	    		n23.style.display = "none";
	    		$(obj).parent().html("<button class='btn btn-outline-success' onclick='fix22(this)'>수정</button>");	
	    	}
			
			function click23(obj){
			
				var val = $(obj).parent().prev();
	    		
	    		n21.style.display = "none";
	    		n22.style.display = "none";	
	    		$(obj).parent().html("<button class='btn btn-outline-success' onclick='fix23(this)'>수정</button>");	
	    	}
			
			function fix21(obj) {
			
				
				
				n21.style.display = "table-row";
				n22.style.display = "table-row";
	    		n23.style.display = "table-row";
	    		$(obj).parent().html("<button class='btn btn-outline-success' onclick='click21(this)'>선택</button>");
			}
	    	
			function fix22(obj) {
				
				n21.style.display = "table-row";
				n22.style.display = "table-row";
	    		n23.style.display = "table-row";
	    		$(obj).parent().html("<button class='btn btn-outline-success' onclick='click22(this)'>선택</button>");
			}
			
			function fix23(obj) {
				
				n21.style.display = "table-row";
				n22.style.display = "table-row";
	    		n23.style.display = "table-row";
	    		$(obj).parent().html("<button class='btn btn-outline-success' onclick='click23(this)'>선택</button>");
			}
 