desc dba_users
select username,account_status
from dba_users
where username in('HR','SCOTT');
alter user scott identified by tiger
account unlock;
conn scott/tiger
show user
