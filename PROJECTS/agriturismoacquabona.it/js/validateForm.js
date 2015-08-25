/**
 * Check form by Alessandro Falcone
 * alefalwebmaster@gmail.com
 * 
 * Questo script permette di controllare i campi di un form a 
 * seconda degli attributi degli INPUT. 
 * 
 * Gli attributi degli input possibili sono:
 * 
 * - frmValidate="true"		(controlla se un field è obbligatorio)
 * - frmCheckMail="true"	(controlla se una mail è valida)
 * - frmCheckNumber="true"		(controlla se il valore del campo è un numero)
 * --- frmDecimal="n"		(number: permessi decimali)
 * --- frmRange="from,to"	(number: range da rispettare
 * - frmPsw1="true"			(PASSWORD: controllo se psw1 e psw2 sono uguali)
 * - frmPsw2="true"
 * - frmLenght="n"			(PASSWORD: controlla lunghezza della password; funziona solamente insieme con l'attributo frmPsw1)
 * - frmExt="zip"			(controlla estensione del file caricato; per input type file)
 * 
 * Alcuni convenzioni da rispettare per poter utilizzare il controllo:
 * 
 * 1) 	Se vogliamo il controllo sul submit del form dobbiamo includere sul form
 * 		onsubmit="return checkForm(this);"
 * 		ESEMPIO:
 * 		<form name="" action="" method="" onsubmit="return checkForm(this);">
 * 
 * 2)	Se vogliamo il controllo durante la digitazione, per ogni field includiamo
 * 		onblur="checkField(this);"
 * 		ESEMPIO:
 * 		<input name="username" id="username" type="text" frmValidate="true" />
 * 		Al momento questo controllo funziona per i campi obbligatori, i numeri e la mail
 * 
 * 3) 	Per ogni fields, il name e l'id devono coincidere
 * 		ESEMPIO: 
 * 		<input name="nome" id="nome" type="text" />
 * 
 * 4) 	Dopo ogni input che utilizza uno degli attributi, deve esserci uno spam con l'id = input_id+msg
 * 		ESEMPIO:
 * 		<input name="nome" id="nome" type="text" /> 
 * 		<span id="nome_msg" class="error"></span>
 * 
 * 5) 	Nella pagina del form, se vogliamo che controlli i campi obbligatori all'apertura della pagina, dobbiamo includere 
 * 		<script>
 * 			checkRequiredFields(document.forms[0]);
 * 		</script>
 * 		che colora in giallo i campi obbligatori del form
 * 
 * 6)	Il form deve avere 1'input type SUBMIT ed un input type RESET
 * 
 * 7) 	Il campo input type RESET deve contenere:
 * 		onclick="clearFields(document.forms[0])"
 * 		ESEMPIO:
 * 		<input type="reset" value="Pulisci" onclick="clearFields(document.forms[0])" />
 * 
 * 8)	Per quanto riguarda l'EXT, al momento è controllata solo una estensione
 * 		ESEMPIO;
 * 		<input type="file" name="template" id="template" size="92" frmExt="zip" />
 * 
 * 9)	Se vogliamo utilizzare l'attribute frmPsw1, dobbiamo obbligatoriamente utilizzare anche un altro campo password con attributo frmPsw2
 *		ESEMPIO:
 *		<input type="password" name="password1" id="password1" frmValidate="true" frmPsw1="true" frmLenght="12" />
 *		<span id="password1_msg" class="error"></span>
 *		<input type="password" name="password2" id="password2" frmValidate="true" frmPsw2="true" />
 *		<span id="password2_msg" class="error"></span>
 *		L'attributo frmLenght indica la lunghezza della password permessa. Va inserita nel frmPsw1
 */

var divStyleInfo = 	"position:absolute;" +
					"display:none;" +
					"border: 2px solid black;" +
					"background-color: white;" +
					"width: 180px;" +
					"padding: 5px 5px 5px 5px;" +
					"margin-top:23px;" +
					"color:#000066;" +
					"text-align:justify;"
	
var img = "<img src='admin/images/error.png' border='0' /> ";
var warn = "<img src='admin/images/warning.gif' border='0' /> ";

//var img2 = "<img src='../images/icon/warning.png' border='0' /> ";

//var warning = "../images/icon/warning.png";
//var warn = "#fffccc url(../images/icon/warning.png) no-repeat scroll right";

var requiredColor = "#FFFCCC";
var normalColor = "#FFFFFF";


/* 
 * START: Controllo form fields required
 */
function checkRequiredFields(form) {
	var n = form.elements.length;
	for(var i = 0; i < n-2; i++){	
		//Campi obbligatori
 		if(form.elements[i].getAttribute('frmValidate')) {
			form.elements[i].style.background = requiredColor;	
 		}
	}
}
/* 
 * END: Controllo form fields required
 */



/*
 * START: pulisce i campi al momento del click su RESET
 */
function clearFields(form) {
	var n = form.elements.length;
	for(var i = 0; i < n-2; i++){	
		form.elements[i].value = "";	
	}
	checkForm(form);
}
/*
 * END: pulisce i campi al momento del click su RESET
 */
	
	

/* 
 * START: Controllo form fields al momento del submit
 */
function checkForm(form) {
	//alert("Sono chekForm...");
	//var i = 0;
	var fields = new Array();
	var n = form.elements.length;
	
	
	/******** FUNZIONA **********/
	/*
	var box = document.getElementById('test');
	var a = document.createElement('div');
	box.appendChild(a);
	a.innerHTML = '<a href="" onclick="alert(\'onclick\'); return false;">succeed</a>';
	*/
		
 	for(var i = 0; i < n-2; i++){	
		//Campo obbligatorio
 		if((form.elements[i].getAttribute('frmValidate')) && (form.elements[i].value == "")) {
			form.elements[i].style.background = requiredColor;
			fields.push(i);
			/*
			var nameField = form.elements[i].name;
			var span = document.getElementById(nameField+"_msg");
			span.innerHTML=warn;
			*/
			continue;
 		}
 		/*
		if(form.elements[i].getAttribute('frmValidate')) {
			var nameField = form.elements[i].name;
			var span = document.getElementById(nameField+"_msg");
			if(form.elements[i].value == "") {
				form.elements[i].style.background = requiredColor;
				fields.push(i);
				span.innerHTML="ops";
				continue;
			} else {
				form.elements[i].style.background = normalColor;
				span.innerHTML="";
			}
		} 
		*/
		//Campo email
		else if(form.elements[i].getAttribute('frmCheckMail')) {
			if(validate_email(form.elements[i],'Email non valida!')) {
				form.elements[i].style.background = normalColor;
				//fields.pop(i);
				continue
			} else {
				form.elements[i].style.background = requiredColor;
				fields.push(i);
			}
		} 
		//Campo numero anche decimale
		else if(form.elements[i].getAttribute('frmCheckNumber')) {
			//alert("Sono un numero...");
			if(validate_number(form.elements[i])) {
				form.elements[i].style.background = normalColor;
				fields.pop(i);
			} else {
				form.elements[i].style.background = requiredColor;
				fields.push(i);
				continue;
			}
		} 
 		//Estensione per upload
		else if(form.elements[i].getAttribute('frmExt')) {
			if(controlloExt(form.elements[i])) {
				form.elements[i].style.background = normalColor;
				fields.pop(i);
			} else {
				form.elements[i].style.background = requiredColor;
				fields.push(i);
				continue
			}
		}
		//Controllo password
		else if(form.elements[i].getAttribute('frmPsw1')) {
			for(var j = 0; j < n-2; j++){
				if(form.elements[j].getAttribute('frmPsw2')){
					if(checkPassword(form.elements[i], form.elements[j])) {
						form.elements[i].style.background = normalColor;
						form.elements[j].style.background = normalColor;
						fields.pop(i);
					} else {
						form.elements[i].style.background = requiredColor;
						form.elements[j].style.background = requiredColor;
						fields.push(i);
					}
				}
			}
		} 
		//Altro caso
		else {
			form.elements[i].style.background = normalColor;
			//fields.pop(i);
		}
	}
	
 	//alert(fields.length);
 	//return false;
 	
 	/* Blocca o meno submit del form */
	if(fields.length != 0) 
		return false;
	else
		return true
		
}
/* 
 * START: Controllo form fields al momento del submit
 */



/* 
 * START: Controllo campi durante la digitazione 
 */
/*
function checkField(field) {
	//Campo obbligatorio
	if((field.getAttribute('frmValidate')) && (field.value == "")){
		field.style.background = requiredColor;
	} 
	//Campo email
	else if(field.getAttribute('frmCheckMail')) {
		if(validate_email(field,'Email non valida!')) {
			field.style.background = normalColor;
		} else {
			field.style.background = requiredColor;
		}
	} 
	//Campo numero anche decimale
	else if(field.getAttribute('frmCheckNumber')) {
		if(validate_number(field)) {
			field.style.background = normalColor;
		} else {
			field.style.background = requiredColor;
		}
	} 
	//Controllo password
	///...
	
	//Altro caso
	else {
		field.style.background = normalColor;
	}
}
*/

/*
function checkEmpty(field) {
	var value = field.value;
	var nameField = field.name;
	var alerttxt = "Campo obbligatorio!";
	
	if(value == "") {
		var span = document.getElementById(nameField+"_msg");
		var createDiv = nameField+"_error";
		var errorDiv="<a href=\"#\"" +
						"onMouseOver=\"return overlay(this,'"+createDiv+"')\"" +
						"onMouseOut=\"overlayclose('"+createDiv+"')\">" +
						img2 +
					"</a>" +
					"<div id=\""+createDiv+"\" " +
						"style=\"" +divStyleInfo+
						"\">" +
					""+alerttxt+"" +
					"</div>";
		span.innerHTML=errorDiv;
		return true;
	} else {
		span.innerHTML="";
		return false;
	}
}
*/
/* 
 * END: Controllo campi durante la digitazione 
 */

/* 
 * START: Function per controllare se una mail è valida o meno 
 */
function validate_email(field,alerttxt) {
	with (field) {
		var value = field.value;
		var nameField = field.name;
		apos=value.indexOf("@");
		dotpos=value.lastIndexOf(".");
		if (apos<1||dotpos-apos<2) {
			var span = document.getElementById(nameField+"_msg");
			
			var createDiv = nameField+"_error";
			
			var errorDiv="<a href=\"#\"" +
							"onMouseOver=\"return overlay(this,'"+createDiv+"')\"" +
							"onMouseOut=\"overlayclose('"+createDiv+"')\">" +
							img +
						"</a>" +
						"<div id=\""+createDiv+"\" " +
							"style=\"" +divStyleInfo+
							"\">" +
						""+alerttxt+"" +
						"</div>";
			
			span.innerHTML=errorDiv;
			return false;
		} else {
			document.getElementById(nameField+"_msg").innerHTML=field.innerHTML;
			return true;
		}
	}
}
/* 
 * END: Function per controllare se una mail è valida o meno 
 */

/* 
 * START: Function per controllare se un campo contiene numeri 
 */
function validate_number(field) {
	var decimal,range,fromR,toR;
	var nameField = field.name;
	var span = document.getElementById(nameField+"_msg");
	var createDiv = nameField+"_error";
	
	if(field.getAttribute('frmDecimal')) {
		decimal = field.attributes['frmDecimal'].value;
	}
	if(field.getAttribute('frmRange')) {
		range = field.attributes['frmRange'].value;
		fromR = range.substr(0,range.indexOf(","));
		toR = range.substr(range.indexOf(",")+1,range.length);
	}
	if(isNaN(field.value)) {
		var alerttxt="Inserisci un numero valido!";
		var errorDiv="<a href=\"#\"" +
							"onMouseOver=\"return overlay(this,'"+createDiv+"')\"" +
							"onMouseOut=\"overlayclose('"+createDiv+"')\">" +
							img +
						"</a>" +
						"<div id=\""+createDiv+"\" " +
							"style=\"" +divStyleInfo+
							"\">" +
						""+alerttxt+"" +
						"</div>";
		
		span.innerHTML=errorDiv;
		return false;
	} else {
		var val = field.value;
		if(parseInt(val) == 0) {
			var alerttxt1="Lo 0 non è permesso!";
			var errorDiv1="<a href=\"#\"" +
								"onMouseOver=\"return overlay(this,'"+createDiv+"')\"" +
								"onMouseOut=\"overlayclose('"+createDiv+"')\">" +
								img +
							"</a>" +
							"<div id=\""+createDiv+"\" " +
								"style=\"" +divStyleInfo+
								"\">" +
							""+alerttxt1+"" +
							"</div>";
			
			span.innerHTML=errorDiv1;
			return false;
		}
		if(field.getAttribute('frmDecimal')) {
			if(val.indexOf(".") > -1) {
				if(val.length - (val.indexOf(".")+1) > decimal) {
					var alerttxt2="Inserisci un numero decimale valido! Il numero può contenere "+decimal+" cifre decimali!";
					var errorDiv2="<a href=\"#\"" +
									"onMouseOver=\"return overlay(this,'"+createDiv+"')\"" +
									"onMouseOut=\"overlayclose('"+createDiv+"')\">" +
									img +
								"</a>" +
								"<div id=\""+createDiv+"\" " +
									"style=\"" +divStyleInfo+
									"\">" +
								""+alerttxt2+"" +
								"</div>";
	
					span.innerHTML=errorDiv2;
					return false;   
				} else {
					result.innerHTML="";
					return true;
				}
			}
	   	} else if(field.getAttribute('frmRange')) {
	   		if(val.indexOf(".") > -1) {
				var alerttxt3="Solo numero intero! Decimali non permessi!";
				var errorDiv3="<a href=\"#\"" +
									"onMouseOver=\"return overlay(this,'"+createDiv+"')\"" +
									"onMouseOut=\"overlayclose('"+createDiv+"')\">" +
									img +
								"</a>" +
								"<div id=\""+createDiv+"\" " +
									"style=\"" +divStyleInfo+
									"\">" +
								""+alerttxt3+"" +
								"</div>";

				span.innerHTML=errorDiv3;
				return false;
			}
		   	if(parseInt(val) > 0) {
				if((parseInt(val) >= parseInt(fromR)) && (parseInt(val) <= parseInt(toR))) {
					span.innerHTML="";
					return true;
				} else {
					var alerttxt4="Range permesso da "+fromR+ " a "+toR;
					var errorDiv4="<a href=\"#\"" +
										"onMouseOver=\"return overlay(this,'"+createDiv+"')\"" +
										"onMouseOut=\"overlayclose('"+createDiv+"')\">" +
										img +
									"</a>" +
									"<div id=\""+createDiv+"\" " +
										"style=\"" +divStyleInfo+
										"\">" +
									""+alerttxt4+"" +
									"</div>";
	
					span.innerHTML=errorDiv4;
					return false;
				}
		   	}
	   	}
   	} 
	span.innerHTML="";	
	return true;
}
/* 
 * END: Function per controllare se un campo contiene numeri 
 */



/* 
 * START: Function per controllo password 
 */
function checkPassword(psw1,psw2) {
	var pass1 = psw1.value;
	var pass2 = psw2.value;
	var lenghtPsw = "";
	var nameField = psw1.name;
	var span = document.getElementById(nameField+"_msg");
	
	if(psw1.getAttribute('frmLenght') != null) {
		lenghtPsw = psw1.attributes['frmLenght'].value;
	}
									 
									 
	if(pass1 != pass2) {
		var alerttxt = "Le password non coincidono!";
		var createDiv = nameField+"_error";
		var errorDiv="<a href=\"#\"" +
						"onMouseOver=\"return overlay(this,'"+createDiv+"')\"" +
						"onMouseOut=\"overlayclose('"+createDiv+"')\">" +
						img +
					"</a>" +
					"<div id=\""+createDiv+"\" " +
						"style=\"" +divStyleInfo+
						"\">" +
					""+alerttxt+"" +
					"</div>";
		
		span.innerHTML=errorDiv;
		return false;
	} else if(pass1.length < lenghtPsw || pass2.length < lenghtPsw){
		var alerttxt1 = "La password deve contenere almeno "+lenghtPsw+" caratteri!";
		var createDiv1 = nameField+"_error";
		var errorDiv1="<a href=\"#\"" +
						"onMouseOver=\"return overlay(this,'"+createDiv1+"')\"" +
						"onMouseOut=\"overlayclose('"+createDiv1+"')\">" +
						img +
					"</a>" +
					"<div id=\""+createDiv1+"\" " +
						"style=\"" +divStyleInfo+
						"\">" +
					""+alerttxt1+"" +
					"</div>";
		
		span.innerHTML=errorDiv1;
		return false;
	} else {
		span.innerHTML="";
		return true;
	}
}
/* 
 * END: Function per controllo password 
 */



function controlloExt(field){
	var extRequired = field.attributes['frmExt'].value
	var nomefile = field.value;
	var nameField = field.name;
	var createDiv = nameField+"_error";
	var span = document.getElementById(nameField+"_msg");
	
	if(nomefile == ""){
		var alerttxt = "Scegliere un file "+extRequired+" da caricare!";
		var errorDiv="<a href=\"#\"" +
							"onMouseOver=\"return overlay(this,'"+createDiv+"')\"" +
							"onMouseOut=\"overlayclose('"+createDiv+"')\">" +
							img +
						"</a>" +
						"<div id=\""+createDiv+"\" " +
							"style=\"" +divStyleInfo+
							"\">" +
						""+alerttxt+"" +
						"</div>";

		span.innerHTML=errorDiv;
		return false;
	} else {
		nomefile = nomefile.substr(nomefile.lastIndexOf(".")+1);
		if(nomefile == extRequired){
			return true;
		} else {
			var alerttxt1 = "E' ammesso l'upload solo di files "+extRequired+"!";
			var errorDiv1="<a href=\"#\"" +
								"onMouseOver=\"return overlay(this,'"+createDiv+"')\"" +
								"onMouseOut=\"overlayclose('"+createDiv+"')\">" +
								img +
							"</a>" +
							"<div id=\""+createDiv+"\" " +
								"style=\"" +divStyleInfo+
								"\">" +
							""+alerttxt1+"" +
							"</div>";

			span.innerHTML=errorDiv1;
			return false;
		}
	}
}



/* START: PARTE PER VIEW BOX */
function getposOffset(overlay, offsettype){
	var totaloffset=(offsettype=="left")? overlay.offsetLeft : overlay.offsetTop;
	var parentEl=overlay.offsetParent;
	while (parentEl!=null){
		totaloffset=(offsettype=="left")? totaloffset+parentEl.offsetLeft : totaloffset+parentEl.offsetTop;
		parentEl=parentEl.offsetParent;
	}
	return totaloffset;
}

function overlay(curobj, subobjdiv){
	if (document.getElementById){
		var subobj=document.getElementById(subobjdiv);
		subobj.style.left=getposOffset(curobj, "left")+"px";
		subobj.style.top=getposOffset(curobj, "top")+"px";
		subobj.style.display="block";
		return false
	}
	else
		return true
}

function overlayclose(subobj){
	document.getElementById(subobj).style.display="none"
}
/* END: PARTE PER VIEW BOX */