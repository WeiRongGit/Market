// JavaScript Document

window.onload = function() {
		var oNav = document.getElementsByTagName('ul')[0];// 邓炜荣
		var aA = oNav.getElementsByTagName('a');
		for (var i = 0; i < aA.length; i++) {
			aA[i].onmouseover = function() {
				if (this.className != "on") {
					clearInterval(this.time);
					var This = this;
					This.time = setInterval(function() {
						This.style.width = This.offsetWidth + 8 + "px";
						if (This.offsetWidth >= 120)
							clearInterval(This.time);
					}, 30);
				}
			};
			aA[i].onmouseout = function() {
				if (this.className != "on") {
					clearInterval(this.time);
					var This = this;
					This.time = setInterval(function() {
						This.style.width = This.offsetWidth - 8 + "px";
						if (This.offsetWidth <= 80) {
							This.style.width = '80px';
							clearInterval(This.time);
						}

					}, 30);
				}
			};
		}
	};
	
	
	
	function gos(tableName) {
		location.href = "addData.jsp?&tableName="+tableName;
	}

	
	
	    
	    
	    function decrease(id,save){
		     var buynum=document.getElementById("buynum"+id).value;
		     buynum--;
		     if(buynum<0){
		         buynum=0;
		     }
		      else  if(buynum>save){
		             alert("不能超过库存量!");
		             buynum=save;
		    }
		    document.getElementById("buynum"+id).value=buynum;
	   }
	
	   function increase(id,save,has)
	   {
		     var buynum=document.getElementById("buynum"+id).value;
		     buynum++;
		     var have = parseInt(has);
		     if(buynum<0){
		         buynum=0;
		     }
		      else  if(buynum+have>save){
		             alert("不能超过库存量!");
		             buynum=save - have;
		    }
		    document.getElementById("buynum"+id).value=buynum;
	   }
	
	   function clears()
		{
			 location.href="carDeal.jsp?action=clear";
		}
	
	   
	   function  change(id,have,save)
	    {
		   var buynum=document.getElementById("buynum"+id).value;
		   var sum =parseInt(have) +parseInt(buynum);
		     
		    if( sum > save ){
		    	alert("不能大于库存量");
		    	sum = save - have;
		    	 document.getElementById("buynum"+id).value=sum;
		    }else{
		    	
		    	
		    	location.href="carDeal.jsp?action=change&id="+id+"&buynum="+buynum;
		    }
		 
	        	
	        
	      	}
	    
	    
	    
	    
	    function car_decrease(id,have){
		     var buynum=document.getElementById("buynum"+id).value;
		     buynum--;
		     if(buynum + have <0){
		     	buynum++;
		     
		     }
		  
		    document.getElementById("buynum"+id).value=buynum;
	   }
	
	   function car_increase(id,have,save)
	   {
		     var buynum=document.getElementById("buynum"+id).value;
		     buynum++;
		     var sum =parseInt(have) +parseInt(buynum);
		    if( sum > save ){
		    	alert("不能大于库存量");
		    	sum = save - have;
		    	 document.getElementById("buynum"+id).value=sum;
		    }else{
		    	
		    	document.getElementById("buynum"+id).value=buynum;
		    }
		      

	   }
	   
	   function see(id,table){
	    	location.href="getOne.jsp?id="+id+"&table="+table;
	    
	    }
	   function gos(tableName) {

			location.href = "addData.jsp?&tableName="+tableName;

		}
	   
	   
	    