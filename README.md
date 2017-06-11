# ambulatory-ehr-data
300k patient records generated to be nationally representative using NAMCS

This repo contains 300k patients generated using the patient-data-generator, which is powered off the 2012 NAMCS survey.  Results are sampled and slightly randomized from the NAMCS survey, and reformatted to be in a format more consistent with EHR data.

This repo also contains a sql script to compile the data into a single sqlite database.  To run, just execute the bash script:

    bash build-sqlite.sh

Or run build-sqlite.sql within sqlite.

To get an entire patient dataset, run the following with an id:

    SELECT *
    FROM patient pat 
    LEFT JOIN diagnosis dia     ON pat.patientid = dia.patientid
    LEFT JOIN encounter enc     ON pat.patientid = enc.patientid
    LEFT JOIN prescription pre  ON pat.patientid = pre.patientid
    LEFT JOIN labresult lab     ON pat.patientid = lab.patientid
    LEFT JOIN  measurement mea  ON enc.encounterid = mea.encounterid
    WHERE pat.patientid = ?;

This data, while intended to be nationally representative and clinically accurate, is not guaranteed to be such.  So, it's better for learning or testing methods on than for doing current public health or clinical research.
