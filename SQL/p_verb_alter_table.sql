ALTER TABLE p_verb
ADD `IMG_VERB1` longblob NOT NULL AFTER `FILE_PATH_IMG_VERB`;
ALTER TABLE p_verb
ADD `FILE_PATH_IMG1_VERB` varchar(200) NOT NULL AFTER `IMG_VERB1`;
ALTER TABLE p_verb
ADD `IMG_VERB2` longblob NOT NULL AFTER `FILE_PATH_IMG1_VERB`;
ALTER TABLE p_verb
ADD `FILE_PATH_IMG2_VERB` varchar(200) NOT NULL AFTER `IMG_VERB2`;