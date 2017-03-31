
What are all projects that use JavaScript?

1.  select project.name, tech.name from project join project_uses_tech on project.id = project_uses_tech.project_id join tech on project_uses_tech.tech_id = tech.id where tech.name = 'CSS'

What are all technologies used by the Personal Website?

2. select project.name, tech.name from project_uses_tech join project on project_uses_tech.project_id = project.id join tech on project_uses_tech.tech_id = tech.id where project.name = 'Personal Website'

Perform a left outer join from the tech table to the project_uses_tech table - which techs has no associated project?

3. select * from tech left outer join project_uses_tech on tech.id = project_uses_tech.tech_id where project_id

Based on the previous query, get the count of the number of techs used by each project.

4. select project.name, count(project_uses_tech.tech_id) from project left outer join project_uses_tech on project.id = project_uses_tech.project_id group by project.name

  4a). select project.name, count(tech_id) from project left outer join project_uses_tech on project.id = project_uses_tech.project_id group by project.name order by count(tech_id) desc
  4b). select
	project.name, count(project_uses_tech.tech_id)
from
	project
left outer join
	project_uses_tech on project.id = project_uses_tech.project_id
group by
	project.id
  
Perform a left outer join from the project table to the project_user_tech table - which projects has no associated tech?

5. select * from project left outer join project_uses_tech on project.id = project_uses_tech.project_id where project_uses_tech.tech_id

Based on the previous query, get the count of the number of projects that use each tech.

6. select tech.name, count(project_uses_tech.project_id) from tech join project_uses_tech on tech.id = project_uses_tech.tech_id group by tech.name order by count(project_uses_tech.project_id) desc

    step 1) select * from tech join project_uses_tech on tech.id = project_uses_tech.tech_id
    step 2) select tech.name, count(project_uses_tech.project_id) from tech join project_uses_tech on tech.id = project_uses_tech.tech_id group by tech.name
    step 3) select tech.name, count(project_uses_tech.project_id) from tech join project_uses_tech on tech.id = project_uses_tech.tech_id group by tech.name order by count(project_uses_tech.project_id) desc


List all projects along with each technology used by it. You will need to do a three-way join.

7. select project.name, tech.name from project_uses_tech join project on project_uses_tech.project_id = project.id join tech on project_uses_tech.tech_id = tech.id

List all the distinct techs that are used by at least one project.

8. select distinct(tech.name) from tech join project_uses_tech on tech.id = project_uses_tech.tech_id

List all the distinct techs that are not used by any projects.

9. select distinct(tech.name) from tech left outer join project_uses_tech on tech.id = project_uses_tech.tech_id where project_uses_tech.project_id is null

List all the distinct projects that use at least one tech.

10. select distinct(project.name) from project_uses_tech join tech on project_uses_tech.tech_id = tech.id join project on project_uses_tech.project_id = project.id

List all the distinct projects that use no tech.

11. select * from project left outer join project_uses_tech on project.id = project_uses_tech.project_id where project_uses_tech.project_id is null

Order the projects by how many tech it uses.

12. select project.name, count(project_uses_tech.tech_id) as count from project join project_uses_tech on project.id = project_uses_tech.project_id group by project.name order by count desc

Order the tech by how many projects use it.

13. select tech.name as technology, count(project_id) as projects_used from tech join project_uses_tech on tech.id = project_uses_tech.project_id group by tech.name order by projects_used desc

What is the average number of techs used by a project?

14. select avg(foo.projects_used from (select tech.name as technology, count(project_id) as projects_used from tech join project_uses_tech on tech.id = project_uses_tech.project_id group by tech.name order by projects_used desc) as foo
