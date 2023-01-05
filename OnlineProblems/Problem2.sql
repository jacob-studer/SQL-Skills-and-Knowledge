--Show patient_id, first_name, last_name, and attending doctor's specialty.
--Show only the patients who has a diagnosis as 'Epilepsy' and the doctor's first name is 'Lisa'

select 
    	p.patient_id,
        p.first_name,
        p.last_name,
        d.specialty
    from patients p
    join admissions a 
    on p.patient_id = a.patient_id
    join doctors d 
    on d.doctor_id = a.attending_doctor_id
    where a.diagnosis = 'Epilepsy'
    and d.first_name = 'Lisa'


--Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed 
--by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: 
--AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).

--Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, 
--and output them in the following format:
--There are a total of [occupation_count] [occupation]s.

select 
    name, 
    CONCAT('(', LEFT(occupation, 1),')')
from occupations
order by name asc

select 
    CONCAT ('There are a total of ', count(occupation), ' ', LOWER(occupation), 's.')
from occupations
group by occupation
order by occupation asc, 