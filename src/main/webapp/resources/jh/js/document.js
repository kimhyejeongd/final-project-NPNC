/**
전자문서 ajax 파일
 */
$(document).ready();
const viewFormList =(no, name)=>{
	$.ajax({
		url: `${path}/document/formlist.do`,
		type: "post",
		data: {"folderNo" : no},
		success: function(data){
			let formArr = data;
			$("#formlistdiv").css("display", "block");
			$("div#formfoldername").text(name);
			$("div#formlist").html('');
			$("div#foldername").html('');
			formArr.forEach((e)=>{
				let $icondiv = $("<div>").addClass('ms-3');
				$("<i>").addClass('icon-drawer').appendTo($icondiv);
				let $namediv = $("<div>").addClass('info-user ms-3');
				$("<div>").addClass('username text-start').text(e.ER_FORM_NAME).appendTo($namediv)
				let $button = $("<button>").addClass('btn item-list border rounded w-100 mb-2').attr('onclick', `writedoc(${e.ER_FORM_KEY});`);
				$icondiv.appendTo($button);
				$namediv.appendTo($button);
				$button.appendTo($("div#formlist"));
			});
		}
	});
};
$("#formsearchbtn").click(e=>{
	let target = $("#formsearchtarget").val();
	console.log(target);
	$.ajax({
		url: `${path}/document/formsearch.do`,
		type: "post",
		data: {"target" : target},
		success: function(data){
			let formArr = data;
			console.log(formArr);
			$("#formlistdiv").css("display", "block");
			$("div#formfoldername").text('검색결과');
			//TODO 검색 결과 화면 레이아웃에 맞춰 화면에 출력
			$("div#formlist").html('');
			$("div#foldername").html('');
			//검색어가 양식명에 포함된 양식목록 출력
			formArr.forEach((e)=>{
				console.log(e.ER_FORM_NAME);
				let $icondiv = $("<div>").addClass('ms-3');
				$("<i>").addClass('icon-drawer').appendTo($icondiv);
				let $namediv = $("<div>").addClass('info-user ms-3');
				$("<div>").addClass('username text-start').text(e.ER_FORM_NAME).appendTo($namediv)
				let $button = $("<button>").addClass('btn item-list border rounded w-100 mb-2');
				$icondiv.appendTo($button);
				$namediv.appendTo($button);
				$button.appendTo($("div#formlist"));
			});
		}
	});
});
const writedoc=(formNo)=>{
	location.assign(`${path}/document/write?form=${formNo}`);
}