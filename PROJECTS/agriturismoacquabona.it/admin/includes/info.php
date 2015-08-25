<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento senza titolo</title>
</head>

<body>
<?
//phpinfo();
for($i = strtotime("2009-4-1");$i<=strtotime("2009-4-30");$i+=(3600*24)) {
	echo $i."<br>";
	$arrDatumRange[$cont]=$i;
	$cont++;
}
?>
</body>
</html>
