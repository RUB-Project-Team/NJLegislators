
db_user="postgres"

db_password="xxxx"

mayor_query = 'SELECT m."Mayor_Name", m."eMail",m."Address",m."Phone",m."Term_End" FROM "MunicipalMayors" AS m WHERE "Town" IN (' + "{}" + ')'

senator_query = 'SELECT s."Name", sa."Address" FROM "Senators" AS s, "Dist_Municipality" AS dm,"SenatorAddress" as sa \
                 WHERE s."Dist_ID" = dm."Dist_ID" AND s."Dist_ID" = sa."Dist_ID" AND dm."Town" IN (' + "{}" + ')'

assembly_query = 'SELECT DISTINCT a."Name", aa."Address" FROM "Assembly" AS a, "Dist_Municipality" AS dm,"AssemblyPersonAddress" as aa WHERE a."Dist_ID" = dm."Dist_ID" AND a."Dist_ID" = aa."Dist_ID" AND dm."Town" IN (' + "{}" + ')'

    