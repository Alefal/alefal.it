/***** WP Theme: Football Club *****/

select id, post_title, guid from avwp_posts where post_type = 'tb_club' 	//692 - Santa Caterina
select * from avwp_postmeta where meta_key = 'tb_club AND 'post_id = '692'
select * from avwp_postmeta where meta_key = 'tb_club' AND meta_value = '692'

select id, post_title, guid from avwp_posts where post_type = 'tb_player'	//777 - Alessandro Falcone

/*** MATCHS ***/
select id, post_title, post_date, guid from avwp_posts where post_type = 'tb_match'	//id: 733
select * from avwp_postmeta where post_id = '733'

select * from avwp_postmeta where meta_key = 'tb_club' AND meta_value = '692'

/*** SQUADRE E GIOCATORI ***/
select P.id AS SquadraId,P.post_title AS Squadra,PP.id AS PlayerId,PP.post_title AS Atleta from avwp_posts AS P 
join avwp_postmeta as PM ON P.id=PM.meta_value
join avwp_posts as PP ON PP.id=PM.post_id
where P.post_type = 'tb_club' AND PM.meta_key = 'tb_club'
order by P.post_title 	

/*** INCONTRI ***/
select P.id, P.post_date, PM.*, PP.post_title AS casa, PPP.post_title AS fuori

from avwp_posts AS P  

JOIN avwp_postmeta as PM ON P.id=PM.post_id
LEFT JOIN avwp_posts as PP ON PP.id=PM.meta_value AND PM.meta_key = 'tb_home_club'
LEFT JOIN avwp_posts as PPP ON PPP.id=PM.meta_value AND PM.meta_key = 'tb_away_club'

where P.post_type = 'tb_match' AND P.id = '733' AND 
	(PM.meta_key = 'tb_home_club' OR 
     PM.meta_key = 'tb_away_club' OR 
     PM.meta_key = 'tb_home_goals' OR 
     PM.meta_key = 'tb_away_goals')
     
order by P.post_date 
