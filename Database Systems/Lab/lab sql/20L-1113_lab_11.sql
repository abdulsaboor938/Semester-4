-- Abdul Saboor
-- 20L-1113
-- BDS-4A

create procedure CheckCGPA
@sem varchar(15),
@roll varchar(7),
@course int,
@cgpa float,
@sction varchar(1)
as begin
	begin tran
		INSERT [dbo].[Registration] ([Semester], [rollber], [CourseID], [Section],cgpa)
		VALUES
		(@sem, @roll,@course,@sction,@cgpa)

		if(@cgpa < 2.5)
			begin
				print 'You can only enroll in sbjcts you can improve'
				rollback tran
			end
		else
			begin
				commit tran
			end
end
execute CheckCGPA @sem ='Spring2016' , @roll='4', @course=40 , @sction='A', @cgpa=2.3
