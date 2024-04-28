#!/bin/ksh
export ORACLE_SID=ORA19C
export ORAENV_ASK=NO
. oraenv >/dev/null 2>&1
tstmp=$(echo $(date '+%d%m%y_%H%M%S'))
sqlplus '/as sysdba' << SQLEOF >${tstmp}_cpoolstatus_check.out
set echo on
set feedback on
set lines 1200 pages 3000 colsep , time on timing on trim on trims on
alter session set nls_Date_format='DD/MON/YYYY HH24:MI:SS';
@cpool.sql
exit;
SQLEOF
echo "Output file: " ${tstmp}_cpoolstatus_check.out