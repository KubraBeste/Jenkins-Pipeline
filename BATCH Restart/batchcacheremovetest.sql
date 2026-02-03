update CI_WF_PROC set WF_STAT_FLG = '40' where WF_STAT_FLG in( '10', '20', '30');
commit;

update cisadm.ci_batch_run set run_status = '40' where batch_cd = 'C1-WFSUB' and not run_status = '40';
update cisadm.ci_batch_job set batch_job_stat_flg = 'ED' where batch_cd = 'C1-WFSUB' and not batch_job_stat_flg = 'ED';
update cisadm.ci_batch_thd set thread_status = '40' where batch_cd = 'C1-WFSUB' and not thread_status = '40';
commit;




update ci_batch_run set run_status='40' where  (run_status='20' or run_status='10' or run_status='30');
update ci_batch_THD set THREAD_status='40' where (THREAD_status='20' or THREAD_status='10' or THREAD_status='30');
update ci_batch_run set DO_NOT_RESTART_SW='Y' where DO_NOT_RESTART_SW='N' and batch_nbr= (select max(batch_nbr) from ci_batch_run ); 
update ci_batch_job set batch_job_stat_flg='ED' where  batch_job_stat_flg in ('PD','ST');
commit;