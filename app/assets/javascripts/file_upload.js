var file_field;
var selx;

$j('.file-upload, .file-search-button').click(function(){
	var source = $j(this).attr('data-source');
	selx = $j(this);
	file_field = document.getElementById(source);
	file_field.click();
});
$j('.raw-file').change(function(){
	selx.val($j(this).val());
	
});