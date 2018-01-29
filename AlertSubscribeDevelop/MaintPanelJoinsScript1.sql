SELECT PROG.ID, PROG.NAME, PROG.DESCRIPTION, PROG_PROF.DISPLAY_ORDER,
  PROG_PROF.DEFAULT_OPT_IN, PROG_PROF.VISIBLE_IN_UI, PROG_PROF.CHAN_EMAIL,
  PROG_PROF.CHAN_IVR, PROG_PROF.CHAN_SMS, PROG_PROF.CHAN_SECURE,
  PROG_CONF.CHAN_EMAIL_PRIORITY, PROG_CONF.CHAN_IVR_PRIORITY,
  PROG_CONF.CHAN_SMS_PRIORITY, PROG_CONF.CHAN_SECURE_PRIORITY,
  PROG_CONF.CHAN_DEFAULT, PROG_CONF.REQUIRED, PROG_CONF.MANDATORY,
  PROG_PROF_CLT.DISPLAY_ORDER, PROG_PROF_CLT.DEFAULT_OPT_IN, PROG_PROF_CLT.VISIBLE_IN_UI,
  PROG_PROF_CLT.CHAN_EMAIL, PROG_PROF_CLT.CHAN_IVR, PROG_PROF_CLT.CHAN_SMS,
  PROG_PROF_CLT.CHAN_SECURE, CLT_CONF.CHAN_EMAIL_PRIORITY, CLT_CONF.CHAN_IVR_PRIORITY,
  CLT_CONF.CHAN_SMS_PRIORITY, CLT_CONF.CHAN_SECURE_PRIORITY, CLT_CONF.CHAN_DEFAULT,
  CLT_CONF.REQUIRED, CLT_CONF.MANDATORY
  FROM
       PROGRAM AS PROG JOIN PROGRAM_PROFILE AS PROG_PROF ON PROG.ID = PROG_PROF.PROGRAM_ID JOIN PROGRAM_CONFIGURATION AS PROG_CONF ON PROG.ID = PROG_CONF.PROGRAM_ID LEFT OUTER JOIN PROGRAM_PROFILE_CLIENT_EXCEPTION AS PROG_PROF_CLT ON PROG.ID = PROG_PROF_CLT.PROGRAM_ID LEFT OUTER JOIN CLIENT_CONFIGURATION AS CLT_CONF ON PROG_CONF.COMMUNICATION_ID = CLT_CONF.COMMUNICATION_ID
  WHERE PROG_CONF.COMMUNICATION_ID = :COMM_ID
  --(PROG_PROF.EFFECTIVE <= CURRENT_TIMESTAMP AND PROG_PROF.EXPIRATION > CURRENT_TIMESTAMP)
   AND PROG_PROF_CLT.CLIENT_ID = :CLIENT_ID