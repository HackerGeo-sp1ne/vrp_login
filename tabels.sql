CREATE TABLE `vrp_login` (
  `user_id` int(255) NOT NULL,
  `username` VARCHAR(255),
  `parola` VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `vrp_login`
  ADD PRIMARY KEY (`user_id`);