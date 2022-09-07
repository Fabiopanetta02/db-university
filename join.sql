-- QUERY CON JOIN

-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.`name`, `students`.`surname`, `students`.`date_of_birth`, `students`.`fiscal_code`, `students`.`enrolment_date`, `students`.`registration_number`, `students`.`email`
FROM `students`
JOIN `degrees` 
ON `degrees`.`id` = `students`.`degree_id`
WHERE `degrees`.`name` = 'Corso di Laurea in Economia';

--2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT `degrees`.`name`, `degrees`.`level`, `degrees`.`address`, `degrees`.`email`, `degrees`.`website`
FROM `degrees`
JOIN `departments` 
ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name` = 'Dipartimento di Neuroscienze';

--3.  Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `courses`.`name`, `courses`.`description`, `courses`.`period`, `courses`.`year`, `courses`.`cfu`, `courses`.`website`
FROM `courses`
JOIN `course_teacher` 
ON `courses`.`id` = `course_teacher`.`course_id`
WHERE `teacher_id` = 44

--4.  Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT DISTINCT `students`.`name`, `students`.`surname`, `degrees`.`name`, `degrees`.`level`, `degrees`.`address`, `degrees`.`email`, `degrees`.`website`, `departments`.`name`, `departments`.`address`, `departments`.`email`, `departments`.`website`
FROM `students`
JOIN `degrees` 
ON `degrees`.`id` = `students`.`degree_id`
JOIN `departments` 
ON `departments`.`id` = `degrees`.`department_id`
ORDER BY `students`.`surname` ASC

--5.  Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name` AS `name_degree`, `degrees`.`level`, `degrees`.`address`, `degrees`.`email`, `degrees`.`website`, `courses`.`name`, `courses`.`description`, `courses`.`period`, `courses`.`year`, `courses`.`cfu`, `courses`.`website`, `teachers`.`name`, `teachers`.`surname`, `teachers`.`phone`, `teachers`.`email`, `teachers`.`office_address`, `teachers`.`office_number`
FROM `courses`
JOIN `degrees`
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher` 
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers` 
ON `teachers`.`id` = `course_teacher`.`teacher_id`  
ORDER BY `name_degree`

--6.  Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT `teachers`.`name`, `teachers`.`surname`, `teachers`.`phone`, `teachers`.`email`, `teachers`.`office_address`, `teachers`.`office_number`, `courses`.`name`, `courses`.`description`, `courses`.`period`, `courses`.`year`, `courses`.`cfu`, `courses`.`website`, `degrees`.`name`, `degrees`.`level`, `degrees`.`address`, `degrees`.`email`, `degrees`.`website`
FROM `courses`
JOIN `degrees` 
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher` 
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers` 
ON `teachers`.`id` = `course_teacher`.`teacher_id`
WHERE `department_id` = 5