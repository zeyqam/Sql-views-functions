use CourseDatabase
create table Students(
[Id] int primary key identity (1,1),
[Name] nvarchar (50),
[Surname] nvarchar (50),
[Age] int,
[Email] nvarchar (100),
[address] nvarchar (255)

)
create table StudentArchives(
[Id] int primary key identity (1,1),
[Name] nvarchar (50),
[Surname] nvarchar (50),
[Age] int,
[Email] nvarchar (100),
[address] nvarchar (255)
)
create procedure usp_deleteAndArchiveStudent
@studentId int
as
begin
declare @Name nvarchar(50),
 @Surname nvarchar (50),
 @Age int,
 @Email nvarchar(100),
 @Address nvarchar (255)
 --secilen telebenin melematlarini getirir
select @Name=[Name],@Surname=[Surname],@Age=[Age],@Email=[Email],@Address=[address]

from Students
where [Id]=@studentId;

insert into StudentArchives([Name],[Surname],[Age],[Email],[address])
values (@Name,@Surname,@Age,@Email,@Address);

delete from Students
where [Id]=@studentId;
end
insert into Students([Name],[Surname],[Age],[Email],[address])
values('Ziko','Ashirov',39,'ziko2mail.com','Hokmeli')

select* from Students
exec usp_deleteAndArchiveStudent @studentId=1;
select *from StudentArchives
select * from Students
