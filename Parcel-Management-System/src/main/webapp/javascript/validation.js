/**
 * 
 */
function validate(){
	
	let fName = document.getElementById("fName").value;
	let lName = document.getElementById("lName").value;
	let email = document.getElementById("email").value;
	let phoneNo = document.getElementById("phoneNo").value;
	let country = document.getElementById("country").value;
	let password = document.getElementById("password").value;
	
	let error_message = document.getElementById("error_message");
	
	error_message.style.padding = "10px";
	 let text;

	if (fName.length<3){
		text="Please enter a valid first name";
		error_message.innerHTML = text;
		return false;
	}
	if (lName.length<3){
		text="Please enter a valid last name";
		error_message.innerHTML = text;
		return false;
	}
	if (email.indexOf("@") == -1 || email.length <5){
		text="Please enter a valid email";
		error_message.innerHTML = text;
		return false;	
	}
	if(isNaN(phoneNo) || phoneNo.length < 5){
		text="Please enter a valid phone number";
		error_message.innerHTML = text;
		return false;
	}
	if(country.length < 5){
		text="Please enter a valid country name";
		error_message.innerHTML = text;
		return false;
	}
	if(password.length < 5){
		text="Please enter a valid password with min. of 5 characters";
		error_message.innerHTML = text;
		return false;
	}
}

function validateLogin(){
	
	let email = document.getElementById("email").value;
	let password = document.getElementById("password").value;
	
	let error_message = document.getElementById("error_message");
	
	error_message.style.padding = "10px";
	 let text;

	if (email.indexOf("@") == -1 || email.length <5){
		text="Please enter a valid email";
		error_message.innerHTML = text;
		return false;	
	}
	if(password.length < 5){
		text="Please enter a valid password with min. of 5 characters";
		error_message.innerHTML = text;
		return false;
	}
}

function validateParcel(){
	
	let pID = document.getElementById("pID").value;
	let cID = document.getElementById("cID").value;
	let pDateReceived = document.getElementById("pDateReceived").value;
	let pStatus = document.getElementById("pStatus").value;
	
	let error_message = document.getElementById("error_message");
	
	error_message.style.padding = "10px";
	 let text;

	if (pID.length<2 || pID.length >7){
		text="Please enter a valid parcel ID";
		error_message.innerHTML = text;
		return false;	
	}
	if (cID.length<2 || cID.length >7){
		text="Please enter a valid customer ID";
		error_message.innerHTML = text;
		return false;	
	}
	if (pDateReceived.length!=10){
		text="Please enter a valid date";
		error_message.innerHTML = text;
		return false;	
	}
	if (pStatus.length==0){
		text="Please enter a valid status";
		error_message.innerHTML = text;
		return false;	
	}
}

function validateEditParcel(){
	
	let pID = document.getElementById("pID").value;
	let cID = document.getElementById("cID").value;
	let pDateReceived = document.getElementById("pDateReceived").value;
	let pStatus = document.getElementById("pStatus").value;
	let pCollectedDate = document.getElementById("pCollectedDate").value;
	
	let error_message = document.getElementById("error_message");
	
	error_message.style.padding = "10px";
	 let text;

	if (pID.length<2 || pID.length >7){
		text="Please enter a valid parcel ID";
		error_message.innerHTML = text;
		return false;	
	}
	if (cID.length<2 || cID.length >7){
		text="Please enter a valid customer ID";
		error_message.innerHTML = text;
		return false;	
	}
	if (pDateReceived.length!=10){
		text="Please enter a valid date";
		error_message.innerHTML = text;
		return false;	
	}
	if (pStatus.length==0){
		text="Please enter a valid status";
		error_message.innerHTML = text;
		return false;	
	}
}

function validateSchedule(){
	
	let cID = document.getElementById("cID").value;
	let pScheduleDate = document.getElementById("pScheduleDate").value;
	let pScheduleTime = document.getElementById("pScheduleTime").value;
	
	let error_message = document.getElementById("error_message");
	
	error_message.style.padding = "10px";
	 let text;

	if (cID.length<2 || cID.length >7){
		return false;	
	}
	if (pScheduleDate.length != 10){
		text="Please enter a valid schedule date";
		error_message.innerHTML = text;
		return false;	
	}
	
	if(pScheduleTime.length != 5){
		text="Please enter a valid schedule time";
		error_message.innerHTML = text;
		return false;
	}
}

function validateEditSchedule(){
	
	let scID = document.getElementById("scID").value;
	let pScheduleDate = document.getElementById("pScheduleDate").value;
	let pScheduleTime = document.getElementById("pScheduleTime").value;
	
	let error_message = document.getElementById("error_message");
	
	error_message.style.padding = "10px";
	 let text;

	if (scID.length<2 || scID.length >7){
		return false;	
	}
	if (pScheduleDate.length != 10){
		text="Please enter a valid schedule date";
		error_message.innerHTML = text;
		return false;	
	}
	if(pScheduleTime.length != 5){
		text="Please enter a valid schedule time";
		error_message.innerHTML = text;
		return false;
	}
}