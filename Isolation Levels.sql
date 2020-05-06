/*
Transaction Isolation Levels

1:Read Committed  Default One
2:Read UnCommited  --Dirty read , lowest isolation level
3:RePeatable Read
4:Snapshot
5.Serializable

*/

-- to change the default Isolation level we use 

set transaction isolation level read uncommitted -- dirty read 

set transaction isolation level repeatable read  -- cannot update data while in this level
