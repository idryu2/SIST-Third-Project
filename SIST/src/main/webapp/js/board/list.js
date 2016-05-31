var pagina = 1;
var nopaginas = 0;
var min = 0;
var max = 0;

function paginar() {
	var tbody = document.getElementById("tbody");
	var Ttr = tbody.getElementsByTagName("tr");
	var cont = 0;
	var paginas = document.getElementById("paginas");
	for (i = 0; i < Ttr.length; i++) {
		cont++;
	}
	nopaginas = Math.ceil(cont / 15);
	if (nopaginas > 1) {
		paginas.innerHTML = 'Pagina <input id="pagns" name="pagns" type="text" value="1" style="width:1em; display:inline-block;">/'
				+ nopaginas;
		var psig = document.getElementById("psig");
		psig.style = "display: inline-block;";
	}
	min = 1;
	max = min + 14;
}

function paginacion(p) {
	var d = document.getElementsByName("pagns")[0];
	var tbody = document.getElementById("tbody");
	var Ttr = tbody.getElementsByTagName("tr");
	if (pagina < nopaginas) {
		if (p == "15") {
			pagina = pagina + 1;
			d.value = pagina;
			min = min + 15;
			max = max + 15;
		}
	}
	if (pagina > 1) {
		if (p == "-15") {
			pagina = pagina - 1;
			d.value = pagina;
			min = min - 15;
			max = max - 15;
		}
	}
	for (i = 0; i < Ttr.length; i++) {
		if (Ttr[i].id >= min && Ttr[i].id <= max) {
			Ttr[i].removeAttribute("style");
		} else {
			Ttr[i].setAttribute("style", "display:none");
		}
	}
}
//paginar();

//모달 JS
$(function(){
	$('#sendBtn').click(function(){
		var kind=$('#kind').val();
		if(kind.trim()=="")
		{
			$('#kind').focus();
			$('#kind').val("");
			return;
		}
		var subject=$('#subject').val();
		if(subject.trim()=="")
		{
			$('#subject').focus();
			$('#subject').val("");
			return;
		}
		var content=$('#content').val();
		if(content.trim()=="")
		{
			$('#content').focus();
			$('#content').val("");
			return;
		}
		$('#writeFrm').submit();
		var subject=$('#subject').val("");
		var content=$('#content').val("");
		$('#largeModal').modal('toggle');
	});
	
	$('writeBtn').click(function(){
		$('#subject').val("");
		$('#content').val("");
	})
	
	
});


//모달 JS

