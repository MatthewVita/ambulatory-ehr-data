CREATE TABLE patient(patientid int, age int, agecat varchar(15), sex varchar(10), race varchar(30), ethnicity varchar(30), state varchar(50));
CREATE TABLE diagnosis(diagnosisid int, patientid int, icd9 varchar(6));
CREATE TABLE encounter(encounterid int, patientid int, payertype varchar(50), reasonforvisit varchar(100), timewithprovider int, providerspecialty varchar(50), dos text);
CREATE TABLE measurement(measureid int, encounterid int, measurement varchar(10), measurementvalue numeric);
CREATE TABLE prescription(prescriptionid int, patientid int, drugid varchar(10));
CREATE TABLE labresult(labresultid int, patientid int, loinc_num varchar(10), date_result text, obs_quan numeric);

.separator ,
.headers on

.import patient.csv patient
.import diagnosis.csv diagnosis
.import encounter.csv encounter
.import encountermeasure.csv measurement
.import labresult.csv labresult
.import prescription.csv prescription
