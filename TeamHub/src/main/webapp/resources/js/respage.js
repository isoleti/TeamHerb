	    	
	   		var n11 = document.getElementById("n11");
		    var n12 = document.getElementById("n12");
			var n13 = document.getElementById("n13");
			
			var n21 = document.getElementById("n21");
			var n22 = document.getElementById("n22");
			var n23 = document.getElementById("n23");
			
			var coun = document.getElementsByName("counseling");			
			var counseler = document.getElementsByName("couns");
			var date = document.getElementsByName("resdate");
			var count = document.getElementsByName("rescount");
			
			
	    	function click11(obj){
	    		
	    		var val1 = $(obj).parent().prev().prev();
				var val1Text = val1.text();
				var val2 = $(obj).parent().prev();
				var val2Text = val2.text();
				
	    		/*
					alert(val1);
		    		alert("val1Text"+val1Text);
		    		alert(val2);
		    		alert("val2Text"+val2Text);
	    		*/
	    		
	    		
	    		n12.style.display = "none";
	    		n13.style.display = "none";
	    		
	    		$(obj).parent().html("<button class='btn btn-outline-success' onclick='fix11(this)'>수정</button>");	
	    		
	    		$(coun).attr('value',val1Text+val2Text);
	    		
	    	}
	    	
			function click12(obj){    	
			
				var val1 = $(obj).parent().prev().prev();
				var val1Text = val1.text();
				var val2 = $(obj).parent().prev();
				var val2Text = val2.text();
				
				/*
					alert(val1);
		    		alert("val1Text"+val1Text);
		    		alert(val2);
		    		alert("val2Text"+val2Text);
	    		*/    		
	    		
	    		n11.style.display = "none";
	    		n13.style.display = "none";
	    		
	    		$(obj).parent().html("<button class='btn btn-outline-success' onclick='fix12(this)'>수정</button>");	
	    		
	    		$(coun).attr('value',val1Text+val2Text);
	    		
	    	}
			
			function click13(obj){
				
				var val1 = $(obj).parent().prev().prev();
				var val1Text = val1.text();
				var val2 = $(obj).parent().prev();
				var val2Text = val2.text();
				
	    		/*
					alert(val1);
		    		alert("val1Text"+val1Text);
		    		alert(val2);
		    		alert("val2Text"+val2Text);
	    		*/
	    		
	    		
	    		n11.style.display = "none";
	    		n12.style.display = "none";	
	    		
	    		$(obj).parent().html("<button class='btn btn-outline-success' onclick='fix13(this)'>수정</button>");	
	    		
	    		$(coun).attr('value',val1Text+val2Text);   		
	    		
	    	}
			
			function fix11(obj) {
					
				n11.style.display = "table-row";
				n12.style.display = "table-row";
	    		n13.style.display = "table-row";
	    		
	    		$(obj).parent().html("<button class='btn btn-outline-success' onclick='click11(this)'>선택</button>");
	    		
	    		$(coun).attr('value', "");
	    		
			}
	    	
			function fix12(obj) {
				
				n11.style.display = "table-row";
				n12.style.display = "table-row";
	    		n13.style.display = "table-row";
	    		
	    		$(obj).parent().html("<button class='btn btn-outline-success' onclick='click12(this)'>선택</button>");
	    		
	    		$(coun).attr('value', "");
	    		
			}
			
			function fix13(obj) {
				
				n11.style.display = "table-row";
				n12.style.display = "table-row";
	    		n13.style.display = "table-row";
	    		
	    		$(obj).parent().html("<button class='btn btn-outline-success' onclick='click13(this)'>선택</button>");
	    		
	    		$(coun).attr('value', "");
			}
			
			function click21(obj){
				
				var val1 = $(obj).parent().prev().prev();
				var val1Text = val1.text();
				var val2 = $(obj).parent().prev();
				var val2Text = val2.text();
				
				/*
					alert(val1);
		    		alert("val1Text"+val1Text);
		    		alert(val2);
		    		alert("val2Text"+val2Text);
	    		*/
	    		
	    		n22.style.display = "none";
	    		n23.style.display = "none";
	    		
	    		$(obj).parent().html("<button class='btn btn-outline-success' onclick='fix21(this)'>수정</button>");	
	    		
	    		$(counseler).attr('value', val1Text);
	    		$(count).attr('value', val2Text);
	    		
	    	}
	    	
			function click22(obj){    		
	    		
	    		var val1 = $(obj).parent().prev().prev();
				var val1Text = val1.text();
				var val2 = $(obj).parent().prev();
				var val2Text = val2.text();
				
				/*
					alert(val1);
		    		alert("val1Text"+val1Text);
		    		alert(val2);
		    		alert("val2Text"+val2Text);
	    		*/
	    		
	    		n21.style.display = "none";
	    		n23.style.display = "none";
	    		
	    		$(obj).parent().html("<button class='btn btn-outline-success' onclick='fix22(this)'>수정</button>");	
	    		
	    		$(counseler).attr('value', val1Text);
	    		$(count).attr('value', val2Text);
	    		
	    		
	    	}
			
			function click23(obj){
			
				var val1 = $(obj).parent().prev().prev();
				var val1Text = val1.text();
				var val2 = $(obj).parent().prev();
				var val2Text = val2.text();
				
				/*
					alert(val1);
		    		alert("val1Text"+val1Text);
		    		alert(val2);
		    		alert("val2Text"+val2Text);
	    		*/
	    		
	    		n21.style.display = "none";
	    		n22.style.display = "none";	
	    		
	    		$(obj).parent().html("<button class='btn btn-outline-success' onclick='fix23(this)'>수정</button>");
	    		
	    		$(counseler).attr('value', val1Text);
	    		$(count).attr('value', val2Text);
	    			
	    		
	    	}
			
			function fix21(obj) {
			
				
				
				n21.style.display = "table-row";
				n22.style.display = "table-row";
	    		n23.style.display = "table-row";
	    		
	    		$(obj).parent().html("<button class='btn btn-outline-success' onclick='click21(this)'>선택</button>");
	    		
	    		$(counseler).attr('value', "");
	    		$(count).attr('value', "");
	    		
			}
	    	
			function fix22(obj) {
				
				n21.style.display = "table-row";
				n22.style.display = "table-row";
	    		n23.style.display = "table-row";
	    		
	    		$(obj).parent().html("<button class='btn btn-outline-success' onclick='click22(this)'>선택</button>");
	    		
	    		$(counseler).attr('value', "");
	    		$(count).attr('value', "");
	    		
			}
			
			function fix23(obj) {
				
				n21.style.display = "table-row";
				n22.style.display = "table-row";
	    		n23.style.display = "table-row";
	    		
	    		$(obj).parent().html("<button class='btn btn-outline-success' onclick='click23(this)'>선택</button>");
	    		
	    		$(counseler).attr('value', "");
	    		$(count).attr('value', "");
	    		
			}
 