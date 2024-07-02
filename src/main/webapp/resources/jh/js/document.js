/**
전자문서 ajax 파일
 */
const viewFormList =(no)=>{
	$.ajax({
		url: `${path}/document/formlist.do`,
		type: "post",
		data: {"folderNo" : no},
		success: function(data){
			let formArr = data;
			formArr.forEach((e)=>{
				console.log(e);
			});
		}
	});
};
