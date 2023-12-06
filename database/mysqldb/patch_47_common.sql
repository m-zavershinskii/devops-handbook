create table bin_data (
    bin_data_id int(3) unsigned auto_increment PRIMARY KEY,
    data_length int(10) unsigned not null,
    file_name varchar(255),
    mime_type varchar(255)
)
engine=InnoDB;

create table bin_data_chunk (
    bin_data_id int(3) unsigned not null,
    chunk_num int(2) unsigned not null,
    chunk_data mediumblob,

    primary key (bin_data_id, chunk_num),

    constraint bin_data_chunk_bin_data_id_fk_bin_data_bin_data_id foreign key (bin_data_id)
      references bin_data (bin_data_id) on delete cascade
)
engine=InnoDB;

create table mail_message
(
  bin_data_id int(3) unsigned not null,
  tries tinyint(3) default 0 null,
  last_try_timestamp timestamp null,
  next_try_timestamp timestamp null,
  last_failure_reason text null,
  client VARCHAR(255) null,

  primary key (bin_data_id),

  constraint mail_message_bin_data_id_fk_bin_data_bin_data_id foreign key (bin_data_id)
    references bin_data (bin_data_id) on delete cascade
)
ENGINE=InnoDB;



INSERT
INTO patch_history (patch, pack_version, patch_timestamp)
VALUES (47, 0, now());

COMMIT;