-- only unique aircrafts models
create unique index on aircrafts (lower(model));
