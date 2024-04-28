--cpool.sql
col machine for a45
col program for a45
col username for a20
col event for a40
col total_process for a10
show parameter process;
select count(1) from v$process;
select a.value total_process
,b.used_process
,(a.value-b.used_process) free_process
from v$parameter a
,(select count(1) used_process from v$process) b
where a.name='processes';
select machine,count(1) from v$session group by machine order by 1;
select machine,program,count(1) from v$session group by machine,program order by 1,2;
select machine,program,username,count(1) from v$session group by machine,program,username order by 1,2,3;
select machine,program,username,count(1) from v$session where username='SCH_HELLOWORLD' and program='UCPTimeouts' group by machine,program,username order by 1,2,3;
select sid,serial#,username,machine,status,state,logon_time,sql_id,sql_exec_start,event,prev_sql_id,prev_exec_start from v$session where username='SCH_HELLOWORLD' and program='UCPTimeouts' order by sid;