// JavaScript Document

/*************** START: CHIAMATE DEL BE ***************/
/* START: funzioni per modifica prenotazione */
function changeStatus(id,day,month,year,prenotato) {
	new Ajax.Updater('result', 'includes/editPrenotation.php', { 
					method: 'get',
					parameters: { 
						id: id,
						day : day,
						month: month,
						year: year,
						prenotato: prenotato
					}
	});
	setTimeout("location.reload(true);",3000);
}
/* END: funzioni per modifica prenotazione */

/* START: msg prima di eliminazione */
function conferma(msg) {
	if(confirm(msg)) {
		return true;
	} else {
		return false;
	}
}
/* END: msg prima di eliminazione */

/*
function editNews() {
	var form = $('editForm');
	var id = form['idEdit'];
	var data = form['dataEdit'];
	var testoIt = form['testoItEdit'];
	var testoEn = form['testoEnEdit'];
	
	Form.Element.getValue(id);
	Form.Element.getValue(data);
	Form.Element.getValue(testoIt);
	Form.Element.getValue(testoEn);
	
	var id = $(id).getValue();
	var data = $(data).getValue();
	var testoIt = $(testoIt).getValue(); 
	var testoEn = $(testoEn).getValue();
	
	$('news')['testoIt'].innerHTML = "<textarea>ciao</textarea>";
	//formEdit['id'] = id;
	//formEdit['data'] = data;
	formEdit['testoIt'] = testoIt;
	//formEdit['testoEn'] = testoEn;
}
*/
/*************** END: CHIAMATE DEL BE ***************/








/*************** START: CHIAMATE DEL FE ***************/
//Check campi
function checkDisponibilita() {
	var result = false;
	
	var form = $('checkAvailable');
	var lingua = form['language'];
	var theDateArrivo = form['theDateArrivo'];
	var theDatePartenza = form['theDatePartenza'];
	var nome = form['nome'];
	var email = form['email'];
	var note = form['note'];
	
	Form.Element.getValue(lingua);
	Form.Element.getValue(theDateArrivo);
	Form.Element.getValue(theDatePartenza);
	Form.Element.getValue(nome);
	Form.Element.getValue(email);
	Form.Element.getValue(note);
	
	var language = $(lingua).getValue();
	var daValue = $(theDateArrivo).getValue();
	var aValue = $(theDatePartenza).getValue(); 
	var nomeValue = $(nome).getValue();
	var emailValue = $(email).getValue(); 
	var noteValue = $(note).getValue();
	
	if(	(daValue == "") ||
		(aValue == "") ||
		(nomeValue == "") ||
		(emailValue == "")) {
		alert("Tutti i campi, tranne NOTE, sono obbligatori / All fields except NOTES are required!");
		result = false;
	} else {
		if((validaEmail(form['email'])) && (confronta_data(daValue, aValue))) {
			new Ajax.Updater('risultatoRichiesta', 'includes/checkAvailable.php', { 
						method: 'post',
						parameters: { 
							language: language,
							da: daValue,
							a : aValue,
							nome: nomeValue,
							email: emailValue,
							note: noteValue
						}
			});
			result = true;
		} else {
			result = false;
		}
		
	}
	return result;
}

//Check email
function validaEmail(field) {
	with (field) {
		var value = field.value;
		var nameField = field.name;
		apos=value.indexOf("@");
		dotpos=value.lastIndexOf(".");
		if (apos<1||dotpos-apos<2) {
			alert("Inserire un indirizzo email valido / Enter a valid email address!");
			return false;
		} else {
			return true;
		}
	}
}

//Check date
function controllo_data(stringa){
    var espressione = /^[0-9]{2}\/[0-9]{2}\/[0-9]{4}$/;
    if (!espressione.test(stringa)) {
        return false;
    } else {
        anno = parseInt(stringa.substr(6),10);
        mese = parseInt(stringa.substr(3, 2),10);
        giorno = parseInt(stringa.substr(0, 2),10);
        
        var data=new Date(anno, mese-1, giorno);
        if(data.getFullYear()==anno && data.getMonth()+1==mese && data.getDate()==giorno){
            return true;
        } else {
            return false;
        }
    }
}
function confronta_data(data1, data2){
	// controllo validità formato data
    if(controllo_data(data1) && controllo_data(data2)){
		//trasformo le date nel formato aaaammgg (es. 20081103)
        data1str = data1.substr(6)+data1.substr(3, 2)+data1.substr(0, 2);
		data2str = data2.substr(6)+data2.substr(3, 2)+data2.substr(0, 2);
		//controllo se la seconda data è successiva alla prima
        if (data2str-data1str<=0) {
            alert("La data di ARRIVO deve essere precedente quella di PARTENZA / The date of ARRIVAL must be before the DEPARTURE!");
			return false;
        } else {
			return true;
		}
    }else{
        alert("Il formato data deve essere gg/mm/aaaa");
		return false;
    }
}

//Send mail
function sendMail() {
	//$('risultatoRichiesta').style.display="none";
	$('risultatoRichiesta').update("<p><img src=\"images/ajax-loader.gif\" /> "+
								   "Attendere, stiamo eseguendo l'operazione richiesta! "+
								   "<br /><br /> "+
								   "Wait, we are performing the requested operation! "+
								   "</p>");
	$('risultatoRichiesta').innerHTML;
	
	var result = false;
	
	var form = $('checkAvailable');
	var theDateArrivo = form['theDateArrivo'];
	var theDatePartenza = form['theDatePartenza'];
	var nome = form['nome'];
	var email = form['email'];
	var note = form['note'];
	
	Form.Element.getValue(theDateArrivo);
	Form.Element.getValue(theDatePartenza);
	Form.Element.getValue(nome);
	Form.Element.getValue(email);
	Form.Element.getValue(note);
	
	var daValue = $(theDateArrivo).getValue();
	var aValue = $(theDatePartenza).getValue(); 
	var nomeValue = $(nome).getValue();
	var emailValue = $(email).getValue(); 
	var noteValue = $(note).getValue();
	
	new Ajax.Updater('risultatoRichiesta', 'includes/sendMail.php', { 
				method: 'post',
				parameters: { 
					da: daValue,
					a : aValue,
					nome: nomeValue,
					email: emailValue,
					note: noteValue
				}
	});
}

//Apre popup con foto gallery
function openGallery(gallery) {
	window.open('galleriaFoto/'+gallery+'/index.html','','width=750,height=500,screenX=100,screenY=100,x=100,y=100,scrollbars=0,resizable=0');
}
/*************** END: CHIAMATE DEL FE ***************/