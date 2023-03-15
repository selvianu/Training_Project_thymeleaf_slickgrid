let staffCount=document.getElementById("staff-count");
let valunteerCount=document.getElementById("valunteer-count");
let doneeCount=document.getElementById("donee-count");
let expensesCount=document.getElementById("expenses-count");
let countSpeed=1; //in milliseconds
let countTarget = document.querySelector("#value").value;
let countTarget1 = document.querySelector("#value1").value;
let countTarget2 = document.querySelector("#value2").value;
let countTarget3 = document.querySelector("#value3").value;

//const countTarget =1000;

let count = 0;
let count1 = 0;
let count2 = 0;

let count3 = 0;

window.onload=function slowCount(){
	if(count<=countTarget){
		staffCount.innerHTML=count;
		count++;
		setTimeout(slowCount, countSpeed);
	}
	if(count1<=countTarget1){
		valunteerCount.innerHTML=count1;
		count1++;
		setTimeout(slowCount, countSpeed);
	}
	if(count2<=countTarget2){
		doneeCount.innerHTML=count2;
		count2++;
		setTimeout(slowCount, countSpeed);
	}
	if(count3<=countTarget3){
		expensesCount.innerHTML=count3;
		count3++;
		setTimeout(slowCount, countSpeed);
	}
	
}







