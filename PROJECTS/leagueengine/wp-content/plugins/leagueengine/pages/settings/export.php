<?php
	error_reporting(0);
	$page = $_GET['page'];
	if(isset($_POST['export'])) {
		global $msg;
		$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
	}
?>

<div id="leagueengine_admin" class="<?php echo $page; ?>">

	<?php echo leagueengine_admin_header(); ?>
	
	<div id="leagueengine_admin_content">
		<?php if($msg) { echo $msg; } ?>
		<h2 class="form_title"><?php _e('Export','leagueengine'); ?></h2>
		<?php echo leagueengine_admin_menu('settings'); ?>
		
<?php

	global $wpdb;
	global $headers_pod;
	global $data_rows_pod;
	global $tabella;
	global $defaults_pod;
	global $keys_pod;
	global $custom_array_pod;
	global $delim_pod;
	global $posts_t_cat;
	global $msql_table;
	global $importop;

	$custom_array_pod = array();
  
	if(isset($_POST['importop']))
	{
		
		if ( $_POST['importop'] == "CSV_file" ) {
			
			
	$upload_dir = wp_upload_dir();
    $importdir  = $upload_dir['basedir']."/imported_csv/";
		
			
		csv_file_data_pod($_FILES['csv_import']['tmp_name'],$delim_pod);
		move_file_pod();
		?>
    
		<?php if ( count($headers_pod)>=1 &&  count($data_rows_pod)>=1 ){?>
		
		<form class="add:the-list: validate" method="post" onsubmit="return import_csv_pod();">
		
		<table class="form" style="margin-bottom:40px;">

			<tr>
				<td><?php _e('Ignore First Row','leagueengine');?></td>
				<td><input name="firsth" type="checkbox"  value="firsth" /></td>
			</tr>

			<tr>
				<td><?php _e('Wipe Data Before Import','leagueengine');?></td>
				<td><input name="drop_table" type="checkbox"  value="drop_table" /></td>
			</tr>		
             
			<?php $cnt =count($defaults_pod)+2; $cnt1 =count($headers_pod); ?>
			<input type="hidden" id="h1" name="h1" value="<?php echo $cnt; ?>"/>
			<input type="hidden" id="h2" name="h2" value="<?php echo $cnt1; ?>"/>
			<input type="hidden" id="delim" name="delim" value="<?php echo $_POST['delim']; ?>" />
            <input type="hidden" id="tabella" name="tabella" value="<?php echo $_POST['tabella']; ?>" />
			<input type="hidden" id="header_array" name="header_array" value="<?php print_r($headers_pod);?>" />
            
		</table>
            
            <table class="form">
            <tr> 
            <th style="width:50%;"><?php _e('Database Column','leagueengine');?></th>
            <th style="width:50%;"><?php _e('CSV Column','leagueengine');?></th>
			<th></th>

            </tr>
            
			 <?php
			  $count = 0;
			  foreach($defaults_pod as $key1=>$value1) {
			if ($key1 == "id"){
			?>
			
                <tr id="tr<?php print($value1);?>" style="display:none;">
			    <td>ID</td>
			    <td>
			    <select name="id" id="id" class="select2-nosearch uiButton" style="display: none" >
				<option id="select" name="select"><?php _e('-- Select --','leagueengine');?></option>
			    <?php 
				foreach($headers_pod as $key=>$value){ 
			    ?>
					<option value ="<?php print($key);?>"><?php print($value);?></option>
			    <?php }
		   	    ?>
				
			    </select>
			   
			  </td>
              <td>
              <label><input name="idforce" type="checkbox" id="idforce" onclick="showidmap()" /></label>
              </td>
			 </tr>
     
			<?php } else if  ($key1 == "permalink"){ ?>
            
                      <tr id="tr<?php print($value1);?>">
			    <td>
				<label>Permalink</label>
			    </td>
			    <td>
			    <select  name="<?php print($value1);?>" id="<?php print($value1);?>" class="select2-nosearch uiButton">
				<option id="select" name="select"><?php _e('-- Select --','leagueengine');?></option>
			    <?php 
				foreach($headers_pod as $key=>$value){ 
			    ?>
					<option value ="<?php print($key);?>"><?php print($value);?></option>
			    <?php }
		   	    ?>
				
			    </select>
			   
			  </td>
               <td>
               If not selected it will be automatically generated based on field <strong>name</strong>
              </td>
			 </tr>
            
            
            <?php } else if  ($key1 == "created" || $key1 == "modified") { ?>
            
            
                      <tr>
			    <td>
				<label><?php print($key1);?></label>
			    </td>
			    <td>
			    <select  name="<?php print($value1);?>" id="<?php print($value1);?>" class ='uiButton'  onchange="addconstant(this.id);">
				<option id="select" name="select"><?php _e('-- Select --','leagueengine');?></option>
			    <?php 
				foreach($headers_pod as $key=>$value){ 
			    ?>
					<option value ="<?php print($key);?>"><?php print($value);?></option>
			    <?php }
		   	    ?>
			    </select>
			   
			  </td>
               <td>
               <input type="datetime" id="textbox<?php print($value1); ?>" name="textbox<?php print($value1); ?>" style="display:none;"/> If not selected it will be automatically generated based on <strong>Current Time</strong>.
              </td>
			 </tr>
  
            
       
              <?php } else { ?>
             <tr>
			    <td>
				<label><?php print($key1);?></label>
			    </td>
			    <td>
			    <select name="<?php print($value1);?>" id="<?php print($value1);?>" class="select2-nosearch uiButton">
				<option id="select" name="select"><?php _e('-- Select --','leagueengine');?></option>
			    <?php 
				foreach($headers_pod as $key=>$value){ 
			    ?>
					<option value ="<?php print($key);?>"><?php print($value);?></option>
			    <?php }
		   	    ?>
			    </select>
			   
			  </td>
               <td>
                  <input type="text" id="textbox<?php print($value1); ?>" name="textbox<?php print($value1); ?>" style="display:none;"/>
              </td>
			 </tr>
          
             <?php }
		   	    ?>
            
             <?php
			   $count++; } 
			 ?>
             	
 
            </table>
    
			<input type='hidden' name='filename' id='filename' value="<?php echo($_FILES['csv_import']['name']);?>" />
			<input type='submit' name= 'post_csv' id='post_csv' class="button" value='Import CSV File' />
		</form>

	</div>

	<?php
		}
	
		else { ?>


		<p><?php _e('Error. The file could not be uploaded.','leagueengine');?></p>

		<form class="add:the-list: validate" method="post" action="">
			<input type="submit" class="button" name="Import Again" value="<?php _e('Try Again','leagueengine');?>"/>
		</form>	

	</div>
	
	<?php	}
	} 
		//
	   //
	   //Mysql Form
	   //
	   //
	   else if ( $_POST['importop'] == "MySql_Table" )  { ?>
		  
		  
		  
 <?php 
 
$tabella_msql = empty($_POST['tabella_msql']) ? '' : $_POST['tabella_msql'];
$posts_t_cat = empty($_POST['posts_t_cat']) ? '' : $_POST['posts_t_cat'];
$max_meta = array();

//get fields from mysql table
$cacche = $wpdb->get_results( "SHOW COLUMNS FROM ".$tabella_msql,  ARRAY_A);
foreach($cacche as $cacca){
$mysqlkeys[$cacca['Field']] = $cacca['Field'];
}


$defaults_podmy = array();
foreach($mysqlkeys as $valy){
$defaults_podmy[$valy]=$valy;}

//case table is wp_posts
if(strstr($tabella_msql, "posts")) {

unset(	$defaults_podmy['post_date_gmt'],
		$defaults_podmy['to_ping'],
		$defaults_podmy['pinged'],
		$defaults_podmy['post_modified_gmt'],
		$defaults_podmy['post_content_filtered'],
		$defaults_podmy['menu_order'],
		$defaults_podmy['post_mime_type']
		);

	
//search for the post with max custom fields
$numeri_meta = $wpdb->get_results("SELECT keyx.id, keyx.post_type, COUNT( keyu.post_id ) AS conteggio
						FROM $wpdb->posts keyx
						LEFT JOIN $wpdb->postmeta keyu 
						ON keyu.post_id = keyx.id
						WHERE keyx.post_type LIKE  '$posts_t_cat'
						AND keyx.post_status LIKE  'publish'
						AND keyu.meta_key NOT LIKE '\_%' 
						GROUP BY keyx.id");
	 

foreach ($numeri_meta as $numero_meta) {
$max_meta[$numero_meta->id] = $numero_meta->conteggio; }
$post_id_max_meta = array_search(max($max_meta), $max_meta);
//list the custom fields of the post with max custom fields
$custom_field_keys = get_post_custom_keys($post_id_max_meta);
foreach ( $custom_field_keys as $keyu => $valueu ) {
$valuet = trim($valueu);
if ( '_' == $valuet{0} )
continue;
$defaults_podmy['customxxx'.$valueu] = $valueu  ; }

}

 

 ?>
 

 <div>
        <p></p>
		<form class="add:the-list: validate" method="post" onsubmit="return import_mysql();">
      
     <p style="color:#FF0000" id="drop_table">  <label><input name="drop_table" type="checkbox"  value="drop_table" /><strong> (TRUNCATE TABLE) Delete all the data before import </strong></label> </p>
          <p>  <label><input name="update" type="checkbox"  id="update" onclick="showwhere()" /><strong> UPDATE Table </strong></label> </p>
        
		<div id="where" style="display:none">	
             <h3>WHERE CONDITION</h3>
            
               <table style="font-size:12px;" >
			
			 <tr>
			    <td>
				 <select  name="where1" id="where1" class ='uiButton' onchange="wherecon()" >
				
			
					<option value ="id">id</option>
			   		<option value ="permalink">permalink</option>
				
			    </select>
			    </td>
			    <td>
			    <select  name="where2" id="where2" class ='uiButton' >
				
			    <?php 
				  foreach($defaults_podmy as $key1=>$value1){
			    ?>
					<option value ="<?php print($key1);?>"><?php print($value1);?></option>
			    <?php }
		   	    ?>
				
			    </select>
			   
			  </td>
			 </tr>
            </table>
            
            </div>
           
			<div id='display_area'>
			<?php $cnt =count($defaults_podmy)+2; $cnt1 =count($keys_pod); ?>
			<input type="hidden" id="h1" name="h1" value="<?php echo $cnt; ?>"/>
			<input type="hidden" id="h2" name="h2" value="<?php echo $cnt1; ?>"/>
			<input type="hidden" id="posts_t_cat" name="posts_t_cat" value="<?php echo $_POST['posts_t_cat']; ?>" />
            <input type="hidden" id="tabella_msql" name="tabella_msql" value="<?php echo $_POST['tabella_msql']; ?>" />
             <input type="hidden" id="tabella" name="tabella" value="<?php echo $_POST['tabella']; ?>" />

            
           	<table style="font-size:12px;">
			  <tr> 
            <th><?php echo $_POST['tabella']; ?> </th>
            <th><?php echo $_POST['tabella_msql']; ?> </th>
			<th> </th>

            </tr>
            
             <?php
			  $count = 0;
			  foreach($keys_pod as $key=>$value){ 
			
			 if ($key == "created" || $key == "modified") { ?>
				 <tr id="tr<?php print($value);?>">
			    <td >
				<label><?php print($value);?></label>
			    </td>
			    <td>
			    <select name="<?php print($value);?>" id="<?php print($value);?>" class ="select2-nosearch uiButton">
				<option id="select" name="select">-- Select --</option>
			    <?php 
				 
				  foreach($defaults_podmy as $key1=>$value1){
					  if ($key1 == $value) {
				?>
					<option selected="selected" value ="<?php print($key1);?>"><?php print($value1);?></option>
			    <?php } 
					else if ($key1 == "post_date" && $value == "created") {
					
			    ?>
					<option selected="selected" value ="<?php print($key1);?>"><?php print($value1);?></option>
			    <?php 
					 }
				
					else if ($key1 == "post_modified" && $value == "modified") {
					
			    ?>
					<option selected="selected" value ="<?php print($key1);?>"><?php print($value1);?></option>
			    <?php 
					 }
				
				
				else {
			    ?>
					<option value ="<?php print($key1);?>"><?php print($value1);?></option>
			    <?php }
				}
		   	    ?>
				<option value ="add_a_constant">add_a_constant</option>
			    </select>
			   
			  </td>
                 <td>
               
                 <input type="datetime" id="textbox<?php print($value); ?>"  name="textbox<?php print($value); ?>" style="display:none;"/> <label><?php if (($value1 != "modified" &&  $value1 != "created") && !strstr($tabella_msql, "posts") ) { ?><input name="unixtt<?php print($value); ?>" type="checkbox"  id="unixtt<?php print($value); ?>"  /><strong> Format Unixtime </strong></label> 
                   <?php } ?>
                - If not selected it will be automatically generated based on <strong>Current Time</strong>
              </td>
			 </tr> 
				 
				 
			<?php	 }
			 
			 else {
			 ?>
			 <tr id="tr<?php print($value);?>">
			    <td >
				<label><?php print($value);?></label>
			    </td>
			    <td>
			    <select  name="<?php print($value);?>" id="<?php print($value);?>" class ='uiButton' onchange="addconstant(this.id);">
				<option id="select" name="select">-- Select --</option>
			    <?php 
				  foreach($defaults_podmy as $key1=>$value1){
			   	  if ($value1 == $value) {
				?>
					<option selected="selected" value ="<?php print($key1);?>"><?php print($value1);?></option>
			    <?php } 
				else  if ($value == 'name' && $value1 == 'post_title') {
				?>
					<option selected="selected" value ="<?php print($key1);?>"><?php print($value1);?></option>
			    <?php }
				else  if ($value == 'permalink' && $value1 == 'post_name') {
				?>
					<option selected="selected" value ="<?php print($key1);?>"><?php print($value1);?></option>
			    <?php }
					else {
			    ?>
					<option value ="<?php print($key1);?>"><?php print($value1);?></option>
			    <?php }}
		   	    
				if ($value != "permalink") { ?>
				<option value ="add_a_constant">add_a_constant</option>
			     <?php }  ?>
                </select>
			   
			  </td>
                 <td>
                 <?php if ($value != "permalink") { ?>
                  <input type="text" id="textbox<?php print($value); ?>" name="textbox<?php print($value); ?>" style="display:none;"/>
               <?php } else { ?>
                  If not selected it will be automatically generated based on field <strong>name</strong> 
                  <?php } ?>
              </td>
			 </tr>

            
             <?php  }
			   $count++; } 
			?>
             	</table>
            			
			<input type='submit' name= 'post_csv' id='post_csv' value='Import' />
		</form>
        
       
        
		</div>
        <?php 
		  	 
	 }
		}
	
	
	
	else if(isset($_POST['post_csv']))
	{
		
		error_reporting(0);
		
		/////
		/////
		///// CSV IMPORT
		///// 
		/////
		if(isset($_POST['filename']))
		{
        	$upload_dir = wp_upload_dir();
	        $dir  = $upload_dir['basedir']."/imported_csv/";
		csv_file_data_pod($dir.$_POST['filename'],$delim_pod);
		
		if(isset($_POST['drop_table'])){
				global $wpdb;
				$wpdb->query("TRUNCATE TABLE $tabella");
			}
		
			if(isset($_POST['firsth'])){
				$headers_pod = array_shift($data_rows_pod);
			}
			
		foreach($_POST as $postkey=>$postvalue){
	
			
			if ($postvalue != "") {
				
			
			if (strpos($postkey,"textbox") !== false) {
				$textboxkey = str_replace("textbox", "", $postkey);
				$texto[$textboxkey] = $postvalue;
				}
		
			else if($postvalue != '-- Select --' ){
		
			 if( $postvalue != 'add_a_constant') {
				$ret_array[$postkey]=$postvalue;
			}}}
		}
	
	
		
		foreach($data_rows_pod as $key => $value){
			
		
			unset($custom_array_pod);
			if(isset($_POST['update'])){
			$wherray[$_POST['where1']] = $value[$_POST['where2']];
			}
			
			
			foreach($ret_array as $koso => $valuso){
						$new_post[$koso] = $value[$valuso];	}
			
		
			for($inc=0;$inc<count($value);$inc++){
			   foreach($keys_pod as $k => $v){
			  
			  //if(array_key_exists($v,$texto)){
				//$custom_array_pod[$v] = $texto[$v];}
			
			
			
			if(array_key_exists($v,$new_post)){
			$custom_array_pod[$v] = $new_post[$v];
				}   }
			   
			if(!isset($_POST['update'])) {
			if (array_key_exists('permalink',$keys_pod)) {
			if (!array_key_exists('permalink',$custom_array_pod)) { 
			$custom_array_pod['permalink'] = generateSeoTitle(($custom_array_pod['name']));} 		
			else
			{$custom_array_pod['permalink'] = generateSeoTitle(($custom_array_pod['permalink']));}
			 }
			
			
			if (array_key_exists('created',$keys_pod) && !array_key_exists('created',$custom_array_pod)) { 
			$custom_array_pod['created'] = current_time('mysql', 1);}	 
			}
			
			if (array_key_exists('modified',$keys_pod)  && !array_key_exists('modified',$custom_array_pod)) { 
			$custom_array_pod['modified'] = current_time('mysql', 1);}  
			
			
			}
			
			if(isset($_POST['update'])){

			
$wpdb->update($tabella, $custom_array_pod, $wherray);

			}	else {
$wpdb->insert( $tabella, $custom_array_pod );	}
				
				}
			
				error_reporting(1);
			
				}

//	
//
//mysql import
//
//	
if(isset($_POST['tabella_msql'])) {
$posts_t_cat = $_POST['posts_t_cat'];		
$tabella_msql = $_POST['tabella_msql'];			
				
		if(isset($_POST['drop_table'])){
				global $wpdb;
				$wpdb->query("TRUNCATE TABLE $tabella");
			}
		
	
			
		foreach($_POST as $postkey=>$postvalue){
			if ($postvalue != "") 
			
			{
			if (strpos($postkey,"textbox") !== false) {
				$textboxkey = str_replace("textbox", "", $postkey);
				$texto[$textboxkey] = $postvalue;
				
				}
				
				else if (strpos($postvalue,"customxxx") !== false) 
				{
				$customfikey = str_replace("customxxx", "", $postvalue); 
				$customizzati[$customfikey] = $postkey;
			
			
				
				} 

				else if($postvalue != '-- Select --'){
				if($postvalue != 'add_a_constant'){
				$ret_array[$postkey]=$postvalue;
				
				
			}}
		}}
		
		
		
foreach($keys_pod as $v)
		{
		if(array_key_exists($v, $ret_array))
		{
		$mysql_match[$v] = $ret_array[$v];
					
		}
		}






$ganzo = array();
foreach ($mysql_match as $source =>$tofill) {
	$ganzo[$tofill] = $tofill.' as '.$source;
	}

$ganzosql = implode(", ", $ganzo); 

if(strstr($tabella_msql, "posts")) 
 {$ganzosql .= ", ID as idcustom";
 $dove = " WHERE (post_type LIKE  '$posts_t_cat') and (post_status LIKE 'publish')";
 }

if(isset($_POST['update']))
{$ganzosql .= ",".$_POST['where2'] ." as ".$_POST['where1'];}


$righette = $wpdb->get_results("SELECT $ganzosql FROM  $tabella_msql ".$dove,  ARRAY_A); 

foreach ($righette as $righetta ) { 

unset($custom_array_pod);


foreach ($righetta as $chiave => $campo ) 
{
if(isset($_POST['update'])) 
{
if ( $chiave == $_POST['where1']) 
{ $wherray[$chiave] = $campo;} 
else {$custom_array_pod[$chiave] = $campo;}
}
else
if( $chiave == "idcustom")  {
	$zoccole =	get_post_custom($campo);
	foreach ($customizzati as $customk => $customv) {
	$custom_array_pod[$customizzati[$customk]] = $zoccole[$customk][0];
	
	}
	}
else {$custom_array_pod[$chiave] = $campo;}
}

foreach ($texto as $textok => $textov ) {
$custom_array_pod[$textok] = $textov ;}

if(!isset($_POST['update'])) {

if (array_key_exists('permalink',$keys_pod) && !array_key_exists('permalink',$custom_array_pod))
 {$custom_array_pod['permalink'] = generateSeoTitle($custom_array_pod['name']);} else
{$custom_array_pod['permalink'] = generateSeoTitle($custom_array_pod['permalink']);}

if (array_key_exists('created',$keys_pod) && !array_key_exists('created',$custom_array_pod)) { 
$custom_array_pod['created'] = current_time('mysql', 1);
}
else if(isset($_POST['unixttcreated'])) 
{$custom_array_pod['created'] = gmdate("Y-m-d\ H:i:s", $custom_array_pod['created']);}

} 

if (array_key_exists('permalink',$custom_array_pod)) {$custom_array_pod['permalink'] = generateSeoTitle($custom_array_pod['permalink']);}
if (array_key_exists('modified',$keys_pod)&& !array_key_exists('modified',$custom_array_pod)) { 
$custom_array_pod['modified'] = current_time('mysql', 1);} 
else if(isset($_POST['unixttmodified'])) 
{$custom_array_pod['modified'] = gmdate("Y-m-d\ H:i:s", $custom_array_pod['modified']);}


if(isset($_POST['update'])){

			
$wpdb->update($tabella, $custom_array_pod, $wherray);

			}	else {
$wpdb->insert( $tabella, $custom_array_pod );	
	
	}
}


//FAST MODE
//$columns_to_fill = implode(", ", array_keys($mysql_match)); 
//$source_columns = implode(", ", $mysql_match); 
//$mysql_string =	"INSERT INTO ".$tabella." (".$columns_to_fill.") SELECT ".$source_columns." FROM ".$_POST['tabella_msql'];


			
			}
		
		
	
	?>
  
    
  <?php

//rename duplicate permalinks



?>
        
        <?php

		//display imported rows
		$righette = '';
	if	(count($data_rows_pod) > 1) {
		$righe_inserite = count($data_rows_pod);
		} else 
		{$righe_inserite = count($righette);
			}

			echo count($data_rows_pod) . __(' Rows Imported','leagueengine') . '.';
		    echo '<form class="add:the-list: validate" method="post" enctype="multipart/form-data">';
			echo '<input type="submit" id="goto" name="goto" class="button" value="Continue" />';
		    echo '</form>';
		    echo '</div>';
       
        ?>

	<?php 
// Code modified at version 1.1.2
	// Remove CSV file
        	$upload_dir = wp_upload_dir();
	        $csvdir  = $upload_dir['basedir']."/imported_csv/";
		$CSVfile = $_POST['filename'];
		if(file_exists($csvdir.$CSVfile)){
			chmod("$csvdir"."$CSVfile", 755);
			fileDeletePod($csvdir,$CSVfile); 
		}
	}
	
	
	
	
	
	
	else
	{
	?>
		
        		
		<form class="" method="post" enctype="multipart/form-data" action="<?php echo LEAGUEENGINE_DIRURL .'/functions/settings/export.php';?>">
		<table class="form">	
	
			<tr>
				<td><?php _e('Database Table','leagueengine');?></td>
				<td>
					<select class="select2-nosearch" name="export_table" id="export_table" aria-required="true">
		            <?php
					global $wpdb;
					$prefix = $wpdb->prefix . 'leagueengine_%';
					$risultati = $wpdb->get_results( "SHOW TABLES LIKE '$prefix'", ARRAY_N);
						foreach( $risultati as $risultato ) {
						echo '<option value="' . $risultato[0] . '">' . $risultato[0]. '</option>';}			
					?>
		            </select>
				</td>
			</tr>

			<tr>
				<td><?php _e('Output Filename','leagueengine');?></td>
				<td>
					<input name="export_filename" id="export_filename" type="text" value="leagueengine" />
				</td>
			</tr>

		</table>
		
		<input style="margin-top:20px;" type="submit" name="export" class="button" value="<?php _e('Export','leagueengine');?>" />

		</form>
		
		</div>

	<?php
	
	error_reporting(1);
	
	}


?>