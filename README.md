# email-sender-powershell
Email sender made in powershell using gmail with App Password.

I have experienced to work with a Windows Server 2008 (now it's 2023 imho a obsolete system).
What I was doing to this Customer was taking data from a SQL Server and then sending an email whenever his machine has registered a certain temperature for a specific time.

Why did I choose powershell and not the better known python?
It's simple, that server didn't have this library: 'api-ms-win-core-path-|1-1-0.dll' and I was really mad about it because the previous version, in python, seems to use this library. 
So I have created this powershell that works perfectly with that old system.
Pros:
- light
- fast
Cons:
- I prefer to develop python

Feel free to ask anything about it!
