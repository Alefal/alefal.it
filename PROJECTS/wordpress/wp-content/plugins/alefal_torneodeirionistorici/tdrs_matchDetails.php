<?php
require_once('../../../wp-config.php');

global $wpdb;

$teamsHomeArray = array();
$teamsAwayArray = array();
$resultArray = array();
$finalArray = array();

if(isset($_GET['match_id'])) { //733
 
	$goals = $wpdb->get_results("select * from avwp_postmeta where post_id = '".$_GET['match_id']."' AND meta_key = 'tb_players'");

	$resultArray[] = array(
	    'result'  => 'OK',
	    'message' => 'OK'
	);


	$resultQueryTmp 	= $goals[0]->meta_value;
	$pos = stripos($resultQueryTmp, '"');

	$resultQueryNew 	= substr($resultQueryTmp, $pos+1, $resultQueryTmp.length - 2); 
	$resultQueryFinal 	= unserialize($resultQueryNew);

	/*
	$mystring='s:2381:"a:2:{s:4:"home";a:2:{s:6:"lineup";a:8:{i:769;a:5:{s:7:"checked";s:1:"1";s:5:"goals";s:1:"0";s:7:"assists";s:1:"0";s:11:"yellowcards";s:1:"0";s:8:"redcards";s:1:"0";}i:770;a:5:{s:7:"checked";s:1:"1";s:5:"goals";s:1:"1";s:7:"assists";s:1:"0";s:11:"yellowcards";s:1:"0";s:8:"redcards";s:1:"0";}i:771;a:5:{s:7:"checked";s:1:"1";s:5:"goals";s:1:"1";s:7:"assists";s:1:"0";s:11:"yellowcards";s:1:"0";s:8:"redcards";s:1:"1";}i:772;a:5:{s:7:"checked";s:1:"1";s:5:"goals";s:1:"0";s:7:"assists";s:1:"0";s:11:"yellowcards";s:1:"0";s:8:"redcards";s:1:"0";}i:773;a:5:{s:7:"checked";s:1:"1";s:5:"goals";s:1:"1";s:7:"assists";s:1:"0";s:11:"yellowcards";s:1:"0";s:8:"redcards";s:1:"0";}i:774;a:5:{s:7:"checked";s:1:"1";s:5:"goals";s:1:"1";s:7:"assists";s:1:"0";s:11:"yellowcards";s:1:"0";s:8:"redcards";s:1:"0";}i:775;a:5:{s:7:"checked";s:1:"1";s:5:"goals";s:1:"0";s:7:"assists";s:1:"0";s:11:"yellowcards";s:1:"0";s:8:"redcards";s:1:"0";}i:777;a:5:{s:7:"checked";s:1:"1";s:5:"goals";s:1:"2";s:7:"assists";s:1:"0";s:11:"yellowcards";s:1:"1";s:8:"redcards";s:1:"0";}}s:4:"subs";a:0:{}}s:4:"away";a:2:{s:6:"lineup";a:10:{i:814;a:5:{s:7:"checked";s:1:"1";s:5:"goals";s:1:"0";s:7:"assists";s:1:"0";s:11:"yellowcards";s:1:"0";s:8:"redcards";s:1:"0";}i:815;a:5:{s:7:"checked";s:1:"1";s:5:"goals";s:1:"0";s:7:"assists";s:1:"0";s:11:"yellowcards";s:1:"0";s:8:"redcards";s:1:"0";}i:819;a:5:{s:7:"checked";s:1:"1";s:5:"goals";s:1:"3";s:7:"assists";s:1:"0";s:11:"yellowcards";s:1:"0";s:8:"redcards";s:1:"0";}i:820;a:5:{s:7:"checked";s:1:"1";s:5:"goals";s:1:"0";s:7:"assists";s:1:"0";s:11:"yellowcards";s:1:"1";s:8:"redcards";s:1:"0";}i:822;a:5:{s:7:"checked";s:1:"1";s:5:"goals";s:1:"0";s:7:"assists";s:1:"0";s:11:"yellowcards";s:1:"0";s:8:"redcards";s:1:"0";}i:823;a:5:{s:7:"checked";s:1:"1";s:5:"goals";s:1:"0";s:7:"assists";s:1:"0";s:11:"yellowcards";s:1:"0";s:8:"redcards";s:1:"1";}i:824;a:5:{s:7:"checked";s:1:"1";s:5:"goals";s:1:"2";s:7:"assists";s:1:"0";s:11:"yellowcards";s:1:"0";s:8:"redcards";s:1:"0";}i:825;a:5:{s:7:"checked";s:1:"1";s:5:"goals";s:1:"0";s:7:"assists";s:1:"0";s:11:"yellowcards";s:1:"0";s:8:"redcards";s:1:"0";}i:827;a:5:{s:7:"checked";s:1:"1";s:5:"goals";s:1:"1";s:7:"assists";s:1:"0";s:11:"yellowcards";s:1:"0";s:8:"redcards";s:1:"0";}i:828;a:5:{s:7:"checked";s:1:"1";s:5:"goals";s:1:"0";s:7:"assists";s:1:"0";s:11:"yellowcards";s:1:"1";s:8:"redcards";s:1:"0";}}s:4:"subs";a:0:{}}}";';
	$findme   = '"';
	$pos = stripos($mystring, $findme);
	$newString = substr($mystring, $pos+1, $mystring.length - 2); 

	$mydata = unserialize($newString);
	var_dump($mydata);
	*/

	foreach ($resultQueryFinal as $key => $value) {

		$home_away = $key;
		foreach ($value as $kk => $vv) {
			foreach ($vv as $kkk => $vvv) {
				$arr_atleta_id = $kkk;
				foreach ($vvv as $kkkk => $vvvv) {
					
					if($kkkk == 'goals')
						$arr_atleta_goal = $vvvv;
					if($kkkk == 'assists')
						$arr_atleta_assists = $vvvv;
					if($kkkk == 'yellowcards')
						$arr_atleta_yellowcards = $vvvv;
					if($kkkk == 'redcards')
						$arr_atleta_redcards = $vvvv;
				}
				//echo '<br />'.$arr_atleta_id .': goal > '. $arr_atleta_goal.' |  assists > '. $arr_atleta_assists.' |  yellowcards > '. $arr_atleta_yellowcards.' |  redcards > '. $arr_atleta_redcards.'	<br />';
				$atletaNome = $wpdb->get_results("select post_title from avwp_posts where id = '".$arr_atleta_id."' AND post_type = 'tb_player'");
				//echo $atletaNome[0]->post_title;

				$objectTeam = new stdClass();
				$objectTeam->atletaId 			= $arr_atleta_id;
				$objectTeam->atletaNome			= $atletaNome[0]->post_title;
				$objectTeam->atletaGoal 		= $arr_atleta_goal;
				$objectTeam->atletaAssist 		= $arr_atleta_assists;
				$objectTeam->atletaYellowcards 	= $arr_atleta_yellowcards;
				$objectTeam->atletaRedcards 	= $arr_atleta_redcards;

				if($home_away == 'home')
					$teamsHomeArray[] = $objectTeam;
				else
					$teamsAwayArray[] = $objectTeam;

			}
		}
	} 
} else {
    $resultArray[] = array(
        'result'  => 'KO',
        'message' => 'Verificare i parametri'
    );
}

//print_r($teamsHomeArray);
//echo '<br/>------------------------<br />';
//print_r($teamsAwayArray);

$finalArray[] = array(
    'response'   => $resultArray,
    'home'   => $teamsHomeArray,
    'away'   => $teamsAwayArray
);
echo json_encode($finalArray);
exit();