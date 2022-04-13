-- Create a trigger which don’t allow you to delete any student from student Table.
-- Print message “You don’t have the permission to delete the student”
create trigger task_1 on [dbo].[Students]
instead of delete
as
BEGIN
print 'You do not have permision to delete the student.'
END

delete from [dbo].[Students] where RollNo=1


-- Create a trigger which don’t allow you to insert any course in Courses Table.
-- Print message “You don’t have the permission to Insert a new Course”
create trigger task_2 on [dbo].[Courses]
instead of insert
as
begin
print 'You do not have permision to insert a new course.'
end

insert into [dbo].[Courses] values(50,'Statistics',null,3)

-- Create a new table, ‘Notify’ that should notify students about any important events. The table has three
-- columns, NotifictionID, StudentID and Notification String. Create a Trigger to notify student if his
-- registration in the course is successful. Also inform user if registration is not successful.
-- For successful registration the student must have passed the prerequisite and number of
-- seats are available.
create table [dbo].[Notify](
    NotificationId int not null identity(1,1) primary  key,
    StudentID int not null,
    Notification varchar(50)
)

-- create a trigger for insertion in given table
alter trigger task_3 on [dbo].[Registration]
instead of insert
as
begin
    declare @pre_req int
    select @pre_req=PrerequiteCourseID from [dbo].[Courses] where Courses.CourseID=(select CourseID from inserted)
    declare @rollnum int
    select @rollnum=RollNumber from inserted
    if(exists(select * from [dbo].[Registration] R where R.RollNumber=@rollnum and R.CourseID=@pre_req and R.GPA>2)) -- checking for pre req
    begin
        if(exists(select * from [dbo].[Courses_Semester] C where C.Section=(select Section from inserted) and C.AvailableSeats>0 and C.Semester=(select Semester from inserted)))
        begin
--             insert into [dbo].[Registration] values((select Semester from inserted),(select RollNumber from inserted),(select CourseID from inserted),(select Section from inserted),(select GPA from inserted))
            insert into [dbo].[Notify] values((select RollNumber from inserted),'Registration in the course is successful')
        end
            else
        begin
            insert into [dbo].[Notify] values((select RollNumber from inserted),'Registration in the course is not successful')
        end
    end
    else
    begin
        insert into [dbo].[Notify] values((select RollNumber from inserted),'Registration in the course is not successful')
    end
end

insert into [dbo].[Registration] values('Spring2017',2,10,'D',4)
select * from Notify
insert into [dbo].[Registration] values('Spring2022',2,10,'A',4)
select * from Notify


-- According to university rules, Students before enrolling in new course should have no fee charges due.
-- Create a trigger to ensure that no student is enrolled in new course with more than 20,000 fee charges
-- due.
drop trigger task_3
alter trigger task_4 on [dbo].[Registration]
instead of insert
as
begin
    if(exists(select * from [dbo].[ChallanForm] C where C.RollNumber=(select RollNumber from inserted) and C.TotalDues>19999 and C.Status='Pending'))
    begin
        print 'student has pending fee'
    end
    else
    begin
        print 'student enrolled'
    end
end
insert into [dbo].[Registration] values('Spring2022',4,10,'A',4) -- has pending fee


-- Create a trigger that do not let you delete any course semester whose available seats are less than 10.
-- Print ‘not possible’.
-- Otherwise prints ‘Successfully deleted’, after you delete any course semester whose available seats are
-- 10 or more.
alter trigger task_5 on [dbo].[Courses_Semester]
instead of delete
as
begin
    if(exists(select * from [dbo].[Courses_Semester] CS where CS.CourseID=(select CourseID from deleted) and CS.Semester=(select Semester from deleted) and CS.AvailableSeats>10))
    begin
        print 'not possible'
    end
    else
    begin
        delete from [dbo].[Courses_Semester] where (CourseID=(select CourseID from deleted) and Semester=(select Semester from deleted))
        print 'Successfully deleted'
    end
end
delete from [dbo].[Courses_Semester] where CourseID=10 and Semester='Spring2017'

-- Create a trigger to stop Instructors table, from being modified or dropped.
alter trigger task_6 on database
for drop_table
as
begin
    print 'You are not allowed to modify or drop this table'
end
drop table [dbo].[Instructors]