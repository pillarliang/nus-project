/* write your SQL and answers */
/* Execution of various SQL commands based on Autism dataset: */
# create database
.open workshop

# check
.databases

# create table
create table ASD(
	Case_No int primary key,
	A1 int,
	A2 int,
	A3 int,
	A4 int,
	A5 int,
	A6 int,
	A7 int,
	A8 int,
	A9 int,
	A10 int,
	Age_Mons int,
	Qchat_10_Score int,
	Sex char(4),
	Ethnicity char(50),
	Jaundice char(3),
	Family_mem_with_ASD char(3),
	Who_completed_the_test char(50),
	[Class/ASD Traits] char(3)
);

# check
.table

# import ASD CSV file into Sqlite DB
.mode csv
.import 'Toddler Autism dataset.csv' ASD
DELETE FROM ASD WHERE Case_No = 'Case_No';

# test
Select * from ASD where [Class/ASDTraits] ="Yes";


/*     How many middle eastern children show ASD traits ? */
SELECT COUNT(*) FROM ASD where Ethnicity='middle eastern' and [Class/ASD Traits]='Yes';


/*     How many children who have Jaundice show ASD traits ? */
SELECT COUNT(*) FROM ASD WHERE Jaundice ='yes' AND [Class/ASD Traits] = 'Yes';


/*     Are ASD traits dependent on hereditary ? Justify . */
# When looking at data queries alone, it cannot be asserted with certainty that ASD traits are solely dependent on heredity. 
# This is because the genetic basis of these traits is complex and involves the interaction of multiple genes, as well as potential external environmental factors. 
# To analyze and understand this, it is recommended to employ machine learning models that incorporate multiple features.


/*     People of which ethnicity are most likely to exhibit ASD traits ? */
SELECT Ethnicity FROM ASD WHERE [Class/ASD Traits]='Yes' GROUP BY Ethnicity ORDER BY COUNT(*) DESC LIMIT 1;


/*     What is the proportion of a white European girls (female) exhibit ASD traits among all white European girls? */
SELECT COUNT() * 100.0 /(SELECT COUNT() FROM ASD WHERE Ethnicity = 'White European' AND Sex = 'f') AS proportion FROM ASD WHERE Ethnicity = 'White European' AND Sex = 'f' AND [Class/ASD Traits] = 'Yes';
