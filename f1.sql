create or alter trigger JelszoLejarat
	on Vevo 
	after insert, update
as
update Vevo 
set JelszoLejarat = DATEADD(year, 1, GETDATE())
from Vevo v join deleted d on v.ID = d.ID
where v.Jelszo != d.Jelszo

declare @deleted nvarchar(max)

select @deleted = count(*) from deleted
if @deleted = 0
	update Vevo
	set JelszoLejarat = DATEADD(year, 1, GETDATE())
	from Vevo v join inserted i on v.ID = i.ID