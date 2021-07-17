# Import database

- Make sure your database already placed in **../shared/databases**
- Attach shell
  ```sh
  $ docker exec -it [mysql_container_name] bash
  ```
- Use _pv_ to show your import progress
  ```sh
  $ pv [file_sql].sql.gz | gunzip | mysql -u [username] -p [database_name]
  ```
